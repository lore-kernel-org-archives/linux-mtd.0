Received: from mail-oi0-f65.google.com ([209.85.218.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cv4CH-0002It-RU
 for linux-mtd@lists.infradead.org; Mon, 03 Apr 2017 15:47:15 +0000
Received: by mail-oi0-f65.google.com with SMTP id s11so4128243oie.1
 for <linux-mtd@lists.infradead.org>; Mon, 03 Apr 2017 08:46:53 -0700 (PDT)
Date: Mon, 3 Apr 2017 10:46:52 -0500
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Graham Moore <grmoore@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 16/37] mtd: nand: denali_dt: add compatible strings
 for UniPhier SoC variants
Message-ID: <20170403154652.tzfgy4l2m33pqvzd@rob-hp-laptop>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-17-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490856383-31560-17-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 30, 2017 at 03:46:02PM +0900, Masahiro Yamada wrote:
> Add two compatible strings for UniPhier SoCs.
> 
> "socionext,uniphier-denali-nand-v5a" is used on UniPhier sLD3, LD4,
> Pro4, sLD8 SoCs.
> 
> "socionext,uniphier-denali-nand-v5b" is used on UniPhier Pro5, PXs2,
> LD6b, LD11, LD20 SoCs.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v3: None
> Changes in v2:
>   - Change the compatible strings
>   - Fix the ecc_strength_capability
>   - Override revision number for the newer one
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  6 ++++++
>  drivers/mtd/nand/denali_dt.c                       | 23 ++++++++++++++++++++++
>  2 files changed, 29 insertions(+)

Acked-by: Rob Herring <robh@kernel.org> 
