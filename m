Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aaUXO-0001HN-S8
 for linux-mtd@lists.infradead.org; Mon, 29 Feb 2016 20:35:28 +0000
Received: by mail-qg0-x22c.google.com with SMTP id b67so125674249qgb.1
 for <linux-mtd@lists.infradead.org>; Mon, 29 Feb 2016 12:35:06 -0800 (PST)
Date: Mon, 29 Feb 2016 17:35:02 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>, Marek Vasut <marex@denx.de>,
 Daniel Kurtz <djkurtz@chromium.org>
Subject: Re: [PATCH v2 7/8] mtd: spi-nor: add TB (Top/Bottom) protect support
Message-ID: <20160229203502.GA13477@laptop.cereza>
References: <1454095537-130536-1-git-send-email-computersforpeace@gmail.com>
 <1454095537-130536-8-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1454095537-130536-8-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 29 January 2016 at 16:25, Brian Norris <computersforpeace@gmail.com> wrote:
> Some flash support a bit in the status register that inverts protection
> so that it applies to the bottom of the flash, not the top. This yields
> additions to the protection range table, as noted in the comments.
>
> Because this feature is not universal to all flash that support
> lock/unlock, control it via a new flag.
>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v2:
>  * Rewrite the bounds checking for top/bottom support, since there were some
>    bad corner cases. Now lock/unlock are more symmetric.
>
>  drivers/mtd/spi-nor/spi-nor.c | 70 ++++++++++++++++++++++++++++++++++++++-----
>  include/linux/mtd/spi-nor.h   |  2 ++
>  2 files changed, 65 insertions(+), 7 deletions(-)
>
[..]
> @@ -476,12 +484,14 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
>
>  /*
>   * Lock a region of the flash. Compatible with ST Micro and similar flash.
> - * Supports only the block protection bits BP{0,1,2} in the status register
> + * Supports the block protection bits BP{0,1,2} in the status register
>   * (SR). Does not support these features found in newer SR bitfields:
> - *   - TB: top/bottom protect - only handle TB=0 (top protect)
>   *   - SEC: sector/block protect - only handle SEC=0 (block protect)

While reviewing and testing this patchset, I realised that *no* Micron device
define BIT(6) as SEC (sector/block) bit. Instead, it's used as BP3, to extend
the region defined by BP0-BP2.

I've checked the following:

  N25Q256A
  N25Q128A
  N25Q064A
  N25Q032A
  N25Q016A
  M25Pxx

So I believe we need to separate stm_{lock,unlock), from
winbond_{lock,unlock}. We might want to explicitly mark devices that
currently support locking with the new _HAS_LOCK flag.

Also, I wonder if we can really separate based on vendor, or if we'll need
more flags to distinguish the lock implementation per device.

Of course, all the devices that define a BP3 are broken with respect to flash
locking. I can try to cook some patches for this, once we are decided on how
to do it.
-- 
Ezequiel García, VanguardiaSur
www.vanguardiasur.com.ar
