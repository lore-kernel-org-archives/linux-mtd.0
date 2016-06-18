Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bECTT-00075o-BN
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 09:23:32 +0000
Subject: Re: [PATCH v2 05/15] mtd: nand: add manufacturer specific
 initialization/detection steps
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
References: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465390849-13199-6-git-send-email-boris.brezillon@free-electrons.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 Aleksei Mamlin <mamlinav@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <576512F5.7050506@nod.at>
Date: Sat, 18 Jun 2016 11:23:01 +0200
MIME-Version: 1.0
In-Reply-To: <1465390849-13199-6-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

Am 08.06.2016 um 15:00 schrieb Boris Brezillon:
> A lot of NANDs are implementing generic features in a non-generic way,
> or are providing advanced auto-detection logic where the NAND ID bytes
> meaning changes with the NAND generation.
> 
> Providing this vendor specific initialization step will allow us to get
> rid of the full ids in the nand_ids table or all the vendor specific
> cases added over the time in the generic NAND ID decoding logic.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 42 ++++++++++++++++++++++++++++++++----------
>  include/linux/mtd/nand.h     | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 95e9a8e..0a7d1c6 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3580,7 +3580,7 @@ static int nand_get_bits_per_cell(u8 cellinfo)
>   * chip. The rest of the parameters must be decoded according to generic or
>   * manufacturer-specific "extended ID" decoding patterns.
>   */
> -static void nand_decode_ext_id(struct nand_chip *chip)
> +void nand_decode_ext_id(struct nand_chip *chip)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	int extid, id_len = chip->id.len;
> @@ -3705,6 +3705,7 @@ static void nand_decode_ext_id(struct nand_chip *chip)
>  
>  	}
>  }
> +EXPORT_SYMBOL_GPL(nand_decode_ext_id);
>  
>  /*
>   * Old devices have chip data hardcoded in the device ID table. nand_decode_id
> @@ -3815,7 +3816,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	int busw;
> -	int i, maf_idx;
> +	int i, maf_idx, ret;
>  	u8 *id_data = chip->id.data;
>  	u8 maf_id, dev_id;
>  
> @@ -3856,6 +3857,14 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  
>  	chip->id.len = nand_id_len(id_data, 8);
>  
> +	/* Try to identify manufacturer */
> +	for (maf_idx = 0; nand_manuf_ids[maf_idx].id != 0x0; maf_idx++) {
> +		if (nand_manuf_ids[maf_idx].id == maf_id)
> +			break;
> +	}
> +
> +	chip->manufacturer.ops = nand_manuf_ids[maf_idx].ops;
> +

Instead of checking on every access whether chip->manufacturer.ops is present, just
assign a nop field.
i.e.

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 55f3ab8..aadebe7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3703,6 +3703,10 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)

 	chip->manufacturer.ops = nand_manuf_ids[maf_idx].ops;

+	if (!chip->manufacturer.ops)
+		/* assign no operations */
+		chip->manufacturer.ops = nand_manuf_ids[0].ops;
+
 	if (!type)
 		type = nand_flash_ids;

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index f1476ff..cdd26af 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -173,6 +173,8 @@ extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
 extern const struct nand_manufacturer_ops amd_nand_manuf_ops;
 extern const struct nand_manufacturer_ops macronix_nand_manuf_ops;

+static const struct nand_manufacturer_ops no_ops;
+
 struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
 	{NAND_MFR_SAMSUNG, "Samsung", &samsung_nand_manuf_ops},
@@ -188,7 +190,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_SANDISK, "SanDisk"},
 	{NAND_MFR_INTEL, "Intel"},
 	{NAND_MFR_ATO, "ATO"},
-	{0x0, "Unknown"}
+	{0x0, "Unknown", &no_ops}
 };

 EXPORT_SYMBOL(nand_manuf_ids);


>  	if (!type)
>  		type = nand_flash_ids;
>  
> @@ -3903,8 +3912,14 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  	chip->chipsize = (uint64_t)type->chipsize << 20;
>  
>  	if (!type->pagesize) {
> -		/* Decode parameters from extended ID */
> -		nand_decode_ext_id(chip);
> +		/*
> +		 * Try manufacturer detection if available and use
> +		 * nand_decode_ext_id() otherwise.
> +		 */
> +		if (chip->manufacturer.ops->detect)

You need to check here for chip->manufacturer.ops first.

Thanks,
//richard
