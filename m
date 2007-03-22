Received: from e34.co.us.ibm.com ([32.97.110.152])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HUMJz-0001HL-9v
	for linux-mtd@lists.infradead.org; Thu, 22 Mar 2007 08:23:12 -0400
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e34.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l2MCN9dl030624
	for <linux-mtd@lists.infradead.org>; Thu, 22 Mar 2007 08:23:09 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l2MCN9Qq070920
	for <linux-mtd@lists.infradead.org>; Thu, 22 Mar 2007 06:23:09 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l2MCN8wl017311
	for <linux-mtd@lists.infradead.org>; Thu, 22 Mar 2007 06:23:09 -0600
Subject: Re: NAND flash file system and JFFS2 problem
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Jakub =?UTF-8?Q?Bedn=C3=A1=C5=99?= <bednar.jakub@centrum.cz>
In-Reply-To: <200703220926.22574@centrum.cz>
References: <200703220926.22574@centrum.cz>
Content-Type: text/plain; charset=utf-8
Date: Thu, 22 Mar 2007 07:22:59 -0500
Message-Id: <1174566179.3416.91.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-22 at 09:26 +0100, Jakub Bednář wrote:
> Hi,
>       I've spent long time reading all about mtd devices and I'd like 
> to check if I understood correctly.
> 
> 1.) The NFTL is usable ONLY for DOC, not for normal NAND flashes.
>       Thats why nftl_format prints unrecognized erase size 0x20000

Yes.

> 2.) FTL is usable ONLY with NOR flashes, that's why the ftl_format
>        ends with an error on trying to erase bad block on NAND in dmesg.

Not sure, but I think yes.

> 3.) So there should be used JFFS2 on NAND, there is no good and reliable
>        way to run ext2 on NAND.

Correct.  Yaffs can also work on NAND.

> I've also encountered a problem.
>         I'm using kernel 2.6.16.20 from buildroot on DBAu1550 like board.
>         When running destroy test on Samsung NAND where I had ext2, 
>         I was using programs from busybox placed on NOR flash (jffs2) /dev/mtdblock0. 
>         Links like dd, cp, md5sum.
> 
>         NAND was mounted on /mnt/. After creating a 45MB file /mnt/file0 with dd
>         from /dev/zero  and running md5sum, something got wrong and all the links
>         from NOR jffs2 stopped working with lot's of errors in CRC codes. I wasnt writting
>         to the NOR jffs2 but I have it mounted rw.  After rebooting the NOR jffs2 is ok again!
> 
>         So maybe it mess up in RAM???  What can couse this trouble?

That seems very odd.  Unfortunately, I don't have an idea at the moment.

josh
