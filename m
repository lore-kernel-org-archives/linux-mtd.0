Return-Path: <SRS0=MQGH=JZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12839C433ED
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 22:32:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6F386143A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Apr 2021 22:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6F386143A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oQF1slCYU3gs4tAD093w6o0Cx5A3q3taHDLGh13p+bQ=; b=hz5zS0wKEfUSBKOeZA16Qs5IH
	CbtOyCgm3yXXZwuYusBC6KFsPHIDbSIN7qDp5sHaW538v3oUnkE+a7y2emWVBxiS+uQN3CxHj2CSK
	E7gqYk7+Msg5YtRaWM2xWbbrSM11JbTbXhyoEHBvRqzi3KGP3enLyDrA7d1R06Rkze50iM7ka2qho
	oLGxrIDZgvzhieUCbQwqQZ/xOWNO0kVuokGZhwjmkim0Z3sgfpuSkldCPxKtQaQBgqTgwSKXasqpC
	5nuNfK9Vk94Q43hEEfkKQnF+NUAFkTr7VEKWIqC3uqi7A0G9vw2FIt5jofx90seHWQBsFWZkYRnDp
	XmFPsCDLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbsig-004NzM-Ou; Wed, 28 Apr 2021 22:31:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbsh1-004Nkf-W4; Wed, 28 Apr 2021 22:30:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/N0HVk0t3uzPL3BGFxeqMxiszRR79/oNr0jso/7nr5E=; b=WZKQtwKN8xIM54ka0pvrV4Nokr
 1MD/Bzkemfcs6iAsWDeUzl0nrCdpHE8/6OwbT6yTZ7DjurAXkcbm2cLYZLmDo4iEzwmWElhOG+L1D
 vBdJAME2pIczIfUsWKF5TOnYDuAaZOV0KcQp/0nHDOmm2KpFsqX//wWGN2j2KPLpinP+/3Jt5WvjB
 lBMC/19rs2ARj4cbp+AAudoLsEy05ebG3ZxpIsfwgH+ddTMoUv1BrPZQwINeGcIjfmTWwOk9bVt9M
 9vTv2mqodt75mePfjMo72LzSMKQf+nvuNYKLgmvBt1iShUng/Xp2dJWfVo1v6O611XtAOKTNO7uwg
 92B/38zg==;
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbsgy-000EAH-5L; Wed, 28 Apr 2021 22:30:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id B5C2F1F42CA7
Received: by jupiter.universe (Postfix, from userid 1000)
 id B1DF34800C8; Thu, 29 Apr 2021 00:29:53 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel@collabora.com
Subject: [PATCHv2 4/5] dt-bindings: arm: fsl: add GE B1x5pv2 boards
Date: Thu, 29 Apr 2021 00:29:52 +0200
Message-Id: <20210428222953.235280-5-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210428222953.235280-1-sebastian.reichel@collabora.com>
References: <20210428222953.235280-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_153000_366188_3938FA3F 
X-CRM114-Status: UNSURE (   8.35  )
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

Document the compatible for GE B1x5pv2 boards.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index e3c50f231d71..6e5b14c75325 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -400,6 +400,17 @@ properties:
           - const: armadeus,imx6dl-apf6         # APF6 (Solo) SoM
           - const: fsl,imx6dl
 
+      - description: i.MX6DL based congatec QMX6 Boards
+        items:
+          - enum:
+              - ge,imx6dl-b105v2          # General Electric B105v2
+              - ge,imx6dl-b105pv2         # General Electric B105Pv2
+              - ge,imx6dl-b125v2          # General Electric B125v2
+              - ge,imx6dl-b125pv2         # General Electric B125Pv2
+              - ge,imx6dl-b155v2          # General Electric B155v2
+          - const: congatec,qmx6
+          - const: fsl,imx6dl
+
       - description: i.MX6DL based DFI FS700-M60-6DL Board
         items:
           - const: dfi,fs700-m60-6dl
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
