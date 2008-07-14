Subject: Re: Regarding NAND driver based on PrimeCell Static Memory
	Controller (PL350 series)
From: David Woodhouse <dwmw2@infradead.org>
To: Divyanshu Verma <dverma@broadcom.com>
In-Reply-To: <E06E3B7BBC07864CADE892DAF1EB0FBD095146C0@NT-SJCA-0752.brcm.ad.broadcom.com>
References: <20080711223448.f5826678.yoichi_yuasa@tripeaks.co.jp>
	<20080711141053.GD13593@linux-mips.org>
	<1215797959.11567.448.camel@pmac.infradead.org>
	<E06E3B7BBC07864CADE892DAF1EB0FBD095146C0@NT-SJCA-0752.brcm.ad.broadcom.com>
Content-Type: text/plain
Date: Mon, 14 Jul 2008 07:26:43 -0700
Message-Id: <1216045603.27455.25.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-07-14 at 03:33 -0700, Divyanshu Verma wrote:
> I am trying to implement a NAND driver for our SOC. The problem I am
> facing is that, our NAND controller does not allow me to have access to
> hardware specific control line. In other words, I cannot follow the
> mechanism given on http://www.linux-mtd.infradead.org/ for NAND driver
> as I cannot write  "my_nand_hwcontrol"  function. The H/w guys say that
> all this is taken care in the controller itself.
> 
> I then decided to identify the NAND Chip as a MTD_BLOCK device, so that
> I  will not require any Hwcontrol function. Now for doing so, is it
> possible to write a kernel module for NAND which can use functions
> exported by mtd/mtd_blkdevs.c ?

It sounds like it isn't 'NAND' at all, as far as you're concerned. It's
a disk drive of some form. Usually these things present themselves as
IDE, so you'd use the IDE driver. If it has its own 'special' interface
then you probably want a dedicated block driver for it; nothing to do
with the MTD subsystem at all.

-- 
dwmw2
