Return-Path: <SRS0=uMxP=ET=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 801F3C56202
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:39:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F41292224C
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2020 12:39:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YtY1L4Nr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F41292224C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gwyuch5D6DzvLXyQT++2rhC/7WZaHVsJBa1Q4VO/F+s=; b=YtY1L4NrcVqbBJeCdcViAUDWls
	dSYkeWKvkinPShuSbfwmviJsRsQFmaXirJuxEmLC8P/NhDeVtDNU/TTZHtlbYaosIl2/dFzqvk4cl
	7nS7REW7Ml/7Dd9plHa0YQduQcEQ33lemhpaOqgj3FMDq5fZqES2PPwqaxOKxv5mChw3prenxFuP0
	gfCM3j5V/kGUCOEIazv/VOf6LlWOr/V60WBPE+X01O53/F9G25ok/CsvopQ4RyEDlQfd7WhR1QaBz
	6DuVumclPajeVrm+lSV6a7qC6OUM9VwU9V7TvuJ1BB2iFuGp16NPzs8LlXESoyTiNwG1WWTXUlU9s
	5/tLOUWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdYLi-0001Vs-Hd; Fri, 13 Nov 2020 12:38:42 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdYLd-0001TQ-S6
 for linux-mtd@lists.infradead.org; Fri, 13 Nov 2020 12:38:39 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id A28A1100002;
 Fri, 13 Nov 2020 12:38:32 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH] docs: mtd: Avoid htmldocs warnings
Date: Fri, 13 Nov 2020 13:38:31 +0100
Message-Id: <20201113123831.32429-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_073838_049410_7465A60F 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Moving files around produced the following warnings:

       Error: Cannot open file drivers/mtd/nand/raw/nand_ecc.c
       Error: Cannot open file drivers/mtd/nand/raw/nand_ecc.c

Fix one by just dropping the reference because it is not relevant, the
other by using a better noun instead of a file name.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/driver-api/mtd/nand_ecc.rst | 2 +-
 Documentation/driver-api/mtdnand.rst      | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/driver-api/mtd/nand_ecc.rst b/Documentation/driver-api/mtd/nand_ecc.rst
index e8d3c53a5056..74347c14a70b 100644
--- a/Documentation/driver-api/mtd/nand_ecc.rst
+++ b/Documentation/driver-api/mtd/nand_ecc.rst
@@ -5,7 +5,7 @@ NAND Error-correction Code
 Introduction
 ============
 
-Having looked at the linux mtd/nand driver and more specific at nand_ecc.c
+Having looked at the linux mtd/nand Hamming software ECC engine driver
 I felt there was room for optimisation. I bashed the code for a few hours
 performing tricks like table lookup removing superfluous code etc.
 After that the speed was increased by 35-40%.
diff --git a/Documentation/driver-api/mtdnand.rst b/Documentation/driver-api/mtdnand.rst
index 0bf8d6ec3f54..ce77e024c4f1 100644
--- a/Documentation/driver-api/mtdnand.rst
+++ b/Documentation/driver-api/mtdnand.rst
@@ -972,9 +972,6 @@ hints" for an explanation.
 .. kernel-doc:: drivers/mtd/nand/raw/nand_base.c
    :export:
 
-.. kernel-doc:: drivers/mtd/nand/raw/nand_ecc.c
-   :export:
-
 Internal Functions Provided
 ===========================
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
