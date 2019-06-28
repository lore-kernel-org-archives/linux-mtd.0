Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8635C5B57B
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 12:31:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E51C2133F
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 12:31:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gCnGnlbo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E51C2133F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LkVmbkfku4sQHqULQGfhxk+7eR1+KE4Llng7NqsxbfM=; b=gCnGnlboBsuf1i
	lXdJJ8ocp68R9WsYqXzSLhjR8YgK7UwOZgq8bV+tyfc5CRBJcgK7c8Yx3IV1QG1YMOedrjXsSOoJR
	PeGbhDBp3yQR8gCLB24fpYhwHRepJSYWKKKmAXJESAKwhaf0u0K0VlwcCWzWdH0cqJsql8Kw6pjF0
	3hb6dMn4JPeuOEPDhns2nJbviECkHGBGm8BHqtXm0kXIlFdNvpOhe5cof3aTVgMz8R20VNrtdObBO
	D4LDZn+7K7vp2UDwLM5YBQAV2zzsU32saSOkI2TwdPtcNrMNxVsxefSwoKjiI6mafOcsy9hD8770G
	pE+0oEUvVazkfJfIYKYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgq1t-0005Su-4C; Fri, 28 Jun 2019 12:31:01 +0000
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hgq1U-00054y-3a; Fri, 28 Jun 2019 12:30:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hgq1S-0005RO-3O; Fri, 28 Jun 2019 09:30:34 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 06/39] docs: mtd: move it to the driver-api book
Date: Fri, 28 Jun 2019 09:29:59 -0300
Message-Id: <5153e27b3729e097e3069f206fb6143ca6457c62.1561724493.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

While I was tempted to move it to admin-guide, as some docs
there are more userspace-faced, there are some very technical
discussions about memory error correction code from the Kernel
implementer's PoV. So, let's place it inside the driver-api
book.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/driver-api/index.rst               | 1 +
 Documentation/{ => driver-api}/mtd/index.rst     | 2 --
 Documentation/{ => driver-api}/mtd/intel-spi.rst | 0
 Documentation/{ => driver-api}/mtd/nand_ecc.rst  | 0
 Documentation/{ => driver-api}/mtd/spi-nor.rst   | 0
 drivers/mtd/nand/raw/nand_ecc.c                  | 2 +-
 6 files changed, 2 insertions(+), 3 deletions(-)
 rename Documentation/{ => driver-api}/mtd/index.rst (94%)
 rename Documentation/{ => driver-api}/mtd/intel-spi.rst (100%)
 rename Documentation/{ => driver-api}/mtd/nand_ecc.rst (100%)
 rename Documentation/{ => driver-api}/mtd/spi-nor.rst (100%)

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 41f5ce7dc34c..488c0347fa98 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -43,6 +43,7 @@ available subsections can be seen below.
    mtdnand
    miscellaneous
    mei/index
+   mtd/index
    nvdimm/index
    w1
    rapidio/index
diff --git a/Documentation/mtd/index.rst b/Documentation/driver-api/mtd/index.rst
similarity index 94%
rename from Documentation/mtd/index.rst
rename to Documentation/driver-api/mtd/index.rst
index 4fdae418ac97..2e0e7cc4055e 100644
--- a/Documentation/mtd/index.rst
+++ b/Documentation/driver-api/mtd/index.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 ==============================
 Memory Technology Device (MTD)
 ==============================
diff --git a/Documentation/mtd/intel-spi.rst b/Documentation/driver-api/mtd/intel-spi.rst
similarity index 100%
rename from Documentation/mtd/intel-spi.rst
rename to Documentation/driver-api/mtd/intel-spi.rst
diff --git a/Documentation/mtd/nand_ecc.rst b/Documentation/driver-api/mtd/nand_ecc.rst
similarity index 100%
rename from Documentation/mtd/nand_ecc.rst
rename to Documentation/driver-api/mtd/nand_ecc.rst
diff --git a/Documentation/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
similarity index 100%
rename from Documentation/mtd/spi-nor.rst
rename to Documentation/driver-api/mtd/spi-nor.rst
diff --git a/drivers/mtd/nand/raw/nand_ecc.c b/drivers/mtd/nand/raw/nand_ecc.c
index f6a7808db818..09fdced659f5 100644
--- a/drivers/mtd/nand/raw/nand_ecc.c
+++ b/drivers/mtd/nand/raw/nand_ecc.c
@@ -11,7 +11,7 @@
  *   Thomas Gleixner (tglx@linutronix.de)
  *
  * Information on how this algorithm works and how it was developed
- * can be found in Documentation/mtd/nand_ecc.rst
+ * can be found in Documentation/driver-api/mtd/nand_ecc.rst
  */
 
 #include <linux/types.h>
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
