package project;

import java.util.*;
import dao.*;
import defaults.*;

public class Auction implements Runnable{
   public static int count;

   private List<Bid> bids;
   private int auctionId ;
   private double askingPrice;
   private int sellingShares;
   private String companyId;
   private String securityId;
   private long startTime;
   private boolean active;

   static{
      count = 0;
   }

   public Auction(String CompanyId, int NoOfShares){
      try{
         count++;

         SecurityDAO sdao = new SecurityDAO(DefaultValues.DBURL, DefaultValues.DBUSER, DefaultValues.DBPASS);

         this.companyId = CompanyId;
         this.securityId = sdao.getEquityShareID(this.companyId);
         this.sellingShares = NoOfShares;
         this.askingPrice = sdao.getEquitySharePrice(this.companyId);
         this.auctionId = count;
         bids = new ArrayList<Bid>();
         this.startTime = System.currentTimeMillis();
         this.active = true;
      }catch(Exception e){
         e.printStackTrace();
      }
   }

   public void run(){
      try{
         for(int i=0; i<5; i++){
            for(int j=1; j<=3; j++){
               if(System.currentTimeMillis() > (this.startTime + (j*1000))){
                  Thread.sleep(1000);
               }else{
                  if(bids.size()<=0){
                     this.askingPrice -= this.askingPrice*.01;
                  }else{
                     //sales
                  }
               }
            }
         }

      }catch(Exception e){
         e.printStackTrace();
      }
   }

   public int getAuctionId(){
      return this.auctionId;
   }

   synchronized public boolean placeBid(int AuctionId, Bid NewBid){
      try{
         if(active){
            this.bids.add(new Bid(TraderId, BidAmount, BidDemand));
            return active;
         }else{
            return active;
         }
      }catch(Exception e){
         e.printStackTrace();
         return false;
      }
   }
}
