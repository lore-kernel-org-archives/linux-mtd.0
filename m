Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993ACC04FFE
	for <linux-mtd@archiver.kernel.org>; Wed,  8 May 2024 19:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0r5dCujbpRQhgEbpllnGWYMd6RyYnZkevu/E1zzzhas=; b=RKbPKH57thlj8q
	1minzbGyQATA88hFL7Mk9kwMFXc11tK7RAGlOL4SKVs/PjONYt8diWHynHxqE+REvXPtqK4gbiAfE
	LBsdTYZeBKxmVgASL+32uZlvoyQ9HdPlTHFyv5SRYU6RTBYln60wORWJvjei/OX5ErlpFyCeS+Qw+
	FibZJ6Bt/d/mWVfDHB0dNwJZ5bQwZg4HyEbeB/PWjgDdHiScHJz4y0se1iS3BVURwJTAVWwqrTz76
	mSP+7yAcqvpIsM7TmrxZOTr/4nF1eiWK1ct8GhjgcsyD4T8++8q+ZjjAZ1FEizih5z2a/CiG22ykk
	pu+paRJY+8ePmbDIGl7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mgU-0000000GfRC-3jUl;
	Wed, 08 May 2024 19:10:34 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mgQ-0000000GfQ9-24MT
	for linux-mtd@lists.infradead.org;
	Wed, 08 May 2024 19:10:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5CE85CE19F6;
	Wed,  8 May 2024 19:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FFCC113CC;
	Wed,  8 May 2024 19:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715195427;
	bh=8X6+44daOTVhYsmsLkXUJSkQDo/m4CLnbDr06hibE2c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hJ5vKu5V89xWFWP1uYZlLrERK6CfxhPrCY6a8jb/ySjrZpqFudFLNPgiHXJNwT0Vz
	 jNNAgxaY722wbJG58KXTBXYeaE9qCJa5MBu4cHlnEZVyiZJRxBcEsNPGbtSylESxro
	 7IYzzLEACMQIlfR13GffPC2zgaGBcES3tE7JUXokXFDc5Q87AUCEppAl68YAiWwQA2
	 rUKh1AakYlWWOHHva2U4Mm31oZYoA3D7aFvUhPxMKCGzH1HEJnFgaJBTLzQu1P6e23
	 MLL2+Y958qtYm8LI1ZcYA6C2S1aG3+vjWDYCxq6j0dsOrAXeNfU4Z373ZncS/wHAbH
	 0L2Waj4d4EsVw==
Date: Wed, 8 May 2024 14:10:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Shijie Qin <shijie.qin@nxp.com>, Ming Qian <ming.qian@nxp.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Zhou Peng <eagle.zhou@nxp.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Jeff LaBundy <jeff@labundy.com>,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] dt-bindings: Use full path to other schemas
Message-ID: <171519542260.2430941.15049314403040181204.robh@kernel.org>
References: <20240505084618.135705-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240505084618.135705-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_121030_739905_DACDB908 
X-CRM114-Status: GOOD (  11.55  )
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


On Sun, 05 May 2024 10:46:18 +0200, Krzysztof Kozlowski wrote:
> When referencing other schema, it is preferred to use an absolute path
> (/schemas/....), which allows also an seamless move of particular schema
> out of Linux kernel to dtschema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Rob, maybe you can take it directly? Should apply cleanly on your tree.
> ---
>  Documentation/devicetree/bindings/input/azoteq,iqs7222.yaml | 2 +-
>  Documentation/devicetree/bindings/media/amphion,vpu.yaml    | 2 +-
>  Documentation/devicetree/bindings/mtd/mtd.yaml              | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 

Applied, thanks!


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
