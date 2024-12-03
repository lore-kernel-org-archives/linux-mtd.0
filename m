Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE25D73619
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2024 09:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwHux/BRG2KcU2O4saD3Z1wqm2A664mVoiS+BKYc65M=; b=bMi0U21vTzbsg1
	bc8NCb42LwhNRAkfYh2Jim0P/gTHjgZ1YW/9CkHCUmp45LXt8UERI38DsYQXAW4lRREe54gXhmTG2
	aefcvqXPailzEV93DfT771C6k3Cpnx2h6li/h0mptY9beSHUpmNsW9y1tAHskqXSqxQcT6b7hEkof
	zSsvnPjCGmfpyesVchcZzBJOkHD0zJW5tIrmzMiLJkzfwXyDr3ldu/L4B26D7QZR9OvYBbBEVax5A
	FE6pe4DpSlLMy4ZKRsDWw/bhukQmjz8HwnhqHLGxhCITkM8173WPZK9B+rDZoxTWz1akyPVgnyV7n
	YnBAdA6swGSJoprRzlmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPM1-00000008v4K-1590;
	Tue, 03 Dec 2024 09:38:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPLx-00000008v2q-2zTs
	for linux-mtd@lists.infradead.org;
	Tue, 03 Dec 2024 09:37:58 +0000
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1tIPLZ-0006C6-Jk; Tue, 03 Dec 2024 10:37:33 +0100
From: Jonas Rebmann <jre@pengutronix.de>
Date: Tue, 03 Dec 2024 10:37:26 +0100
Subject: [PATCH v2 2/3] dt-bindings: mtd: mchp48l640 add mb85rs128ty
 compatible
MIME-Version: 1.0
Message-Id: <20241203-mb85rs128ty-v2-2-42df3e7ff147@pengutronix.de>
References: <20241203-mb85rs128ty-v2-0-42df3e7ff147@pengutronix.de>
In-Reply-To: <20241203-mb85rs128ty-v2-0-42df3e7ff147@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Schocher <hs@denx.de>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, David Jander <david@protonic.nl>, 
 kernel@pengutronix.de, Jonas Rebmann <jre@pengutronix.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=854; i=jre@pengutronix.de;
 h=from:subject:message-id; bh=0L8AAzCGjxqDT9tSoEM1H4PxUPfUrUDm2XS8wz5bPHQ=;
 b=owGbwMvMwCF2ZcYT3onnbjcwnlZLYkj3uxjd8CHZvc3jdcHm308m37zKJs686Uz/v59b4tc77
 3/tNrfAoqOUhUGMg0FWTJElVk1OQcjY/7pZpV0szBxWJpAhDFycAjARUQWGf8a6H5fPaCu9aM2U
 N6XA6ZzYwZ8L8iQWfLGXWvn87P9V008xMlw9t0Mn2m2xk9z6iW9azi0UUw3Mzbvctb41sW/GY88
 qTTYA
X-Developer-Key: i=jre@pengutronix.de; a=openpgp;
 fpr=0B7B750D5D3CD21B3B130DE8B61515E135CD49B5
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::ac
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_013757_751714_86A5EE5F 
X-CRM114-Status: UNSURE (   8.98  )
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

Add a compatible string to support Fujitsu MB85RS128TY.

Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
---
 Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
index 0ff32bd00bf6aee279fa78c624d8d47c6162f7f1..11f64056a28f98ad633265b00605ffd2c3e026c8 100644
--- a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
+++ b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
@@ -16,8 +16,9 @@ description: |
 
 properties:
   compatible:
-    items:
-      - const: microchip,48l640
+    enum:
+      - microchip,48l640
+      - fujitsu,mb85rs128ty
 
   reg:
     maxItems: 1

-- 
2.39.5


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
