Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A56CC46CCD
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 22:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Db/PxIr/8KrM6sNc6iDAK02rB0WmsY+g6hWcVdMucqA=; b=I6myOaRi0mKty5
	4aVo6L2l7WBoa6M8M1ihcBngB/L+joaiWAHJ6tw2LqxwNe+HQEEyk0iHm6PBazd1JuJFMrwZpFToU
	TB5FYblE4eaFGljloPT46YuaKMphGD5/tZNLR6NS4i02ryYvVlLdm/cGLy0hwgVaOQ1RUZTMGblID
	+kXrjsbMWotvKKfsC+inl4Ff9CL/fc49M8TBTz8C8awyLD/3ae3GHb4g+c/Yd6k7VdoK2qMfTeqzK
	l/RL7zVJAPLpjQ2vXgMSSHPPOfrh0i6hqJSxSIZx7CLAxetVcmWbks8ENR6LuoRll1kqopLCTSOGH
	zFK5jEos37nenU/MvUHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG52Q-0014VS-2t;
	Wed, 20 Dec 2023 22:27:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG52M-0014TE-2U;
	Wed, 20 Dec 2023 22:27:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4CF1EB81EF6;
	Wed, 20 Dec 2023 22:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1330FC433C8;
	Wed, 20 Dec 2023 22:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703111252;
	bh=09LFZ9wZLT9mCWPWV/qxK5umtM14v7DD0caIrMfURGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hNMZ9AzYyi2cMQDTMeXnUypFNK+n6flnT4m64kwUqhg8J/nVXCyiOH2IcX42AdoHR
	 abWz5xiRK5rLKha8gCWypRLxzaBsje56vhgjbFuD6XOk67ZTNylgHWhA0iPkm/EBIA
	 KHIsO37wtLWEaqTQ7YdGfi95y1mAD/dvjOPnayHfs7efTtRGfJWKhXsjwX/sCygyJW
	 Y0F7ZTREcflbAX44+RbWnqoKdZw02U1HCqd1tnfViyIaUcl/hMS0wDwPOCSTSxl9le
	 XhYqmQJf+9k1LqatCS4a1MpgK0C9uWTtUhKeHuNHk1Artibfj6fYX/FR6bX1BnLa6s
	 BXji2UY1Ki8uQ==
Received: (nullmailer pid 1238181 invoked by uid 1000);
	Wed, 20 Dec 2023 22:27:30 -0000
Date: Wed, 20 Dec 2023 16:27:30 -0600
From: Rob Herring <robh@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Han Xu <han.xu@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, linux-imx@nxp.com, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?iso-8859-1?Q?S=E9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: partitions: u-boot: Fix typo
Message-ID: <170311124964.1238110.7971021577049808628.robh@kernel.org>
References: <20231218130656.9020-1-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231218130656.9020-1-wahrenst@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_142734_946980_8C27DC34 
X-CRM114-Status: UNSURE (   8.69  )
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


On Mon, 18 Dec 2023 14:06:55 +0100, Stefan Wahren wrote:
> The initial description contained a typo.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
