Received: from e35.co.us.ibm.com ([32.97.110.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HmEE8-0000kN-99
	for linux-mtd@lists.infradead.org; Thu, 10 May 2007 20:23:01 +0100
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l4AJMeLM008012
	for <linux-mtd@lists.infradead.org>; Thu, 10 May 2007 15:22:40 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay04.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l4AJMekO185400
	for <linux-mtd@lists.infradead.org>; Thu, 10 May 2007 13:22:40 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l4AJMdnp021449
	for <linux-mtd@lists.infradead.org>; Thu, 10 May 2007 13:22:39 -0600
Subject: Re: NAND flash write goes wrong
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: borasah@gmail.com
In-Reply-To: <200705102150.31171.borasah@gmail.com>
References: <200705102150.31171.borasah@gmail.com>
Content-Type: text/plain
Date: Thu, 10 May 2007 14:16:32 -0500
Message-Id: <1178824593.22802.48.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-05-10 at 21:50 +0300, borasah@gmail.com wrote:
> Hi,
> 
> I have a MIPS based board and want to use its NAND flash for storage. NAND 
> chip is a Samsung part: K9F1208UDA. It has 16KB erase block size and 512 byte 
> page size.
> 	cat /proc/mtd
> 	dev:    size   erasesize  name
> 	mtd0: 02000000 00020000 "mtdram test device"
> 	mtd1: 00800000 00004000 "NAND FS 0"
> 	mtd2: 03800000 00004000 "NAND FS 1"
> 
> As you see there are two partitions on it. I want to use "NAND FS 1"(56MB) for 
> rootFS storage. I obtained mtd-utils from the site and compiled them for both  
> the host and the target. I am using "mkfs.jffs2 command on the host" to 
> generate a jffs2 image.
> 	./mkfs.jffs2 -p 0x3800000 -s 0x200 -e 0x4000 -r rootfs -o img -l
> Then on the target I do
> 	flash_eraseall -j /dev/mtd

Could you try without the -j and see if it fares any better?

josh
