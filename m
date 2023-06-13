Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF86DEB64D7
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Jun 2023 21:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pqSmY/qbHhSbqwx2tAgOkD48JOVo5BL1nMrjAdd//so=; b=DF4fNijcAUp9TW
	NAml0RDTQFY98A/VRQ2HFwRuNqSMy/LSNFgvCO4OposSD+BDdigjInQosTADb2w1lcYZHDFpALWs5
	H7RFc1hjHFol1d5+A4KQod8LsS8ktt3Fj4S9PxhDuah9DG+ldyZaufbF36lI7hcaNd8PG6PPYluDi
	Cfk09jm3MP+4Upc5Hu7MeuUN0bIQh17/78SKAeUu/ZhVocGR7iZr7jzjJn4CPcQ2v97gMzZU15JSq
	RkSGcfhjZSF4U8AuYIjk4Z1pU122ktjor97WOcmulF7jqhhPieLpECtLpXPO3xRmmJ1hIFz4vB7/K
	Je/5j0asdzqk+Th+kxTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9BQv-009CYS-00;
	Tue, 13 Jun 2023 21:20:09 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9BQq-009CXS-2G
	for linux-mtd@lists.infradead.org;
	Tue, 13 Jun 2023 21:20:07 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51873e43986so1745206a12.2
        for <linux-mtd@lists.infradead.org>; Tue, 13 Jun 2023 14:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686691201; x=1689283201;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jWvY4U8tYba+wNIbdqcQVeFZy9Nih1yvcvBjp24Mas=;
        b=qRU/dUZpnh2AVwkbsKA44WLQyrmK9X/p/rf9IDKCQ7dB+mze0KgTsdLfaIX5G2wkNS
         yiSAHuQ1Ge+PQVcRvhs9MbIryKEnqv9UkSRDAKl2VSOCdNncZbX1sd2EfqURYQi6VDfV
         exuCx1pEhcm74sgwNmWlXfb2fkCl6L9jYeDLWCzlc1zR4J1MVvQrcNnuLQ8NjSqdnPS+
         c4o/AzAvZ0WGsawlk2bSyJINvtuy4o2KjkMff5ia2un8U/ZoPwWH3cEjrPFbW0jGXL6o
         0uax62fbwF84CRgCFWS5TdWKFckCZGQT3s+RQ/fzY4MGeXb+WPqGziPP4+e45OSg4SxI
         Ul3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686691201; x=1689283201;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4jWvY4U8tYba+wNIbdqcQVeFZy9Nih1yvcvBjp24Mas=;
        b=aIf03fJytkKA6PaMiJBQqj4KtIgnhpxEtfkRJfB5V1Mzk6A/rxRtssIYA62KKicPoC
         flteaM6X1vU8OousAMZ0kIP3sm/Qoldi5nqDY7M5rDnylOAE2xPwe3LMDuXLp1k7bLVR
         f1oo/wiu4yPush1Ckvlml6wdSxAHPFhsGPdXImSarTd5Rx+/xUJPlQ5Ks8OkMoOhoCUp
         RLbyYcdeLfhoeCTalgshjl5OkoM2Cht44n0PyfDGHtvNF3QmZ1aLXNu7cPutpqp622Az
         3g2OKvLoW758QAszCMzaD4zyiBFG6ivY4PSY1+Mk5vrciySRxKNezi3RbRdHNJmp7fKu
         SLTA==
X-Gm-Message-State: AC+VfDzmQd0k+2/bwdU5w0zLiLQf+cP6FXXFY9CWJl8IGGZdnDdZROrD
	QN3AUp3f1a3i8Fh4XpwTV/E=
X-Google-Smtp-Source: ACHHUZ7ttPM6Lmzp02stCVrPtQ12GVqkzGdupAadZLlbQZwynuS3qmelOCVeX/cFVP2wQFJlS/feKA==
X-Received: by 2002:aa7:ccda:0:b0:518:7a40:b75e with SMTP id y26-20020aa7ccda000000b005187a40b75emr1817076edt.25.1686691200508;
        Tue, 13 Jun 2023 14:20:00 -0700 (PDT)
Received: from [192.168.2.2] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id u11-20020aa7d0cb000000b00514a97b6b80sm6922313edo.78.2023.06.13.14.19.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 14:20:00 -0700 (PDT)
Message-ID: <aaf4580a-a368-8f70-c9c4-21b5ed4dd599@gmail.com>
Date: Tue, 13 Jun 2023 23:19:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v3 1/2] mtd: rawnand: add basic sandisk manufacturer ops
To: miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_142004_745792_01761797 
X-CRM114-Status: GOOD (  14.86  )
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

Add basic Sandisk manufacturer ops support to get
SDTNQGAMA timing data with the nand_get_sdr_timings()
function.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V3:
  Separate serie
  Change prefixes

Changed V2:
  New patch

---
Limited to one chip model for now.
In need for someone with better knowledge of the Sandisk product
range to expand and improve. Documentation is rare to find.
---
 drivers/mtd/nand/raw/Makefile       |  1 +
 drivers/mtd/nand/raw/internals.h    |  1 +
 drivers/mtd/nand/raw/nand_ids.c     |  2 +-
 drivers/mtd/nand/raw/nand_sandisk.c | 26 ++++++++++++++++++++++++++
 4 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 drivers/mtd/nand/raw/nand_sandisk.c

diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 917cdfb81..d93e861d8 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -67,5 +67,6 @@ nand-objs += nand_esmt.o
 nand-objs += nand_hynix.o
 nand-objs += nand_macronix.o
 nand-objs += nand_micron.o
+nand-objs += nand_sandisk.o
 nand-objs += nand_samsung.o
 nand-objs += nand_toshiba.o
diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 7016e0f38..e9932da18 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -73,6 +73,7 @@ extern const struct nand_manufacturer_ops hynix_nand_manuf_ops;
 extern const struct nand_manufacturer_ops macronix_nand_manuf_ops;
 extern const struct nand_manufacturer_ops micron_nand_manuf_ops;
 extern const struct nand_manufacturer_ops samsung_nand_manuf_ops;
+extern const struct nand_manufacturer_ops sandisk_nand_manuf_ops;
 extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;

 /* MLC pairing schemes */
diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
index dacc5529b..1a89ed796 100644
--- a/drivers/mtd/nand/raw/nand_ids.c
+++ b/drivers/mtd/nand/raw/nand_ids.c
@@ -188,7 +188,7 @@ static const struct nand_manufacturer_desc nand_manufacturer_descs[] = {
 	{NAND_MFR_NATIONAL, "National"},
 	{NAND_MFR_RENESAS, "Renesas"},
 	{NAND_MFR_SAMSUNG, "Samsung", &samsung_nand_manuf_ops},
-	{NAND_MFR_SANDISK, "SanDisk"},
+	{NAND_MFR_SANDISK, "SanDisk", &sandisk_nand_manuf_ops},
 	{NAND_MFR_STMICRO, "ST Micro"},
 	{NAND_MFR_TOSHIBA, "Toshiba", &toshiba_nand_manuf_ops},
 	{NAND_MFR_WINBOND, "Winbond"},
diff --git a/drivers/mtd/nand/raw/nand_sandisk.c b/drivers/mtd/nand/raw/nand_sandisk.c
new file mode 100644
index 000000000..7c66e4187
--- /dev/null
+++ b/drivers/mtd/nand/raw/nand_sandisk.c
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include "internals.h"
+
+static int
+sdtnqgama_choose_interface_config(struct nand_chip *chip,
+				  struct nand_interface_config *iface)
+{
+	onfi_fill_interface_config(chip, iface, NAND_SDR_IFACE, 0);
+
+	return nand_choose_best_sdr_timings(chip, iface, NULL);
+}
+
+static int sandisk_nand_init(struct nand_chip *chip)
+{
+	if (!strncmp("SDTNQGAMA", chip->parameters.model,
+		     sizeof("SDTNQGAMA") - 1))
+		chip->ops.choose_interface_config =
+			&sdtnqgama_choose_interface_config;
+
+	return 0;
+}
+
+const struct nand_manufacturer_ops sandisk_nand_manuf_ops = {
+	.init = sandisk_nand_init,
+};
--
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
