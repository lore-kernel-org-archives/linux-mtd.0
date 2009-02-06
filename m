Received: from mailout3.samsung.com ([203.254.224.33])
	by casper.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LVQPe-0004e7-2C
	for linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 13:06:33 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0KEN0058EB1YUI@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 22:05:58 +0900 (KST)
Received: from amitksharma ([107.108.214.35])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0KEN00979B1T0S@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Fri, 06 Feb 2009 22:05:54 +0900 (KST)
Date: Fri, 06 Feb 2009 18:40:34 +0530
From: Amit Kumar Sharma <amitsharma.9@samsung.com>
Subject: Re: cannot access NAND STL partition
To: Iram Shahzad <iram.shahzad@jp.fujitsu.com>, linux-mtd@lists.infradead.org
Message-id: <60E410F24BBD4335A6F9C77D0CB7EBA5@sisodomain.com>
Content-transfer-encoding: 7BIT
References: <4C336FC8FE0F441DA6FAB8337E58BB54@sky>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Iram,

----- Original Message ----- 
From: "Iram Shahzad" <iram.shahzad@jp.fujitsu.com>
To: <linux-mtd@lists.infradead.org>
Sent: Friday, February 06, 2009 11:36 AM
Subject: cannot access NAND STL partition


> Hi
>
> I am having the following problem related to reading data
> from NAND. Any hints will be highly appreciated.
>
> Problem in short:
> -------------------
> I can read some partitions but cannot read other ones.
>
> Problem in long:
> -------------------
> I need to access my rootfs from Linux. The rootfs is 
> located
> in NAND. If I write the rootfs in the NAND using u-boot or
> Linux itself, then I can read the rootfs from Linux 
> without
> problem.
>
> But the flash has to be programmed using a special flash
> writer. While doing this the flash is divided into several
> partitions, some partitions are STL and the others are 
> BML.
> Now I find that u-boot/Linux can read BML partitions 
> correctly
> but cannot read STL partitions. Reading STL partition 
> gives
> unexpected data.
>
STL and BML are device interface for block device, BML 
interface is used for rootfs
mout and u can use bmldump/bmlrestore utility for chip 
dump/restore.
how You are trying to read STL partition,Please tell me,

> For test, I am able to place my rootfs in the BML 
> partition
> in which case everything works fine. But finally I have to
> place the rootfs in STL partition.
>
You donot need to place rootfs for STL partiton becasuse BML 
inetrface is enough for rootfs,
STL inetrafce is used for RFS File system mounting.
> Do you have any idea how can Linux read data from STL 
> partition?
> I guess I need some kind of translation layer on top of my
> low level NAND driver but am not sure about that.
> Currently I am using the following components.
>    drivers/mtd/cmdlinepart + drivers/mtd/onenand
When you have xsr donot use  mtd. because if you want to use 
mtd u need to format to do seaprate init .
>
> Is FTL/NFTL used for this purpose?
>
In mtd we are not using FTL/NFTL. you can use directly.
> Best regards
> Iram
>
>
>
>


--------------------------------------------------------------------------------


> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
