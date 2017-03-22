Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqn02-0001YH-W1
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 20:36:59 +0000
Date: Wed, 22 Mar 2017 21:36:25 +0100
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
Subject: Re: [PATCH v2 10/53] mtd: nand: denali: fix erased page checking
Message-ID: <20170322213625.4d2cf783@bbrezillon>
In-Reply-To: <1490191680-14481-11-git-send-email-yamada.masahiro@socionext.com>
References: <1490191680-14481-1-git-send-email-yamada.masahiro@socionext.com>
 <1490191680-14481-11-git-send-email-yamada.masahiro@socionext.com>
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

On Wed, 22 Mar 2017 23:07:17 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> This part is wrong in multiple ways:
> 
> [1] is_erased() is called against "buf" twice, so the second one is
> meaningless.  The second call should check chip->oob_poi.
> 
> [2] This code block is nested by double "if (check_erase_page)".
> The inner one is redundant.
> 
> [3] Erased page checking without threshold is false-positive.
> Basically, there are two ways for erased page checking:
> - read the whole of page + oob in raw transfer, then check if all
>   the data are 0xFF.
> - read the ECC-corrected page + oob, then check if *almost* all the
>   data are 0xFF (bit-flips less than ecc.strength are allowed)
> While here, it checks if all data in ECC-corrected page are 0xFF.
> This is too strong because not all of the data are 0xFF after they
> are manipulated by the ECC engine.  Proper threshold must be taken
> into account to avoid false-positive ecc_stats.failed increments.

Hm, the ECC engine should not introduce extra bitflips. I've seen 3
different cases in the various ECC engine I worked with:

1/ the ECC engine is able to correct bitflips in erased pages. In this
   case you should trust it and return the number of corrected
   bitflips or increment the ECC failed counter if it reports
   uncorrectable errors.
2/ the ECC engine is able to detect erased pages, but fails to detect
   those containing bitflips in it. In this case, you should rely on
   the default "empty page" detection and only manually check if the
   page is almost filled with 0xff when an error is reported.
3/ the ECC engine does not detect empty pages at all. In this case, you
   should check if the page empty (or almost empty) each time an ECC
   error is reported

In any case, if the ECC engine reports uncorrectable errors, it should
keep the data untouched, which means you don't have to re-read the whole
page in raw mode, only the OOB bytes.

> 
> [4] positive return value for uncorrectable bitflips
> 
> The comment of ecc->read_page() says it should return "0 if bitflips
> uncorrectable", but the current code could return a positive value
> in the case.

This one should probably be fixed in the core. Returning a negative
error core for uncorrectable errors is forbidden, but reporting the
maximum number of bitflips that have been corrected in each valid
ECC sector of the page (even if the page contains uncorrectable
sectors) does not sound like a bad idea to me.

The reason the core asks drivers to return 0 in case of uncorrectable
errors is because it updates the max_bitflips variable before testing
if the page contains uncorrectable errors [1]. Moving this statement
here [2] (in an else branch) should solve the problem for all drivers
returning positive numbers even when uncorrectable errors are detected
in one of the ECC chunk contained in a page.

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L1999
[2]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L2048
