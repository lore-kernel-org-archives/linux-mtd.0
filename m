Received: from kasumi.idis.co.kr ([203.238.93.2] ident=mail)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 196K2H-0003DS-Fe
	for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2003 01:47:25 +0100
Message-ID: <3E9FC99D.5040200@idis.co.kr>
Date: Fri, 18 Apr 2003 18:47:09 +0900
From: "Edward J. Lee" <noshel@idis.co.kr>
MIME-Version: 1.0
To: tglx@linutronix.de,  linux-mtd@lists.infradead.org
References: <002901c3021b$546a6fe0$525deecb@noshel>
	<200304140954.27049.tglx@linutronix.de> <3E9AF275.4000905@idis.co.kr>
	<200304141325.02451.tglx@linutronix.de>
In-Reply-To: <200304141325.02451.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: A question on ECC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:

>On Monday 14 April 2003 19:40, Edward J. Lee wrote:
>  
>
>>this->eccmode is indeed set to NAND_ECC_SOFT.
>>I guess my case is kind of 'extra-tricky'. I just found out another
>>weird thing,
>>that the warning messages complaining '...without ECC...' do NOT appear
>>when I'm 'writing' on the chip. Strange, eh. :'(
>>    
>>
>
>Can you put some debug output YAFFS ?
>
>--- yaffs_mtdif.c	8 Apr 2003 19:53:44 -0000	1.9
>+++ yaffs_mtdif.c	14 Apr 2003 10:23:39 -0000
>@@ -90,10 +90,12 @@
> 		if(dev->useNANDECC)
> 		{   // Careful, this call adds 2 ints to the end of the spare data.  
>Calling function should
>             // allocate enough memory for spare, i.e. 
>[YAFFS_BYTES_PER_SPARE+2*sizeof(int)].
>+	    	printk (KERN_DEBUG "YAFFS ReadChunk with real ECC_INFO\n");
>     		retval = 
>mtd->read_ecc(mtd,addr,dev->nBytesPerChunk,&dummy,data,spareAsBytes,&yaffs_oobinfo);            
> 		}
> 		else
> 		{
>+		    	printk (KERN_DEBUG "YAFFS ReadChunk with dummy ECC_INFO\n");
> 			retval = 
>mtd->read_ecc(mtd,addr,dev->nBytesPerChunk,&dummy,data,spareAsBytes,&yaffs_noeccinfo);
> 		}
> 	}
>
>
>  
>
I tried this last night, and I got a bunch of "YAFFS ReadChunk with real 
ECC_INFO".
when both reading/writing.
Nothing else, do we need more information?
