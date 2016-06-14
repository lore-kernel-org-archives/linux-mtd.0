Received: from mail-oi0-f68.google.com ([209.85.218.68])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCnjp-0006bh-BW
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 12:46:37 +0000
Received: by mail-oi0-f68.google.com with SMTP id d132so30487358oig.3
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2016 05:46:17 -0700 (PDT)
Date: Tue, 14 Jun 2016 07:46:14 -0500
From: Rob Herring <robh@kernel.org>
To: Han Xu <han.xu@nxp.com>
Cc: boris.brezillon@free-electrons.com, richard@nod.at, dwmw2@infradead.org,
 computersforpeace@gmail.com, pawel.moll@arm.com,
 mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
 galak@codeaurora.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] mtd: nand: gpmi: document the clocks and
 clock-names in DT property
Message-ID: <20160614124614.GA3616@rob-hp-laptop>
References: <1465578094-8816-1-git-send-email-han.xu@nxp.com>
 <1465578094-8816-3-git-send-email-han.xu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465578094-8816-3-git-send-email-han.xu@nxp.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 10, 2016 at 12:01:30PM -0500, Han Xu wrote:
> add the clocks and clock-names in DT property, gpmi-io clock is
> mandatory for all platforms, but some platforms, such as i.MX6Q may
> need more extra clocks for submodules. More details please refer to the
> SoC reference manual.
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> ---
>  Documentation/devicetree/bindings/mtd/gpmi-nand.txt | 9 +++++++++
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

You need to spell out exactly which clocks each chip/compatible string 
has.

I'm generally suspicious of varying number of clocks. My guess is all 
the versions have the additional clocks, but they are all just tied to 
the same parent. 

Rob
