Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB42C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 05:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5miNHC2WhnvX/E1ZmyL2ukNwXyNwFnddjk0yG++qAsw=; b=tViURzIAzOWlOn
	2PMeHOegEiSyrqrGt52ex3zFXhfdPIkE1AMf39oQHQvKJi67I+rwswWKVduwSDSxUg3Pb7Zz+LPnR
	JfyirZiJfJF5hJbaMRlBPle2vSpFCJwJF/EPxxiFpQx7Znnlk3DJ5SKdZ62cFyLvc7fTZtJzuoyTc
	YKAiNKfL+eXoV0V2g0vNv7RszvpMc/sLWtJUk+bf+/C5n1QQhiIkHVkdFhHBbwcyHZieBX6NjHmvd
	IaCiQKp1tA1TdKa4urFR0qsJCCvA4wsrUNQ1jSdf0lqyNryicC5N1pIaaHzrY9LgTYJ/NeU0QyTGA
	/cRyxxqBYbHvy020Q6mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxyb-00000006mKG-0MQr;
	Mon, 02 Jun 2025 05:44:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxqO-00000006lEK-29bA;
	Mon, 02 Jun 2025 05:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1748842580; x=1780378580;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GhL0kNqcfcle3qIVF5sXJEBnV++w7E5fWBwfkhBS8f8=;
  b=uwklVr5WUwJTH4KK51/qchUxvrSxlx5Q5LxSMt6mZYUkwL8uCr8noOCf
   b/SKaNNlH9CRk2jyOMmVpJ6I7+mUB2DsmH6FPXw0tl8xc3ejMkF5CAmRl
   LBOumJCYE3/ZVQFrPI073qlbWptyc/XNecUulNjcRoYOLqX+TsM6Yz/Df
   0VQXqOvRJbwNTQNwqJ0DTQ77xDLEDvMLNzD3U/b4iTdHBAA8PUaTuBxIP
   r/VWpdCOcf+Qsx/xPmF303MXjNsdObCZQQGbxXH6Ee83hxVhWrhRST9lQ
   XO44S7phIX2I3xObZwMb3wScGPzIyB7JU8MfxGgl1rlgewqBcpZ8GtXaO
   Q==;
X-CSE-ConnectionGUID: eittDR1XTzS4g4o2E6Cy1A==
X-CSE-MsgGUID: j/fk5qE3SA6Kqm/N9d3YUw==
X-IronPort-AV: E=Sophos;i="6.16,202,1744095600"; 
   d="scan'208";a="42865351"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Jun 2025 22:36:18 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 1 Jun 2025 22:35:55 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Sun, 1 Jun 2025 22:35:47 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Subject: [PATCH v3 4/4] MAINTAINERS: add entry for microchip nand controller
Date: Mon, 2 Jun 2025 11:05:07 +0530
Message-ID: <20250602053507.25864-5-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_223620_644775_A0DA3349 
X-CRM114-Status: UNSURE (   9.25  )
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

Add myself as maintainer for microchip nand controller driver

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index dd844ac8d910..53cc327b8985 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16064,9 +16064,10 @@ S:	Maintained
 F:	drivers/mmc/host/atmel-mci.c
 
 MICROCHIP NAND DRIVER
+M:	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
 L:	linux-mtd@lists.infradead.org
-S:	Orphan
-F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
+S:	Maintained
+F:	Documentation/devicetree/bindings/mtd/microchip,*.yaml
 F:	drivers/mtd/nand/raw/atmel/*
 
 MICROCHIP OTPC DRIVER
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
