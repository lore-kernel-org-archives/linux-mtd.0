Return-Path: <SRS0=iF+I=2U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CFD9C2D0C2
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 16:52:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE1AF206CB
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Dec 2019 16:52:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p9W3Gu0M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE1AF206CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvAN5XEBfw6PdP6O7WxjOLEQFJXV2P7xGc3RU1X5Wqw=; b=p9W3Gu0MHqiiGI
	duhykCw6sYKD2/1ZT9mhLXotoW7g3/JKk/Xcox/RrkI0KB0w0SrGsW7LhBqnIxOu4TfTbHqyFJnF9
	sY9BNJiuWvkQ3y1m6KmwQiB9pvpRKRjKhtqk6VJJ16/6oz26kDkieDgSDp9IarR15vcqLNmxMdfn+
	ALazu77scxVKNLbvxdr5H+ZU4AvhzIwqVVgQeJiRdv7Fz17XIqI+YtPxPZVzH2OBiUuWJwWYz7Zow
	I/5HCeJNIkt3Xd3iyqZxGUWBoVLot0giT5SvmYGFw0xJgafUgTcnM46jO+aCs6LPIIco16cPQ3jbk
	8j9zanPBejm+lm/O4WLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilyHU-0004BY-OF; Mon, 30 Dec 2019 16:52:36 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilyGd-0003J6-GQ
 for linux-mtd@lists.infradead.org; Mon, 30 Dec 2019 16:51:47 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id CD790C0004;
 Mon, 30 Dec 2019 16:51:35 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 5/8] dt-bindings: mtd: partition: Document the slc-mode
 property
Date: Mon, 30 Dec 2019 17:51:26 +0100
Message-Id: <20191230165129.11925-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191230165129.11925-1-miquel.raynal@bootlin.com>
References: <20191230165129.11925-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_085143_820588_89B2FDCF 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

Add a boolean property to force a specific partition attached to an MLC
NAND to be accessed in an emulated SLC mode this making this partition
immune to paired-pages corruptions.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/partition.txt       |   3 +++
 scripts/pnmtologo                               | Bin 0 -> 22416 bytes
 2 files changed, 3 insertions(+)
 create mode 100755 scripts/pnmtologo

diff --git a/Documentation/devicetree/bindings/mtd/partition.txt b/Documentation/devicetree/bindings/mtd/partition.txt
index afbbd870496d..4a39698221a2 100644
--- a/Documentation/devicetree/bindings/mtd/partition.txt
+++ b/Documentation/devicetree/bindings/mtd/partition.txt
@@ -61,6 +61,9 @@ Optional properties:
   clobbered.
 - lock : Do not unlock the partition at initialization time (not supported on
   all devices)
+- slc-mode: This parameter, if present, allows one to emulate SLC mode on a
+  partition attached to an MLC NAND thus making this partition immune to
+  paired-pages corruptions
 
 Examples:
 
diff --git a/scripts/pnmtologo b/scripts/pnmtologo
new file mode 100755
index 0000000000000000000000000000000000000000..ddb4f779cfa46fd92b802097fb2dd301bbe91912
GIT binary patch
literal 22416
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

literal 0
HcmV?d00001

-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
