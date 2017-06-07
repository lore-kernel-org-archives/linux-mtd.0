Received: from mail-ot0-f194.google.com ([74.125.82.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dIgDB-0007yf-GB
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 19:01:47 +0000
Received: by mail-ot0-f194.google.com with SMTP id a2so1787997oth.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2017 12:01:24 -0700 (PDT)
Date: Wed, 7 Jun 2017 14:01:22 -0500
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v5 05/23] mtd: nand: denali_dt: add compatible strings
 for UniPhier SoC variants
Message-ID: <20170607190122.h3nkuxuzwfvx6gia@rob-hp-laptop>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-6-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496836352-8016-6-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 07, 2017 at 08:52:14PM +0900, Masahiro Yamada wrote:
> Add two compatible strings for UniPhier SoC family.
> 
> "socionext,uniphier-denali-nand-v5a" is used on UniPhier sLD3, LD4,
> Pro4, sLD8.
> 
> "socionext,uniphier-denali-nand-v5b" is used on UniPhier Pro5, PXs2,
> LD6b, LD11, LD20.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v5:
>   - Adjust to the update of generic helpers
> 
> Changes in v4:
>   - Adjusted to generic helpers for ECC engine caps
> 
> Changes in v3: None
> Changes in v2:
>   - Change the compatible strings
>   - Fix the ecc_strength_capability
>   - Override revision number for the newer one
> 
>  .../devicetree/bindings/mtd/denali-nand.txt        |  6 ++++++

I acked v3. Please add acks when posting new versions.

Rob

>  drivers/mtd/nand/denali_dt.c                       | 25 ++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
