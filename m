Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OKaIj-0001xL-Du
	for linux-mtd@lists.infradead.org; Fri, 04 Jun 2010 17:03:22 +0000
Received: by fxm15 with SMTP id 15so1051613fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 Jun 2010 10:03:19 -0700 (PDT)
Subject: Re: CRC error when mounting UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Leo Barnes <barnes.leo@gmail.com>
In-Reply-To: <AANLkTinzLo7e5sHOn7sFKRAZNZHWoi3TMMG-FslG-CVv@mail.gmail.com>
References: <AANLkTilGg81TGnkS2VwF6xdFCvsB_AF_8rLYVqTr-81g@mail.gmail.com>
	<1275575118.9729.2.camel@localhost.localdomain>
	<AANLkTim4K_-kJc4x7mlgyXG3DPgcWUR5-nb46SEpn3pG@mail.gmail.com>
	<1275579127.9729.6.camel@localhost.localdomain>
	<AANLkTinzLo7e5sHOn7sFKRAZNZHWoi3TMMG-FslG-CVv@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 04 Jun 2010 20:03:15 +0300
Message-Id: <1275670996.9729.19.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-06-04 at 18:18 +0200, Leo Barnes wrote:
> You were completely right that the errors were driver related. I
> created a test that tested page-aligned/unaligned reads of different
> lengths and then managed to spot the error in the driver. I will send
> in the test once I have cleaned up the code a bit. Might be useful for
> someone else.

Could you please patch mtd_readtest and send the patch?

> A new question:
> Background:
> The driver in use in the device does all communication with the
> NAND-chipset/controller via DMA. Some of the problems I had with the
> driver was that UBI in some cases sends vmalloc'd buffers to the
> mtd-driver for reading and writing which failed spectacularly (it
> might have been kmalloc'd buffers that were not allocated with
> GFP_DMA, I'm unsure if DMA would succeed in this case). Since I dont
> know exactly how UBI manages it's memory buffers, my question might be
> impossible to implement efficiently.

Yes, both UBI and UBIFS use vmalloc() buffers when they manage whole
eraseblocks - e.g., in UBIFS garbage collector when scanning the
journal, or in UBI when moving eraseblocks for wear-leveling purposes.
The reason is that eraseblocks may be large (e.g., 256 KiB), and
kmalloc() that much of contiguous physical memory is prone to fail.

The way to fix this is to make UBI/UBIFS use arrays of pages instead. Or
array of 2, 4, 8, etc pages, or it may be flexible and contain a field
which describes the allocation order. And then UBI/UBIFS code should be
amended correspondingly.

This will need some effort, but I think a skilled engineer would do this
relatively quickly. We are not actively working on UBI/UBIFS now, so we
will unlikely implement this, but I'd be happy to help someone else to
do this.

Many people ask about small features like security xattrs, or NFS
support, or DMA friendliness, but it is strange that people want ready
solutions instead of investing a bit of time and just implementing this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
