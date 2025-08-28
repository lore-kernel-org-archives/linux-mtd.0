Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7749DCA0EED
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Aug 2025 17:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Edl2sGE30f23q6UHI0ytko6N79JdQSFCnnSVmP3JuoY=; b=wg63i6RrR/VnUM
	miHTlrKR2xvFp8jVJVkcsgslqVsez/19ssOlwZjkkv5QyHw2Li865vaMeZ3aLaYQ1cTetLVJyYUCq
	AEWkq3CsCG1inyvRK9iCVQnwIWL+9UCu6D3a8SjNCo4x4Xr+PCAWR7y7D/nVm8oD5U7f1EjrPsB25
	qodWy4nR4MlvosJAXS784RcMofc3zkVg7DhtyZh4JGmcUdkkPAS5BkMfSrrkk1hXGSICLey1+fA4I
	bPNnNp+lsQ3t0CudOmllZoLGb+wvKE+2jOd/K6UjpcGKIETp+GUpfDpb2L3Ymtg8lEylk9/Lyweiw
	Zlnjxwr0t6IYaIyvcCPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgQC-00000002Vkk-3uS7;
	Thu, 28 Aug 2025 17:28:24 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdhw-00000001wCO-2yzq
	for linux-mtd@lists.infradead.org;
	Thu, 28 Aug 2025 14:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1756391650; x=1756996450;
	i=markus.stockhausen@gmx.de;
	bh=ENtF9dMmAFLBKN2RSrXhoJle/KDo1PSoRLO/+5jvepw=;
	h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BMplK54RjJ068zbVhZRJble6t06dNn5NxTf392MTiQ7S4wG7kiAPmV1yq3vi+BzJ
	 91G/LIN1hhV8QMOpp0g0Bw+ORQ5/rAqUuNTJsD0mTHHaYEUtRGH6lnddoiW89QeFv
	 5Zssou+24Ob2qLcc07VMO5P6onqHy/W0gZCIYPqya8JRq58yEShhdqb15tmHxfsCZ
	 SudZbhhnoPy+wfLPm7GDc9Y98H2y8t5StCzpGITkcHM//yWBabj8visltDZd7QbFM
	 BV6cnesKUhUrTJL9Zy9vCaQnyWSDDINphmhRbb7xXdYU4+QrpoY7fOCnqN45djZtl
	 yDEqVPunMgE7PlHNKQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from openwrt ([94.31.70.55]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2W5-1uBg2Q3WLf-00l7xa; Thu, 28
 Aug 2025 16:34:09 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Realtek ECC engine
Date: Thu, 28 Aug 2025 10:34:06 -0400
Message-ID: <20250828143408.2511086-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:8V3bAinyMxRqJe5iZvnjkl4TBWX7tGMAZ8knI6ACUqzsfkJ5XlO
 qiRiQYVPJjinIBI9Jatt9Pjxu/vcynzj+3CwG+Gx+gNxk+MboXbjqDyQRjlH8XjuMK1Wrdo
 g7ZmmP6+Xf6298PAQ8AhlXu9ZU4UGC1o3RvoObzhAesbYKHophwNCPU1vOt1BJGfncGd+2S
 B8SbbAPy2tYSptGdOkcuw==
UI-OutboundReport: notjunk:1;M01:P0:dgcx+G14/og=;+D0SF74F1u1vCQbCoG2egg92sFb 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 ADyvkMA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_073433_040237_C27CFB27 
X-CRM114-Status: UNSURE (   4.80  )
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

This series adds support for the ECC engine on Realtek RTL93xx switch SoCs.



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
