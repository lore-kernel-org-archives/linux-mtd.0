Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F73EC25B77
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2024 20:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rVIM6TPmCvuy/BSFggXTr8WERVEkldypu9S/y5hkZ28=; b=2LAWS9MkUfxg1c
	pOJxL1ly0fl5BZYOyVcYBAMks0WZQ/cpwz9yI7EFed1JSGh0eigo//Vb5O3aMd++PQ3tu1SV/mOO2
	fKrLTDvL1FclUWenAgD4lOhQ3MiuMvv89VxnQLY9IMMA05JZOAoWLvaeZxry9S63xBjh/gsxg610p
	3v/MT+9MkC71AaJV6dO4QgARTf6QGun6pQaMrN8gB5cEgdq7obtzAzgmHaoHybnkAQxW+fyqwFUbn
	jb+apLYft7Gk3/HmwhTx13mmMdjURXkPyFbdfboajIbEk6nsHnUBg0JypduWqS9mSd9aZ2L7flP9e
	h3lBJMH/ZZHhP29+tkpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s99o9-0000000FVHG-27iN;
	Mon, 20 May 2024 20:40:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s99o5-0000000FVG4-07DJ;
	Mon, 20 May 2024 20:40:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E459861F22;
	Mon, 20 May 2024 20:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B507C4AF07;
	Mon, 20 May 2024 20:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716237626;
	bh=0GeM9ZvpwWeEcyEm1SbQY2gkxS/JHF/8kq6OsWB3c64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7ZqlrZNs9lHt+YgugJjQRXeBEDuR0Vitej683otqqmp7+RMvFnGITHwvABnm2rFq
	 yMpYc2h39snU/KS7pZ/9kKDAp6A5KLeaU/iAMaQN3TVxjVFLIsHnQeaHpmJiD/LdkQ
	 crnfWwF5HJZRGtk5DaZqMAsepEoJYlRNRiaIkYXaUlWsCCSc0PTV+2eYYF9SVJziqL
	 AHlr24bQPpMhN3GO7XSdPt/ZnH9QtR5x0BRKmrqpea5EQ7SbNxuXFELInc2W+c9ShH
	 Byj5aLi+tuzYz7uFCPQ/y1Uv+xE+u6QQLPgq4e65/uuHzOKnAqWR+COCFY3TphD3wF
	 vwfg79vx+vbsg==
Date: Mon, 20 May 2024 15:40:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>,
	Richard Weinberger <richard@nod.at>,
	Fabio Estevam <festevam@gmail.com>, linux-mtd@lists.infradead.org,
	Marek Vasut <marex@denx.de>, Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	dmaengine@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	imx@lists.linux.dev, Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: dma: fsl-mxs-dma: Add compatible string
 "fsl,imx8qxp-dma-apbh"
Message-ID: <171623762348.1441545.15424610075709594477.robh@kernel.org>
References: <20240517-gpmi_nand-v1-0-73bb8d2cd441@nxp.com>
 <20240517-gpmi_nand-v1-2-73bb8d2cd441@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517-gpmi_nand-v1-2-73bb8d2cd441@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_134029_133697_E658143B 
X-CRM114-Status: UNSURE (   9.56  )
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


On Fri, 17 May 2024 14:09:49 -0400, Frank Li wrote:
> Add compatible string "fsl,imx8qxp-dma-apbh". It requires power-domains
> compared with "fsl,imx28-dma-apbh".
> 
> Allow 'power-domains' property because i.MX8DXL i.MX8QM and i.MX8QXP need
> it.
> 
> Keep the same restriction about 'power-domains' for other compatible
> strings.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
