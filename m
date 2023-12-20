Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE71FC3DA6E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Dec 2023 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JepncLZBv6Ryin34pGOYybbAQh7hiHKoZjtubjO8daw=; b=QHkIG7g83dwmDT
	u8bf2C+slJDY4UTQRMOcyUlbh+qcfp3GtQtTUsimkQhoCflgZXqsPPXb2wX2e1YCfAfvycJGOKqCL
	wLnCIpP66P0Rkhrv2hZh1qtOzATiZa9BhqGPYsgxveNtBuFwuog+8VYCDhnIbKEIRInDTWRLUCtsf
	xMjEaFMuo4rVXT4HXM7cR6G6j8WPA8ZIQJ8fXsjJ+ZkqmI3Mb81px+V3SFfRKIeoB0xaEQiPXs8gm
	EWUaLOQosPqUnupHd5Q+NRK+CI6aR+Hd5uSgxrN8sWInSYmfiWjSP/YAsCIemJMo3/AftMhUSkkE6
	8qicBrMUlUCnjGIgEsvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsdJ-00Gh66-0S;
	Wed, 20 Dec 2023 09:12:53 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFsdF-00Gh5F-1p;
	Wed, 20 Dec 2023 09:12:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A918BFF80F;
	Wed, 20 Dec 2023 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703063565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r6z4KODvtzTr61IMxvmajoJCqwn7pJbqrJvZIcULTcQ=;
	b=DOt9jI3sn+v5eF81qoZ4DhcxnCOr/z6YU0EDa8w4iUQXfhnqZy1GRZb1/Qv0ISOx4fyItx
	nGwQeBB03czD4nxHeqsqEa2tDBsSnTHCF9Y04egpWc5t+nFdJsK9b43cCM0YQSA18IN7rN
	z0hQWi8ofPmdmZyeE0nzy1X8Six84IRZTVsFFxTN1J1QE6PgPpLKaqmbKKt/V8cOg/NTSv
	yOnmuebvYlzml+FZZ4n07LIcTx2pqDcU0QIoXeqiXwkoCpvGFvkINf9WM4GxJd7XDdrVvV
	xKh7gmOukLLJ15BKj9AxTXJT2EsVvUGd/UOeX/zAuhA7TLvwHwwdRzKslb4FLw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stefan Wahren <wahrenst@gmx.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>,
	=?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-imx@nxp.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: mtd: partitions: u-boot: Fix typo
Date: Wed, 20 Dec 2023 10:12:44 +0100
Message-Id: <20231220091244.655381-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218130656.9020-1-wahrenst@gmx.net>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'72da6edd3281650818ee9094cc40a7157b0ae6dc'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_011249_732164_3AB39FE1 
X-CRM114-Status: UNSURE (   4.73  )
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

On Mon, 2023-12-18 at 13:06:55 UTC, Stefan Wahren wrote:
> The initial description contained a typo.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
