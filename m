Received: from mail-wi0-f173.google.com ([209.85.212.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XsLUp-0004e9-71
 for linux-mtd@lists.infradead.org; Sun, 23 Nov 2014 00:57:47 +0000
Received: by mail-wi0-f173.google.com with SMTP id r20so2552006wiv.6
 for <linux-mtd@lists.infradead.org>; Sat, 22 Nov 2014 16:57:25 -0800 (PST)
Message-ID: <5471308E.908@vanguardiasur.com.ar>
Date: Sat, 22 Nov 2014 21:55:42 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Aaron Sierra <asierra@xes-inc.com>, linux-mtd@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] mtd: fsl_upm: Support NAND ECC DTS properties
References: <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Jordan Friendshuh <jfriendshuh@xes-inc.com>, devicetree@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/08/2014 04:11 PM, Aaron Sierra wrote:
> From: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> 
> Support the generic nand-ecc-mode and nand-ecc-strength device-tree
> properties with the Freescale UPM NAND driver.
> 
> This patch preserves the default software ECC mode while adding the
> ability to use BCH ECC for larger NAND devices.
> 
> Signed-off-by: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> ---
> v2:
>     * Now using ECC mode and strength helpers from of_mtd.h
>     * ECC mode and strength checking is more robust
> 
>  .../devicetree/bindings/mtd/fsl-upm-nand.txt       |  2 +
>  drivers/mtd/nand/Kconfig                           |  1 +
>  drivers/mtd/nand/fsl_upm.c                         | 51 +++++++++++++++++++---
>  3 files changed, 49 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> index fce4894..a9906f6 100644
> --- a/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/fsl-upm-nand.txt
> @@ -18,6 +18,8 @@ Optional properties:
>  - chip-delay : chip dependent delay for transferring data from array to
>  	read registers (tR). Required if property "gpios" is not used
>  	(R/B# pins not connected).
> +- nand-ecc-mode : as defined by nand.txt ("soft" and "soft_bch", only).
> +- nand-ecc-strength : as defined by nand.txt.
>  

The nand.txt recommends that each binding documents the way these
properties are interpreted.

Moreover, there's no nand-ecc-step usage? Are you assuming a 512-byte size?
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
