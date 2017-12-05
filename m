Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eMI9A-0008G5-Qq
 for linux-mtd@lists.infradead.org; Tue, 05 Dec 2017 18:40:51 +0000
From: Richard Weinberger <richard@nod.at>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de,
 Han Xu <han.xu@nxp.com>, Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: gpmi: Fix failure when a erased page has a
 bitflip at BBM
Date: Tue, 05 Dec 2017 19:40:54 +0100
Message-ID: <2221916.oFKidPPRfi@blindfold>
In-Reply-To: <20171205105140.915-1-s.hauer@pengutronix.de>
References: <20171205105140.915-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Dienstag, 5. Dezember 2017, 11:51:40 CET schrieb Sascha Hauer:
> When erased subpages are read then the BCH decoder returns STATUS_ERASED
> if they are all empty, or STATUS_UNCORRECTABLE if there are bitflips.
> When there are bitflips, we have to set these bits again to show the
> upper layers a completely erased page. When a bitflip happens in the
> exact byte where the bad block marker is, then this byte is swapped
> with another byte in block_mark_swapping(). The correction code then
> detects a bitflip in another subpage and no longer corrects the bitflip
> where it really happens.
> 
> Correct this behaviour by calling block_mark_swapping() after the
> bitflips have been corrected.
> 
> In our case UBIFS failed with this bug because it expects erased
> pages to be really empty:
> 
> UBIFS error (pid 187): ubifs_scan: corrupt empty space at LEB 36:118735
> UBIFS error (pid 187): ubifs_scanned_corruption: corruption at LEB 36:118735
> UBIFS error (pid 187): ubifs_scanned_corruption: first 8192 bytes from LEB
> 36:118735 UBIFS error (pid 187): ubifs_scan: LEB 36 scanning failed
> UBIFS error (pid 187): do_commit: commit failed, error -117
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c index 50f8d4a1b983..d4d824ef64e9
> 100644
> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> @@ -1067,9 +1067,6 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd,
> struct nand_chip *chip, return ret;
>  	}
> 
> -	/* handle the block mark swapping */
> -	block_mark_swapping(this, payload_virt, auxiliary_virt);
> -
>  	/* Loop over status bytes, accumulating ECC status. */
>  	status = auxiliary_virt + nfc_geo->auxiliary_status_offset;
> 
> @@ -1158,6 +1155,9 @@ static int gpmi_ecc_read_page(struct mtd_info *mtd,
> struct nand_chip *chip, max_bitflips = max_t(unsigned int, max_bitflips,
> *status);
>  	}
> 
> +	/* handle the block mark swapping */
> +	block_mark_swapping(this, buf, auxiliary_virt);
> +
>  	if (oob_required) {
>  		/*
>  		 * It's time to deliver the OOB bytes. See gpmi_ecc_read_oob()

Fixes: bd2e778c9ee3 ("gpmi-nand: Handle ECC Errors in erased pages")
Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
