Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19519U-0004XL-Ay
	for <linux-mtd@lists.infradead.org>; Mon, 14 Apr 2003 11:25:28 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HDB009QZWXPST@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Mon, 14 Apr 2003 12:25:02 +0200 (MEST)
Date: Mon, 14 Apr 2003 13:25:02 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3E9AF275.4000905@idis.co.kr>
To: "Edward J. Lee" <noshel@idis.co.kr>
Message-id: <200304141325.02451.tglx@linutronix.de>
MIME-version: 1.0
References: <002901c3021b$546a6fe0$525deecb@noshel>
 <200304140954.27049.tglx@linutronix.de> <3E9AF275.4000905@idis.co.kr>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
cc: linux-mtd@lists.infradead.org
Subject: Re: A question on ECC
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 14 April 2003 19:40, Edward J. Lee wrote:
>
> this->eccmode is indeed set to NAND_ECC_SOFT.
> I guess my case is kind of 'extra-tricky'. I just found out another
> weird thing,
> that the warning messages complaining '...without ECC...' do NOT appear
> when I'm 'writing' on the chip. Strange, eh. :'(

Can you put some debug output YAFFS ?

--- yaffs_mtdif.c	8 Apr 2003 19:53:44 -0000	1.9
+++ yaffs_mtdif.c	14 Apr 2003 10:23:39 -0000
@@ -90,10 +90,12 @@
 		if(dev->useNANDECC)
 		{   // Careful, this call adds 2 ints to the end of the spare data.  
Calling function should
             // allocate enough memory for spare, i.e. 
[YAFFS_BYTES_PER_SPARE+2*sizeof(int)].
+	    	printk (KERN_DEBUG "YAFFS ReadChunk with real ECC_INFO\n");
     		retval = 
mtd->read_ecc(mtd,addr,dev->nBytesPerChunk,&dummy,data,spareAsBytes,&yaffs_oobinfo);            
 		}
 		else
 		{
+		    	printk (KERN_DEBUG "YAFFS ReadChunk with dummy ECC_INFO\n");
 			retval = 
mtd->read_ecc(mtd,addr,dev->nBytesPerChunk,&dummy,data,spareAsBytes,&yaffs_noeccinfo);
 		}
 	}


-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
