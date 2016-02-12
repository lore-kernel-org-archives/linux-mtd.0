Received: from mail-pa0-x241.google.com ([2607:f8b0:400e:c03::241])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUIUI-0006zu-L2
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 18:30:39 +0000
Received: by mail-pa0-x241.google.com with SMTP id gc2so364796pab.3
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 10:30:18 -0800 (PST)
Date: Fri, 12 Feb 2016 10:30:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 4/5] mtd: atmel_nand: Support 32-bit ECC strength
Message-ID: <20160212183015.GP19540@google.com>
References: <1455098187-9442-1-git-send-email-romain.izard.pro@gmail.com>
 <1455098187-9442-5-git-send-email-romain.izard.pro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455098187-9442-5-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 10, 2016 at 10:56:26AM +0100, Romain Izard wrote:
>  Documentation/devicetree/bindings/mtd/atmel-nand.txt |  3 ++-
>  drivers/mtd/nand/atmel_nand.c                        | 19 +++++++++++++++++--
>  drivers/mtd/nand/atmel_nand_ecc.h                    |  1 +
>  3 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index e1887b7d7e53..d53aba98fbc9 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -27,7 +27,8 @@ Optional properties:
>  - atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware,
>    capable of BCH encoding and decoding, on devices where it is present.
>  - atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
> -  Controller. Supported values are: 2, 4, 8, 12, 24.
> +  Controller. Supported values are: 2, 4, 8, 12, 24. If the compatible string

Looks like you could be using the common 'nand-ecc-strength' binding
here.

> +  is "atmel,sama5d2-nand", 32 is also valid.
>  - atmel,pmecc-sector-size : sector size for ECC computation. Supported values
>    are: 512, 1024.

And 'nand-ecc-step-size' here.

>  - atmel,pmecc-lookup-table-offset : includes two offsets of lookup table in ROM

Of course we can't break backward compatibility, but it'd be nice if you
made sure this worked with the generic bindings.

Regards,
Brian
