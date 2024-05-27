Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DB6C25B7C
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdsieo+rjLlvwCAXGJnGGBxRhC6bwIvCKw67xVyE/5A=; b=plZNjgDdAz001G
	r/PYFuMkFY6DhwRQ0VhcILo93zadPkWrnQrxzzvvh5x2E23Ek7c54JZDWEx1FgmOYytggcVx/CucO
	w8Pcln0IjCQ8hhtLkb2WdRtO/MXuMdbz7Jzjokvo41lq05iUAucU2fAnmyLvM8TYpTFh/iyje69jZ
	thyqShj/o47v+b5X/olBOx51npA5efTByrMqRoq9PzNCYLm7Hx6t2+g953AiZCwZH+xj1djBl+yCA
	0yNJnVC6igCUjrTlE0he+wUFGcUwAZBiX60S+fCUCHP3BzZpY8xoSGxz3gbW5SbmHL3QNTltNLQlA
	/lwIQfVn4WDrgQ9UV1Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJl-0000000EqCT-3ux1;
	Mon, 27 May 2024 12:19:09 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJL-0000000Epri-145r;
	Mon, 27 May 2024 12:18:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3A1B120004;
	Mon, 27 May 2024 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=94UOc6Wom93RXwChN429/bX0m+mqat4leaCPT/CzIhQ=;
	b=RJ7SrfyPwDv7LlLhgATY7ekp2eNuTnvkSO/t6KBDXdshAci07VITrFb/nfpdxBuIa+XBWE
	HgKo8EGDRgTHlyozBWsJai5fguj9P4tp6UTqkw18J2N+Wg/o+UIBd83MPUGzIluVE/tsfQ
	+aXXACwD6qK9jxMxI5YJc1lUIsehGBc111W3ggQejuwLJRg3tj54Istq7Ht8xNXsi3hqSU
	xW8tUbYMJ8Z8LE6wNrfMPxvsHvH3LBakAKc4t7y4MOFbTQAfTczauxTXYg0Lw61JNnUrzs
	aowpe9sGcJi8dUY6nt/LMWvk1J1nNU+1/zkNs9P0Ycce44JUskzIs++3bFgYHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Han Xu <han.xu@nxp.com>,
	Vinod Koul <vkoul@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/6] dt-bindings: dma: fsl-mxs-dma: Add compatible string "fsl,imx8qxp-dma-apbh"
Date: Mon, 27 May 2024 14:18:36 +0200
Message-Id: <20240527121836.178457-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240520-gpmi_nand-v2-2-e3017e4c9da5@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ccb5d365ee53b3c79c96c89a0bb179354c37873c'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051843_493900_4D2EF35D 
X-CRM114-Status: UNSURE (   7.22  )
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

On Mon, 2024-05-20 at 16:09:13 UTC, Frank Li wrote:
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
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
