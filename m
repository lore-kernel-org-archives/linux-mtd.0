Received: from smtp.hotbox.ru ([80.68.244.50])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 199Bbu-0003vV-Pm
	for <linux-mtd@lists.infradead.org>; Fri, 25 Apr 2003 23:24:02 +0100
Message-ID: <000701c30b79$539ecbd0$1a00a8c0@itc.intrinsyc.com>
From: "Alex Samoutin" <samoutin@hotbox.ru>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
References: <000d01c3090a$4b822850$1a00a8c0@itc.intrinsyc.com>
	<20030423204440.258661528E@desire.actrix.co.nz>
	<000d01c30a8e$ebd08150$1a00a8c0@itc.intrinsyc.com>
	<20030425130134.GC27144@wohnheim.fh-wedel.de>
Date: Fri, 25 Apr 2003 15:23:36 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Fw: corrupt my NAND flash device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> > cause. As I mentioned NAND driver (nand.c) has lock mechanism to prevent
> > this situation. But it doesn't work in my case. I don't know why - the
code
> > look Ok. A added some additional locks and it solved this problem.
>
> Ah, sorry for me misinterpreting you original post. I thought, you had
> found a problem in yaffs.
>
> Do you have a patch for this? Even if it is ugly and slow, correct
> code is better than broken one.
>
This is diff file for drivers/mtd/nand.c  (I made to many changes to create
a patch)

151a152,154
> static struct semaphore sam;
> #define NAND_WRITE_RETRY 1
>
362c365
<
---
> 	int ret = 0;
370c373,381
<
---
> #ifdef NAND_WRITE_RETRY
> repeat:
> 	if (ret>3){
> 		printk ("%s: " "Failed write verify, page 0x%08x ", __FUNCTION__, page);
> 		return -EIO;
>
> 	}
> #endif
>
476a488,491
> #ifdef NAND_WRITE_RETRY
> 			++ret;
> 			goto repeat;
> #endif
485c500,504
< 				DEBUG (MTD_DEBUG_LEVEL0, "%s: " "Failed write verify, page 0x%08x ",
__FUNCTION__, page);
---
> 				DEBUG (MTD_DEBUG_LEVEL0, "%s: " "Failed write verify OOB, page 0x%08x
", __FUNCTION__, page);
> #ifdef NAND_WRITE_RETRY
> 				++ret;
> 				goto repeat;
> #endif
507a527,530
> #ifdef NAND_WRITE_RETRY
> 				++ret;
> 				goto repeat;
> #endif
557c580
<
---
> 	down(&sam);
701a725
> 	up(&sam);
737c761
<
---
> 	down(&sam);
763c787
<
---
>         up(&sam);
807c831
<
---
> 	down(&sam);
851c875,876
<
---
> 	up(&sam);
>
880a906
> 	down(&sam);
944c970,971
<
---
>         up(&sam);
>
990a1018
> 	down(&sam);
1063a1092
> 	up(&sam);
1098c1127,1128
<
---
>
> 	down(&sam);
1189a1220
> 	up(&sam);
1373a1405
> 	init_MUTEX(&sam);
