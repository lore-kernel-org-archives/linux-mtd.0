Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aUIS4-0004vv-Fr
 for linux-mtd@lists.infradead.org; Fri, 12 Feb 2016 18:28:22 +0000
Received: by mail-pf0-x242.google.com with SMTP id 71so4297542pfv.1
 for <linux-mtd@lists.infradead.org>; Fri, 12 Feb 2016 10:28:00 -0800 (PST)
Date: Fri, 12 Feb 2016 10:27:57 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Romain Izard <romain.izard.pro@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Josh Wu <rainyfeeling@outlook.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 1/5] mtd: atmel_nand: Support variable RB_EDGE
 interrupts
Message-ID: <20160212182757.GO19540@google.com>
References: <1455098187-9442-1-git-send-email-romain.izard.pro@gmail.com>
 <1455098187-9442-2-git-send-email-romain.izard.pro@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1455098187-9442-2-git-send-email-romain.izard.pro@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 10, 2016 at 10:56:23AM +0100, Romain Izard wrote:
> The NFC controller used to accelerate the NAND transfers on SAMA5 chips
> can use either RB_EDGE0 or RB_EDGE3 as its ready/busy interrupt bit.
> 
> Use the controller's compatible string to select the correct bit.
> 
> For the binding:
> Acked-by: Rob Herring <robh@kernel.org>
> 
> Reviewed-by: Wenyou Yang <Wenyou.yang@atmel.com>
> Tested-by: Wenyou Yang <wenyou.yang@atmel.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
> ---
> v4: collect tested-by and reviewed-by tags
> v3: constify atmel_nand_nfc_caps structures
> v2: use of_device_get_match_data
>     rename struct atmel_nand_nfc_priv as atmel_nand_nfc_caps
>     rename member rb_edge as rb_mask
>     do not create defines for unused status bits
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  2 +-
>  drivers/mtd/nand/atmel_nand.c                      | 35 +++++++++++++++++-----
>  drivers/mtd/nand/atmel_nand_nfc.h                  |  3 +-
>  3 files changed, 30 insertions(+), 10 deletions(-)

Applied patches 1-4, with the following style diff:

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index aaad1b98dd0d..20cbaabb2959 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -2395,7 +2395,7 @@ static int atmel_nand_nfc_probe(struct platform_device *pdev)
 
 	nfc->caps = (const struct atmel_nand_nfc_caps *)
 		of_device_get_match_data(&pdev->dev);
-	if (NULL == nfc->caps)
+	if (!nfc->caps)
 		return -ENODEV;
 
 	nfc_writel(nfc->hsmc_regs, IDR, 0xffffffff);
