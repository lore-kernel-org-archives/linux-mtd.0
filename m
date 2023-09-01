Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58690CA0FE1
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 13:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BzMNfolq1yhjkqrmVDzUhjQle06n94FAw8zchcCOMt4=; b=ykBpdgvdgek9n4
	IaPMkvCiuRhkL+w6tErE8U99hlmtKtFAvSI2oOqpSTfvzvQecGedvtlAsnqtrwHicOtpG8GVY2HcE
	jiZd5Sft9AlcMk0X56efoU6V5gTIjMnQYbIuy+pQ0s+UhFh1IHM9m2IMohBcFX/Fz0cgvcwgm7wIo
	AvZB5eUvmPPfkw8sRV9lYp+USslmUIH3uZq12u0CL0CNXgphw2GItBCKjTmRHhf8MQ0kGzUmf3Pst
	fx6sFES18CeF5XTA8JOvcMfqYr9IWC6BeEXFoJr4XvvzbXVDZkp5fsEgUW5hNLM1nbeC7i0xPCx6Y
	FV5X0/+RkrHXlN0LaVPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc4L2-00HZp0-2h;
	Fri, 01 Sep 2023 13:37:28 +0000
Received: from forward103b.mail.yandex.net ([178.154.239.150])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc4Kz-00HZoH-09
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 13:37:27 +0000
Received: from mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net [IPv6:2a02:6b8:c08:2e14:0:640:2cd1:0])
	by forward103b.mail.yandex.net (Yandex) with ESMTP id BCE3E600C9;
	Fri,  1 Sep 2023 16:37:03 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 1bTJsPiDbqM0-prEI6731;
	Fri, 01 Sep 2023 16:37:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itb.spb.ru; s=mail; t=1693575423;
	bh=Ba8JWc3C9psCW/rmvc3IHsDGaZyabBvdUWtlCB4rRX8=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=UrNdCmqqSOogo/OavfhMWwDrPKx8G1SaWm5o2i6XE+DQ7WQ2rF5o2IEANWoxn3sWr
	 UIEqAIbCA5X6kvpeGf6E7Vmin6mLvsECllP4c4zRrqpBiwq1EOjNsR1SO/BK34+OkI
	 NfQheI5H1w347KexyNmJ8fMPItl9hA2MPcS/8M7o=
Authentication-Results: mail-nwsmtp-smtp-production-main-25.sas.yp-c.yandex.net; dkim=pass header.i=@itb.spb.ru
From: Dembskiy Igor <dii@itb.spb.ru>
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Dembskiy Igor <dii@itb.spb.ru>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] mtd: tests: remove useless checks
Date: Fri,  1 Sep 2023 16:36:41 +0300
Message-Id: <20230901133641.60817-1-dii@itb.spb.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_063725_266263_2C9FBDAA 
X-CRM114-Status: GOOD (  11.96  )
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

Return value of mtdtest_scan_for_bad_() is always 0. So it causes senseless
checks in some functions such as mtd_subpagetest_init().

Fixes: 084db4b020c7 ("mtd: tests: introduce helper functions")
Signed-off-by: Dembskiy Igor <dii@itb.spb.ru>
---
 drivers/mtd/tests/oobtest.c     | 2 --
 drivers/mtd/tests/pagetest.c    | 2 --
 drivers/mtd/tests/readtest.c    | 2 --
 drivers/mtd/tests/speedtest.c   | 3 +--
 drivers/mtd/tests/stresstest.c  | 2 --
 drivers/mtd/tests/subpagetest.c | 2 --
 drivers/mtd/tests/torturetest.c | 2 --
 7 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index 13fed398937e..976f40a5656e 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -399,8 +399,6 @@ static int __init mtd_oobtest_init(void)
 	pr_info("test 1 of 5\n");
 
 	err = mtdtest_erase_good_eraseblocks(mtd, bbt, 0, ebcnt);
-	if (err)
-		goto out;
 
 	prandom_seed_state(&rnd_state, 1);
 	err = write_whole_device();
diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index 8eb40b6e6dfa..a59ef88cdaf3 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -373,8 +373,6 @@ static int __init mtd_pagetest_init(void)
 	if (!bbt)
 		goto out;
 	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
-	if (err)
-		goto out;
 
 	/* Erase all eraseblocks */
 	pr_info("erasing whole device\n");
diff --git a/drivers/mtd/tests/readtest.c b/drivers/mtd/tests/readtest.c
index 99670ef91f2b..8bc52aca1b2a 100644
--- a/drivers/mtd/tests/readtest.c
+++ b/drivers/mtd/tests/readtest.c
@@ -162,8 +162,6 @@ static int __init mtd_readtest_init(void)
 	if (!bbt)
 		goto out;
 	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
-	if (err)
-		goto out;
 
 	/* Read all eraseblocks 1 page at a time */
 	pr_info("testing page read\n");
diff --git a/drivers/mtd/tests/speedtest.c b/drivers/mtd/tests/speedtest.c
index 075bce32caa5..978369f8d4c0 100644
--- a/drivers/mtd/tests/speedtest.c
+++ b/drivers/mtd/tests/speedtest.c
@@ -229,8 +229,7 @@ static int __init mtd_speedtest_init(void)
 	if (!bbt)
 		goto out;
 	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
-	if (err)
-		goto out;
+
 	for (i = 0; i < ebcnt; i++) {
 		if (!bbt[i])
 			goodebcnt++;
diff --git a/drivers/mtd/tests/stresstest.c b/drivers/mtd/tests/stresstest.c
index 8062098930d6..0a1fa8a2078e 100644
--- a/drivers/mtd/tests/stresstest.c
+++ b/drivers/mtd/tests/stresstest.c
@@ -189,8 +189,6 @@ static int __init mtd_stresstest_init(void)
 	if (!bbt)
 		goto out;
 	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
-	if (err)
-		goto out;
 
 	/* Do operations */
 	pr_info("doing operations\n");
diff --git a/drivers/mtd/tests/subpagetest.c b/drivers/mtd/tests/subpagetest.c
index 05250a080139..5ca93e169a25 100644
--- a/drivers/mtd/tests/subpagetest.c
+++ b/drivers/mtd/tests/subpagetest.c
@@ -319,8 +319,6 @@ static int __init mtd_subpagetest_init(void)
 		goto out;
 
 	err = mtdtest_scan_for_bad_eraseblocks(mtd, bbt, 0, ebcnt);
-	if (err)
-		goto out;
 
 	err = mtdtest_erase_good_eraseblocks(mtd, bbt, 0, ebcnt);
 	if (err)
diff --git a/drivers/mtd/tests/torturetest.c b/drivers/mtd/tests/torturetest.c
index 841689b4d86d..46634198e19d 100644
--- a/drivers/mtd/tests/torturetest.c
+++ b/drivers/mtd/tests/torturetest.c
@@ -243,8 +243,6 @@ static int __init tort_init(void)
 	}
 
 	err = mtdtest_scan_for_bad_eraseblocks(mtd, bad_ebs, eb, ebcnt);
-	if (err)
-		goto out;
 
 	start_timing();
 	while (1) {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
