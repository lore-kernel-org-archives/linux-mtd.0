Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19iHie-0005tY-UY
	for <linux-mtd@lists.infradead.org>; Thu, 31 Jul 2003 19:00:04 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de
 (iPlanet Messaging Server 5.2 HotFix 1.17 (built Jun 23 2003))
 with SMTP id <0HIW007LJHZ671@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Thu, 31 Jul 2003 19:59:31 +0200 (MEST)
Date: Thu, 31 Jul 2003 20:56:00 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <5.1.1.6.0.20030731180128.024a0020@192.168.2.1>
To: llandre <r&d@wawnet.biz>, linux-mtd@lists.infradead.org
Message-id: <200307312056.00480.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <5.1.1.6.0.20030715182633.027cd5c0@dns.struinfo.it>
 <5.1.1.6.0.20030731180128.024a0020@192.168.2.1>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: Help to understand error messages (MTD on Samsung NAND  chips)
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 31 July 2003 18:16, llandre wrote:
> Hi Thomas,
>
> sorry for this late response, but I had to work for a couple of weeks on
> another project.
>
> Anyway I restored the original source files included in the kernel and I
> collected the debug information printed during the execution of the
> eraseall command.
> Here is a short dump of what I got:
>
> ---------------------------------------------------------------------------
>------------ bash-2.05# echo 9 >/proc/sys/kernel/printk
> bash-2.05# eraseall /dev/mtd0
> MTD_open
> MTD_ioctl
> Erasing 16 KibyMTD_ioctl
> te @ 0 --  0 % cnand_erase: start = 0x00000000, len = 16384
> omplete.nand_erase: attempt to erase a bad block at page 0x00000000

Byte 5 of the OOB area in the first page of the block is != 0xFF. 
That means, that this block is bad. Either it was set by the manufacturer, 
which is possible as NAND chips can contain bad blocks, or JFFS2 / YAFFS do 
it when they recognize a bad block, or you managed it anyhow to write the bad 
block markers. I assume the latter.

Bad blocks may not be erased, as the bad block information may be destroyed 
and you then would use a bad block for storing data.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
