Return-Path: <SRS0=Ifuc=SO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9992BC10F0E
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 09:29:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64F7F205F4
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Apr 2019 09:29:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pmveNi16";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fCT40XDJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64F7F205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+MtWkNkxxbKGIlUvezKhLDxvuhSaGYdHDzH3BYD34A=; b=pmveNi16y0f1GC
	CQqcE1DVpXNDrot9ZIfGOi6C6DqtllcHugtfXuBcZWRZ8qIz9CKIOaU9TeZrRg+6tuH6e3cBHiSXx
	fwO8cVPO2cizVw54bmJ2pfVHNt6Bf+gdbUILdMmNuFaWIRGdtgKj2D4SS5G7R7umL6h1NPlH4w5T5
	oG5GU0BA/868NBFXOeaTzqr+jcQeaNR5dfF319RXbe13eRGh7quxYpOeQej+o4geeRtV2MY+7+qFo
	tepKsvML0M0EtGg/3A24nDcdw7LjGsCuQVq8EUNfvj9urO+NNmhSCB71wPtbLmU5gmyswJSPGTRqS
	fjafxTsoSErP5CN8ac+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEsVG-0006rK-Am; Fri, 12 Apr 2019 09:29:46 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEsUd-0005v7-I2; Fri, 12 Apr 2019 09:29:10 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3C9StTq028565;
 Fri, 12 Apr 2019 04:28:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1555061335;
 bh=J2zT+LR12Ogn3aduBhqlwatG9kR5GFN1+eqq1CoI5Co=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=fCT40XDJAESeT+vi8/WiHOWIoLvc4UIIS6Fa8BMCgwWTw24UnQUehZgSg8R+HgT3B
 JBmImljxi2jsA41YwkXhN/ctynQTwm5vUgAsE14zkL6oda0mt1bPBjge8OEuxnuuP6
 QeQt29YW05cI6ZuhEoBhyUKQOp9IkCbYjwpfaHSU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3C9StM2106610
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 12 Apr 2019 04:28:55 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 12
 Apr 2019 04:28:55 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 12 Apr 2019 04:28:55 -0500
Received: from a0132425.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3C9SWmF093202;
 Fri, 12 Apr 2019 04:28:48 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris
 Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 2/5] dt-bindings: mtd: Add binding documentation for
 HyperFlash
Date: Fri, 12 Apr 2019 14:59:20 +0530
Message-ID: <20190412092923.24919-3-vigneshr@ti.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190412092923.24919-1-vigneshr@ti.com>
References: <20190412092923.24919-1-vigneshr@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_022908_052357_07D11F5B 
X-CRM114-Status: GOOD (  14.60  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add DT binding documentation for HyperFlash devices.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../devicetree/bindings/mtd/cypress,hyperflash.txt          | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt

diff --git a/Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt b/Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
new file mode 100644
index 000000000000..7fb7d82bb042
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cypress,hyperflash.txt
@@ -0,0 +1,6 @@
+Bindings for HyperFlash NOR flash chips compliant with Cypress HyperBus
+specification and supports Cypress CFI specification 1.5 command set.
+
+Required properties:
+- compatible : "cypress,hyperflash", "cfi-flash" for HyperFlash NOR chips
+- reg : Address where flash's memory mapped space
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
