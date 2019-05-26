Return-Path: <SRS0=EZ/G=T2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB193C282E3
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:41:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DC4D20815
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:41:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p49Z5IUr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJGczZ9e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DC4D20815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vxnK+jV38sRjtJs5VJIwfrHE4v2BMryIZUrCz0LwS7s=; b=p49Z5IUrilNKgA4tTAkzPutBJy
	88JR8YZtAbN7TrhHn8cep1WftEx2SnoLMCdnc/q8cOAJZEQf7hHZY3qcnxjil7I0+jdtDkOpnS1IW
	I/y1zpij8Nvqjyx1rYLNGQbVSTLbu5pgRq2s9DXmEn6+gptIQ/nrnovUj7+lzfcAe/ukr8c2RbF3Z
	ea4cVo0xlIEKyRzq7T7Zq4gF0lIZsD+Dcu0YHWxtpif9uKn7x+X+gWWB7kwn6nFg68I2YpdvhTQ7r
	eRos18i5LZaTGf85m+fXd3H4/m+o/KTA/1uqUUnByZHeHgd0/ChMg8wsQXno443GAWrt9WIKS/KuV
	y1U8ytUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUvGt-0002aO-SU; Sun, 26 May 2019 15:41:15 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUvFN-0007xi-Il
 for linux-mtd@lists.infradead.org; Sun, 26 May 2019 15:39:46 +0000
Received: by mail-pl1-x643.google.com with SMTP id p15so6052705pll.4
 for <linux-mtd@lists.infradead.org>; Sun, 26 May 2019 08:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=DAcyApQvAlRT+e2om6YuefzI8yTqvXpbnaJyA23RiwQ=;
 b=CJGczZ9eiHJ62kwbZffhrLlhSo9LstmNwJcVd0SbqSZdsHs0d1WBnA6lJAws9lOp/h
 OvLgLAAEk3KdDxooD7BvPovmuyb3rOaV9113YXN0/3Njb9n9VC72fRmV51uICoauzbnj
 2Z7ZJqA3PdBHplMLOOd6qE74jePEvY+Z4i2CxS1LQOqauj3rS+KcWUTsJlOwh5vVmTTm
 k8WAqG8OreJQSkP9XPOFBI2O1uku4CGTh7DoSOdaWlVuZsez+B6EbJdoUSsHQkl5JPVz
 7E+UaRKZJMf/+q9JoBqELTR0BI07nbRW816rkfz0sZ8ss5HTjQaYhw/XIiv4KQizc4rS
 lj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=DAcyApQvAlRT+e2om6YuefzI8yTqvXpbnaJyA23RiwQ=;
 b=IpI/u/amrYR7RCS7Or+k2JFJDYYDW7iU2JFHjBgBBd4IaEcCcXbhF0t4VPVbOx0nWg
 L4JSUXA82lntRRj2DDWiBsZ/KthqTYohPMuxNL53jD+hAqBxgw/XzEzzEoG34DDdW15V
 9ucS3e82+jKk8kLXd/xQ0k0Buo7iIZ/5xVAKh1KWlCY8OHQT7wEdmyAoUsKMiswRwbu5
 1jfvECC20Na+qUujby3A8OP7E0JXtCbuU2Y3bPUxEy5P22kHYn/x4aPVK4kyULIDTAJO
 jizAWmM8LpjKlrWkzlZDDsPMzJwwy/RtP8EowyUGd1ASzzvd+alVeil30CvOQOx7wF4l
 qoJA==
X-Gm-Message-State: APjAAAUHhjvgs7SgtIZeAu7lxy8s5Vqmv/kBuXNrfj/bJDIKi5CUXTGQ
 IJ0ciF/kd/CZ6rDHiOYLKTXNXj+H
X-Google-Smtp-Source: APXvYqwKD2FYVzhoD4GcNpu7q9g7ITizJXVEd4tXnoNyQpftrLEauUo6K66H71wBZjaKcsB60UjOrQ==
X-Received: by 2002:a17:902:2e83:: with SMTP id
 r3mr105268175plb.139.1558885180978; 
 Sun, 26 May 2019 08:39:40 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id o2sm863129pgm.51.2019.05.26.08.39.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 08:39:40 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 10/11] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce exit paths
Date: Mon, 27 May 2019 00:39:03 +0900
Message-Id: <20190526153904.28871-11-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190526153904.28871-1-ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190526_083942_367108_41E9AF46 
X-CRM114-Status: GOOD (  16.98  )
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
Cc: Tokunori Ikegami <ikegami.t@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The do_write_oneword_done() is called twice at the exit paths.
By splitting the retry functionality it can be reduced to call once.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v5:
- Rebased on top of Liu Jian's fixes in master.
- Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.

Changes since v4:
- None.

Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 39 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index ebf420e1db43..477bc3d65e68 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1648,25 +1648,16 @@ static void __xipram do_write_oneword_done(struct map_info *map,
 	mutex_unlock(&chip->mutex);
 }
 
-static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
-				     unsigned long adr, map_word datum,
-				     int mode)
+static int __xipram do_write_oneword_retry(struct map_info *map,
+					   struct flchip *chip,
+					   unsigned long adr, map_word datum,
+					   int mode)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
 	int ret = 0;
 	map_word oldd;
 	int retry_cnt = 0;
 
-	adr += chip->start;
-
-	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n", __func__, adr,
-		 datum.x[0]);
-
-	ret = do_write_oneword_start(map, chip, adr, mode);
-	if (ret) {
-		return ret;
-	}
-
 	/*
 	 * Check for a NOP for the case when the datum to write is already
 	 * present - it saves time and works around buggy chips that corrupt
@@ -1676,7 +1667,6 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
 		pr_debug("MTD %s(): NOP\n", __func__);
-		do_write_oneword_done(map, chip, adr, mode);
 		return ret;
 	}
 
@@ -1696,6 +1686,27 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	}
 	xip_enable(map, chip, adr);
 
+	return ret;
+}
+
+static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
+				     unsigned long adr, map_word datum,
+				     int mode)
+{
+	int ret = 0;
+
+	adr += chip->start;
+
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n", __func__, adr,
+		 datum.x[0]);
+
+	ret = do_write_oneword_start(map, chip, adr, mode);
+	if (ret) {
+		return ret;
+	}
+
+	ret = do_write_oneword_retry(map, chip, adr, datum, mode);
+
 	do_write_oneword_done(map, chip, adr, mode);
 
 	return ret;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
