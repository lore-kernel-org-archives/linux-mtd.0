Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F39C636EE
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2024 18:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r++EwWlRHa5Wl46KF4UB8slSZy/UtEGQ3OK98SUPBjw=; b=m3aCccZywL7uqv
	yCO982+3kedt2umGEeRM/O5bf75rzwaeV4ia3WZlhjonYtx+eJE6iKtrXzkMi2KU/t7lfZCzmZvM+
	gfidRk88I4NKMkt7FarsLlg1zCq9n5kwbNTkosD5ibs3InCLMGUFTAuI1OR2QGqn6PsLe6dYZOZV2
	a1GKffqswEv2UjGNe1CzWox/xRfNxbtAVxMj5Gw9wpENA6UwHa3BQkFDTQrR2dyChHdn0hoeWxyJS
	aoRfr1Q1kp4d2bMrC6Kp6V/Dz29Cvs7y3QkJSY0Dn5SxVafOXA6S1lmj/W+4d9LQvambT1j3/5ASk
	YCsbA4RnAlDw/OLRzekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjNEq-0000000GWdZ-2oVz;
	Wed, 28 Aug 2024 18:17:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjNDy-0000000GWQy-0FFv;
	Wed, 28 Aug 2024 18:16:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EAE32AE2F9B;
	Wed, 28 Aug 2024 18:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7D0C4CEC0;
	Wed, 28 Aug 2024 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724869011;
	bh=Ei26e5yU+S/V7nXPDZSm18EDo4MePpuDMOpeUvRaWWk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=baUZeKh0CjQCh3MO61e5/D6g5uQzviJ7KGflQDz8uYzAL1OUqedJyfgyopon7BFwN
	 fJB0/JeutRk4/q2KDrffS3/i3bhClWQiNeQl6OdOcme7lttrOj8/2F5aGDIXXNLut7
	 YzW4HE9sQyJdJfb1Mx43zlozRQ4a87GCrZHThQvWYLtxflffjv1B0+9DsmeO8QDLvN
	 zslwAdA9NJ4Vp7yBMfFy01XZf3uEormWTz+MAG0BAhfW6eAZyCpuoxJwSQVbykOiTm
	 fjFkWm/G/MKMNO6ZbFGhTq4W5AUuu6/E4v+/GVUAYZIHUNvUT/xnQyC34U4jyQiA5y
	 w1ZpIP6+aPkNg==
From: Vinod Koul <vkoul@kernel.org>
To: miquel.raynal@bootlin.com, Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, 
 dmaengine@vger.kernel.org, festevam@gmail.com, han.xu@nxp.com, 
 imx@lists.linux.dev, kernel@pengutronix.de, krzk+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, marex@denx.de, richard@nod.at, 
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, 
 vigneshr@ti.com
In-Reply-To: <20240801214601.2620843-1-Frank.Li@nxp.com>
References: <20240801214601.2620843-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: dma: fsl-mxs-dma: Add compatible
 string "fsl,imx8qxp-dma-apbh"
Message-Id: <172486900640.320468.11399033651070208268.b4-ty@kernel.org>
Date: Wed, 28 Aug 2024 23:46:46 +0530
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_111654_331031_514CA767 
X-CRM114-Status: UNSURE (   5.82  )
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


On Thu, 01 Aug 2024 17:46:01 -0400, Frank Li wrote:
> Add compatible string "fsl,imx8qxp-dma-apbh". It requires power-domains
> compared with "fsl,imx28-dma-apbh".
> 
> Allow 'power-domains' property because i.MX8DXL i.MX8QM and i.MX8QXP need
> it.
> 
> Keep the same restriction about 'power-domains' for other compatible
> strings.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: dma: fsl-mxs-dma: Add compatible string "fsl,imx8qxp-dma-apbh"
      commit: 63556df6acdd737b75d9a7a8b906cd1c1bc8e2aa

Best regards,
-- 
~Vinod



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
