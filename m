Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1DyRx8-00006I-0w
	for linux-mtd@lists.infradead.org; Fri, 29 Jul 2005 06:19:01 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: JianZhang <JianZhang@SoftHome.net>
In-Reply-To: <courier.42E9F963.00002B1B@softhome.net>
References: <courier.42E9F963.00002B1B@softhome.net>
Content-Type: text/plain
Date: Fri, 29 Jul 2005 12:23:14 +0200
Message-Id: <1122632594.26146.78.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: [linux_mtd]bad eraseblock in nandflash when booting linux-2.6.12
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please fix your mail client and wrap lines at 76.
Also we really don't need all the empty lines between the information
you want to send us. Reduce the information to the necessary amount to
describe your problem and do not flood us with redundant crap.

On Fri, 2005-07-29 at 17:40 +0800, JianZhang wrote:
> NAND device: Manufacturer ID: 0xec, Chip ID: 0x76 (Samsung NAND 64MiB 3,3V 8-bit)
> NAND_ECC_NONE selected by board driver. This is not recommended !!

Use software ECC !

> Scanning device for bad blocks
> Bad eraseblock 6 at 0x00018000
<SNIP>
> Scanning device for bad blocks
> Bad eraseblock 1 at 0x00004000

> It seem that the location of bad eraseblocks is random in every
> booting time.

Yes, it's probably related to timing. Did you set this->chip_delay
correct ? Is the timing of your CPU setup to match the NAND timing
specs ?

> I want to use flash_eraseall to erase all block,but it  skiped the bad
> block.so i hacked ....

What are you trying to solve ? Erase random bad blocks ? Fix the random
read problem first before messing with your FLASH chip. 

I really start to question the quality of engineering schools. Did
nobody ever tell you to solve basic problems first instead of trying to
work around them without even having a clue whats going on ?

> there is a little "Failed erase" in this operation. but also it is
> random in every time i do flash_eraseall_hack.

The kernel refuses to erase bad blocks, even if you remove the check in
flash_erase_all. And I recommend you not to touch that check in the
kernel, unless you exactly know what you are doing.

tglx
