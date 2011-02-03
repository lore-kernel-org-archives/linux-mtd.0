Received: from mail-yw0-f49.google.com ([209.85.213.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PkpHw-0005K9-WA
	for linux-mtd@lists.infradead.org; Thu, 03 Feb 2011 02:51:17 +0000
Received: by ywf7 with SMTP id 7so305274ywf.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 02 Feb 2011 18:51:15 -0800 (PST)
Date: Thu, 3 Feb 2011 11:50:56 +0900
From: Mitsutaka Amano <mitsutaka.amano@gmail.com>
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: Question about CFI allocation
Message-ID: <20110203025049.GA621@miraclelinux.com>
References: <AANLkTimVCusWk1qkeY4geXBQ0Bw=rM0mUAaFO32tyoy=@mail.gmail.com>
	<AANLkTimSqWO_7hBhmBsRKtmm-S=dtJK1wjDv8ekby+3H@mail.gmail.com>
	<AANLkTimkjy7KcO=QULXYubEPnrh4H1gPpYBL3yE7NDSy@mail.gmail.com>
	<AANLkTikAJ+NgaZ8-_WJSNZ=QJyh0qNM5WqPnem44D3Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AANLkTikAJ+NgaZ8-_WJSNZ=QJyh0qNM5WqPnem44D3Sw@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15:23 Mon 31 Jan     , Josh Boyer wrote:
> On Mon, Jan 31, 2011 at 12:48 AM, Mitsutaka Amano
> <mitsutaka.amano@gmail.com> wrote:
> > On Wed, Jan 26, 2011 at 11:43 PM, Josh Boyer <jwboyer@gmail.com> wrote:
> >> On Wed, Jan 26, 2011 at 6:09 AM, Mitsutaka Amano
> >> <mitsutaka.amano@gmail.com> wrote:
> >>> Hi all, I'm a newbie about mtd.
> >>>
> >>> I'm trying to use the cfi on the mpc85xx board. Part of mtdblock is
> >>> used by rootfs. So I have questions.
> >>>
> >>> Why does CFI(or other flash memory) have to alloc to the vmalloc
> >>> area(such as PHYSMAP or PHYSMAP_OF)?
> >>
> >> The CFI code is not calling vmalloc explicitly.  It's calling ioremap,
> >> which happens to come from vmalloc space on most (all?) architectures.
> >>  It has to do that because otherwise the CFI driver can't get access
> >> to the physical flash because of the MMU.
> > I understand that CFI needs ioremap() -> vmalloc space for accessing
> > to the physical flash via MMU.
> >
> > Why allocate amount of flash memory size? my board has 256MB flash
> > memory and be allocated 256MB over by of_flash_probe.
> 
> It's either do that so you can address the whole flash space, or
> implement a sliding window in the mapping driver.  That can be rather
> complicated when you consider concurrent access to the flash, and
> doing repeated ioremap/iounmap calls so I would guess simplicity is
> why.

Yeah. If possible, I want to implement a sliding window in the mapping driver for reducing the allocated size.

But I wondered other devices seems to not allocating(e.g, most NAND flash, flash on ARM, MIPS and so on). I don't know difference between my board and other. Doesn't other devices need to allocate to vmalloc?

Mitsutaka
