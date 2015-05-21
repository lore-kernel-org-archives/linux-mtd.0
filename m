Received: from mail-by2on0105.outbound.protection.outlook.com
 ([207.46.100.105] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvXYp-0000Yq-Pm
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 20:59:24 +0000
Message-ID: <1432241934.27761.230.camel@freescale.com>
Subject: Re: [PATCH v2] mtd: fsl_elbc_nand Add ECC mode selection in DT
From: Scott Wood <scottwood@freescale.com>
To: Tomas Hlavacek <tmshlvck@gmail.com>
Date: Thu, 21 May 2015 15:58:54 -0500
In-Reply-To: <1432208791-20734-1-git-send-email-tmshlvck@gmail.com>
References: <20150507231530.GT32500@ld-irv-0074>
 <1432208791-20734-1-git-send-email-tmshlvck@gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-05-21 at 13:46 +0200, Tomas Hlavacek wrote:
> Add device tree pointer to chip structure in order to allow turn off the
> HW ECC and force own ECC mode and ECC parameters. Newly supported entries
> are as per documentation: nand-ecc-mode, nand-ecc-step-size
> and nand-ecc-strength.

If you're using these properties with eLBC, the eLBC binding needs to be
updated to say that they're allowed for use with software ECC.

> @@ -677,8 +689,8 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
>  		priv->page_size = 1;
>  		setbits32(&lbc->bank[priv->bank].or, OR_FCM_PGS);
>  		/* adjust ecc setup if needed */
> -		if ((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
> -		    BR_DECC_CHK_GEN) {
> +		if (((in_be32(&lbc->bank[priv->bank].br) & BR_DECC) ==
> +		    BR_DECC_CHK_GEN) && (chip->ecc.mode == NAND_ECC_HW)) {

There's no need to check both.  If you're selecting software ECC in the
device tree then you must also remove ECC checking from BRn.

If you want to make Linux write to BRn to ensure that it's consistent
with ecc.mode after the DT init, fine, but don't just silently proceed
without fixing it if there's an inconsistency.

> @@ -786,6 +801,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
>  		chip->ecc.size = 512;
>  		chip->ecc.bytes = 3;
>  		chip->ecc.strength = 1;
> +		chip->ecc.write_subpage = fsl_elbc_write_subpage;
>  	} else {
>  		/* otherwise fall back to default software ECC */
>  		chip->ecc.mode = NAND_ECC_SOFT;

...but here you are relying on BRn to be set correctly before
nand_dt_init(), so I'm even more confused by what the previous change is
for.

-Scott
