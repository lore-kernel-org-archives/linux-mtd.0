Received: from mail-pf0-x22b.google.com ([2607:f8b0:400e:c00::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auvx9-0000Fx-Am
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 05:54:31 +0000
Received: by mail-pf0-x22b.google.com with SMTP id n1so2867994pfn.2
 for <linux-mtd@lists.infradead.org>; Mon, 25 Apr 2016 22:54:10 -0700 (PDT)
Date: Mon, 25 Apr 2016 22:53:55 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 "open list:BROADCOM STB NAND FLASH DRIVER"
 <bcm-kernel-feedback-list@broadcom.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] mtd: brcmnand: respect ECC algorithm set by NAND
 subsystem
Message-ID: <20160426055355.GA25981@localhost>
References: <1461324197-1333-1-git-send-email-zajec5@gmail.com>
 <1461324197-1333-3-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1461324197-1333-3-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 22, 2016 at 01:23:15PM +0200, Rafał Miłecki wrote:
> It's more reliable than guessing based on ECC strength. It allows using
> NAND on devices with BCH-1 (e.g. D-Link DIR-885L).
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/brcmnand/brcmnand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
> index c3331ff..dcb22dc 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -1927,7 +1927,7 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
>  
>  	switch (chip->ecc.size) {
>  	case 512:
> -		if (chip->ecc.strength == 1) /* Hamming */
> +		if (chip->ecc.algo == NAND_ECC_HAMMING)

This doesn't handle most of the problems I noted on the early version of
this series. (But thank you for following through on the algorithm
selection refactoring!)

Particularly, this change will
(a) break any existing DTs which used to have 'nand-ecc-size = <1>', and
    would assume this gets Hamming ECC; and
(b) allows DTs to specify Hamming ECC for unsupported modes, like 1024B
    sectors, or ecc_level != 1. None of these are supported in HW.

>  			cfg->ecc_level = 15;
>  		else
>  			cfg->ecc_level = chip->ecc.strength;

Something like the following probably works better (not tested):

---8<---

From: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 25 Apr 2016 20:48:02 -0700
Subject: [PATCH] mtd: brcmnand: respect ECC algorithm set by the NAND
 subsystem

This is more obvious than guessing based on ECC strength. It allows
using NAND on devices with BCH-1 (e.g. D-Link DIR-885L).

This maintains DT backward compatibility by defaulting to Hamming if a
1-bit ECC algorithm is specified without a corresponding algorithm
selection. i.e., to use BCH-1, you must specify:

  nand-ecc-strength = <1>;
  nand-ecc-step-size = <512>;
  nand-ecc-algo = "bch";

Also adds a check to ensure we haven't allowed someone to get by with SW
ECC. If we want to support SW ECC, we need to refactor some other pieces
of this driver.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index c3331ffcaffd..b76ad7c0144f 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1925,9 +1925,31 @@ static int brcmnand_setup_dev(struct brcmnand_host *host)
 	cfg->col_adr_bytes = 2;
 	cfg->blk_adr_bytes = get_blk_adr_bytes(mtd->size, mtd->writesize);
 
+	if (chip->ecc.mode != NAND_ECC_HW) {
+		dev_err(ctrl->dev, "only HW ECC supported; selected: %d\n",
+			chip->ecc.mode);
+		return -EINVAL;
+	}
+
+	if (chip->ecc.algo == NAND_ECC_UNKNOWN) {
+		if (chip->ecc.strength == 1 && chip->ecc.size == 512)
+			/* Default to Hamming for 1-bit ECC, if unspecified */
+			chip->ecc.algo = NAND_ECC_HAMMING;
+		else
+			/* Otherwise, BCH */
+			chip->ecc.algo = NAND_ECC_BCH;
+	}
+
+	if (chip->ecc.algo == NAND_ECC_HAMMING && (chip->ecc.strength != 1 ||
+						   chip->ecc.size != 512)) {
+		dev_err(ctrl->dev, "invalid Hamming params: %d bits per %d bytes\n",
+			chip->ecc.strength, chip->ecc.size);
+		return -EINVAL;
+	}
+
 	switch (chip->ecc.size) {
 	case 512:
-		if (chip->ecc.strength == 1) /* Hamming */
+		if (chip->ecc.algo == NAND_ECC_HAMMING)
 			cfg->ecc_level = 15;
 		else
 			cfg->ecc_level = chip->ecc.strength;
-- 
2.8.0.rc3.226.g39d4020
