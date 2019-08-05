Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B50C433FF
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:04:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF4CD205F4
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g/h3xjYN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaM/XTj1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF4CD205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=x6YXP5fyFes8WeE3YTzXFRO42FgfwAjuOqrZfhnztfI=; b=g/h3xjYNaMrhsXpR5ZoZ8tSxt8
	8vcadta29FkWfvPy6CDVWp62fFJ85nnbTX537Nwvcib+vmcRkYGJ80mQYE0SBC0fhjU7VYKhE+10H
	NxrVdcWJuxLjBaMotMm0lBBmO6chr+jvqPnlmtAaJXo18iUP8GZ93RRqAjffnGLaaapcgyoBTxexH
	KCahhtzZaDUK81JxnPd14eTrQDnYf2805liaRVST8BhhEt/lOpdHWr+90TaRCbd6YfZ0eQf0FKWey
	L0wFWXD6dNMkF+X/3uCVgbbrbpIlgwbVnxS9Fc6r+JfV43BpXPHOpfHIGmolWIC3KtialRdhtCQ5x
	46M6bcMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huiHX-0004F7-Mn; Mon, 05 Aug 2019 19:04:31 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huiGs-0003Op-M3
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 19:03:52 +0000
Received: by mail-pl1-x644.google.com with SMTP id c14so36743481plo.0
 for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2019 12:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=MOHvtvPCgTFpvpqo6MwoXrLLd7FJuLXsz4ZvM/Ru9Dk=;
 b=BaM/XTj1ijXgmadxyhgL9zO9FzFNaY1y0bhZN93ehiSt8hu7mv8WIfLOzN9Aw+G7i1
 1xPvE42vGGXsmc+y0Syqc2PQtCNUZYyU0WVIu8UeJvt3TU7O78QIGjePLaqTnCEE3O7e
 sDYOL8UaVSKHBQQxFTRbMp9CYWqa+EN9zDfXDNZlhKCzsxEdnri8HBqs2lkQn12Io7FV
 EZVIwYyIGd8pppp7ykPeGP9NTqk+RrWPy4dL6blgqZcA+KzSpy9THxiL+aMdkLIJbeNr
 V+gx/GkqOmNa5+TEjFOZJxpnEfGmwOZcopSaqFoaNwEAuFwQFEONn6mz9PFu7cz/ufFM
 qeSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=MOHvtvPCgTFpvpqo6MwoXrLLd7FJuLXsz4ZvM/Ru9Dk=;
 b=nytuxuNzOUdxMZa8aqu88akZFt3K2thH+JESLtY5zFKwpiM+Oy3srdQVAka6rIHQs4
 T8JxF4BRTFXnbD6TmAgVmZKnv229g3B/T7AzX3H34ukJPo5TKbk+OflpxdJl255fRPnQ
 lcoiZXS0PNOATPwDBy+BZZamb/jmD/+1fywafv49VYN8LRYQT+8FGG6j7UTly/pESOeh
 cKJ6feIT04WCJaenqHL2uMThfbInTNlyhdcFRKWmlhnyp+7B1N3lXGmRLN49o7QnJ5Bs
 vDXYwv4ifw3yDcf0zK+uoHjoXs9khC2YPpuNFNYGVoLxxvWcoeKH/t/I9Gu9hz+pvpPS
 piwg==
X-Gm-Message-State: APjAAAWNhf6+m6NPbTl0OfEL3EvpPzXr2XOoaH0uvLTItmp0LsSnJtDC
 yJbnQHdtOZP3lekP1IZJrTE=
X-Google-Smtp-Source: APXvYqzZ48Nc8Bfik7LsgN29M3ODWubsEZqH6s+pksfTIKK1VfiYOclDgRCx1LnljZh8TX8ABUmTmA==
X-Received: by 2002:a17:902:42d:: with SMTP id
 42mr139197405ple.228.1565031830032; 
 Mon, 05 Aug 2019 12:03:50 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id q198sm88045579pfq.155.2019.08.05.12.03.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 12:03:49 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v8 4/9] mtd: cfi_cmdset_0002: Split do_write_oneword() op_done
 goto statement
Date: Tue,  6 Aug 2019 04:03:21 +0900
Message-Id: <20190805190326.28772-5-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190805190326.28772-1-ikegami.t@gmail.com>
References: <20190805190326.28772-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_120350_837331_06BECC6D 
X-CRM114-Status: GOOD (  17.96  )
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

To reduce function size and remove the goto statement split the op_done
goto statement part into do_write_oneword_done() created a function. Also
split the start part into do_write_oneword_start() to find easier pairs.

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v7:
- None.

Changes since v6:
- Removed the tag of Koen Vandeputte as same with the v7 1/9 patch.
- Address the ./scripts/checkpatch.pl issue.

Changes since v5:
- Rebased on top of Liu Jian's fixes in master.
- Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.

Changes since v4:
- None.

Changes since v3:
- Rebased on the patch v4 01/11.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Change to split the start part of do_write_oneword() additionally.
- Fix indentation to call pr_debug().

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 57 ++++++++++++++++++++++++++-----------
 1 file changed, 40 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index b74b57e30904..67640eded881 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1704,6 +1704,40 @@ static int __xipram do_write_oneword_once(struct map_info *map,
 	return ret;
 }
 
+static int __xipram do_write_oneword_start(struct map_info *map,
+					   struct flchip *chip,
+					   unsigned long adr, int mode)
+{
+	int ret = 0;
+
+	mutex_lock(&chip->mutex);
+
+	ret = get_chip(map, chip, adr, mode);
+	if (ret) {
+		mutex_unlock(&chip->mutex);
+		return ret;
+	}
+
+	if (mode == FL_OTP_WRITE)
+		otp_enter(map, chip, adr, map_bankwidth(map));
+
+	return ret;
+}
+
+static void __xipram do_write_oneword_done(struct map_info *map,
+					   struct flchip *chip,
+					   unsigned long adr, int mode)
+{
+	if (mode == FL_OTP_WRITE)
+		otp_exit(map, chip, adr, map_bankwidth(map));
+
+	chip->state = FL_READY;
+	DISABLE_VPP(map);
+	put_chip(map, chip, adr);
+
+	mutex_unlock(&chip->mutex);
+}
+
 static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 				     unsigned long adr, map_word datum,
 				     int mode)
@@ -1715,19 +1749,14 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 
 	adr += chip->start;
 
-	mutex_lock(&chip->mutex);
-	ret = get_chip(map, chip, adr, mode);
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n", __func__, adr,
+		 datum.x[0]);
+
+	ret = do_write_oneword_start(map, chip, adr, mode);
 	if (ret) {
-		mutex_unlock(&chip->mutex);
 		return ret;
 	}
 
-	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-		 __func__, adr, datum.x[0]);
-
-	if (mode == FL_OTP_WRITE)
-		otp_enter(map, chip, adr, map_bankwidth(map));
-
 	/*
 	 * Check for a NOP for the case when the datum to write is already
 	 * present - it saves time and works around buggy chips that corrupt
@@ -1736,8 +1765,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 */
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
-		pr_debug("MTD %s(): NOP\n",
-			 __func__);
+		pr_debug("MTD %s(): NOP\n", __func__);
 		goto op_done;
 	}
 
@@ -1760,12 +1788,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	}
 	xip_enable(map, chip, adr);
  op_done:
-	if (mode == FL_OTP_WRITE)
-		otp_exit(map, chip, adr, map_bankwidth(map));
-	chip->state = FL_READY;
-	DISABLE_VPP(map);
-	put_chip(map, chip, adr);
-	mutex_unlock(&chip->mutex);
+	do_write_oneword_done(map, chip, adr, mode);
 
 	return ret;
 }
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
