Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aw48L-0006SH-E5
 for linux-mtd@lists.infradead.org; Fri, 29 Apr 2016 08:50:46 +0000
Date: Fri, 29 Apr 2016 10:50:23 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Han Xu <han.xu@nxp.com>
Cc: <shijie.huang@arm.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <standby24x7@gmail.com>, <jkosina@suse.cz>,
 <fabio.estevam@freescale.com>, <fransklaver@gmail.com>, <hofrat@osadl.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] mtd: nand: gpmi: document the clocks and
 clock-names in DT property
Message-ID: <20160429105023.0209995a@bbrezillon>
In-Reply-To: <1456268693-8630-3-git-send-email-han.xu@nxp.com>
References: <1456268693-8630-1-git-send-email-han.xu@nxp.com>
 <1456268693-8630-3-git-send-email-han.xu@nxp.com>
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

Hi Han,

On Tue, 23 Feb 2016 17:04:50 -0600
Han Xu <han.xu@nxp.com> wrote:

> add the clocks and clock-names in DT property, gpmi-io clock is
> mandatory for all platforms, but some platforms, such as i.MX6Q may
> need more extra clocks for submodules. More details please refer to the
> SoC reference manual.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 9 +++++++++

Please make sure you add the DT maintainers (and the DT ML) in Cc when
you update DT bindings.

Best Regards,

Boris

>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> index d02acaf..c8d0e2f 100644
> --- a/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.txt
> @@ -13,6 +13,13 @@ Required properties:
>      and GPMI DMA channel ID.
>      Refer to dma.txt and fsl-mxs-dma.txt for details.
>    - dma-names: Must be "rx-tx".
> +  - clocks : The clocks needed by the gpmi controller. This field varies
> +    depends on the SoC design, "gpmi-io" is mandatory but some platforms may
> +    need several extra clocks, such as i.MX6Q, it requires "gpmi_apb,
> +    gpmi_bch, gpmi_bch_apb and per1_bch" for all submodules. Please refer to
> +    the HW design manual.
> +  - clock-names : the name of the clocks, please refer to the HW design
> +    manual.
>  
>  Optional properties:
>    - nand-on-flash-bbt: boolean to enable on flash bbt option if not
> @@ -51,6 +58,8 @@ gpmi-nand@8000c000 {
>  	interrupt-names = "bch";
>  	dmas = <&dma_apbh 4>;
>  	dma-names = "rx-tx";
> +	clocks = <&clks 50>,;
> +	clock-names = "gpmi_io";
>  
>  	partition@0 {
>  	...



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
