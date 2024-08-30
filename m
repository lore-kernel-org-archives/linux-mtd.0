Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746A2CA0EDC
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2024 17:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kWEUBZAUBK98CXvRNPU++6u8qKr5QJ9LCBHkBteKbfY=; b=Zj531KNm9HNOBy
	29rC9OBjnpsLyW5e3vyXo9lmijOgFCSdPMobfqj+dDG2ViaGn4q3CZ0iWIm4t2esbv6WUlDJbgg6r
	iPlz6hFCRjy7AtdFpGboUjFFCZZnS44efuRTv5P6YCJ4iQBZXjMnzokzcKA2OsPvyJr+rSURpmjNi
	TuSpKe/VJaRIxg5jemvef5LWIm2YzIR0/eS05gE1xz5T8COwyh3ICHFEd/5T/kq9Ah3M7pKQYGr4g
	oW0I7wm8iteO/lJ8I5LTvtiBsEs88SfjT0TM8SFqAlZr97n5MW5MeZJ4ULaVaAdkgTEx+9DAnZKLn
	pFkRSk6jH7qelDzuJGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk5eO-00000007EW2-18za;
	Fri, 30 Aug 2024 17:43:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk5eL-00000007EVP-0kbT
	for linux-mtd@lists.infradead.org;
	Fri, 30 Aug 2024 17:43:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E10545C0FBE;
	Fri, 30 Aug 2024 17:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB1DC4CEC2;
	Fri, 30 Aug 2024 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725039783;
	bh=uG9/JQIdbEu96p4oSPxyLfmE2ss4VuClCzwnEHEd22Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tMY24y3fqm3RrXNMQJyMYA/rf7AeYALggfmKOq0odYWcDsz11dMiKMhC/m485kK3x
	 68h0KBrW830HXw9lwy1tXecOASizcUcyX9I8i76GKHpCnyQ4m5zBKc6qTrx76iRtWx
	 rw95H0KjRmA9h5p5jyTgqKEADo38kSwk6k4pB72vwk+ZrfIOg0Q+Kmbzfu0XEwFBzj
	 QefRMQOXiV6GliOv22oSVsFV0+8UfJw6zUT0+ds9qje3DtOYFJTrGCqwUs6oL+hA4t
	 2g6+269msUVRq1GA7f1hKjCt3Fnbv/7Jj16o1lHyilyCDmV5hDcvcfmore+OxojdbX
	 y9TQvwInF+XMw==
Date: Fri, 30 Aug 2024 12:43:02 -0500
From: Rob Herring <robh@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>,
	srk@ti.com, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: ti, gpmc-nand: support partitions node
Message-ID: <20240830174302.GA551760-robh@kernel.org>
References: <20240830-gpmc-dtb-v1-1-792cac1ef3cc@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240830-gpmc-dtb-v1-1-792cac1ef3cc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_104305_280895_99302425 
X-CRM114-Status: GOOD (  14.60  )
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

On Fri, Aug 30, 2024 at 03:27:53PM +0300, Roger Quadros wrote:
> Allow fixed-partitions to be specified through a partitions
> node.
> 
> Fixes the below dtbs_check warning:
> 
> arch/arm64/boot/dts/ti/k3-am642-evm-nand.dtb: nand@0,0: Unevaluated properties are not allowed ('partitions' was unexpected)
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
> index 115682fa81b7..c2143f943e7f 100644
> --- a/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-nand.yaml
> @@ -61,6 +61,11 @@ properties:
>        GPIO connection to R/B signal from NAND chip
>      maxItems: 1
>  
> +  partitions:
> +    type: object
> +    description:
> +      Node containing description of fixed partitions.
> +
>  patternProperties:
>    "@[0-9a-f]+$":
>      $ref: /schemas/mtd/partitions/partition.yaml

This and the addition should be replaced with a mtd.yaml reference.

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
