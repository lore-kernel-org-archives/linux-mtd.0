Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7153ACA1002
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SN1s8pc0Hw6pfpUhQZKlT9xxUuy6Fsm1VnZnrTd4OxM=; b=KuVN6A6qeHeRSJ
	vbqr8KiCR6b/Rk1NNu1zMR9lcnXRzi+Sw0/GMm+xMiHMOkSODQ5Xvl1ODug/4unkSN8MMPHC7y6oN
	vPxsjATIMBS53EAIQ0Jp4mF6E8u9MxiUgIFCCthn1UJDqP+MvZU/Nj/lacuvxLuQrJejn8RaHqRS1
	NKcCqk8HjQHK+KGMjz9dxdL/V4JfnT5KOByeFYwDvCKJldLyPdq73XN2pIaGYtfvZSAlYPCMYTvbG
	LTw+RwEtCT/pyHfQaoRSBdejUFy/Ozc9clPesbygk8dUMppRU5HLW+BAmrhVmFxbpTnsLU7G457GT
	47vtd9TXDaW1+HP6SitA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDnW-0000000EIgC-2An4;
	Mon, 01 Sep 2025 23:18:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utB1z-0000000DmAS-1MS9;
	Mon, 01 Sep 2025 20:21:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED00541E48;
	Mon,  1 Sep 2025 20:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9C65C4CEF0;
	Mon,  1 Sep 2025 20:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756758094;
	bh=zupmcbT7MYzC+6+FlkMyuP3znHTEX3ZeQyS/vH9i+Gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EW+IGomsJAUChff9Gfgx3X5WbTf2EUQ+5T88BsXsDAWjg3VLClfaczOTrC4ltqKYm
	 1FcnaH9p0mlgM/q31XczwR0fdwMvgdHH8dXzkQLi+y2pu/o3wLP15oOZ7AQCMZ+TWu
	 64XhQLtlPKeElWy9r3O8Ilc7seDm0rx6MVCQ4+gwTXp3dDb+tGkY3rJZZ14ALGCvK2
	 030OxJ91/4dYE4PKW4ha0791/jnLi6GslFzimkfOEth2Gj0haXg6Q10XhSd3Ti+VtM
	 Z/t5RP/S8BlpP4ETgG4+Xd074Xso3ZjIcuO2a50T9DK/un/sjJzR5stW00O6B9z+D6
	 708z4g2CEN4kg==
Date: Mon, 1 Sep 2025 15:21:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: mtd samsung-s3c2410: Drop S3C2410
 support
Message-ID: <175675809322.277369.1491301346340311064.robh@kernel.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
 <20250830-s3c-cleanup-nand-v1-2-05b99ef990fe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250830-s3c-cleanup-nand-v1-2-05b99ef990fe@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_132135_382275_726CF6CC 
X-CRM114-Status: UNSURE (   9.13  )
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


On Sat, 30 Aug 2025 19:01:10 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of its compatibles.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/mtd/samsung-s3c2410.txt    | 56 ----------------------
>  1 file changed, 56 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
