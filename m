Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545DFC982ED
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 09:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFX/eDiiwo8VgqUmlU/Lv0qc2bx8rL5GzT5IC7VkAoQ=; b=gQ1wD5B3Xelk9G
	/30Sd8jZVDOn2F2kmN5IKo1GA4VWu00hRW+sUXHMS86thOWwvUJT+iiJemoJ9rExgzUuaIqxWMiE+
	qpriIhsRhdMMQ8VfkR2ufFABw1qeL+XMGjbYduuj63+ldMceBtImt3NoIctbpBKyDnYZwinB8x9Mb
	9jeBTlY5y4CGEswpgshwdZJZ4aEiMvVF6JlFFNhOst8sjCQUomTh/t9915a9BheA+0Angkv9E6Fzf
	D9jnr2J8lb68ucQkDOn7AA4pP4XeIdtK1AYncnrCmiL1/6d3872Dwi4WLaF6rCtgspkDC7R8ismB9
	4jWHHBxgsletP0S8BC9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aTy-00000001Xka-0wvA;
	Mon, 21 Sep 2026 09:38:42 +0000
Received: from spam01.horizon.auto ([42.62.85.75])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aTv-00000001Xie-12m5
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 09:38:41 +0000
Received: from spam01.horizon.auto (exchange003.hobot.cc [10.69.1.10])
	by spam01.horizon.auto with ESMTPS id 68L9c19D068819
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO);
	Mon, 21 Sep 2026 17:38:01 +0800 (+08)
	(envelope-from fei.xie@horizon.auto)
Received: from server227.horizon.auto (10.9.0.252) by exchange003.hobot.cc
 (10.69.1.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 21 Sep 2026
 17:38:00 +0800
From: Fei Xie <fei.xie@horizon.auto>
To: Mark Brown <broonie@kernel.org>
CC: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger
	<richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Parshuram Thombare <pthombar@cadence.com>, <linux-spi@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, "fei.xie"
	<fei.xie@horizon.auto>
Subject: [RFC PATCH 1/4] dt-bindings: spi: cdns,xspi: add SPI NAND compatible
Date: Mon, 21 Sep 2026 17:36:58 +0800
Message-ID: <20260921093701.1341766-2-fei.xie@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260921093701.1341766-1-fei.xie@horizon.auto>
References: <20260921093701.1341766-1-fei.xie@horizon.auto>
MIME-Version: 1.0
X-Originating-IP: [10.9.0.252]
X-ClientProxiedBy: exchange004.hobot.cc (10.9.15.112) To exchange003.hobot.cc
 (10.69.1.10)
X-DKIM-Results: exchange003.hobot.cc; dkim=none;
X-DNSRBL: 
X-MAIL: spam01.horizon.auto 68L9c19D068819
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horizon.auto;
	s=auto; t=1789983488;
	bh=SDAOlAC7vrik7PAuqLK16OWJ52qpC4QqixrLeIZyURc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ex9GAswmCgLRF5NDcgpinB+OXxMVKNfrg34uOzVtsFC0UDg3QYk7wHesTylkTmjEw
	 YSTxxR1v/QTFwBhm/wsQNeFgxvL1lSdk1M4iFOfoBo0xYOJvQbovufHTO6640e6XZk
	 9CHBNeXA9F949GpK6dUA4EPsQAtiBZC3EqOpG8E7lLD2thCW+U71YeN1b8Ff/C0YH+
	 TyatVmcR3Wu+5QCRA0Xx9YJtKjQP7r32OX5VraB6ITNqziKwzrOP4H+ZtlRfdSQm04
	 yeqKj4sfJGjRxDHJbaSXx+kkx+e9AybrQk3Q3E1MLEsZ5Tw6fvuNankwbVU6lPmvV+
	 RlBcH76o6hWZw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_023839_930220_7A2F465F 
X-CRM114-Status: UNSURE (   9.21  )
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

From: "fei.xie" <fei.xie@horizon.auto>

Document the Cadence XSPI controller compatible used with SPI NAND.

Signed-off-by: fei.xie <fei.xie@horizon.auto>
---
 Documentation/devicetree/bindings/spi/cdns,xspi.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/cdns,xspi.yaml b/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
index 38a5795589de2..3decf45d1b484 100644
--- a/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
+++ b/Documentation/devicetree/bindings/spi/cdns,xspi.yaml
@@ -13,11 +13,12 @@ maintainers:
 description: |
   The XSPI controller allows SPI protocol communication in
   single, dual, quad or octal wire transmission modes for
-  read/write access to slaves such as SPI-NOR flash.
+  read/write access to slaves such as SPI-NOR and SPI-NAND flash.
 
 properties:
   compatible:
     enum:
+      - cdns,xspi-nand
       - cdns,xspi-nor
       - marvell,cn10-xspi-nor
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
