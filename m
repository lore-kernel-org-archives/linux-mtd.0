Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QP7Q-0002fh-1C
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 11:15:44 +0100
Message-Id: <200306121016.h5CAGCi07498@dagobert.svc.sysgo.de>
From: Robert Kaiser <rob@sysgo.de>
To: Chris Marston <chris@wirewerks.com>, linux-mtd@lists.infradead.org
Date: Thu, 12 Jun 2003 12:18:32 +0200
References: <20030611173522.NAUK12016.simmts1-srv.bellnexxia.net@there>
In-Reply-To: <20030611173522.NAUK12016.simmts1-srv.bellnexxia.net@there>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: David Woodhouse <dwmw2@infradead.org>
Subject: Re: blkmtd.o, JumpTec Dimm-PC woes
Reply-To: rkaiser@sysgo.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Mittwoch, 11. Juni 2003 19:35 schrieb Chris Marston:
> Hi,
>
> I'm working on a project using embedded linux on a JumpTec Dimm-PC (the
> Elan SC520 model). The JumpTec (supposedly) emulates a full PC with IDE,
> etc, so up till now, we've been able to get by quite happily with a
> homegrown slack-based distro with a minix FS (the final product will be
> mostly ro, so wear levelling is unnecessary).  Recently, however, we
> noticed that our development units were beginning to corrupt data on
> writes, well before the MTBF of their flash.

My understanding is that wear depends on the number erase cycles a particular 
flash block has seen. How is it even possible to specify an MTBF in this case?

Keep in mind that, even if you only read files off the disk, those file's 
access times will get updated in the FS, so even read-only operation may 
cause physical write accesses. To avoid this, try the "noatime" mount option.


> It turns out that the DIMM-PC
> carries out a good chunk of its IDE-emulating chicanery in the BIOS. Any OS
> can happily talk to the fictitious hard drive on its own, but, without the
> help of the BIOS, it won't properly erase sectors before using them. Thus,
> because Linux cold-shoulders the BIOS, sectors on the (SanDisk NAND) flash
> aren't getting erased properly, and, over time, the boards become unusable.

Are you absolutely sure of this? I thought all Jumptec DIMM-PCs have a 
SanDisk IDE CF built in: The chips are soldered onto the PCB, but it behaves 
exactly like a normal CF. I'm sure this is true for the 386SX and SC410 
versions, not 100% sure for the SC520 version, though.

> I'm thinking that the best way to handle this is to use blkmtd.o and then
> use JFFS2, eraseall, etc. Unfortunately, I can't figure out how or where to
> talk to the mtd device created by blkmtd.o. I've tried utils/MAKEDEV and
> /dev/ftla0, and /dev/nftla0, but (eg. eraseall /dev/ftla0) complains that
> there's no such device or address. I know blkmtd.o loaded correctly,
> because it shows an mtd0 in /proc/mtd.

If you can access the device through blkmtd.o or the Linux IDE driver, then 
you most certainly have an IDE CF (these drivers access the device directly, 
not through the BIOS). You *can* put a JFFS2 FS on such a device by means of 
the blkmtd.o driver, but this not very useful. (IIRC, this has been discussed 
on this list serveral times).

Rob


----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO AG
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10
