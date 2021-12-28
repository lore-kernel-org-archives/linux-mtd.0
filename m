Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4ADC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Dec 2021 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKDplVqePqVfjDTa59uu6OTIu15ZnoDt+X8jNIT/l1k=; b=joqcziMPRFxaLy
	y/8LLM4w4FjMCTJxoWkNWsvdMSqXNFuWb+WFqDeImcld1IH7NRnOG62X3vwF1KPS8ZejXOiGDqT6B
	xN/rn8GAvKz8G5FzngUc6ufpk+FiS2LADQ3b9q61DZPzHglojtesa4lR0zNovGGbaBBulwO+EpKAC
	tI+LyVVQmZCclnvxFr0PCf20LzI2pxJL02Rr1WwWocoiBcK626MFqrQksiR6sqUzCerWaZ0sk39qj
	8aoFiF3d0VeijRFQDdPsJYytKr2iVLZywuaq9R9LbSm6GmWbHTT28SztC+Lqxin9MEPEJ2XmoDWUy
	tSGOrd9kT+hnBOP6niiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2DWJ-00196x-Ue; Tue, 28 Dec 2021 14:32:08 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2DQn-00170J-GL; Tue, 28 Dec 2021 14:26:26 +0000
Received: from mwalle01.kontron.local. (unknown
 [IPv6:2a02:810b:4340:43bf:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 98B4222438;
 Tue, 28 Dec 2021 15:26:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1640701581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z7Jp/9TSBr/YXtTUKHXXv5W5V0V0BzH9Fdgy4wsGzuM=;
 b=i27Za8Xxp66QNN2GAetc5+ufS54wRS8I3TG4LOZ7r/64y4vaq4SuALrGDc7+bWJ8W6dGPa
 i6A/Vk+pnzFBMXYfh4c5bF4tGI4oE1zimVTC50EJDE0smC+5+DK/fmeYOJ+Nshn1NVBf9o
 o4lFfflbRswrsrd9bTZbhl1ZC7KTep0=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Ansuel Smith <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 8/8] arm64: defconfig: enable NVMEM transformations
Date: Tue, 28 Dec 2021 15:25:49 +0100
Message-Id: <20211228142549.1275412-9-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211228142549.1275412-1-michael@walle.cc>
References: <20211228142549.1275412-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_062625_749692_E92AE180 
X-CRM114-Status: UNSURE (   8.96  )
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

The Kontron sl28 needs the transformation to get the correct ethernet
addresses for its onboard NICs.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index ee4bd7710a0d..117423e81d15 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1178,6 +1178,7 @@ CONFIG_FSL_IMX8_DDR_PMU=m
 CONFIG_HISI_PMU=y
 CONFIG_QCOM_L2_PMU=y
 CONFIG_QCOM_L3_PMU=y
+CONFIG_NVMEM_TRANSFORMATIONS=y
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_IMX_OCOTP_SCU=y
 CONFIG_QCOM_QFPROM=y
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
