Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.12 #3 (Red Hat Linux))
	id 18g1ef-0005FJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Feb 2003 11:54:21 +0000
Received: from maria.bhp.t-online.de (maria.ada.t-online.de [172.30.8.41])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H9S007S191P2N@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 04 Feb 2003 12:53:50 +0100 (MET)
Date: Tue, 04 Feb 2003 12:51:49 +0100
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <3E3F9DA6.60607@laser5.co.jp>
To: Vishal <vishal@laser5.co.jp>
Cc: linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200302041251.50037.tglx@linutronix.de>
MIME-version: 1.0
References: <3E3E517F.9010908@laser5.co.jp>
 <200302041138.14013.tglx@linutronix.de> <3E3F9DA6.60607@laser5.co.jp>
Subject: Re: help: bootloader for loading kernel from mtdblock device on
 flash........
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
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

On Tuesday 04 February 2003 12:01, Vishal wrote:
> let me explain the problem in more detail here
> the thing is that currently i have a boot loader code which reads from a
> char device /dev/mtd/ on NAND where only the kernel image is placed. Bad
> blocks on the /dev/mtd device can cause problems loading the kernel
> which is why i was asked to move the kernel to /dev/mtdblock (which is
>  runs a JFFS), and change the boot loader accordingly.
>      Thats the reson why i was thinking in terms of using a  char driver.
>   As per your suggestion of using YAFFS, what kind of effort would it
> require to get going on this system where JFFS had been completely
> cutomised? will it require any changes for the kind of flash(samsung
> K9F2808U0B) we are using?
No changes, just create well sized partitions.
-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
