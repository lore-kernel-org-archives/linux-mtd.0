Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOnmt-0006Fg-Al
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 14:43:07 +0000
Received: by mail-wm0-x233.google.com with SMTP id l66so14020743wml.0
 for <linux-mtd@lists.infradead.org>; Thu, 28 Jan 2016 06:42:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
References: <1453960307-10181-1-git-send-email-computersforpeace@gmail.com>
Date: Thu, 28 Jan 2016 11:42:45 -0300
Message-ID: <CAAEAJfAeBW_As1tF19xBVcdafBUdwEtPjupVEmBD4G4gU2OjVw@mail.gmail.com>
Subject: Re: [PATCH 0/8] mtd: spi-nor: locking fixes and updates
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bayi Cheng <bayi.cheng@mediatek.com>,
 Marek Vasut <marex@denx.de>, Daniel Kurtz <djkurtz@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 January 2016 at 02:51, Brian Norris <computersforpeace@gmail.com> wro=
te:
> Hi,
>
> These are an assortment of fixes and updates to the SPI NOR lock/unlock
> feature. The biggest new features are:
> (a) Status Register protection; I don't see why this shouldn't be enabled=
 by
>     default. See patch 4's description.
> (b) Bottom-block protection support (via TB status bit)
> (c) Lock/unlock support for a few Winbond flash
>
> Patch 7 (Top/Bottom protection support) is still an RFC, as I think it de=
serves
> a bit more work. But I'm just getting it out there, as it's been sitting =
on my
> plate for a while.
>
> Regards,
> Brian
>
> Brian Norris (8):
>   mtd: spi-nor: wait for SR_WIP to clear on initial unlock
>   mtd: spi-nor: guard against underflows in stm_is_locked_sr
>   mtd: spi-nor: silently drop lock/unlock for already locked/unlocked
>     region
>   mtd: spi-nor: disallow further writes to SR if WP# is low
>   mtd: spi-nor: use BIT() for flash_info flags
>   mtd: spi-nor: add SPI_NOR_HAS_LOCK flag
>   mtd: spi-nor: add TB (Top/Bottom) protect support
>   mtd: spi-nor: support lock/unlock for a few Winbond chips
>

For all patches, except RFC 7/8:

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
