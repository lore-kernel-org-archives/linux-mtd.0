Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqnYe-0000eT-0Z
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 21:12:41 +0000
Date: Wed, 22 Mar 2017 22:12:16 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, laurent.monat@idquantique.com,
 thorsten.christiansson@idquantique.com, Enrico Jorns <ejo@pengutronix.de>,
 Jason Roberts <jason.e.roberts@intel.com>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v2 12/53] mtd: nand: denali: support HW_ECC_FIXUP
 capability
Message-ID: <20170322221216.26539147@bbrezillon>
In-Reply-To: <1490191680-14481-13-git-send-email-yamada.masahiro@socionext.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-13-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 22 Mar 2017 23:07:19 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> +static int denali_hw_ecc_fixup(struct mtd_info *mtd,
> +			       struct denali_nand_info *denali)
> +{
> +	int bank = denali->flash_bank;
> +	uint32_t ecc_cor;
> +	unsigned int max_bitflips;
> +
> +	ecc_cor = ioread32(denali->flash_reg + ECC_COR_INFO(bank));
> +	ecc_cor >>= ECC_COR_INFO__SHIFT(bank);
> +
> +	if (ecc_cor & ECC_COR_INFO__UNCOR_ERR)
> +		return -EBADMSG;

As previously mentioned, just increment ecc_stats.failed.

> +
> +	max_bitflips = ecc_cor & ECC_COR_INFO__MAX_ERRORS;
> +
> +	/*
> +	 * The register holds the maximum of the number of corrected bitflips
> +	 * per sector.  This can be returned from ecc->read_page() as-is.
> +	 * Unfortunately, we can not know the total number of corrected bits
> +	 * in the page.  mtd->ecc_stats.corrected is compromised here.
> +	 */
> +	mtd->ecc_stats.corrected += max_bitflips;
> +
> +	return max_bitflips;
> +}
