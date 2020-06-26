Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C85C433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:48:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B6AC2080C
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 11:48:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AFezHs1Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A3FNdNaL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B6AC2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zq8cbZm4U5BlqSaDLfYkdwXZWG7R+YtXkaAFclwfVl4=; b=AFezHs1Q+5Nnhnt7CN614H7jE
	mGlPPCX/u+uPX4975uNDSMIE2jmhPXmvn28df+N4baZrCe7DItMef/v9nPfKxhgOZKsq8x6B0ROHX
	75xHDEyez+0HkpjWQ61Qn+FABAw/RpIBKlG4ruV8DDmW9PCUs8R91ma58tSVvbpBGtuvWpnADdmr1
	eRnp+XNS/0v2Vx98Qy19s/Pv4XAKYytFHA6y15IdrFU9dk+5YaD8kuanV3YA7Aq1P0J+P17EZb4G/
	6Yc6r8rryeHah1kC7ZONOZUuea+/nq1K9lCqzlaCqI4sgXvMIOUGUzGD5ZwjIjITP21w+QFe8TrZN
	Noyjou9XA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jompS-00045A-MU; Fri, 26 Jun 2020 11:47:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolN3-0000z2-BF
 for linux-mtd@merlin.infradead.org; Fri, 26 Jun 2020 10:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=xZ5cS/N7SHedICeFNBwAGyNAl/iRa57XO1VaKJMwBrg=; b=A3FNdNaLKTpdveUKi2uJ8/DsCd
 je2s8XmHibEWy7Wgx7eH9HqKvmUsMZ/4ro53QgfD0qSqw9I7EHLg96X/49DmKtt65Gb/nYbQfzg4P
 WdqLH2MyXerQqPuOOWcAPu3MtYt9cQTh8DLkJVkQ17pAjNWFu2MNUxoj1/h0s5we/6lYlw7DL0IvQ
 ov6p6AkMtyrOAR84ExyH+2YdG/y3UT3AbuqhHrr94oG1U86qY8qX9UUyQxt8UJQ2byxfJnGYQKVE7
 s7sxWk8/QEMDzzDS/Dt834PQ4a5YCbJV0Ce7iHK5kyMQv6ZVSQUJvYmgmWxc+DMZ6ia8Dq8L7RXgN
 26iOz0Cg==;
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joiZB-0003Ul-HT
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 07:14:31 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 8C557100003;
 Fri, 26 Jun 2020 07:14:06 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>
Subject: [PATCH v11 1/2] dt-bindings: mtd: Document nand-ecc-engine
Date: Fri, 26 Jun 2020 09:13:56 +0200
Message-Id: <20200626071357.21421-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626071357.21421-1-miquel.raynal@bootlin.com>
References: <20200626071357.21421-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_081429_724096_0BFF5CFF 
X-CRM114-Status: GOOD (  11.51  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, juliensu@mxic.com.tw,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, masonccyang@mxic.com.tw
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This property is needed to precisely point to the hardware ECC engine
to use when there are several of them available. Here, hardware also
refers to the on-die possibility.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/nand-controller.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 4a0798247d2d..0969d2e6720b 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -56,6 +56,18 @@ patternProperties:
           (Linux will handle the calculations). soft_bch is deprecated
           and should be replaced by soft and nand-ecc-algo.
 
+      nand-ecc-engine:
+        maxItems: 1
+        description:
+	  A phandle on the hardware ECC engine if any. There are
+          basically three possibilities:
+          1/ The ECC engine is part of the NAND controller, in this
+          case the phandle should reference the parent node.
+          2/ The ECC engine is part of the NAND part (on-die), in this
+          case the phandle should reference the node itself.
+          3/ The ECC engine is external, in this case the phandle should
+          reference the specific ECC engine node.
+
       nand-ecc-placement:
         allOf:
           - $ref: /schemas/types.yaml#/definitions/string
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
