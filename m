Received: from smtp115.sbc.mail.sp1.yahoo.com ([69.147.64.88])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jp6hs-0005nJ-7Z
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 19:02:08 +0000
From: David Brownell <david-b@pacbell.net>
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH] NAND hardware ECC controller on at91sam9263 / at91sam9260
Date: Thu, 24 Apr 2008 12:02:04 -0700
References: <47BABA0C.8070500@gmail.com>
	<1208964556.9212.809.camel@pmac.infradead.org>
	<1208973075.7471.6.camel@ubuntu>
In-Reply-To: <1208973075.7471.6.camel@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200804241202.04290.david-b@pacbell.net>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 23 April 2008, Richard Genoud wrote:
> +static int at91_nand_calculate(struct mtd_info *mtd,
> +               const u_char *dat, unsigned char *ecc_code)
> +{
> +       struct nand_chip *nand_chip = mtd->priv;
> +       struct at91_nand_host *host = nand_chip->priv;
> +       uint32_t *eccpos = nand_chip->ecc.layout->eccpos;
> +       unsigned int ecc_value;
> +
> +       /* get the first 2 ECC bytes */
> +       ecc_value = ecc_readl(host->ecc, PR) & AT91_ECC_PARITY;
> +
> +       ecc_code[eccpos[0]] = ecc_value & 0xFF;
> +       ecc_code[eccpos[1]] = (ecc_value >> 8) & 0xFF;

My copy of the sam9263 docs doesn't list an "ECC_PARITY" field
in the PR register ... just two masked fields, 0xfff0 and 0x000f
labeled WORDADDR and BITADDR respectively.  (Which evidently are
combined into a single opague 0xffff mask on block writes, and
are interpretable only on block reads.)

And the system header doesn't have an ECC_PARITY mask ... so I
get build errors with current GIT.


> +
> +       /* get the last 2 ECC bytes */
> +       ecc_value = ecc_readl(host->ecc, NPR) & AT91_ECC_NPARITY;
> +
> +       ecc_code[eccpos[2]] = ecc_value & 0xFF;
> +       ecc_code[eccpos[3]] = (ecc_value >> 8) & 0xFF;

That one builds OK.

I suggest you just remove the masks from the readl() lines.
They're not necessary.

- Dave


> +
> +       return 0;
> +}
