Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctsZH-0000eA-AS
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 09:10:05 +0000
Date: Fri, 31 Mar 2017 11:09:38 +0200
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
Subject: Re: [PATCH v3 13/37] mtd: nand: denali: avoid hard-coding
 ecc.strength and ecc.bytes
Message-ID: <20170331110938.071cd993@bbrezillon>
In-Reply-To: <1490856383-31560-14-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-14-git-send-email-yamada.masahiro@socionext.com>
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

On Thu, 30 Mar 2017 15:45:59 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

>  
> diff --git a/drivers/mtd/nand/denali_dt.c b/drivers/mtd/nand/denali_dt.c
> index 1681a30..c3bc333 100644
> --- a/drivers/mtd/nand/denali_dt.c
> +++ b/drivers/mtd/nand/denali_dt.c
> @@ -31,10 +31,12 @@ struct denali_dt {
>  
>  struct denali_dt_data {
>  	unsigned int revision;
> +	unsigned long ecc_strength_avail;

Shouldn't you directly make sure that your driver will support
strengths > BITS_PER_LONG?
I would store the supported strength in a table to make it more
future-proof:

	int *ecc_strength_avail;
	int num_ecc_strengths;


>  	unsigned int caps;
>  };
>  
