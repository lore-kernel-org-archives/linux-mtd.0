Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIben-0006fh-1C
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 14:09:58 +0000
Date: Wed, 7 Jun 2017 16:09:35 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao
 Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Subject: Re: [PATCH v5 19/23] mtd: nand: denali: fix raw and oob accessors
 for syndrome page layout
Message-ID: <20170607160935.6b064eef@bbrezillon>
In-Reply-To: <1496836352-8016-20-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-20-git-send-email-yamada.masahiro@socionext.com>
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

On Wed,  7 Jun 2017 20:52:28 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

>  
> +static void denali_read_buf(struct mtd_info *mtd, uint8_t *buf, int len)
> +{
> +	struct denali_nand_info *denali = mtd_to_denali(mtd);
> +	int i;
> +
> +	iowrite32(MODE_11 | BANK(denali->flash_bank) | 2, denali->flash_mem);

What is this '| 2'? You seem to use it a lot. Can you define a macro
and maybe add a comment if the macro name is not self-descriptive.
