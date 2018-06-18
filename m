Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fUoV6-0001Pk-8t
 for linux-mtd@lists.infradead.org; Mon, 18 Jun 2018 07:22:57 +0000
From: Richard Weinberger <richard@nod.at>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, linux-kbuild@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v3 3/3] mtd: rawnand: denali: optimize timing parameters
 for data interface
Date: Mon, 18 Jun 2018 09:22:44 +0200
Message-ID: <34780659.LX1KsSZy9L@blindfold>
In-Reply-To: <1529025532-22087-4-git-send-email-yamada.masahiro@socionext.com>
References: <1529025532-22087-1-git-send-email-yamada.masahiro@socionext.com>
 <1529025532-22087-4-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Freitag, 15. Juni 2018, 03:18:52 CEST schrieb Masahiro Yamada:
> This commit improves the ->setup_data_interface() hook.
> 
> The denali_setup_data_interface() needs the frequency of clk_x
> and the ratio of clk_x / clk.
> 
> The latter is currently hardcoded in the driver, like this:
> 
>   #define DENALI_CLK_X_MULT       6
> 
> The IP datasheet requires that clk_x / clk be 4, 5, or 6.  I just
> chose 6 because it is the most defensive value, but it is not optimal.
> By getting the clock rate of both "clk" and "clk_x", the driver can
> compute the timing values more precisely.

What datasheet do you have, is it public?
Mine clearly states that the factor is 4.
"The frequency of nand_x_clk is four times the frequency of nand_clk."

> To not break the existing platforms, the fallback value, 50 MHz is
> provided.  It is true for all upstreamed platforms.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard
