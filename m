Received: from 10.mo3.mail-out.ovh.net ([87.98.165.232]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SX8GU-0002NB-50
 for linux-mtd@lists.infradead.org; Wed, 23 May 2012 09:53:58 +0000
Received: from mail91.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id 17D24FF9AF4
 for <linux-mtd@lists.infradead.org>; Wed, 23 May 2012 11:56:51 +0200 (CEST)
Date: Wed, 23 May 2012 11:54:02 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v8 2/3] MTD: add dt parameters for PMECC
Message-ID: <20120523095402.GF3377@game.jcrosoft.org>
References: <1337759274-9921-1-git-send-email-josh.wu@atmel.com>
 <1337759274-9921-3-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1337759274-9921-3-git-send-email-josh.wu@atmel.com>
Cc: hongxu.cn@gmail.com, dedekind1@gmail.com, nicolas.ferre@atmel.com,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 15:47 Wed 23 May     , Josh Wu wrote:
> Signed-off-by: Hong Xu <hong.xu@atmel.com>
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt         |    7 +++++++
>  drivers/mtd/nand/atmel_nand.c                      |   20 ++++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index a200695..895d72b 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -16,6 +16,12 @@ Optional properties:
>  - nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
>    Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
>    "soft_bch".
> +- atmel,has-pmecc : boolean to enable Programmable Multibit ECC hardware.
> +  Only supported by at91sam9x5 or later sam9 product.
> +- atmel,pmecc-cap : error correct capability for Programmable Multibit ECC
> +  Controller. Supported values are: 2, 4, 8, 12, 24.
> +- atmel,sector-size : sector size for ECC computation. Supported values are:
> +  512, 1024.
pmecc-sector-size as it's pmecc specific

Best Regards,
J.
