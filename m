Received: from mail5.bluewin.ch ([195.186.1.207])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18e9Dw-0000EX-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 Jan 2003 07:35:00 +0000
Subject: Re: NFTL not recognizing disk on chip in some cases
From: Raphael Hertzog <eng@eipm.ch>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Henrik Nordstrom <hno@marasystems.com>, linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.44.0301292238560.4791-100000@imladris.demon.co.uk>
References: <Pine.LNX.4.44.0301292238560.4791-100000@imladris.demon.co.uk>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1043913922.556.4.camel@localhost>
Mime-Version: 1.0
Date: 30 Jan 2003 09:05:22 +0100
Content-Transfer-Encoding: 8bit
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

Am Mit, 2003-01-29 um 23.41 schrieb David Woodhouse:
> Does one of your files have 'ANAND' at the start of it (or at an offset of 
> n*512 bytes withing the file? :)

Yes.

$ find . -type f | xargs grep -l ANAND
./root/lib/modules/2.4.19-eipm/kernel/drivers/block/doc.o
./root/lib/modules/2.4.19-eipm/kernel/drivers/block/doc/doc.o
./root/usr/lib/grub/i386-pc/stage2
./root/usr/lib/grub/i386-pc/grub_firmware

After inspection, grub_firmware does have 'ANAND' at offset 87040 (170 *
512).

> That may get seen as an 'extra' NFTL media header sector; we should do 
> more sanity checks and refrain from looking inside an already-detected 
> NFTL partition.

I'm happy to test any patch since I can reproduce the problem here very
regularly ... :-)

> Because in the first case the 'ANAND' went somewhere other than the first 
> page of an erase block, so wasn't seen as an 'extra' media header? Taking 
> raw dumps of the flash would confirm this.

I'll do that to check it. 

Cheers,
-- 
Raphaël Hertzog - EIPM SA
