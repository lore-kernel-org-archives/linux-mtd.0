Received: from mail-gx0-f12.google.com ([209.85.217.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KTGHf-0004xZ-Hq
	for linux-mtd@lists.infradead.org; Wed, 13 Aug 2008 13:21:03 +0000
Received: by gxk5 with SMTP id 5so775321gxk.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 13 Aug 2008 06:21:02 -0700 (PDT)
Subject: Re: [U-Boot] U-Boot and UBI
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <9c9fda240808121634q7128ed30w40635e34d4a7fcf9@mail.gmail.com>
References: <1218220016.2328.109.camel@localhost.localdomain>
	<200808112202.24363.sr@denx.de>
	<9c9fda240808120325va530f61q13b4836f9b8202b5@mail.gmail.com>
	<200808121311.27026.sr@denx.de>
	<9c9fda240808121634q7128ed30w40635e34d4a7fcf9@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 13 Aug 2008 09:20:36 -0400
Message-Id: <1218633636.10489.43.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: Josh Boyer <jwboyer@gmail.com>
Cc: u-boot@lists.denx.de, Stefan Roese <sr@denx.de>,
	linux-mtd@lists.infradead.org, arnez@de.ibm.com
Reply-To: jwboyer@linux.vnet.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-08-13 at 08:34 +0900, Kyungmin Park wrote:
> Hi,
> 
> On Tue, Aug 12, 2008 at 8:11 PM, Stefan Roese <sr@denx.de> wrote:
> > On Tuesday 12 August 2008, Kyungmin Park wrote:
> >> > On Monday 11 August 2008, Kyungmin Park wrote:
> >> >> Actually the Samsung implemented the UBI support on U-boot already and
> >> >> has used it internally. The big difference is the code base. It's
> >> >> based on kernel UBI code. Yes it's not fit well to u-boot ecosystem so
> >> >> it created the ubi wrapper for u-boot.
> >> >
> >> > And how does NAND/OneNAND booting with UBI support fit into this? I
> >> > assume that you have some size restrictions for the IPL/SPL on your
> >> > platforms as well.
> >>
> >> It's not yet covered. it's TODO
> >
> > I see.
> >
> 
> Yes, we should make a u-boot within one block size since flash only
> guarantees the first one block as bad block free. e.g., exactly
> (128KiB - 2KiB) size if OneNAND case.
> For this, we need to code or size optimization.
> If this is solved, we can use flash as bad block free device with UBI.

An alternative to that is to have a very small IPL that loads U-Boot to
DRAM as the SPL.  That would require some relocatable support in U-Boot.

josh
