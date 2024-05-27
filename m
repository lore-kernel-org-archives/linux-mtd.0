Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3FFC25B7C
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJhxd9fvRAl+2SeEY751EWafi7wJUgsTYUWhv6rGb7k=; b=Lz+U1Vz8sKO33z
	P0f9N/fydt9t5tBjBm6MOlI4zXsNFBO5/wkce8JvLIiq0YHGy7voCyceH+j8nc2WOUuYuV50yInD+
	FMVWustHD8Hb7eFTIptG4hNEro3JDfE0q4OwdTwB0hL8f8db8T6dQMjgwSumphzkugb7090gYpSbR
	SyVdaPXguuIkmcjTBmbHmfjAlPB5Nbtxtsp+LWG+QsYQnQqklNsu8669yI6O6uhedPKbYlCg/qaqa
	39VvM7EvW3uXr9JIh2QIg/pGEb1s6PHpq61Knv7Y49ftEe7XLjqBCOFoTXSA/aMYYxmGx2wkG9WV2
	rxkiCB72P+2AZ66+F59w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJD-0000000EpqV-2Sq7;
	Mon, 27 May 2024 12:18:35 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJA-0000000EppY-0v7a;
	Mon, 27 May 2024 12:18:33 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 72458FF810;
	Mon, 27 May 2024 12:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p2Iu865HQOncwOUv89lXf8ydO1Mwrp2c6T2G2xw89jY=;
	b=NF4FxnwdqS2r+FF9nN6B0D7CokJjbAf5Whywftp3k88UuIGMS9CWuyFDwsksh1KzcxV420
	mYIyrp43cK2Hr2kIIIkmjYr4oPe759t2CsmVXuwZvAG2yXFuhjtHIHA9jCBLxh4vhUyAEY
	yDit73LJgpNWaSZozOPlut82blxvk9Q+THeDFQKTk/zA1uIIttWbLPJ3YNll+fmv8f5wYq
	Ya+EKFw9FdvuYBcnnY4UoAIrlmOTnUN0dejWYCltmIqnJ8sF4AkeUQ4GGHSd8GtAQ7BDhZ
	tdeRmZY0g4z+W4fMMpt/huKy5NLGyxtYihFsc3uHqSXJfg3FEpCtaO/1d8BLsA==
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
Subject: Re: [PATCH v2 4/6] mtd: rawnand: gpmi: add iMX8QXP support.
Date: Mon, 27 May 2024 14:18:28 +0200
Message-Id: <20240527121828.178398-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240520-gpmi_nand-v2-4-e3017e4c9da5@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'b9bf7737de329f7a05ac2f9c1bba664926eed3e8'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051832_516278_D6DEFEED 
X-CRM114-Status: UNSURE (   6.97  )
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

On Mon, 2024-05-20 at 16:09:15 UTC, Frank Li wrote:
> From: Han Xu <han.xu@nxp.com>
> 
> Add "fsl,imx8qxp-gpmi-nand" compatible string. iMX8QXP gpmi nand is similar
> to iMX7D. But it is using 4 clocks: "gpmi_io", "gpmi_apb", "gpmi_bch" and
> "gpmi_bch_apb".
> 
> Signed-off-by: Han Xu <han.xu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
