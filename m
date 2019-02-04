Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BF5C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:22:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B08F2176F
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:22:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O6e1KRYK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="VasNLSKu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B08F2176F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FN16h+sWsVo5rtW/cNJvy/m/e55hs8svdjmvvkv1Ifc=; b=O6e1KRYKr61Q/MCUFTa63PrMeT
	wZOMMFWueRpXhWjqDZN5wheN4GZzTrjqOL9fDDPAUhWHMhEj4bIEUIM2O/OuN6OG35ddyD31IdYSk
	X6JxQ8mPM5fcH33J+q8y4lBNsH+csTi+tmFnXjdLWTWKBDM3A809vNELSPm/J1AjMvhHFBDZthLD/
	mm2fM9P+tK6rtLbY6jjCRUSn5WTzCifvOJUsVkBymxBynXvVBVzV4fudoWhJvcvHuEdDMsvEcD+FS
	/C4xRguNvelBpR39HCkOX9VnmlmZelIJjEkLqkcb12JRMaDiIS4XCqLIiKFtpZSPXrHjMFWrnPKN+
	e2UonZJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqisa-0007RY-UA; Mon, 04 Feb 2019 18:22:00 +0000
Received: from nh605-vm3.bullet.mail.ssk.yahoo.co.jp ([182.22.90.76])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqs-0005kN-Bv
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:25 +0000
Received: from [182.22.66.104] by nh605.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:12 -0000
Received: from [182.22.91.128] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:12 -0000
Received: from [127.0.0.1] by omp601.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:12 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 731656.85735.bm@omp601.mail.ssk.yahoo.co.jp
Received: (qmail 42100 invoked by alias); 4 Feb 2019 18:20:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304412; bh=Ctocki519CGWOKTh4AZPWW5e1p4OwWUFX64A4n6E9B4=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=VasNLSKuB2HR1XvGTB3jpTwqVdLAmfhWcELxKMUOpJc2Lk9c6fNYcxzh9oXTN0vur1e2uE4BzOK/YUjRv22exVfGClGB7pgQT2rpkZj0WKDFuBAr7leuXvboa0SolopLBT6VAY4KM49GP0e/DKzFca56o7DhoYzRcAW7siFWetg=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=PlNXf4N/ck3aqGCN04kgmhr/YihgbbXs5yQppuhJowolvjWu8+Nz8ZFJE3HxfTXjY3NDqv4LSHmx7Cv4gNmUW6o/J/kOqeHcTN2XL8DHsRKnlfjxdiT3iVn1omnuK+hTRQZ5RrDp34wtzXpfuf0CYdEl3SwThtulGJNRn4qlZVo=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:12 -0000
X-YMail-JAS: p9oCtvkVM1kVekpC3xOvNaXPAPSgZcVmvQp71RDkr_MBJi4ZN6gY9y..AHMl.tW8uvftk.I0.GsYn_ReLCWp5oOwWlwNw4dDjgoBHSFvdQQuROuKMHwIQ_Ot3WEDX9xWBcCyoGsP0Q--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: 6ElaUk8VM1nhQStATUxxsUmTsZhffUJIpRBUO6U.G.ENfS8
 oS2WDskfMm9A_cCTyR2Q44YY0IsPjKHarQz8jg2cyiMyYx0AEEwVzf2pTply
 UL.Mt30kOH4wMwjtsRM0NC.T3DdZVWv8CQVD6YG7yMzFgf2XBJEGyldf4397
 WNwhcPn0MzqfqPSvf8j3nGHh9U7XeEGiOk.7JOH34e1.t0_oq4fNCwcMxSwo
 orp.VIop_cYYYMungsLFkS8Hite7B.lM2BgA9TCdV.CjnuzLl7ifkeS4SGDJ
 JwhHahb52nWO.fifoV1lrubW9Vtpm47QUL3_GjQQ0Wq7jUTxkmaj93g.W6Hk
 b_IVVOevrZAMDOU5ZX51vw2c6B68r4tTFQ8ITRkkriwdr8wdND8Tf.WuvP0M
 psul4FPlleNQC778I4fePoVYCLq3LDWfarNxdIN2RNitrUY2BaZTOMWjjP.t
 tfnFtSj6rJSK2tvf8kVbTf8tvoYnLam7sT0x2VwQvtohwBZX4vXMzQkbkW9T
 YSD9dkNplJVczgvGyOdnG27rIvrYtMtPxwR.8VfbiT2wnRYbiYEwzAs8pp1.
 ldmyePklyuQKReqoCq5xauT3ZqHL61c6vddBKc36yF5exBpql
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 11/11] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce exit paths
Date: Tue,  5 Feb 2019 03:20:04 +0900
Message-Id: <20190204182004.29894-12-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102014_900056_077F7C3D 
X-CRM114-Status: GOOD (  13.46  )
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
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami_to@yahoo.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The do_write_oneword_done() is called twice at the exit paths.
By splitting the retry functionality it can be reduced to call once.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 39 ++++++++++++++++++++++++-------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index da48b4c..21ba6d6 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1643,25 +1643,16 @@ static void __xipram do_write_oneword_done(struct map_info *map,
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
@@ -1671,7 +1662,6 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
 		pr_debug("MTD %s(): NOP\n", __func__);
-		do_write_oneword_done(map, chip, adr, mode);
 		return ret;
 	}
 
@@ -1691,6 +1681,27 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
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
