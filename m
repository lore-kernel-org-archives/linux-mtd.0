Return-Path: <SRS0=GMtL=QM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F70C282CB
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:10:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8297E2080F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Feb 2019 14:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YIvoaIJC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="DVelCMQr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8297E2080F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=trsNLUuAoMDq+yasTGe6TsiZbuUfnlahUL+pzrqdPK8=; b=YIvoaIJCF5QidveSb/dVO0I4wa
	As6ic6V9Judv7AMpvIOUjhYx4xyimogmt3CIMpU5i8IEz6bcXb1qNS4+lNS/RmW8XyJVVhWHWeP7Y
	Rfc5A8xftQrfbn1Ro0vJbVJ8cQr/ARLRgTS0LER04Oaf269XW/hUF9l+lwzE+etl5PCKH1iVC5KQq
	y/t5kiDFbgAytlaGRT5NYxhbnL5gn8xdNWw5c5xh7QTFNaO2bzt4E07ZD9t6so6HlfkbAveIp1grw
	BR5+1yJsOnpx07T2HSuacOEfeFjrQ4Q8eU/bVsoSHSoxoDN8CzHBUqLnBnO+cOfsUBWMbqnb8eL5y
	5QS9pSNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gr1QG-0007cs-6p; Tue, 05 Feb 2019 14:10:00 +0000
Received: from nh502-vm6.bullet.mail.kks.yahoo.co.jp ([183.79.56.151])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gr1PI-0006lU-HL
 for linux-mtd@lists.infradead.org; Tue, 05 Feb 2019 14:09:04 +0000
Received: from [183.79.100.138] by nh502.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 05 Feb 2019 14:08:57 -0000
Received: from [183.79.100.134] by t501.bullet.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:57 -0000
Received: from [127.0.0.1] by omp503.mail.kks.yahoo.co.jp with NNFMP;
 05 Feb 2019 14:08:57 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 930266.66757.bm@omp503.mail.kks.yahoo.co.jp
Received: (qmail 45781 invoked by alias); 5 Feb 2019 14:08:57 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549375737; bh=p3qpCJkf9xce3tgqcI5sGAyVPPQd/vJ/y16L+YYxk7I=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=DVelCMQrUl5OGQgKqHxY2XVUiDhg6Q1Vcc7EuY4sftNSLRm+bm6nNivHbOl3ud+MqH1E86fKpgpiB7kf2ANqkm+pMtKnpQ52TAZaXcIfg5p3knuQdfwkljoCbWP1jSv7Cp6z+hbbL6LQO20jQAHtmpuI8LXsriBUzrUHtNjmrNI=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=fAbFtDJMH7zr3bzzsgScja7BCqeMP3N7Y8rWxSv3TCOTU9LFQXdjgKBeAPczk1TbpRTcWdQg88CWEZab6UVZHBogmStr4OPEpcWM29vSOHaDhU1LqwRa3Bb8vV6JgCr5CVpux2gdMjZtvHv22W7IZD8n22j6L5PpuSW66sAW/Ac=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5006.mail.kks.ynwp.yahoo.co.jp with SMTP;
 5 Feb 2019 14:08:57 -0000
X-YMail-JAS: tZ4JM4YVM1nZiBx8z6gCxo3qFCIrZFTVmn6207qwOD01Vez2CUMWmmTtwhIat_WWXj3VTqVxNgrMmxKzvdxkX9rPX.HdgRlbWwhtUZlavDabAs3oCfhSvDw3fBjz4qfXMzfbtVUV4g--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: 6By.53cVM1lNPmRIKKpkbSQ1t8Zqh.evcZKd2K7gKlrVWaP
 8mtaxhx1Lw6fVAAEHWtLSZ7wJVLPs.fZS5KHBlPM0v.PbJzjWBqL2E8rz2_V
 5RWktdMrn7f8j2CVkMay63AIhPTEeP3AXmZWBoiY9JS1y1ST2tQK5ApVjCBp
 3VsieYwy_Zb_Xk3wvfVl6FIWTXlRVtuLK6U45CXQCHuHyBQK61BiPgYHrPGs
 Bgozk5yp.W4iNHrtQn3AY9mlKeaTE42UFPqAEdnsuz_d0Ub50ul.VjDzC1DF
 4HCfhrl163kYW8MyhiCaXOGwBW4N_30Nv31hJOptdzeDE.L3VeL82CbLZ7jN
 e0s3e1RB4NI1IdEbHY0_d_Gv2hvPXJ50e9pUiZmfrUVjCOi7F2D88c_ssswU
 3EPBH9WGll4K5zCbnF9p3jhYa2_7Kn61lTZTtNNaWQMlh9WxPYvxruFZ_gkv
 .ZU3GuGa9nE5TcwBxQ.zJRVfq8WVzgQDGwFx3FNkySikp0v2Xn7VnLHpAkGs
 yKyg9p.lnGnCy7PSzKvysLByF5ji7f_CjzKffycCKOHzB0L9uzYE3jnGBOQv
 GPJGVpr06Uj6HNq9lZ9IFAYLANWCMQJ5I3K8FNq_ZDM9emMTD
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [PATCH v5 06/11] mtd: cfi_cmdset_0002: Split do_write_oneword()
 op_done goto statement
Date: Tue,  5 Feb 2019 23:07:54 +0900
Message-Id: <20190205140759.2360-7-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
References: <20190205140759.2360-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190205_060900_802070_A620BACD 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: linux-mtd@lists.infradead.org
---
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
