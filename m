Received: from albatross.mail.pas.earthlink.net ([207.217.120.120] helo=albatross.prod.itd.earthlink.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GMbb-0000ep-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 17:01:08 +0000
Reply-To: <anidea@earthlink.net>
From: "Gabriel Goldstein" <anidea@earthlink.net>
To: <tglx@linutronix.de>,
	<linux-mtd@lists.infradead.org>
Subject: RE: Nand flash and blob
Date: Mon, 25 Nov 2002 12:28:29 -0500
Message-ID: <018501c294a8$12311ba0$6401000a@zorak>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <200211251815.45629.tglx@linutronix.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is interesting.  I was planning on storing my ramdisk image in the
nand flash and still having blob expand it to ram.  I can see benefits
to both ways.  If I store the ramdisk.gz in flash, I will always have a
good image to boot up to, if I store it directly in nand, I could have
persistant information much easier.

How do you handle the aspect of all of the dev devices?  Are they part
of the root file system in ram still?

If I wanted to make a JFFS image, how do I take a directory and make a
file system image that I could load though blob?  Or how else would I
get it in there?

Thanks,

Gabriel

-----Original Message-----
From: Thomas Gleixner [mailto:tglx@linutronix.de] 
Sent: Monday, November 25, 2002 12:16 PM
To: anidea@earthlink.net; linux-mtd@lists.infradead.org
Subject: Re: Nand flash and blob

On Monday 25 November 2002 17:49, Gabriel Goldstein wrote:
> Hello,
>
> I'm working on a arm based design where I have a 16MB Sandisk/Samsung
> nand flash device.  I think I have the Linux side settled buy using
the
> standard MTD driver.
>
> I'm using BLOB and I'd like to know what people are doing to get the
> system loaded.  I have zImage, params, and ramdisk that I want to use
my
> NAND device to store these blocks.
You will have to extend block to handle NAND. You could use the nand
driver 
code from mtd-cvs for this. Be aware that you have to handle bad blocks,
as 
your chip can have factory marked bad blocks.

On my system I have 1MB bootflash, where the bootloader, zImage and
params are 
stored and my root filesystem is on a JFFS2 partition on NAND. Thats the

fastest way to go along I think.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
