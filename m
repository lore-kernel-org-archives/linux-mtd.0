Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pi6aY-0001no-L1
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2011 14:43:15 +0000
Received: by wwb17 with SMTP id 17so1032640wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 26 Jan 2011 06:43:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTimVCusWk1qkeY4geXBQ0Bw=rM0mUAaFO32tyoy=@mail.gmail.com>
References: <AANLkTimVCusWk1qkeY4geXBQ0Bw=rM0mUAaFO32tyoy=@mail.gmail.com>
Date: Wed, 26 Jan 2011 09:43:12 -0500
Message-ID: <AANLkTimSqWO_7hBhmBsRKtmm-S=dtJK1wjDv8ekby+3H@mail.gmail.com>
Subject: Re: Question about CFI allocation
From: Josh Boyer <jwboyer@gmail.com>
To: Mitsutaka Amano <mitsutaka.amano@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 26, 2011 at 6:09 AM, Mitsutaka Amano
<mitsutaka.amano@gmail.com> wrote:
> Hi all, I'm a newbie about mtd.
>
> I'm trying to use the cfi on the mpc85xx board. Part of mtdblock is
> used by rootfs. So I have questions.
>
> Why does CFI(or other flash memory) have to alloc to the vmalloc
> area(such as PHYSMAP or PHYSMAP_OF)?

The CFI code is not calling vmalloc explicitly.  It's calling ioremap,
which happens to come from vmalloc space on most (all?) architectures.
 It has to do that because otherwise the CFI driver can't get access
to the physical flash because of the MMU.

The mtdblock driver does call vmalloc explicitly and that is because
it creates a DRAM cache of the current eraseblock being written to.
If it didn't do that, every write to the block device would generate a
read/modify/erase/write cycle, which is fairly suboptimal.  So it will
cache the writes to that block until it moves onto the next block, at
which point it will flush the whole buffer back.  That helps with
performance and flash lifetime (somewhat), but it does mean that usage
of mtdblock can be prone to data loss in the event of a power failure,
panic, or some other reset.

It uses vmalloc because getting physically contiguous pages to cover a
whole eraseblock (often 128KiB in size), is both unnecessary and will
quite often fail after the board has been running for a bit due to
page fragmentation.

josh
