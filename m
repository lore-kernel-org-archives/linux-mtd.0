Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B71A1C001E0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 15:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X92O67PU2y/X9d6u9JdU0MGnGUfktLzObRP4wa6dgsA=; b=Jwg3Vu4cxDg5BI
	LKCy4YqOov6dYpQ7MuQKWYMiPOXXJ4EurscccFC4VkiibWWCvyfWpO0srISsMjyU0Zj4jpZQFAuoW
	3Gy28fhj/w7oheirOKT6lN7FL9dbx0U1NDcd7A3dBTPn+v462mnp3dPDMt1ihDCVEkpSIaSJtlDua
	VLaObxXM32bVZ3xdRhr0SAhXoYumppOtv3ppDJXIqMtEclAN+zrGZVtRZS+AbXDNxm2UbxaZogPZD
	S2B/hCApDjUJ+3AbptDNn+PBXMbcBuMIFGqkdCe5ikFR8mCdGs84GwrDueCcox8dAEeMye1a1ggMY
	FyI8ndPKw8wyUMASUS0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2lD-00Fm3S-05;
	Thu, 27 Jul 2023 15:18:39 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2kv-00FlmT-2b;
	Thu, 27 Jul 2023 15:18:24 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2694A1C0007;
	Thu, 27 Jul 2023 15:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1690471096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7rDi/rWyrHY5kZcl5dVEL9LRJ9CfxxxjeIcAFDcIAjI=;
	b=Uz8AhCmDYbzE6WW6+p9hhdi/bDCpkB2j9E7n2Adiu/QA+/MXEdvgNWe+lpmUH6bBFMplgH
	yCXz5IUEb/xn46MwTnb3Ge7xDD6H0jvDVmFK3bE57PpEqCueRLYF7fifq8kND6JBcXRnLK
	B/lc7dPHXvJ3Hv25yXtkWQCqciFRqfXYieq+ExahRspyScoTjUNx/i4XRPhlhaDeFxzXxF
	dMoeHxMMttWSHZNepDQK1IECamvNbv8nxLLQR2fON199Qrlg16kI7tg4OstGLwjznZ8ZZv
	y4BtTU3YFtddtVt01kR7b670NdqTg7Y21MyGnAYwnkyROqZznL86SWcc5l8+mA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Liang Yang <liang.yang@amlogic.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: oxffffaa@gmail.com,
	kernel@sberdevices.ru,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] mtd: rawnand: meson: support for 512B ECC step size
Date: Thu, 27 Jul 2023 17:18:11 +0200
Message-Id: <20230727151811.586490-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717053402.1203724-3-AVKrasnov@sberdevices.ru>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'0e1db39336d8be4ddeb9f0d99720056f3ff41310'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_081822_704777_BE1B226D 
X-CRM114-Status: UNSURE (   4.75  )
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

On Mon, 2023-07-17 at 05:34:01 UTC, Arseniy Krasnov wrote:
> Meson NAND supports both 512B and 1024B ECC step size.
> 
> Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
