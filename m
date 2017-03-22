Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqnKJ-0002zK-7P
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 20:57:53 +0000
Date: Wed, 22 Mar 2017 21:57:28 +0100
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
Subject: Re: [PATCH v2 11/53] mtd: nand: denali: fix bitflips calculation in
 handle_ecc()
Message-ID: <20170322215728.69e8b566@bbrezillon>
In-Reply-To: <1490191680-14481-12-git-send-email-yamada.masahiro@socionext.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-12-git-send-email-yamada.masahiro@socionext.com>
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

On Wed, 22 Mar 2017 23:07:18 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> +	do {
> +		err_addr = ioread32(denali->flash_reg + ECC_ERROR_ADDRESS);
> +		err_sector = ECC_SECTOR(err_addr);
> +		err_byte = ECC_BYTE(err_addr);
> +
> +		err_cor_info = ioread32(denali->flash_reg + ERR_CORRECTION_INFO);
> +		err_cor_value = ECC_CORRECTION_VALUE(err_cor_info);
> +		err_device = ECC_ERR_DEVICE(err_cor_info);
> +
> +		/* reset the bitflip counter when crossing ECC sector */
> +		if (err_sector != prev_sector)
> +			bitflips = 0;
> +
> +		if (ECC_ERROR_UNCORRECTABLE(err_cor_info)) {
> +			/*
> +			 * if the error is not correctable, need to look at the
> +			 * page to see if it is an erased page. if so, then
> +			 * it's not a real ECC error
> +			 */
> +			ret = -EBADMSG;

You should never return -EBADMSG directly. Just increment
ecc_stats.failed and let the core return -EBADMSG to the upper layer.
