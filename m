Return-Path: <SRS0=prEm=YR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60843CA9EAF
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Oct 2019 07:15:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30A9121655
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Oct 2019 07:15:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aVPDiHQE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30A9121655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxic.com.tw
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9k8xjsb05KlccRf/oBLzyjqDysM0mm+h0vLt96I0EK4=; b=aVPDiHQEUySxv5Pp1J6pkjqj6k
	+SA802ShzRs33wv2sL429cIjlkb6RyJ8oounE0llX5+yBJL9iw3Q9hSutWO2wHmZD5vUHKPfuP8no
	CqhCrC2DSyJKwzgLqqPJksiKkWMrSxfCQnELzpwUgatFf2hbhyxHYy65No2ZsX9+UVnkTa3FiLqQl
	rhqA0eWgJDz+CccotrcuYA3PTS9Q5XKZH7PkfIIKLoTGKGabmFAODTRyg7ftlCFrqH04mJurNIyVV
	mDoSV8Kzb/IFjxoqcjLaCx31/6On8woCncNEjBsVhqpU81FMLdzteKyJDb9dKvxeSnrSXHtKiX5lr
	iPf70tqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNXL5-0003Zm-PF; Thu, 24 Oct 2019 07:15:19 +0000
Received: from twhmllg4.macronix.com ([122.147.135.202])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNXKw-0002AO-9A
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2019 07:15:11 +0000
Received: from localhost.localdomain ([172.17.195.96])
 by TWHMLLG4.macronix.com with ESMTP id x9O7E52w080302;
 Thu, 24 Oct 2019 15:14:07 +0800 (GMT-8)
 (envelope-from masonccyang@mxic.com.tw)
From: Mason Yang <masonccyang@mxic.com.tw>
To: miquel.raynal@bootlin.com, richard@nod.at, marek.vasut@gmail.com,
 dwmw2@infradead.org, bbrezillon@kernel.org,
 computersforpeace@gmail.com, vigneshr@ti.com, robh+dt@kernel.org,
 mark.rutland@arm.com
Subject: [PATCH v4 2/2] dt-bindings: mtd: Document Macronix NAND device
 bindings
Date: Thu, 24 Oct 2019 15:40:07 +0800
Message-Id: <1571902807-10388-3-git-send-email-masonccyang@mxic.com.tw>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1571902807-10388-1-git-send-email-masonccyang@mxic.com.tw>
References: <1571902807-10388-1-git-send-email-masonccyang@mxic.com.tw>
X-MAIL: TWHMLLG4.macronix.com x9O7E52w080302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_001510_595562_487880A4 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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
Cc: juliensu@mxic.com.tw, devicetree@vger.kernel.org, masonccyang@mxic.com.tw,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Document the bindings used by the Macronix NAND device.

Signed-off-by: Mason Yang <masonccyang@mxic.com.tw>
---
 .../devicetree/bindings/mtd/nand-macronix.txt        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nand-macronix.txt

diff --git a/Documentation/devicetree/bindings/mtd/nand-macronix.txt b/Documentation/devicetree/bindings/mtd/nand-macronix.txt
new file mode 100644
index 0000000..cb60358
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nand-macronix.txt
@@ -0,0 +1,20 @@
+Macronix NANDs Device Tree Bindings
+-----------------------------------
+
+Macronix NANDs support randomizer operation for user data scrambled,
+which can be enabled with a SET_FEATURE. The penalty of randomizer
+is subpage accesses prohibited. By adding a new specific property
+in children nodes to enable randomizer function.
+
+Required NAND chip properties in children mode:
+- randomizer enable: should be "mxic,enable-randomizer-otp"
+
+Example:
+
+	nand: nand-controller@unit-address {
+
+		nand@0 {
+			reg = <0>;
+			mxic,enable-randomizer-otp;
+		};
+	};
-- 
1.9.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
