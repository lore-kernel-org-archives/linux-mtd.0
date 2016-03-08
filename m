Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ad78R-0000DR-CY
 for linux-mtd@lists.infradead.org; Tue, 08 Mar 2016 02:12:32 +0000
Received: by mail-pf0-x244.google.com with SMTP id 184so182223pff.1
 for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2016 18:12:10 -0800 (PST)
Date: Mon, 7 Mar 2016 18:12:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>, Marek Vasut <marex@denx.de>,
 Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v2 7/8] mtd: spi-nor: add TB (Top/Bottom) protect support
Message-ID: <20160308021207.GF55664@google.com>
References: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
 <1454095537-130536-8-git-send-email-computersforpeace@gmail.com>
 <20160229203502.GA13477@laptop.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160229203502.GA13477@laptop.cereza>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 29, 2016 at 05:35:02PM -0300, Ezequiel Garcia wrote:
> On 29 January 2016 at 16:25, Brian Norris <computersforpeace@gmail.com> wrote:
> > Some flash support a bit in the status register that inverts protection
> > so that it applies to the bottom of the flash, not the top. This yields
> > additions to the protection range table, as noted in the comments.
> >
> > Because this feature is not universal to all flash that support
> > lock/unlock, control it via a new flag.
> >
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> > v2:
> >  * Rewrite the bounds checking for top/bottom support, since there were some
> >    bad corner cases. Now lock/unlock are more symmetric.
> >
> >  drivers/mtd/spi-nor/spi-nor.c | 70 ++++++++++++++++++++++++++++++++++++++-----
> >  include/linux/mtd/spi-nor.h   |  2 ++
> >  2 files changed, 65 insertions(+), 7 deletions(-)
> >
> [..]
> > @@ -476,12 +484,14 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
> >
> >  /*
> >   * Lock a region of the flash. Compatible with ST Micro and similar flash.
> > - * Supports only the block protection bits BP{0,1,2} in the status register
> > + * Supports the block protection bits BP{0,1,2} in the status register
> >   * (SR). Does not support these features found in newer SR bitfields:
> > - *   - TB: top/bottom protect - only handle TB=0 (top protect)
> >   *   - SEC: sector/block protect - only handle SEC=0 (block protect)
> 
> While reviewing and testing this patchset, I realised that *no* Micron device
> define BIT(6) as SEC (sector/block) bit. Instead, it's used as BP3, to extend
> the region defined by BP0-BP2.

Hmm, OK. Maybe it's worth a note, if it's not going to get fixed
immediately.

> I've checked the following:
> 
>   N25Q256A
>   N25Q128A
>   N25Q064A
>   N25Q032A
>   N25Q016A
>   M25Pxx
> 
> So I believe we need to separate stm_{lock,unlock), from
> winbond_{lock,unlock}.

I'm not yet confident that we need separate functions. We would just
make SEC and BP3 support mutually exclusive, and then we can see whether
separate functions or a dual-purpose (single) implementation makes more
sense. I'd think the latter, actually, since adding an extra bit to the
'mask' should be pretty simple.

> We might want to explicitly mark devices that
> currently support locking with the new _HAS_LOCK flag.

Yeah, I think there are enough problems that we at least need a
_HAS_LOCK flag to opt in, rather than assuming every device by a certain
vendor works. It's really not clear which devices we claimed ever used
to work with lock/unlock, and some will change over time -- possibly
even in incompatible ways. You never know how wrong vendors can make
things.

> Also, I wonder if we can really separate based on vendor, or if we'll need
> more flags to distinguish the lock implementation per device.

For now, I'd like it if we can transition to using SPI_NOR_HAS_LOCK for
every flash that supports it, instead of auto-opting in all
Micron/STMicro flash. I think a new flag for SPI_NOR_HAS_BP3 would also
be in order.

> Of course, all the devices that define a BP3 are broken with respect to flash
> locking. I can try to cook some patches for this, once we are decided on how
> to do it.

Brian
