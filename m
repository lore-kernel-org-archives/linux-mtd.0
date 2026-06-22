Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8067DCDB46B
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jun 2026 09:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ZqiPKcoFjouMlWcsGjOF5SBX/IhhXQD7kMkAFxg3ps=; b=33AHAirjI9iOf6
	Ry48u97MVTXEU8PUA9PIfMLtpg2+wPQx+ZtYugtTmcBqLw2TihbKYBk0iBl4lxP3nnY30nyrszCKv
	KhTPZ5ilCt2H+3XCyc0txNKJHbaTwXOBvpnVGgPQlJEu3ONLXffikM3rDsYWLJVpTCblc4/+RW9kk
	O7d830xTnKhsGnIkArUIkdiVit9ZpCpF+iCzV30/nRcpoQ40MT6RGvCFajcxCvFv5XdjP+zFqAlKO
	WB8PXD3r75cxknsHx3XqUE7YH0+HWsiMzTIsZHwDE/r9d7N5MTBOED1MW3UTlTDVAv1BLcFL1sqB7
	FRbmyEm6ggSru2phCvcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbamu-00000004jxK-1NdP;
	Mon, 22 Jun 2026 09:17:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbamt-00000004jx5-2c3J
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jun 2026 09:17:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13EFD6008A;
	Mon, 22 Jun 2026 09:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A861F000E9;
	Mon, 22 Jun 2026 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782119870;
	bh=75WkuDbFDwK34b3F1MyX5oE8FFFopksL8cNu00Zpxfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R/YCPKRa+xIx11buTQlPiQBzl7DId8G1PzPC7UL7S64waj7Db1cVNTC7Hi9J6NufN
	 tfLNQCkOk2+Yiwd2g7Kff+K3jd/9vIIonnHKSRVleviBvCPzKyfkesEkNeFagjkK10
	 VlNe10Saz2+IaCtgnSOTLjhnDLM9E2bqqpZs1N7Z9/CUXGJSIqMZTeJOlwKDh8eVRI
	 bwmzkNag9rTvKXB25wYsQELubrYvUKmZdOS7adccZYlpk5Ep0/qklu0bh21fg3c0up
	 WhIZL2LfHchOLmyINMWA5XipKHmj7QesrgbmeSf7nuYM03VPyvZiizBRh/80FJLrwA
	 9ms6gjyj3DJYg==
Date: Mon, 22 Jun 2026 11:17:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com, a-dutta@ti.com
Subject: Re: [PATCH v4 02/16] spi: dt-bindings: add spi-phy-pattern-partition
 property
Message-ID: <20260622-jasmine-mandrill-of-emphasis-eebb4c@quoll>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-3-s-k6@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260618073725.84733-3-s-k6@ti.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jun 18, 2026 at 01:07:11PM +0530, Santhosh Kumar K wrote:
> Add spi-phy-pattern-partition, a per-device phandle property on the
> flash sub-node that allows the DT author to directly reference the
> partition holding the PHY tuning pattern. Used to locate the pattern
> data during PHY tuning when the device cannot load the pattern
> dynamically.
> 
> "Read PHY tuning" works by reading a known data pattern from the device
> repeatedly while sweeping controller delay parameters until the
> capture window is stable. For SPI NAND, the driver loads the pattern
> into the page cache once using write-to-cache opcodes, then reads it
> during the sweep. SPI NOR devices have no equivalent opcode, so the
> pattern must be pre-programmed in a dedicated flash partition. One
> partition per device is required to keep the procedure unambiguous
> when multiple devices share a bus.
> 
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> ---
>  .../bindings/spi/cdns,qspi-nor.yaml           | 19 +++++++++++++++++++
>  .../bindings/spi/spi-peripheral-props.yaml    |  7 +++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> index 891f578b5ac4..c6f1b1d1251d 100644
> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
> @@ -204,10 +204,29 @@ examples:
>          flash@0 {
>              compatible = "jedec,spi-nor";
>              reg = <0x0>;
> +            #address-cells = <1>;
> +            #size-cells = <1>;

This is neither needed, nor correct.

>              cdns,read-delay = <4>;
>              cdns,tshsl-ns = <60>;
>              cdns,tsd2d-ns = <60>;
>              cdns,tchsh-ns = <60>;
>              cdns,tslch-ns = <60>;
> +            spi-phy-pattern-partition = <&phy_pattern>;
> +
> +            partitions {
> +                compatible = "fixed-partitions";
> +                #address-cells = <1>;
> +                #size-cells = <1>;
> +
> +                partition@0 {
> +                    label = "data";
> +                    reg = <0x0 0x3fc0000>;
> +                };
> +
> +                phy_pattern: partition@3fc0000 {
> +                    label = "phy-pattern";
> +                    reg = <0x3fc0000 0x40000>;
> +                };
> +            };
>          };
>      };
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index ece86f65930f..38708f8197f9 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -123,6 +123,13 @@ properties:
>      description:
>        Delay, in microseconds, after a write transfer.
>  
> +  spi-phy-pattern-partition:

Is this specific to SPI-based MTD/NAND or rather broader - specific to
MTD/NAND memories, regardless of interface? Feels like the second, thus
maybe should be placed into the NAND bindings.

If the first, then in below description:

s/PHY/SPI PHY/ to be clear that this is about SPI, not the memory
itself.


> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the flash partition holding the pre-programmed PHY tuning
> +      pattern. Used when the device cannot load the pattern dynamically during
> +      PHY tuning.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
