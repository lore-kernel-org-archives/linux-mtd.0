Received: from ip68-7-112-74.sd.sd.cox.net ([68.7.112.74] helo=clpanic.kennet.coplanar.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16s7Lw-0001ps-00
	for <linux-mtd@lists.infradead.org>; Mon, 01 Apr 2002 20:20:28 +0100
Received: from bridge (bridge.kennet.coplanar.net [192.168.10.126] (may be forged))
	by clpanic.kennet.coplanar.net (8.11.6/8.11.2) with SMTP id g31JKGl11149
	for <linux-mtd@lists.infradead.org>; Mon, 1 Apr 2002 11:20:16 -0800
Message-ID: <000d01c1d9b2$3c760c60$7e0aa8c0@bridge>
From: "Jeremy Jackson" <jerj@coplanar.net>
To: <linux-mtd@lists.infradead.org>
Subject: Award BIOS flash programming
Date: Mon, 1 Apr 2002 11:20:08 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

HI,

I'm having trouble writing an MTD driver for some
common flash chips used in motherboard BIOS.
I'd like to merge /dev/bios project's support into MTD.

I'm having trouble getting writes to propagate to the 
bios flash device on two motherboards, 430TX & 430FX
based.  The AWDFLASH utility work ok on both. The
only bit in all the northbridge, southbridge, keyboard
controller, superio, flash chip that refers to write protect
is in the PIIX/PIIX4 southbridge.  Setting this bit to
either value fails to allow writes (logic probe on flash
chip WE#)

Under Linux, I've tried from kernel and user space.
Under dos, I've tried debug and uniflash.

Any perls of wisdom welcome.

Jeremy
