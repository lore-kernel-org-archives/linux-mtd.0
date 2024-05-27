Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1413C25B7D
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 13:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5CZV/154GPDAmJ8drh/qTDY/2OLY0h1hH43dKX6ENAY=; b=kTMD1vEUq6pJEY
	5qkKFnp5cw1LXjhwDSp70XIKObkphGxsIAX3HNXqUCgQWpTnDfNCKYHaCzLLP6ypNl5Y6BAje0CBc
	f/jLErzN8ngfpmklEawYpxdSBzDwQePCYEPVERpt40mEi/sieoGBGpTaPPk0l+i8FVmkwifcLFZIs
	v5I3rbz946DtcXRb+8Qn3dlQqwdZ5INHw3CPgsEdFk6HB7VZ9XloM6OawBqgxcfYAnBgvwbcwQAgK
	GiHhT5bn6wMUgSF4g0MrvSSWP3ADY2JgbbgryxM/uYuC8W5z60xgbC4jQ3ushumARB7tYxjxnJlc+
	x60/HCskBIybSZewTEVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBaQl-0000000F5vO-0aYX;
	Mon, 27 May 2024 13:30:27 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZJM-0000000EptB-1pVT;
	Mon, 27 May 2024 12:18:47 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7CA5920007;
	Mon, 27 May 2024 12:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zUfiAG71aXn8LdRaUjhGkzb2gmamEauYl7siNmkQPII=;
	b=ZscDcFbsoCxIlzUzanGm50DEOu5JpbDdy9iNvKULFsmbZ/99wzJbP6FhaAYkJLO8gKnNaG
	IK19K3CEIvSx6XIeiwWMQsTI53hnkcJ3SPt8Peu1PJ0IOoAWgzmKY6EDwnYxB/1CIhoIAo
	E+PWT7Ql8mQerbCeoxS1HbuzBo7P8T1lFl8Bjws7IPqSXpRoJV9Q94HuSE+78YWcqTpRQC
	IwUkDsptHhcSgr1tFDIzKxYtA6f2SkYMLMY7xReggWFycsGErvMLZYNR86W9YuCvEdXiZ2
	jsljHJaKTlFhz5EDkzDPDZV46Or2dwJnRBgO2KA7WHFHMwNjx7b9LoICOv3c+g==
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
Subject: Re: [PATCH v2 1/6] dt-bindings: mtd: gpmi-nand: Add 'fsl,imx8qxp-gpmi-nand' compatible string
Date: Mon, 27 May 2024 14:18:41 +0200
Message-Id: <20240527121841.178486-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240520-gpmi_nand-v2-1-e3017e4c9da5@nxp.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a25587a7c95063635ed4d92cb6d73c9e3d7babeb'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051844_733338_CF1CB2C9 
X-CRM114-Status: UNSURE (   5.03  )
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

On Mon, 2024-05-20 at 16:09:12 UTC, Frank Li wrote:
> Add 'fsl,imx8qxp-gpmi-nand' compatible string and clock-names restriction.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
