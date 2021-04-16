Return-Path: <SRS0=ZSp+=JN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D333C433ED
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:54:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE40A611AE
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Apr 2021 11:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE40A611AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8OSl6J0yZC61lZCv+NhIt61gWMt8sXWoQLKi2Eb53jk=; b=mHs23jB87eLmcOJ25jj0TWF4g
	5ZUjKF3eS04D9m161JJEZoWX3eB2szP60k+P8M3qA5qcC4e5F4HpG6cDG1r8q+yZb2mfTD7q+d3M3
	ZaC2K2LoC7rCn7OLpqpl9BWqxcEzQIrQmLuO7HyRIhOQViDUHOHMBWpGFIF4slaCWq8eQ8qRgSsK3
	7OiK8UgE+cD5eLYxoVc4t3DhQiZHDJURjsCAc/HdF32XUIWXncYC8gJOf7Cd2dC+X28yvMwR2EigI
	WaeRXsbpDsGnMNbvl218/FDQfvRUlYveeLeN2W2xcWm5HHJglRSHXqvprxkGWsXwH/BuN1SPSMnGZ
	cvxwbDoNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXN1z-001zMg-IK; Fri, 16 Apr 2021 11:53:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyl-001yex-MO
 for linux-mtd@desiato.infradead.org; Fri, 16 Apr 2021 11:49:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GRkPqnjS5YDgk8NQ66Yo0tAQL/4J4zRIFEj93tKMbLs=; b=x88K7YVOxXDSQJb+mx4RvrRGBE
 m6DD915SOMI2bLhQWjHdw5+mvp4ver3lP/7gX5cY6J8WXuyV+IcA0hPSMgpULlCm1kjlc2NhG4J5D
 KN90Pfy6QBLix0RvNVsY6634s/qRmaVoOE5958ZowX6jeEZiMyjBm9WRJERVOq4Z6+If2qu6uZjOO
 oh1k2OXfdezfrosAp9+coyGTElyDbrHSqT6nchI2qYoc5ewnO85eW7QbN6f81yYKARQzTiWvL9soc
 VFc/DmOYJGDarQIdG7PzOmZRpGxxE+ZSSGkw6i+BTyzwRX4TdebuukhvyKP9OAj1jQD5N3C+HmfVR
 wQaL4ShQ==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXMyg-009Kfb-PX
 for linux-mtd@lists.infradead.org; Fri, 16 Apr 2021 11:49:42 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2BEA622259;
 Fri, 16 Apr 2021 13:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1618573777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRkPqnjS5YDgk8NQ66Yo0tAQL/4J4zRIFEj93tKMbLs=;
 b=JRF2Zu4zYjJfSu1XdXaojzHMGqdR3HmaFuC22rIYn1V1sVux4oOUsIXnlGYjqGfF9gs5GX
 1kRRn2FXqVr9MYqFSPID+voBhdi6oYAnYeDaIF4uQNJgVXF3p3f3rmeHkCj21HbhQ0S7yk
 GrwBfAjCDBKVcDfBZWRi/zAwPkoMPU0=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Michael Walle <michael@walle.cc>
Subject: [PATCH 4/5] dt-bindings: mtd: spi-nor: add otp property
Date: Fri, 16 Apr 2021 13:49:27 +0200
Message-Id: <20210416114928.27758-5-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210416114928.27758-1-michael@walle.cc>
References: <20210416114928.27758-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_044939_001697_CDD80A23 
X-CRM114-Status: UNSURE (   7.29  )
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

SPI-NOR flashes may have OTP regions and have a nvmem binding. This
binding is described in mtd.yaml.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Changes since RFC:
 - new patch

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 5e7e5349f9a1..ed590d7c6e37 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -9,6 +9,9 @@ title: SPI NOR flash ST M25Pxx (and similar) serial flash chips
 maintainers:
   - Rob Herring <robh@kernel.org>
 
+allOf:
+  - $ref: "mtd.yaml#"
+
 properties:
   compatible:
     oneOf:
@@ -82,6 +85,9 @@ patternProperties:
   '^partition@':
     type: object
 
+  "^otp(-[0-9]+)?$":
+    type: object
+
 additionalProperties: false
 
 examples:
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
