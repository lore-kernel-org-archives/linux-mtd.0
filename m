Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a68Fz-00071C-7M
 for linux-mtd@lists.infradead.org; Tue, 08 Dec 2015 02:44:00 +0000
Received: by pacdm15 with SMTP id dm15so3960630pac.3
 for <linux-mtd@lists.infradead.org>; Mon, 07 Dec 2015 18:43:37 -0800 (PST)
Date: Mon, 7 Dec 2015 18:43:34 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Felix Fietkau <nbd@openwrt.org>
Cc: linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Bayi Cheng <bayi.cheng@mediatek.com>
Subject: Re: [PATCH] Revert "mtd: spi-nor: disable protection for Winbond
 flash at startup"
Message-ID: <20151208024334.GA121937@google.com>
References: <1448555221-24257-1-git-send-email-nbd@openwrt.org>
 <20151127222701.GA19615@localhost> <56596CFF.10002@openwrt.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56596CFF.10002@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sat, Nov 28, 2015 at 09:59:43AM +0100, Felix Fietkau wrote:
> On 2015-11-27 23:27, Brian Norris wrote:
> > On Thu, Nov 26, 2015 at 05:27:01PM +0100, Felix Fietkau wrote:
> >> This reverts commit c6fc2171b249e73745c497b578b417a2946f1b2f.
> >> 
> >> This commit is breaking read access on at least s25fl064k, but also
> >> possibly other Spansion flash chips.
> > 
> > This makes no sense. This patch is about Winbond flash, but you're
> > referencing Spansion flash in the commit subject. I suspect you have
> > either some more explaining, or some better investigation to do, because
> > I don't understand how the commit in question could be the problem for
> > you.
> Take a look at these Spansion flash ids:
> 
>     { "s25fl004k",  INFO(0xef4013,      0,  64 * 1024,   8, SECT_4K |
> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>     { "s25fl008k",  INFO(0xef4014,      0,  64 * 1024,  16, SECT_4K |
> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>     { "s25fl016k",  INFO(0xef4015,      0,  64 * 1024,  32, SECT_4K |
> SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>     { "s25fl064k",  INFO(0xef4017,      0,  64 * 1024, 128, SECT_4K) },
> 
> Note how they start with 0xef (SNOR_MFR_WINBOND).

Ugh, that really sucks :(

Maybe we should do the revert [*] now, and fix it for the next release.
Maybe we can add something to the table entry to (optionally) specify
the manufacturer, so we can specify that even if these look like they're
Winbond, they're actually Spansion.

However, it seems like the lock/unlock features (e.g., top/bottom; 4K
sector ranges) supported vary significantly across not only vendors, but
generation. So maybe we just need some more opt-in flags in the table,
so we don't have to try to make blanket statements, like "all Winbond
flash support flash locking in SR."

Brian

[*] I have a comment for this patch. I'll reply to the top-level.
