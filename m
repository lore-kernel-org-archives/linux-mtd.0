Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E818C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:16:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4105D60240
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 15:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4105D60240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+dYRt134mtvBz/c0BNhgcpw8LZeE0671Zq1WbXmdjSE=; b=E7PzihhuBy/mhEOiAsMf7wx9Oi
	Qd5WpSv5HvZ8YhB1nTPNTRnj4T4KamViDkOP0++LZBtTsrxnvM2SO9JuRRXvL2Nhz4IG1H5Zr4K/w
	BhzCxThGSVgnTQXDjhjJw4yg2Y2lKXja/qJcCVtUgIstzVvtgZqD1tSHgR7b7HyPT/qtE6QVvPhTz
	gYn8uS/6d5h6dusLtjCJxG4lFX5KMGNFDXS3NSBvx2MEAEFLGn3CaJBn9RFzAKFrjtwr4Y0ba0RQS
	zu2hHLoKnkGTxdNVonfsb05fQZeaSvALKRfSoq1BByzbX6qLOkR2at3sQnAKhL4RL26rjwxKM/hZt
	JCwpYNBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTE4-005LYq-NA; Wed, 03 Mar 2021 15:15:48 +0000
Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSEz-0055Fs-3Z
 for linux-mtd@lists.infradead.org; Wed, 03 Mar 2021 14:12:45 +0000
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 78611440209;
 Wed,  3 Mar 2021 16:12:29 +0200 (IST)
From: Baruch Siach <baruch@tkos.co.il>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] mtd: parsers: qcom: incompatible with spi-nor 4k sectors
Date: Wed,  3 Mar 2021 16:12:12 +0200
Message-Id: <71e3fe832d35bd34a7da87146ba7d52f89278665.1614780732.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
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

Partition size and offset value are in block size units, which is the
same as 'erasesize'. But when 4K sectors are enabled erasesize is set to
4K. Bail out in that case.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/mtd/parsers/qcomsmempart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index 808cb33d71f8..f851574e1b52 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -65,6 +65,13 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 	int ret, i, numparts;
 	char *name, *c;
 
+	if (IS_ENABLED(CONFIG_MTD_SPI_NOR_USE_4K_SECTORS)
+			&& mtd->type == MTD_NORFLASH) {
+		pr_err("%s: SMEM partition parse is incompatible with 4K sectors\n",
+				mtd->name);
+		return -EINVAL;
+	}
+
 	pr_debug("Parsing partition table info from SMEM\n");
 	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
 	if (IS_ERR(ptable)) {
-- 
2.30.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
