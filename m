Return-Path: <SRS0=hJJw=US=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09515C31E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:52:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A51CE21537
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:52:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fmt9y2Dt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pf3m2Dm/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A51CE21537
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oLNyB9PCNlV9a3uDqolCXSMcq2WNSGYJGpC+h/uP9Yc=; b=fmt9y2DthNK0E2TfWeMJDjC/sp
	1kRhKiHe3jdzAB2XZy6u5GcURgd0f7OoIP7LqMcmNfNANrwSXqhZRb3gEHMTkMOHtMsJm6C9JKOY3
	j4txyVi1LFpQO4yJ2AOWTJbDuq3nDyNXjztrOZ8HgJbJ3KDmyOUBWFLuuxA8uBBdDnfxf1fSIxcAO
	LC21B/xfsnWQ8V0QMWfJ/Z2O0tNC8FehqbyC+40EgtWyyu+fGIqm+UQ0f5QQNDgyvSkYk8wPiOS/s
	75mv2tqSsuR/eAtii8Q5qqFY6ee6TlU6qyz+kyYLteANKtN1RknloB696uSvpHgUHM1LzliQGZLKo
	JHjQiP4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hddp6-0002Nf-7n; Wed, 19 Jun 2019 16:52:36 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddn8-0000R1-0A
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 16:50:35 +0000
Received: by mail-pg1-x544.google.com with SMTP id v11so9982042pgl.5
 for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2019 09:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RHPnKa4lpzShPp8v6HEr2I4MlpDohnI0U9yd4uFjIPw=;
 b=Pf3m2Dm/ftL/iK0H8gqYyGI/dbA8tXvD3CWrKqOeHfyQrSTm9VguZL8IHhIESi9f1m
 dKQ7JFVK92dOyRxafxw4GjvcDJ0BL3Xd6FpVLICxxtfDtkKbjWzn5rSQCWquO5HP17iO
 spxlW9xUP84nDlDU4KX7bW4VQSyLTtTFv6/1wXB123OxYvV7AxbipxjefnJwE6rAyCH8
 aedjm4F5um8qKkXZSdsr/tHCzXtakluFYpN9hV4BR6163xfz80NbLc9HwM8vQXYuYJPa
 /0dN6ACK57U/ZJRL8XGEQ1t4sSZdFboChU+WIGxTe9TUsAkTB0490eB31lT6ni8Ftf94
 Cw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RHPnKa4lpzShPp8v6HEr2I4MlpDohnI0U9yd4uFjIPw=;
 b=bEG0Hnf3+nsOOy6RJ2Q0eBfKQtZyIJGF1VQsdrIVSHciJ+CBuuWKNxpxJD6BWsyfSU
 UWW17T1rmxCrGkdjsWw/p+7bcUbKYkr4msrczbYlyYC/Xq6qMPsdsvXjVdbyycS+MSoT
 /sHj7R70goo/vzhBTjGvrWwWnFb2Q8SuJHLlYi5K930Y2oZsLUjRo+Jhhga1hRjIy6HW
 5ZoLlEjgb5NaEw5z9ltPQ4ceRPDzfL4UQtxdb1P4e8c1FRp1KDe62YavxCpDwOBmZM8h
 /xfs2p+/MyQZC8MIZfnpBofOmmIROJzi7DiODiM8w10SLNCKWaID3YicaVumEEJ1gGZa
 MSdw==
X-Gm-Message-State: APjAAAW/Hr8eeN8H04F/TcZCWwJDq3PeYVAP+Ea9fiwn07RuflJiRbqa
 GgXH0gpEjNSkhcaeZbaKIc81pXW5
X-Google-Smtp-Source: APXvYqwPW7y2kmfvjKfCPww5q2TBi42iHxMMmz9hnoYsH/sXiItc8hNvB7xsbAUtqrh9Hbc7SXhNCQ==
X-Received: by 2002:a17:90a:b78b:: with SMTP id
 m11mr12394070pjr.106.1560963033378; 
 Wed, 19 Jun 2019 09:50:33 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id j1sm21344894pfe.101.2019.06.19.09.50.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 09:50:33 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v7 8/9] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce exit paths
Date: Thu, 20 Jun 2019 01:50:00 +0900
Message-Id: <20190619165001.28410-9-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190619165001.28410-1-ikegami.t@gmail.com>
References: <20190619165001.28410-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_095034_090067_24270FB7 
X-CRM114-Status: GOOD (  17.23  )
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
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v6:
- Removed the tag of Koen Vandeputte as same with the v7 1/9 patch.
- Address the ./scripts/checkpatch.pl issue.

Changes since v5:
- Rebased on top of Liu Jian's fixes in master.
- Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.

Changes since v4:
- None.

Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 38 +++++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 50d9e2348845..a742e718d244 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1649,25 +1649,16 @@ static void __xipram do_write_oneword_done(struct map_info *map,
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
@@ -1677,7 +1668,6 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
 		pr_debug("MTD %s(): NOP\n", __func__);
-		do_write_oneword_done(map, chip, adr, mode);
 		return ret;
 	}
 
@@ -1699,6 +1689,26 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
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
+	if (ret)
+		return ret;
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
