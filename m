Date: Wed, 25 May 2016 20:16:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Rob Herring <robh+dt@kernel.org>,
 Pawel Moll <pawel.moll@arm.com>, Mark Brown <broonie@kernel.org>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Russell King <linux@arm.linux.org.uk>, Josh Wu <rainyfeeling@outlook.com>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] Revert "mtd: atmel_nand: Support variable RB_EDGE
 interrupts"
Message-ID: <20160526031654.GA107505@google.com>
References: <1462776680-5284-1-git-send-email-wenyou.yang@atmel.com>
 <1462776680-5284-2-git-send-email-wenyou.yang@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462776680-5284-2-git-send-email-wenyou.yang@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Mon, May 09, 2016 at 02:51:18PM +0800, Wenyou Yang wrote:
> This reverts commit 5ddc7bd43ccc ("mtd: atmel_nand: Support variable
> RB_EDGE interrupts")
> 
> Because for current SoCs, the RB_EDGE3(i.e. bit 27) of HSMC_SR
> register does not exist, the RB_EDGE0 (i.e. bit 24) is the ready/busy
> line edge status bit. It is a datasheet bug.
> 
> Signed-off-by: Wenyou Yang <wenyou.yang@atmel.com>
> ---
> 
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  2 +-
>  drivers/mtd/nand/atmel_nand.c                      | 35 +++++-----------------
>  drivers/mtd/nand/atmel_nand_nfc.h                  |  3 +-
>  3 files changed, 10 insertions(+), 30 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> index d53aba9..3e7ee99 100644
> --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> @@ -39,7 +39,7 @@ Optional properties:
>  
>  Nand Flash Controller(NFC) is an optional sub-node
>  Required properties:
> -- compatible : "atmel,sama5d3-nfc" or "atmel,sama5d4-nfc".
> +- compatible : "atmel,sama5d3-nfc".
>  - reg : should specify the address and size used for NFC command registers,
>          NFC registers and NFC SRAM. NFC SRAM address and size can be absent
>          if don't want to use it.
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index efc8ea2..68b9160 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
[...]
>  static const struct of_device_id atmel_nand_nfc_match[] = {
> -	{ .compatible = "atmel,sama5d3-nfc", .data = &sama5d3_nfc_caps },
> -	{ .compatible = "atmel,sama5d4-nfc", .data = &sama5d4_nfc_caps },
> +	{ .compatible = "atmel,sama5d3-nfc" },

Hmm, wait. Didn't Rob and Alexandre suggest that we should *not* drop
the compatible property? We could have easily supported both here, and
just not listed any different capabilities. But I see that Nicholas took
the patch anyway, so I guess it's not a big deal...

>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, atmel_nand_nfc_match);

Brian
