Received: from mx.zebratelecom.ru ([213.145.47.145] helo=smtp.zebratelecom.ru)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CEWkh-0001VS-06
	for linux-mtd@lists.infradead.org; Mon, 04 Oct 2004 13:36:00 -0400
From: Dmitry Skorinko <skorinkod@mosk.ru>
To: tglx@linutronix.de
Date: Mon, 4 Oct 2004 21:26:10 +0400
References: <200410011858.28776.skorinkod@mosk.ru>
	<1096751135.21297.73.camel@thomas>
In-Reply-To: <1096751135.21297.73.camel@thomas>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200410042126.10303.skorinkod@mosk.ru>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with DiskOnChip 2000
Reply-To: skorinkod@mosk.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Fri, 2004-10-01 at 16:58, Dmitry wrote:
> > Hi, all
> > 
> > I have pc104 system ICOP-6070 with DiskOnChip 2000 on it..
> > Here is task to install linux OS on this system..
> > With Knoppix 3.6 CD I start linux and try load drivers for this flash disk 
for 
> > next step with installation on it, but modules don't see chip on board...
> > 
> > kernel 2.6.8:
> > #insmod mtdcore
> > #insmod nand_ids
> > #insmod docecc
> > #insmod doc2000
> > #insmod docprobe
> > and i have:
> > Resource temporarily unavailable

oops, it's mistake. Knoppix 3.6 has 2.6.7 kernel....

> 
> Use the new diskonchip driver in drivers/mtd/nand. The old drivers are
> DEPRECATED (See Kernel config) and will be removed in the near future.
> 
> > kernel 2.4.27:
> > Unknown flash chip found: 81 81
> > Please report to dwmw2@infradead.org
> > No flash chips recognised.
> > Possible DiskOnChip with unknown ChipID 36 found at 0xe8000
> > Possible DiskOnChip with unknown ChipID C6 found at 0xea000
> > Possible DiskOnChip with unknown ChipID F6 found at 0xec000
> > Possible DiskOnChip with unknown ChipID C1 found at 0xee000
> 
> None of those ID's is a valid chip ID except the 0x36, which is a
> 64MiB,1.8V chip. I doubt, that there are DoC's available with 1.8V
> supply. The stuff looks more like random nonsense.
> 
> Use a recent 2.6 kernel with the new diskonchip driver. We don't know
> which kernel modifications are on the Knoppix CD, so please use a kernel
> >= V2.6.8.1 from kernel.org and if the problems persist the latest MTD
> patches from the MTD website.
> 
> tglx

ok, I wil do install linux diskette with 2.6.8.1 
but what modules i must have there??

what about 2.4.x kernel? Will these new drivers included in this kernels? With 
2.6 I must rewrite other self drivers and it's not best way for me...

Dmitry
