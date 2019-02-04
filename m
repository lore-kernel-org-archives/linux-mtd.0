Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81AAFC282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:38:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DD5320815
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:38:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cEsuEsCg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="ZSckaSkU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DD5320815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=H4W9LrI+F00HpnkbggGLvXv0EAExEfkpL1r6acGN/CA=; b=cEsuEsCgcX0mkNyyEObKC3pElY
	CBJ28IjZk9QdfHClk9PKgUs8LgXbsERHzCJCm2pWegS5avR8YNRPzcGo6l/hgZf4rRl6SK+B/7pB8
	5LuxEAcjj2OrefO+wz+U7/q2TdOpUCKfSQCtoNX6sBnQ3TIhd1nWZ5efAQyPxQVnrnSikafTg4gFY
	nORdmDnPRn6Ly5VpxYeL93Bxzof0KVyX6QFQYgOVy5kBpyQq++Uvdzf+s18lMlGIbI3yyyXlAELQA
	XCk6qK8kZNX3PGMvfnS+8E1PemQo4ozI87d2Y7MSq3DxHTzjmAKboIvOwSRiWlUd9gLX2wvkfou/V
	SuwMmY/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiCH-0003oV-MO; Mon, 04 Feb 2019 17:38:17 +0000
Received: from nh502-vm4.bullet.mail.kks.yahoo.co.jp ([183.79.56.149])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAm-0002Pv-2M
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:47 +0000
Received: from [183.79.100.138] by nh502.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 17:36:41 -0000
Received: from [183.79.101.121] by t501.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:41 -0000
Received: from [127.0.0.1] by omp508.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:41 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 953370.59179.bm@omp508.mail.kks.yahoo.co.jp
Received: (qmail 78199 invoked by alias); 4 Feb 2019 17:36:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301801; bh=zT2mdO6m25fvRZEtKBL/+Foi2kn+9CbnK4vgganWpQQ=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=ZSckaSkUY0rIuoMLrt/s0F2+kk1Zwi+snqF+dFDmsSI2BiwGb7/ICud803xF41F4gWrTaiGfkiXdmH1yvw7hK7AlYHXob+QUEpFmWpJBQB3p+PGYM70dDVx3HarkayhuSd4V260ZKo/1wBUidTBxYC5Jv8Ta+tM+i5bh+owtq6Y=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=VxGQTEWjntKEJoVb2sPZRRNviyIdfiHsbZ+9n03JC5e8+tjZ60uh/IKi12RfpqTzGo+w3KXnEYDzNXdBs59zYJIt8d2TOTMREwgc6RIyNEDGiWS6uTRSu5wJ/4XlW/Ctz0iIRW9rdZaf54oTTVfTUvTgjQG4N8VFfBx/GJ6jI/4=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:41 -0000
X-YMail-JAS: .KRdpqcVM1nBsnOIHBRrouBH16EKfQqYE1xNnJEYHFgiJ6P4citmAa2He0ma6jdBsdH5Oyw70lTKLsqL1B3G8beZjDbPTRp_BU6bG5h0Lg01u8b3aR0qZkpTPVLwetWK5zcqcUupCg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: ecptJgwVM1n8GF0mj9rEQMkPwysge4nSF1owCVQW1OgAwSv
 KDuXQTLwnHh8JpH3QAZ13B1s3SRbZJVnR4FZhsI0N5wRsuoNc4MYBjAaRuSk
 CZjSOSo6OUQUK15uPWMkfQ6SkNDCpK.XXfYID_uPUccNZOuRd_jzeUyPq1bv
 4OJEl4UAsUROALJ5M7gONCwZqZtqP8VWpK7UTTuryPrqSgj3of6UeSrDoSol
 Qt5PMYhXLmifGPHKO9eqnFceD4aUckirssMT9xRPbvD1XbbE5m4SjiInIcFl
 8EFNQBexcQiYoXdgPlDOzEke1YBtBKqqoZ6nFME_8E0rTWMU00v.AMsqONCt
 RnldznxLfa7ESIqDpbOZaTau2WbjpbKV1SgPT_yd2FA79j4qwGzLnCFePi.w
 x4V6gkjLA5rfYUUUhDWe5OsiNkFSBiZjFISUHPPYpk3w4.TdL1kium.SMsKJ
 mfWPodWXq5PNUsCY.XOudD3c6gHUbFpFqXww7yZfIBBfymSYqoHeCZCVaZIp
 QGWrxpQNOusEVMHiV.wVdR1NZJ60dkImcTbNXa6eGdiBjYEQqV.cYuwV2AWT
 96dkbJFJLBWFeRNSZb1dsv9PrGysmS_m1PoRWM6N2oRcPftmh
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 06/11] mtd: cfi_cmdset_0002: Split do_write_oneword()
 op_done goto statement
Date: Tue,  5 Feb 2019 02:35:45 +0900
Message-Id: <20190204173550.29703-7-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093644_343358_C57FA95F 
X-CRM114-Status: GOOD (  14.09  )
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

To reduce function size and remove the goto statement split the op_done goto
statement part into do_write_oneword_done() created a function.
Also split the start part into do_write_oneword_start() to find easier pairs.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
---
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
index 6393af4..a11dc40 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1609,6 +1609,40 @@ static int __xipram do_write_oneword_once(struct map_info *map, struct flchip *c
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
@@ -1620,19 +1654,14 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 
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
@@ -1641,8 +1670,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 */
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
-		pr_debug("MTD %s(): NOP\n",
-		       __func__);
+		pr_debug("MTD %s(): NOP\n", __func__);
 		goto op_done;
 	}
 
@@ -1664,12 +1692,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
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
