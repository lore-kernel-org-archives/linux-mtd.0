Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqnW4-00075B-Ff
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 21:10:08 +0000
Date: Wed, 22 Mar 2017 22:09:37 +0100
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
Message-ID: <20170322220937.202c5180@bbrezillon>
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

> @@ -339,6 +352,7 @@ struct denali_nand_info {
>  	int bbtskipbytes;
>  	int max_banks;
>  	unsigned int caps;
> +#define DENALI_CAP_HW_ECC_FIXUP			BIT(0)

Can you move this definition outside of the struct denali_nand_info
definition?

>  };
>  
>  extern int denali_init(struct denali_nand_info *denali);
