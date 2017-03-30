Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctcQg-0005VK-8e
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 15:56:07 +0000
Date: Thu, 30 Mar 2017 17:55:44 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v3 25/37] mtd: nand: denali: switch over to cmd_ctrl
 instead of cmdfunc
Message-ID: <20170330175544.4459007f@bbrezillon>
In-Reply-To: <1490856383-31560-26-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-26-git-send-email-yamada.masahiro@socionext.com>
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

On Thu, 30 Mar 2017 15:46:11 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:


>  /*
>   * sends a pipeline command operation to the controller. See the Denali NAND
>   * controller's user guide for more information (section 4.2.3.6).
> @@ -824,7 +856,13 @@ static void denali_select_chip(struct mtd_info *mtd, int chip)
>  
>  static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
>  {
> -	return 0;
> +	struct denali_nand_info *denali = mtd_to_denali(mtd);
> +	uint32_t irq_status;
> +
> +	/* R/B# pin transitioned from low to high? */
> +	irq_status = denali_wait_for_irq(denali, INTR__INT_ACT);
> +
> +	return irq_status & INTR__INT_ACT ? 0 : NAND_STATUS_FAIL;

Okay, you fix the ->waitfunc() implementation here. Great! Then I'm
fine with patch 18.

>  }
