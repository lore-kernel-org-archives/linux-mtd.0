Received: from mail-oi0-f68.google.com ([209.85.218.68])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ct2vI-0000lJ-Tj
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 02:01:22 +0000
Received: by mail-oi0-f68.google.com with SMTP id t7so171892oig.2
 for <linux-mtd@lists.infradead.org>; Tue, 28 Mar 2017 19:01:00 -0700 (PDT)
Date: Tue, 28 Mar 2017 21:00:58 -0500
From: Rob Herring <robh@kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, laurent.monat@idquantique.com,
 thorsten.christiansson@idquantique.com, Enrico Jorns <ejo@pengutronix.de>,
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
Subject: Re: [RESEND PATCH v2 13/53] mtd: nand: denali_dt: enable
 HW_ECC_FIXUP for Altera SOCFPGA variant
Message-ID: <20170329020058.twiqhpghloxh32pj@rob-hp-laptop>
References: <1490213273-8571-1-git-send-email-yamada.masahiro@socionext.com>
 <1490213273-8571-14-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490213273-8571-14-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 23, 2017 at 05:07:12AM +0900, Masahiro Yamada wrote:
> There are various customizable parameters, so several variants for
> this IP.  A generic compatible like "denali,denali-nand-dt" is
> useless.  Moreover, there are multiple things wrong with this string.
> (Refer to Rob's comment [1])
> 
> The denali_dt.c was split out and this compatible was added by Altera
> for the SOCFPGA port.  So, replace it with a more specific string.
> 
> The Denali IP on SOCFPGA incorporates the hardware ECC fixup feature.
> So, this capability should be associated with the compatible string.
> 
> [1] https://lkml.org/lkml/2016/12/1/450
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v2:
>   - Add caps flag to of_device_id data, not hard-code in driver code
>   - Add Altera-specific compatible.
> 
>  Documentation/devicetree/bindings/mtd/denali-nand.txt |  5 +++--
>  drivers/mtd/nand/denali_dt.c                          | 14 ++++++++++----
>  2 files changed, 13 insertions(+), 6 deletions(-)

You should also mention there are no users (in-tree) of the old string.

Acked-by: Rob Herring <robh@kernel.org>
