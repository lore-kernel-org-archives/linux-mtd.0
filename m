Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37586CFB440
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 06:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7f7aKi/ozO82nDSnXosaxTY3DuWrxtOgsxYO4e8Ewc=; b=BF62L7Iodr+PVz
	+QC+5P/n38BLgjKmAbjGUK90/cRS8zuU8HdexY3sBSRmQfOAwLVIzbGpnOOBg5HITfDEcaAA2MKu5
	0OtNQ1gfrkWguaw/JRo9uRpRVO0kTSfpMn2Pf7DFUKVeKFxI62uP9zLZ14cEVBsrk8Uz5YBhtL5s2
	J14ikaUgzwihf24w4ZuBv21AZz2LPxfnrmwsDup4xk+FFHRGH+Ht3k04gDJEE3dImzBue48RAW9Nw
	Pu2NKSHlclbjjTCmQbA9qnRe1LOW0oXgl7dm/EO76Dm43HfJiYCjaQZgnLPMrb/Mudh0SWxfrthXi
	wTmeiX9hD5uQCzMUMPSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxgu7-00000001Msd-1XYD;
	Mon, 07 Oct 2024 06:07:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxgu5-00000001Mrz-05mR
	for linux-mtd@lists.infradead.org;
	Mon, 07 Oct 2024 06:07:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 649FBA41664;
	Mon,  7 Oct 2024 06:07:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9303C4CEC6;
	Mon,  7 Oct 2024 06:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728281251;
	bh=TJDZRfnnzX+xy8MEiw6sdpR/evFaYYUlQz5KOokMWuM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rgif4kiBYf98qIriEbWJ1RlmAXJ9t6cVkAwy7wqP5ktAykrx662rDDUgsE/hpsf/r
	 Qg9WpDC40ZBG26HTlVv2/k4C5pssboAbKtiHKQ2FPE+QZAY5NIVpeosAvWifDnDhVR
	 3kUUk3l/OPX+xCjNKzGoI55bCNOaO0wd4G1vkwh/cISivY4+OmTo9zAOWgnKiqvOcp
	 3lppdvzdZJSrTDLB8cwdCRKvEL6b6EdRRDocvYsKapepqGq0EQ9Mza9GOunWfcOt1h
	 40pMIA9XpAiAnynnNvdenyCyxTUBOkk7WpaWNU9oG/GvFIsYE543BV6l8svTVcyd5D
	 zKhAXRKa8JeTA==
Date: Mon, 7 Oct 2024 08:07:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <deeflg5wd756tkfr6zdta4imuc7ijwl56yclfwiqexlqdq6jsk@5za5g6i7wj6k>
References: <20241006-ondie-v4-0-ff9b9fd9a81d@gmail.com>
 <20241006-ondie-v4-2-ff9b9fd9a81d@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241006-ondie-v4-2-ff9b9fd9a81d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_230733_224707_177C95A0 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

On Sun, Oct 06, 2024 at 03:05:47PM +0200, Marcus Folkesson wrote:
> +  ti,davinci-nand-use-bbt:
> +    type: boolean
> +    description:
> +      Use flash based bad block table support. OOB identifier is saved in OOB
> +      area.
> +    deprecated: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - ti,davinci-chipselect
> +
> +additionalProperties: true

That's a final device schema, this cannot be true. Why you are doing
this entirely different than all other bindings?

You wrote in changelog, that you "silent the errors". Sorry, but that's
a no go. You are not suppose to silent them, but FIX THEM.


> +
> +examples:
> +  - |
> +    nand-controller@2000000 {
> +      compatible = "ti,davinci-nand";
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      reg = <0 0x02000000>;

Keep order like in DTS coding style.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
