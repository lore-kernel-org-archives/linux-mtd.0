Received: from frontend1.messagingengine.com ([66.111.4.30])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bv87S-000410-U2
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2004 01:27:20 -0400
Message-ID: <411AFFAF.5030908@fastmail.fm>
Date: Thu, 12 Aug 2004 15:27:11 +1000
From: Brendan Simon <BrendanSimon@fastmail.fm>
MIME-Version: 1.0
To: Dan Brown <dan_brown@ieee.org>
References: <4111AEA6.2080605@fastmail.fm><003f01c47aeb$706113d0$0100a8c0@superfortress>
	<4119723E.8050205@fastmail.fm>
	<032f01c47fa1$ae533f50$0100a8c0@superfortress>
In-Reply-To: <032f01c47fa1$ae533f50$0100a8c0@superfortress>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: 128MB DOC2000 with 2.4.X kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Brown wrote:

>>    3) Recommend using 2.6 kernel and latest MTD tree.
>>    
>>
>This would still be my recommendation, however, there has been some effort
>in the last few days to allow the latest MTD code to compile under the 2.4
>series.  If you're dead-set against switching to 2.6, it might be worth your
>time to grab the latest MTD snapshot, patch your 2.4 kernel using the
>included script, and see what happens.  No promises.
>  
>
Depends whether it would patch to 2.4.18 sucessfully or whether it is 
designed to patch to 2.4.26 or 2.4.27.  If I have to do work to get it 
to patch, then the time might be better spent porting 2.6.x to my board :)

>>Is the 96MB DOC2000 more like the 64MB model or the 128MB model?
>>i.e. can I use a 96MB DOC2000 with my existing 2.4.18 kernel or will I
>>have the same problems as the 128MB DOC.
>>    
>>
>INFTL [Inverse NAND Flash Translation Layer] M-Systems' latest flash
>management algorithm, used by the TrueFFS driver for the following devices:
>
>- DiskOnChip Millennium Plus
>- Mobile DiskOnChip Plus
>- DiskOnChip 2000 DIP (high), 384Mbytes and higher.
>- DiskOnChip 2000 DIP (low), 192Mbytes and higher.
>
>If I had reviewed this table before I responded to your email, I would have
>noticed that the 128M DOC ought to use NFTL.  Are you sure you have a part
>that "looks like a Millennium"?  (All DOC2000 parts that use the Millennium
>hardware interface also use INFTL, and vice versa.)  I'm willing to believe
>the MSYS docs I have might be out of date (I'm pretty sure the
>low-profile/high-profile boundary has changed), but it would be good to
>confirm this.
>  
>
I can confirm that the 128MB DOC I received in Australia definately DOES 
NOT work.  i.e. it looks like it has the new ASIC embedded in it.  A 
friend of mine in the USA also sees the same thing on his newly received 
128MB DOC.  Therefore I think the M-System docs are wrong.

Anyone know about the 96MB DOC2000 ????
Is it an old style or new style DOC2000 ????

Cheers,
Brendan Simon.
