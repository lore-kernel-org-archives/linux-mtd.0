Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E50FC433E2
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:32:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D2D20770
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 15:32:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oOAbVH5t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2g6yeun"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D2D20770
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vwL7BHuBV2/feTZK4SsMuL7HUDf7wd54v4l43CyV/0k=; b=oOAbVH5tCVSTx63Qi/c8WwHQyr
	i6iNHqGcg2n5tHDuPDoBLvhwB4NKv0pLhXWUkQIZbbn7laXv1GsR1BzJ1P502q8OlRFFdlRDOZkHn
	o2YdXpjnKBnhJonliK8RXAE/kniQotaWDqVSl8CwBCkdqaAlfiNqON6GGMBeGdUYUtwG7mtxI3nTJ
	KogKkmZ8+ftHJsw34exLFGeJLg0OjJuU3xi4cUHxaUjCqT6kJhif7f+RQL2rMOWjZXjZQ7hgeQuzg
	AB1JkvX/ytY3iug8Ae82ZbX8n5iF4tOoJS2NFaCOQAJtyWX+LgFN20cbHlt+FOTnZ5YOwjH2nXGUj
	FYUQSNLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEDgC-0002mw-7S; Fri, 04 Sep 2020 15:31:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEDaZ-0007lk-PZ; Fri, 04 Sep 2020 15:25:26 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B200220772;
 Fri,  4 Sep 2020 15:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599233119;
 bh=Dd93FE9oQpev+CVY2ipzNLkXaKzEf3vCB92IiF1lQ2Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G2g6yeunx3Er8BuGMgPm7rLE0oNqNL6t1jPmBNIWE1PGDPRu7FEN7h0TZI6XSmG5D
 6AMwT61dT9xL6JpEZjcNNzY9aXQ8wqaN9TUkG0S/rpylmqhSB+zNZxptTHmkhEFJiK
 ndzT/91ejUDsMmTe/jvdUAWhlr5rHwq5tXtYGa7Y=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH v3 13/14] dt-bindings: mtd: nand-controller: Fix matching with
 size-cells==1
Date: Fri,  4 Sep 2020 17:24:03 +0200
Message-Id: <20200904152404.20636-14-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904152404.20636-1-krzk@kernel.org>
References: <20200904152404.20636-1-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_112520_058755_B4D283F5 
X-CRM114-Status: GOOD (  12.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Most of Freescale/NXP GPMI device trees use size-cells==1 (even when
actually not needed except few boards).  This fixes dtbs_check warnings
like:

    arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dt.yaml: nand-controller@33002000: #size-cells:0:0: 0 was expected

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 40fc5b0b2b8c..0879e1108837 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -34,7 +34,10 @@ properties:
     const: 1
 
   "#size-cells":
-    const: 0
+    description:
+      Depends on your controller. Put zero unless you need a mapping between CS
+      lines and dedicated memory regions.
+    enum: [0, 1]
 
   ranges: true
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
