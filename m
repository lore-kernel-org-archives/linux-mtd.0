Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703F7CD5BD0
	for <linux-mtd@archiver.kernel.org>; Sat, 30 May 2026 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IhipHxvq1vZmJwQZHuOjPU8+xQ3em1kzEjP6y2TJqTs=; b=jaYgzVFnSfUdea
	tSgCKey5gSvtb1odOC79kcxrIbszLMH5OIV44nE+jiRSdtrqqrrcJitDiLUQZpyaVUdlUtW6zdq48
	zw5lHX/1dYdqOt/N1W5OOJtCKS7xGY5FnvUQbkv//GqDHLJQbcqdH7yO+s4U/zJncivI/x+uCtvBB
	0eBWlioKLA5p4qrzD3ksKXs8CNZ9lxfWMHVNSbIZw0C5Rmczs+pvmWHI77KA1CL7TczcJjVjcyxfJ
	YIqnMGnb2B7t2W5esm67IFQ5fHPnzDf1XQ26zPuApcqyfYYjj9n8cY7vC95Ojy9Unxrl+lvN7w7x+
	Hpzqtn6pMNMBAIefNARQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTFR1-00000008YJ1-1Wos;
	Sat, 30 May 2026 08:52:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTFQy-00000008YIW-4Bds
	for linux-mtd@lists.infradead.org;
	Sat, 30 May 2026 08:52:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E22F040A97;
	Sat, 30 May 2026 08:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3FA1F00893;
	Sat, 30 May 2026 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780131163;
	bh=/mT4btVGnimZ9Cv2QimGX1edcsMj9bhXopCVFXdF1jw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GUOE/JYYD5ukPosFNGICnMEEXmC/PcIE/e/TdmLcyR0vCHekxgmLErsWQJfmMYHss
	 ypM9VKAGvxo11Bo5h7hD/Wb8S4thlGW2gY1UG7JFo1iSHvpad+j3ECxnpjZ1qAJyje
	 hPAzXsWK9gsDmxAfT5+Nbj4WaDh32qwPlRER45+CMGP9Pva8WMz+Aw3ElXaJRJ8e/0
	 XtetNTRBEPgRE10UVO4Lr8GuVBuh6vPcdKajZ9GqNmyK8yIQyQz9xiGwv0bmmDZrij
	 Xtx2XdOMstrJSS6jKHuIj6lABoa9wbUPsceWF8GpRTs/XA8nn0Ierzm2mYPp6cUtvm
	 /GtilIJ84WxrA==
Date: Sat, 30 May 2026 10:52:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com, a-dutta@ti.com
Subject: Re: [PATCH v3 02/13] spi: dt-bindings: cdns,qspi-nor: add PHY tuning
 pattern partition property
Message-ID: <20260530-original-peccary-of-cubism-af68ed@quoll>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-3-s-k6@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260527175527.2247679-3-s-k6@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_015245_076017_C5FC40BF 
X-CRM114-Status: GOOD (  16.78  )
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

On Wed, May 27, 2026 at 11:25:16PM +0530, Santhosh Kumar K wrote:
> PHY tuning requires a known data pattern to be readable from flash.
> When no partition is explicitly identified, the controller must search
> all available partitions to locate the pattern by label, which adds
> overhead and relies on label naming conventions outside the
> controller's control.
> 
> Add cdns,phy-pattern-partition, a phandle property that allows the DT
> author to directly reference the flash partition holding the PHY tuning
> pattern. The controller uses this partition during calibration, avoiding
> the partition search entirely.
> 
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> ---
>  .../bindings/spi/cdns,qspi-nor-peripheral-props.yaml      | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml
> index 510b82c177c0..0ffcdf5b00d0 100644
> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor-peripheral-props.yaml
> @@ -39,4 +39,12 @@ properties:
>        Delay in nanoseconds between setting qspi_n_ss_out low and
>        first bit transfer.
>  
> +  cdns,phy-pattern-partition:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the flash partition containing the PHY tuning pattern.
> +      When present, the controller uses this partition to locate the
> +      pattern data during PHY tuning instead of searching all partitions
> +      by label.
> +

This should be used in any of applicable examples.

I also have doubts that this is per-device property. Your commit msg
suggests it is per controller.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
