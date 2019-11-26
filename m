Return-Path: <SRS0=rTMm=ZS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C25C4C432C0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2019 21:28:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A1B320866
	for <linux-mtd@archiver.kernel.org>; Tue, 26 Nov 2019 21:28:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QJWsIS1R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tTxANH1K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A1B320866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5izrJ4NPBLoqrGAypWa6ofqi//8MggwMXnfitwLS1QI=; b=QJWsIS1R7+zgcf
	bCgDASaaTjEJR47o0AXQFzRCv2zJUnMw7PFwSHYTRc/J0ueTYoubfb16uvmk7TJqcsMoVoMhY7Mrs
	gilqe2vWyGwpWUT/KJvYl0n64VqWBgO2RsDGxQ3YLrLTCS4sAqHlgWxrNeQogHD/KIJKfZiol4Gaq
	cz0RNUCXsPD8XbCiE8v7LCngjopBXkHl+QQbDuc22KVbFDmM+186zxgsArpXlugGcAasU4eb/tTW6
	eRa5fSA4R5u9O9r0XL+Sj0GcRDZfwndncnh7hlXI8wEt2gz+/ObMlkK7FPZ/sX9BDvH579FAppGmC
	rW35cIEH88LG2ysVELiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZiNh-00047q-2D; Tue, 26 Nov 2019 21:28:21 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZiNe-00047U-JO
 for linux-mtd@lists.infradead.org; Tue, 26 Nov 2019 21:28:19 +0000
Received: by mail-ed1-x544.google.com with SMTP id dc19so2816743edb.10
 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2019 13:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p6gN7fIFJuj8Wgl6yeORs66j5aIMBonTV8hfE0W6caI=;
 b=tTxANH1KPn41laEVyiOkQomwjMx2R/X1C1QeHkn6BLoygh1seuOOoaHXgBCWP5+iVs
 FgQesMbP6+ahNFmB0Yjtuz7dzP8IFiPDOiMh5aJwoc7KbQgcrfK7q1triqA8V2IuXXmO
 Ym+WfpC7Jvc/WDnrgetJUb4CLAFUqG9WzW7fcRyGXLEXqDmrY7JrJY3KwbXLBRXWSw3q
 kEHT87ZPjr4n99HXcKozciH5e1Z8mqeCNgUSBoKHIkId27NO42PDLXVuJ4ByZoIn1Qcx
 uTNTOXy46U0oS5VwvKSXoznEE6yTU7WbFdosUl0JwA9j/YzCgPz7YKZ8gnC0b+b2FLzs
 xHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p6gN7fIFJuj8Wgl6yeORs66j5aIMBonTV8hfE0W6caI=;
 b=TD+9o4cKkKSRgISZHc0h3Dz4zTqphr2RGfhwLtRUJiV64zvEYX8CI5+xAzcRtBdKXH
 Nj+EdBMLVs7WqdQ3A9fp5kCbVvX2bAKlw6Lh1UkxeT9Xu4Tsiq3WgdJAtZKkMZxsuJ8K
 Z6J4O8ttUzInPgRkOqCHs+TR7Wvc9MZuux2I9v7ykFee1obNwD0cwJPHkfQIlwQhWunX
 TVvGskOuincPpQ2YwIKDcPy4tXnAKtrZXe4+ftC7b4TgpIRhlKxeHXOFKvzeuUZ/N149
 RvqXQq9/6WLu/9uEcy0s82gf9O2R3Ig5m8HeW+LdknAcwmr+hF4nVTWhWxi1rriwv3EC
 EJfw==
X-Gm-Message-State: APjAAAVZUy7pzsIkdPL6H69aOzG26/9YHaah3Td22CHeRh3vRSR2YBcZ
 wnHE/Lsld7tOAKAewqcId7W8W4UT
X-Google-Smtp-Source: APXvYqx1It1HJ9NfM+y6RWfTOls8BAtvFn1dl3lXzok7qtZiC4sRx7EOxBcjmZAw6tDvb9qkQaYemA==
X-Received: by 2002:a05:6402:799:: with SMTP id
 d25mr4884174edy.221.1574803696086; 
 Tue, 26 Nov 2019 13:28:16 -0800 (PST)
Received: from localhost.localdomain (31-10-150-32.cgn.dynamic.upc.ch.
 [31.10.150.32])
 by smtp.googlemail.com with ESMTPSA id f25sm365927edr.48.2019.11.26.13.28.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 13:28:15 -0800 (PST)
From: Bruno Pena <brunompena@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: core: allow mask_flags to be set for mtd_add_partition
Date: Tue, 26 Nov 2019 22:25:11 +0100
Message-Id: <20191126212511.1218-1-brunompena@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_132818_661242_DD622E25 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: Bruno Pena <brunompena@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patchs makes it possible to mask certain flags for new partitions (e.g. to make them read-only).
The change consists in the addition of a new argument "mask_flags" to "mtd_add_partition" that is passed on to the "allocate_partition".

Signed-off-by: Bruno Pena <brunompena@gmail.com>
---
 drivers/mtd/mtdchar.c          | 5 ++++-
 drivers/mtd/mtdpart.c          | 3 ++-
 include/linux/mtd/partitions.h | 2 +-
 3 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 0238952..0c0a6f2 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -583,7 +583,10 @@ static int mtdchar_blkpg_ioctl(struct mtd_info *mtd,
 		/* Sanitize user input */
 		p.devname[BLKPG_DEVNAMELTH - 1] = '\0';
 
-		return mtd_add_partition(mtd, p.devname, p.start, p.length);
+		/* No mtd flag masking required */
+		uint32_t mask_flags = 0;
+
+		return mtd_add_partition(mtd, p.devname, p.start, p.length, mask_flags);
 
 	case BLKPG_DEL_PARTITION:
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index b6af41b..66675a4 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -588,7 +588,7 @@ static int mtd_add_partition_attrs(struct mtd_part *new)
 }
 
 int mtd_add_partition(struct mtd_info *parent, const char *name,
-		      long long offset, long long length)
+		      long long offset, long long length, uint32_t mask_flags)
 {
 	struct mtd_partition part;
 	struct mtd_part *new;
@@ -609,6 +609,7 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	part.name = name;
 	part.size = length;
 	part.offset = offset;
+	part.mask_flags = mask_flags;
 
 	new = allocate_partition(parent, &part, -1, offset);
 	if (IS_ERR(new))
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 11cb0c5..1a0deeb 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -107,7 +107,7 @@ extern void deregister_mtd_parser(struct mtd_part_parser *parser);
 
 int mtd_is_partition(const struct mtd_info *mtd);
 int mtd_add_partition(struct mtd_info *master, const char *name,
-		      long long offset, long long length);
+		      long long offset, long long length, uint32_t mask_flags);
 int mtd_del_partition(struct mtd_info *master, int partno);
 uint64_t mtd_get_device_size(const struct mtd_info *mtd);
 
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
