Received: from mail-ob0-x22b.google.com ([2607:f8b0:4003:c01::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwtNO-0001n5-1K
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 15:01:26 +0000
Received: by obbnk6 with SMTP id nk6so48111971obb.2
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 07:01:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1447336537-3705-1-git-send-email-debrabander@gmail.com>
References: <1447336537-3705-1-git-send-email-debrabander@gmail.com>
Date: Thu, 12 Nov 2015 16:01:05 +0100
Message-ID: <CAFLxGvydxAF5hVqqEGhTec9=rpD5jga0VP8=DvDVDpBZJQ2zuw@mail.gmail.com>
Subject: Re: [PATCH] mtd: orion_nand: support selecting ECC mode via the
 device tree
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Frank de Brabander <debrabander@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 2:55 PM, Frank de Brabander
<debrabander@gmail.com> wrote:
> Currently the Orion NAND ECC mode is hardcoded to NAND_ECC_SOFT, it does not
> allow selecting any other ECC mode. This change makes it possible to use the
> device tree to select other ECC modes. It still defaults to the original
> mode NAND_ECC_SOFT.
>
> This makes the driver more in line with other mtd nand drivers, that already
> support similar ways to select the ECC mode.
>
> Signed-off-by: Frank de Brabander <debrabander@gmail.com>
> ---
>  Documentation/devicetree/bindings/mtd/orion-nand.txt | 4 ++++
>  drivers/mtd/nand/orion_nand.c                        | 6 +++++-
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/orion-nand.txt b/Documentation/devicetree/bindings/mtd/orion-nand.txt
> index 2d6ab66..908c321 100644
> --- a/Documentation/devicetree/bindings/mtd/orion-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/orion-nand.txt
> @@ -11,6 +11,9 @@ Optional properties:
>  - bank-width : Width in bytes of the device. Default is 1
>  - chip-delay : Chip dependent delay for transferring data from array to read
>                 registers in usecs
> +- nand-ecc-mode : String, operation mode of the NAND ecc mode, soft by default.
> +  Supported values are: "none", "soft", "hw", "hw_syndrome", "hw_oob_first",
> +  "soft_bch".

Does the driver (and the NFC) really support all these modes?

-- 
Thanks,
//richard
