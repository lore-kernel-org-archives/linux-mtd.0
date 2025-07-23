Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A77A9C83F17
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 04:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UH8X0ga0B7d9yKVaGBf0WvZbGbw8U8ioTqf1rcjc3fI=; b=UvH/8EG9TZMG2m
	ZaHX3iRjg9nt+HdqmUrfmAKdSMVstA7UncH8O89w9Aa4rTD92hPzkwy+z2/IR2hkKn/Erwo79CmKJ
	LuhdsDYqkchmUmBrHCe1zcMhR1P7LlDytldFH4hKJU/tpQLdos8bS0s2+a2l7LjBrl/uehbgMESkN
	sGO3Txhx7+VbZJziOstfRZxvn7P7TYS8rNX061/GbVr2LKkPUubuyLVPmLt+hNUfm7pFFPqnLnzX3
	+KuFYUl1e5GHIei8qtTFXzb4APAXTH9rsjqwwYk97v9tmTy431YCrSgZW7Bbx25JT5z/wCbQo2b2x
	cS+2dtOuomMZOvRIHHJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRTq-0000000415e-3y88;
	Wed, 23 Jul 2025 04:53:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRTo-00000004153-0eiT
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 04:53:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 672ACA528D6;
	Wed, 23 Jul 2025 04:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF643C4CEE7;
	Wed, 23 Jul 2025 04:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753246403;
	bh=6960Oe+ygdAUIT8IES+usufPt7vUmG+j/++rDLnHJ+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qeO14F3rVsqV0udR9lCnw+pfDYgncDn+cJKtQKtaSl+fse3rOEBbpJClTzvUmOTFZ
	 gOmRNs3ADYf/X70gphZHrXQQfyjTort5XJGf+YIHo0OxUoEdsCdQq8DGlUeLQF1OCW
	 fmbLPp0ngcXUKtcNhOTeS79D7Nzf5BCFhNJrffOapSSX1uJnqaww9gmq1zzTb6VWwj
	 JZCz4S7w+zda6Z2DotA0Xg1Fb7TS/cG4/8z76HdCpGyC8QRRp5nztwRf6e2YdECdEC
	 w1XrmaviZFDWACnk4zI5qimuNzdxdiSKhneGRZpDfN5ggzJlYAIQ5UAHWogBd3uPKr
	 irPKyrvnl+QHA==
Date: Tue, 22 Jul 2025 23:53:22 -0500
From: Rob Herring <robh@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev,
	devicetree@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 7/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K1000 NAND controller
Message-ID: <20250723045322.GA1226341-robh@kernel.org>
References: <cover.1753166096.git.zhoubinbin@loongson.cn>
 <ed625518c752738cb7e24f6d4b7fb9b62a609880.1753166096.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed625518c752738cb7e24f6d4b7fb9b62a609880.1753166096.git.zhoubinbin@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_215324_330112_64C8484D 
X-CRM114-Status: GOOD (  14.95  )
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

On Tue, Jul 22, 2025 at 05:11:06PM +0800, Binbin Zhou wrote:
> Add new compatible for the Loongson-2K NAND controller used for
> Loongson-2K1000 SoC.
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../mtd/loongson,ls1b-nand-controller.yaml    | 58 +++++++++++++++++--
>  1 file changed, 54 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
> index 4ec2b5d1e89d..07a0d9b40fdd 100644
> --- a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
> +++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
> @@ -26,18 +26,19 @@ properties:
>            - loongson,ls1b-nand-controller
>            - loongson,ls1c-nand-controller
>            - loongson,ls2k0500-nand-controller
> +          - loongson,ls2k1000-nand-controller
>        - items:
>            - enum:
>                - loongson,ls1a-nand-controller
>            - const: loongson,ls1b-nand-controller
>  
>    reg:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    reg-names:
> -    items:
> -      - const: nand
> -      - const: nand-dma

Keep the list and add dma-config here and 'minItems: 2'

> +    minItems: 2
> +    maxItems: 3
>  
>    dmas:
>      maxItems: 1
> @@ -54,6 +55,32 @@ required:
>  
>  unevaluatedProperties: false
>  
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - loongson,ls2k1000-nand-controller
> +
> +then:
> +  properties:
> +    reg:
> +      minItems: 3
> +    reg-names:
> +      items:
> +        - const: nand
> +        - const: nand-dma
> +        - const: dma-config

And just 'minItems: 3' here

> +
> +else:
> +  properties:
> +    reg:
> +      maxItems: 2
> +    reg-names:
> +      items:
> +        - const: nand
> +        - const: nand-dma

And 'maxItems: 2' here.

> +
>  examples:
>    - |
>      nand-controller@1fe78000 {
> @@ -72,3 +99,26 @@ examples:
>              nand-ecc-algo = "hamming";
>          };
>      };
> +
> +  - |
> +    nand-controller@1fe26000 {
> +        compatible = "loongson,ls2k1000-nand-controller";
> +        reg = <0x1fe26000 0x24>,
> +              <0x1fe26040 0x4>,
> +              <0x1fe00438 0x8>;
> +        reg-names = "nand", "nand-dma", "dma-config";
> +        dmas = <&apbdma0 0>;
> +        dma-names = "rxtx";
> +
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        nand@0 {
> +            reg = <0>;
> +            label = "ls2k1000-nand";
> +            nand-use-soft-ecc-engine;
> +            nand-ecc-algo = "bch";
> +            nand-ecc-strength = <8>;
> +            nand-ecc-step-size = <512>;
> +        };
> +    };
> -- 
> 2.47.3
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
