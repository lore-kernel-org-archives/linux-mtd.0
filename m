Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5DCC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:28:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D0FC60E76
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D0FC60E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cviliTVnee3MbPwbp9wfnLyQWnK7xwzvVCpNQZmH5OQ=; b=GQceA/4O4nwkpb
	0ISaR2LQiufFYALDNR5CChT6dkNh+ubOH8S1eK8+YaYwZ94LGNEGjsH7BrGHJe1DlgwayMyuDC+GX
	RhdS/h6UW5lCuQrSX4SM8NEyGtAPHuSvve1DLrG5cLYjY2Fzam0XBmbW5DQY22DizDT5yYZdCXp9g
	92x2X/e8q6KxBQFfT5LFg4xWCeBMrUL2B4ytDaKwJvLar7kjriLEX81yqRx93llGxcbx9iC6jQp/k
	3hRV0l4cRMtiK6W9BnM8639rphT9XLb9eMZUXLZtjhWBIw5kHrmTEV5VUKPU/6EWuL0VObCu8Wujm
	ovZ2JldriNgjvT8/UypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKH5-001uOV-0d; Mon, 20 Sep 2021 14:28:03 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKGf-001uJE-9y
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 14:27:38 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18KERW4a015725;
 Mon, 20 Sep 2021 09:27:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1632148052;
 bh=5hWRp8SQ/F6dA2b0wXfuXXIFLTZSU7wZCK+QJTioq9U=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=OsMEr8gVfIuD5DEBJClcQxXNGhaZarK7/obCy+xm8ZIj5WS/R6TXqYcnsqNAEn1LP
 0TMaFu58z7V1dlNRKzCJDfrTkuxJbOA4PRy3GUtzs+V1p0T6psHcOsnlcy51AxZk06
 uTewsMvDULfiHTPZ7fCNefw3+oIr2fUj9jYwak90=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18KERWBG026216
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Sep 2021 09:27:32 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Sep 2021 09:27:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Sep 2021 09:27:31 -0500
Received: from LT5CD112GSQZ.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18KERE44100694;
 Mon, 20 Sep 2021 09:27:27 -0500
From: Apurva Nandan <a-nandan@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
 <robh+dt@kernel.org>, Serge Semin <fancer.lancer@gmail.com>, Mark Brown
 <broonie@kernel.org>, Apurva Nandan <a-nandan@ti.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>
CC: <michael@walle.cc>
Subject: [PATCH v2 2/2] dt-bindings: snps,
 dw-apb-ssi: Use 'flash' node name instead of 'spi-flash' in example
Date: Mon, 20 Sep 2021 19:57:13 +0530
Message-ID: <20210920142713.129295-3-a-nandan@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210920142713.129295-1-a-nandan@ti.com>
References: <20210920142713.129295-1-a-nandan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_072737_507037_0DA55517 
X-CRM114-Status: GOOD (  11.74  )
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

Change the nodename in the example with spi-nand from 'spi-flash@1'
to 'flash@1' to make the schema uniform with both spi-nand and spi-nor
flashes. jedec,spi-nor.yaml uses 'flash@' nodename for spi-nor flashes,
so make the spi-nand examples in dt-bindings use it too for uniformity.

Signed-off-by: Apurva Nandan <a-nandan@ti.com>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index ca91201a9926..d7e08b03e204 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -171,7 +171,7 @@ examples:
       cs-gpios = <&gpio0 13 0>,
                  <&gpio0 14 0>;
       rx-sample-delay-ns = <3>;
-      spi-flash@1 {
+      flash@1 {
         compatible = "spi-nand";
         reg = <1>;
         rx-sample-delay-ns = <7>;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
