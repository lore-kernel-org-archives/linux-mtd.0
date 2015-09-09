Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZZpBB-0007AF-Rb
 for linux-mtd@lists.infradead.org; Wed, 09 Sep 2015 23:53:31 +0000
Received: by padhk3 with SMTP id hk3so23984644pad.3
 for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2015 16:53:09 -0700 (PDT)
Date: Wed, 9 Sep 2015 16:53:06 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Roy Spliet <r.spliet@ultimaker.com>
Subject: Re: [PATCH] mtd: nand: sunxi_nand.c: Select the chip in
 sunxi_nand_chip_init_timings()
Message-ID: <20150909235306.GC11487@google.com>
References: <1440765921-10972-1-git-send-email-sr@denx.de>
 <55E05F93.5070802@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55E05F93.5070802@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 28, 2015 at 03:18:11PM +0200, Hans de Goede wrote:
> Hi Stefan,
> 
> On 28-08-15 14:45, Stefan Roese wrote:
> >nand_scan_ident() leaves the chip deselected. So just issuing some commands
> >from the sunxi driver does not work. We need to select the chip before
> >writing the commands to the NAND device. This patch takes care of this.
> >
> >Set the new timing on all dies implemented as suggested by Boris.
> >
> >This was detected on the in-circuit ICnova-A20 SoM equipped with the
> >Micron MT29F32G08CBACAWP (4GiB) ONFI NAND device.
> >
> >Signed-off-by: Stefan Roese <sr@denx.de>
> >Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> >Cc: Hans de Goede <hdegoede@redhat.com>
> >Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> >Cc: Roy Spliet <r.spliet@ultimaker.com>
> >Cc: Brian Norris <computersforpeace@gmail.com>
> 
> This one has some whitespace errors, so you may want todo a v2:
> 
> [hans@shalem linux]$ git am ~/1.eml
> Applying: mtd: nand: sunxi_nand.c: Select the chip in sunxi_nand_chip_init_timings()
> /home/hans/projects/sunxi/linux/.git/rebase-apply/patch:29: space before tab in indent.
>  						ONFI_FEATURE_ADDR_TIMING_MODE,
> /home/hans/projects/sunxi/linux/.git/rebase-apply/patch:30: space before tab in indent.
>  						feature);
> warning: 2 lines add whitespace errors.

Fixed the whitespace myself and applied to l2-mtd.git/next
