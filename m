Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GMOf-0000cX-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 16:47:45 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H65002G36PKNS@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Mon, 25 Nov 2002 18:17:45 +0100 (MET)
Date: Mon, 25 Nov 2002 18:15:45 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Nand flash and blob
In-reply-to: <017c01c294a2$907fe9b0$6401000a@zorak>
To: anidea@earthlink.net, linux-mtd@lists.infradead.org
Reply-to: tglx@linutronix.de
Message-id: <200211251815.45629.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: <017c01c294a2$907fe9b0$6401000a@zorak>
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

On Monday 25 November 2002 17:49, Gabriel Goldstein wrote:
> Hello,
>
> I'm working on a arm based design where I have a 16MB Sandisk/Samsung
> nand flash device.  I think I have the Linux side settled buy using the
> standard MTD driver.
>
> I'm using BLOB and I'd like to know what people are doing to get the
> system loaded.  I have zImage, params, and ramdisk that I want to use my
> NAND device to store these blocks.
You will have to extend block to handle NAND. You could use the nand driver 
code from mtd-cvs for this. Be aware that you have to handle bad blocks, as 
your chip can have factory marked bad blocks.

On my system I have 1MB bootflash, where the bootloader, zImage and params are 
stored and my root filesystem is on a JFFS2 partition on NAND. Thats the 
fastest way to go along I think.

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
