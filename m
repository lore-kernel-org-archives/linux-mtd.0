Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuBsb-0008H1-IC
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2018 07:24:07 +0000
Date: Mon, 27 Aug 2018 09:23:41 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2] mtd: rawnand: denali: do not pass zero maxchips to
 nand_scan()
Message-ID: <20180827092341.1385ea7d@bbrezillon>
In-Reply-To: <1535353301-1727-1-git-send-email-yamada.masahiro@socionext.com>
References: <1535353301-1727-1-git-send-email-yamada.masahiro@socionext.com>
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

On Mon, 27 Aug 2018 16:01:41 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Commit 49aa76b16676 ("mtd: rawnand: do not execute nand_scan_ident()
> if maxchips is zero") gave a new meaning for calling nand_scan_ident()
> with maxchips=0.
> 
> It is a special usage for some drivers such as docg4, but actually
> the Denali driver may pass maxchips=0 to nand_scan() when the driver
> is enabled but no NAND chip is found on the board for some reasons.
> 
> If nand_scan_with_ids() is called with maxchips=0, nand_scan_ident()
> is skipped, then nand_set_defaults() is skipped as well.  Thus, the
> driver must set chip->controller beforehand.  Otherwise, nand_attach()
> causes NULL pointer dereference.
> 
> In fact, the Denali controller knows the number of connected chips
> before calling nand_scan_ident(); if DEVICE_RESET fails, there is no
> chip in that chip select.  Then, denali_reset_banks() sets the maxchips
> to the number of detected chips.  If no chip is found, maxchips is zero.
> 
> In this case, there is no point for calling nand_scan() because we know
> it will fail for sure.  Let's make the probe function fail immediately.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Looks good to me. I'm waiting for Miquel's ack and I'll queue it to
mtd/fixes.

Thanks,

Boris
