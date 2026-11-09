Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76C3606A31C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 05:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yogeskzi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=epj4gA1I;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=mu1LLSrb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Fqm9btIpqhx2hEcZceKWeKQZnqdtPPYwVslG6Nwy46A=; b=YogeskziatlmWFY+L4lTWhAHBX
	xFy8wgEDUHWe8iaXLpbAMu0OfJ2nOzdBAsc3ocAbSTUiG9XXFqDlPJOG/lcvSgqfDWq6HTPQoZ0Wv
	KoHa3U0UcLuiRdywaFEvlYUhFwegeevdcIf+AXe7r/8J1ykqPhtaU6YZoxhHfR4l8w6KA6V9bFTkZ
	Oxei2/c/a0TKxsbg5MJs2vfSkeCRtzVetr1IPuKcx94+9IKQhyZuaSEbs9lr6V+2L1HKPhkQcnqHI
	dQ1AMW7hlJ+8iVLH8R5ArIAQf0VoHlHX5mt3u6V0Dmjg1wAROHYSzVOqgQh1wQcm1iEFBQc6n46V1
	rDJ66i3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHvB-0000000HPS5-2DpC;
	Mon, 09 Nov 2026 05:27:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHvA-0000000HPRq-2qKE
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Nov 2026 05:27:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1BtYHxxSpkoc0eJPO2XWBHTEKtWfzsME850atTr5y88=; b=epj4gA1IGaRylUnfZbe1OgT/xN
	e+EanYF8zrFfxc4C5A7/GN4qGFknDqBMu0xv4rGKAfkkAkaGIrRCH1V7edVH74Kh0vpVmw/C6FT+H
	E0gEekZpyTpMF6VELEbTmQ+ayI4nbhgyulLGodMueVqN9u94jbxBp0w91XrwDQVjyeGYuFzW4SRzR
	y/43p6JVovh1Q15KtU7GPAWKDUu5oW8Rw3fFewr/q4F2aZ//uDQxONhUKlxTEvaOwWHqsqnKCC/wY
	uzyIAig/U1zP8Sxjy2TyHWiF2ARHrMnz0dY6NBfgBtkvgNGQpXD5izUxon0oatp3rvn7AOzfwrxK7
	9Zz6W+kQ==;
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQHuw-00000006KCC-0C4p
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 05:27:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=mu1LLSrbUforV64iiqvmLBcZBvjKdmB1+qzO1laEiA3KSJcj2qQ9pPj3gtVjZ96WVPvf7ee34bk40
	 4RBCdh0VEmByamH70AWtMVfrekrfxw7pnXbtFReD+9cBZgeQbPRL1fUhzfuYB3flupb+Dtmscnd98C
	 BGbRHhw4tVIfykO0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af159c0428-c1c4b;
	Mon, 09 Nov 2026 13:27:28 +0800 (CST)
X-RM-TRANSID: 2ee76af159c0428-c1c4b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from  (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af159bcc11-8263c;
	Mon, 09 Nov 2026 13:27:28 +0800 (CST)
X-RM-TRANSID: 2ee86af159bcc11-8263c
From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	michal.simek@amd.com,
	linux-kernel@vger.kernel.org,
	Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] mtd: rawnand: arasan: fix GPIO CS leak on probe error paths
Date: Mon,  9 Nov 2026 13:27:24 +0800
Message-ID: <20261109052724.1032-3-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
References: <20261109052724.1032-1-zhaofeng2@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_052743_161537_B0A8E928 
X-CRM114-Status: GOOD (  13.12  )
X-Spam-Score: -0.5 (/)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The CS GPIO descriptors acquired by anfc_parse_cs() via
rawnand_dt_parse_gpio_cs() are only released in anfc_remove().  Two
probe error paths leak them:

- anfc_parse_cs() itself returns -EINVAL on an invalid DT GPIO CS
  layout without releasing the freshly acquired descriptors;
- anfc_probe() bails out when anfc_chips_init() fails, leaving the
  successfully parsed CS array behind.

Factor the gpiod_put() loop of anfc_remove() into anfc_put_cs() and
call it from both error paths as well.  gpiod_put() accepts NULL, so
this is also safe when the default all-NULL CS array is in place.

Fixes: acbd3d0945f9 ("mtd: rawnand: arasan: Leverage additional GPIO CS")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
Verified against current upstream master.  Not runtime-tested (no
Arasan hardware).

 drivers/mtd/nand/raw/arasan-nand-controller.c | 26 ++++++++++++++----
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/nand/raw/arasan-nand-controller.c
--- a/drivers/mtd/nand/raw/arasan-nand-controller.c
+++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
@@ -1391,6 +1391,14 @@ static void anfc_reset(struct arasan_nfc *nfc)
 
 	nfc->cur_cs = -1;
 }
 
+static void anfc_put_cs(struct arasan_nfc *nfc)
+{
+	int i;
+
+	for (i = 0; i < nfc->ncs; i++)
+		gpiod_put(nfc->cs_array[i]);
+}
+
 static int anfc_parse_cs(struct arasan_nfc *nfc)
 {
@@ -1413,7 +1421,9 @@ static int anfc_parse_cs(struct arasan_nfc *nfc)
 		if (nfc->ncs > 2 && !nfc->cs_array[0] && !nfc->cs_array[1]) {
 			dev_err(nfc->dev,
 				"Assign a single native CS when using GPIOs\n");
+			anfc_put_cs(nfc);
+
 			return -EINVAL;
 		}
 
 		if (nfc->cs_array[0])
@@ -1469,23 +1479,23 @@ static int anfc_probe(struct platform_device *pdev)
 
 	ret = anfc_chips_init(nfc);
 	if (ret)
-		return ret;
+		goto err_put_cs;
 
 	platform_set_drvdata(pdev, nfc);
 
 	return 0;
+
+err_put_cs:
+	anfc_put_cs(nfc);
+
+	return ret;
 }
 
 static void anfc_remove(struct platform_device *pdev)
 {
-	int i;
 	struct arasan_nfc *nfc = platform_get_drvdata(pdev);
 
-	for (i = 0; i < nfc->ncs; i++) {
-		if (nfc->cs_array[i]) {
-			gpiod_put(nfc->cs_array[i]);
-		}
-	}
-
+	anfc_put_cs(nfc);
+
 	anfc_chips_cleanup(nfc);
 }
-- 
2.39.2




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
