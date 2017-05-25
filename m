Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dDzk2-0002gR-8X
 for linux-mtd@lists.infradead.org; Thu, 25 May 2017 20:52:19 +0000
Received: by mail-pf0-x242.google.com with SMTP id u26so41405846pfd.2
 for <linux-mtd@lists.infradead.org>; Thu, 25 May 2017 13:51:57 -0700 (PDT)
Date: Thu, 25 May 2017 13:51:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V5 4/4] mtd: extract TRX parser out of bcm47xxpart into a
 separated module
Message-ID: <20170525205154.GD114788@google.com>
References: <20170524094437.2174-1-zajec5@gmail.com>
 <20170524094437.2174-5-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170524094437.2174-5-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 24, 2017 at 11:44:37AM +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This makes TRX parsing code reusable with other platforms and parsers.
> 
> Please note this patch doesn't really change anything in the existing
> code, just moves it. There is still some place for improvement (e.g.
> working on non-hacky method of checking rootfs format) but it's not
> really a subject of this change.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
> V2: A totally rebased & refreshed version.
> V5: Add TRX format verification, improve comment, fix memory leak
>     Thanks Brian

I think this looks OK now. I'll wait on resolving the rest of the
infrastucture, so I'll leave this here for now:

Reviewed-by: Brian Norris <computersforpeace@gmail.com>

> ---
>  drivers/mtd/Kconfig              |   4 ++
>  drivers/mtd/Makefile             |   1 +
>  drivers/mtd/bcm47xxpart.c        |  99 ++----------------------------
>  drivers/mtd/parsers/Kconfig      |   8 +++
>  drivers/mtd/parsers/Makefile     |   1 +
>  drivers/mtd/parsers/parser_trx.c | 126 +++++++++++++++++++++++++++++++++++++++
>  6 files changed, 145 insertions(+), 94 deletions(-)
>  create mode 100644 drivers/mtd/parsers/Kconfig
>  create mode 100644 drivers/mtd/parsers/Makefile
>  create mode 100644 drivers/mtd/parsers/parser_trx.c
> 

...

> diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
> new file mode 100644
> index 000000000000..ebb697a52698
> --- /dev/null
> +++ b/drivers/mtd/parsers/Kconfig
> @@ -0,0 +1,8 @@
> +config MTD_PARSER_TRX
> +	tristate "Parser for TRX format partitions"
> +	depends on MTD && (BCM47XX || ARCH_BCM_5301X)

|| COMPILE_TEST ? Would be nice to be able to build-test things like
this, even if you know they're only used for a few architectures.

> +	help
> +	  TRX is a firmware format used by Broadcom on their devices. It
> +	  may contain up to 3/4 partitions (depending on the version).
> +	  This driver will parse TRX header and report at least two partitions:
> +	  kernel and rootfs.

...

Brian
