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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB41DC31E5B
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:51:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D418206E0
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jun 2019 16:51:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V645kHML";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ff5Jxroj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D418206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wqJA6E6vrBohLxLYSJzQDsS1Np21mJDqBbZ+Z6c0fJs=; b=V645kHMLMUUBkVwzXFeE01lZ3l
	N/uQ642ljBZQUaf45HIuuTARUxdyzhYadqFpnzDtabpBTACDSUXkkX2m3xZR6tfMVoWG1bBWpHYg9
	ziP0LAGdS3MfrfHsaxFNEWFhv0whL79r8r4xqpoQO0xj9eSmGhpCpfMBSmHsC9KtNR79K5KxXIViW
	Tpe7ZyDxh2n76pYEbPo5VCQ/oDTNC+yS4Vyv1CECzq9cUVding2In5KAYuUZz7RKf9JIOZ3PjCepk
	FWSWJRPWx+fuE4AIrqgjunyFxhE/rdYS0Ac2yIRIv4R5TOFC/xXfI/tWihnctujbk152rsdQqgfhb
	BHmVOfaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hddnx-0001GF-2x; Wed, 19 Jun 2019 16:51:25 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hddn0-0000H9-7L
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2019 16:50:28 +0000
Received: by mail-pl1-x641.google.com with SMTP id i2so59595plt.1
 for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2019 09:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FqodIC35lv+OmmACIdLud67ndXOsuqAQl8Mc0biq5x0=;
 b=ff5JxrojguB7ua/cEOVI8mu77U0G2l+bJiYU5azpHYU4hmadAYMcWMhAGHD0yA0Ejn
 JEtGcQ5aQFWTQg9VI6TSw6wQxqSEqwaiO6l8QUpvO/I6FlcEZxY1v0I7pI34HgO7hIpO
 cH8MJekgFzOOmiNAbgCuPHy5Y77Okjxm9xqcVshE+BvZI2afXs856tB6wmHnJLJIRMxG
 kN9EtehWsk4fYbqnNMa9uqF1d8E2F7Ibyti6BsS3cQCKAV1r9EfBWkFrApH1u3wC3wJS
 eGwUWL+RZ5ioGWWJN1Rz2ck45O/k445y6T/jDym9MOcRTnfyQfGLF1/3N6PqWTiQAVAJ
 AnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FqodIC35lv+OmmACIdLud67ndXOsuqAQl8Mc0biq5x0=;
 b=GleacriEQTXSmpEskZklk4EZgyWbUO1FXCn0da2GxE9xa8PozAXGpk8thSs/CD5Uza
 vTx6SvFEc7A/XrbOxERxJQ8DEJPgNKcIs2MK3FesMuW+AAX6Ba0KHcwIj91n0ZWdVRWE
 HBy/kW/PqhRJ4yMf23nKVtW9r+DqWZ12H3O1fV3EJq5aMnNV+lVj6FHafMXxS3oyzLRW
 gRQFE5Txe6lLdvCazCni4zEmgj9hc08oqeDQwcnJLdcEDqtKBwlR/f1D4kZh7n6hGKUK
 DhCF0Ca0HkKoT8E2VtEghvQDclc1/Q0KwsdEaV3WCP72tch10OUkQUG1d9DdfTyQ4o08
 +QUA==
X-Gm-Message-State: APjAAAX5HalPPCwyXTlcJQmLblFKnlR5jS4Z0iqN7eBJgtf+GegTsijV
 xXWI3kel5vU32CYSu9D54jc=
X-Google-Smtp-Source: APXvYqwV1tEVsAqoBlTGW6GJONWQz3RXpV0sYqlBdnZVe8vdBIRJnNhoTMv2SgyFUb+HCGutQtBjLQ==
X-Received: by 2002:a17:902:ba8b:: with SMTP id
 k11mr18743345pls.107.1560963025572; 
 Wed, 19 Jun 2019 09:50:25 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id j1sm21344894pfe.101.2019.06.19.09.50.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 09:50:25 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v7 4/9] mtd: cfi_cmdset_0002: Split do_write_oneword() op_done
 goto statement
Date: Thu, 20 Jun 2019 01:49:56 +0900
Message-Id: <20190619165001.28410-5-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190619165001.28410-1-ikegami.t@gmail.com>
References: <20190619165001.28410-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_095026_310767_7F413BA2 
X-CRM114-Status: GOOD (  17.72  )
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
index 08a119489b28..d511f70080dd 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1615,6 +1615,40 @@ static int __xipram do_write_oneword_once(struct map_info *map,
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
@@ -1626,19 +1660,14 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 
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
@@ -1647,8 +1676,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 */
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
-		pr_debug("MTD %s(): NOP\n",
-			 __func__);
+		pr_debug("MTD %s(): NOP\n", __func__);
 		goto op_done;
 	}
 
@@ -1670,12 +1698,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
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
