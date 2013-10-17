Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWdRR-0006wH-8i
 for linux-mtd@lists.infradead.org; Thu, 17 Oct 2013 02:36:01 +0000
Received: by mail-ob0-f181.google.com with SMTP id va2so1389825obc.12
 for <linux-mtd@lists.infradead.org>; Wed, 16 Oct 2013 19:35:40 -0700 (PDT)
Date: Wed, 16 Oct 2013 19:35:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v9 0/9] mtd:nand:omap2: clean-up of supported ECC schemes
Message-ID: <20131017023536.GE23337@ld-irv-0074.broadcom.com>
References: <1381816197-20477-1-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381816197-20477-1-git-send-email-pekon@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 Pawel.Moll@arm.com, dedekind1@gmail.com, tony@atomide.com,
 ijc+devicetree@hellion.org.uk, avinashphilipk@gmail.com, balbi@ti.com,
 robherring2@gmail.com, bcousson@baylibre.com, swarren@wwwdotorg.org,
 olof@lixom.net, linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Oct 15, 2013 at 11:19:48AM +0530, Pekon Gupta wrote:
> 
> *changes v8 -> v9*
> [PATCH 1/9] <no update from [PATCH v8 1/6]>
> [PATCH 2/9] <only commit log updated from [PATCH v8 2/6]>
>  As per feedbacks from Brian Norris <computersforpeace@gmail.com> previous
>  revision [PATCH v8 3/6] and [PATCH 4/6] are split into following sub-patches:
> - [PATCH 3/9] <new> replaces local reference with generic names (mtd, nand_chip)
> - [PATCH 4/9] <new> enables auto-detection of bus-width
> - [PATCH 5/9] <new> removes omap3_init_bch: populates ecc-scheme data
> - [PATCH 6/9] <new> removes omap3_init_bch_tail: populates ecc-layout
> - [PATCH 7/9] <new> replaces lib/bch.c with nand_bch.c wrapper
> [PATCH 8/9] <no update same as [PATCH v8 5/6]
> [PATCH 9/9] removed devm_free_xx functions

[...]

I had a few comments on patches 4 and 7, but everything else is looking
a lot better.

Thanks,
Brian
