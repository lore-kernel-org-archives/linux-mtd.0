Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F362C4828F
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Feb 2024 20:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sL5Oo3ss/zSI6sP36JVstMeBpvZSd4vBebwspbLQB2M=; b=QmlIvI8HYiOndY
	HVQLQUs7KyIBJtBpjLtLecxAg9RMEb4s4QkvaqlcR5GZKwuloDcixSvL2L72zJVKPtO5sbDSqreyg
	2u4y8BKpR71+rAsbSvMm3hc3linQSoq4ZOjEUzA3gTQSOWzSy/GAOaemHaXqMi531DeoOm+XJ5o81
	8sQmstX0C/mDTBUdDqsQM9Rt26DenVHW1SWF5p3E3oz0a/VKwcbSfMfo+CJD7iuV3dJk/GpOjDOu5
	YO+TFRGEqTuQGnjOYZofanOeZ6e3U8lmARLQf7/xZFlDOa8vqIqQBlZj1TuPkdeAwpSVWCtReQ6NU
	MitPrBtGheIvnZzFL4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXoSD-0000000BhrC-3Mu0;
	Wed, 07 Feb 2024 20:23:33 +0000
Received: from lpdvsmtp11.broadcom.com ([192.19.166.231] helo=relay.smtp-ext.broadcom.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXoS9-0000000Bhof-0mMM;
	Wed, 07 Feb 2024 20:23:30 +0000
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 2EDA4C002E04;
	Wed,  7 Feb 2024 12:23:28 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 2EDA4C002E04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1707337408;
	bh=2MG0NMfZmd9Qh5xJzY5hxI6VpQVPWSkYrqSpDO/Rr3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EYzpPF1GgnNk+wK9Irbe1dqf5j3sQScSLPH2Lb/2SVXjMZvC5Jv3HDhJc3iLNRfje
	 ntpUky6sT01Bf1ahwUXVjvc1e/oD12IWxAu22jLsHC/XRZYe6m+PjQ4dNgDAvkeVFa
	 ztY6/vkzUFHiSsxtTbY/MEdkenxVn515hsZ8TMcY=
Received: from bcacpedev-irv-3.lvn.broadcom.net (bcacpedev-irv-3.lvn.broadcom.net [10.173.232.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id A7FE018041CAC4;
	Wed,  7 Feb 2024 12:23:26 -0800 (PST)
From: William Zhang <william.zhang@broadcom.com>
To: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>
Cc: f.fainelli@gmail.com,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	devicetree@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 02/12] dt-bindings: mtd: brcmnand: Add WP pin connection property
Date: Wed,  7 Feb 2024 12:22:47 -0800
Message-Id: <20240207202257.271784-3-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240207202257.271784-1-william.zhang@broadcom.com>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_122329_389795_BA94034A 
X-CRM114-Status: GOOD (  12.19  )
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

Add brcm,wp-not-connected property to have an option for disabling this
feature on broadband board design that does not connect WP pin.

Signed-off-by: William Zhang <william.zhang@broadcom.com>

---

Changes in v5:
- Update the description of this new property

Changes in v4:
- Move the WP pin property to this separate patch and change it to
boolean type.

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
index e54ca08a798a..6a717bcedfd3 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
@@ -113,6 +113,13 @@ properties:
       earlier versions of this core that include WP
     type: boolean
 
+  brcm,wp-not-connected:
+    description:
+      Use this property when WP pin is not physically wired to the NAND chip.
+      Write protection feature cannot be used. By default, controller assumes
+      the pin is connected and feature is used.
+    $ref: /schemas/types.yaml#/definitions/flag
+
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
