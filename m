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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72075C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:16:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3718A2082E
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:16:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TzZzAaLO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="hpuA2rt8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3718A2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PcUN48XlKrJTh6qQEXhnL4kkLW6d4sGiBwvGRm3uzlc=; b=TzZzAaLORUEXthF6+30/6kAP3u
	QfrJ9ANUr0c8mmw9anDEEkHh2YTidKpscT1HleUAUaLJB7rMnTY1bVW/LEKMAgHRY0x7rlYdY02HI
	A+x6M/VJANTBwF2wVOIpTbF1z5lnNi5hCK7v8ZrmYrhfwafG9ILqaZaCMDvtPvUQXSmXFW7a4zjgG
	H+mSinDESeGIsk9qnuFBNe0oBFZDVxzHa4vIF/aNptjIRUQWX31l7y86akzu25rKvf632HhY+tAoS
	EKxc4MLKGsLFv9IUBUsZEyrtBS1zfpOqpW62ZhBakQFdFyyzZIXh4WfDYioLi7gr0z6+QypePoxZZ
	8EAl2nyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqin6-0002VE-MI; Mon, 04 Feb 2019 18:16:20 +0000
Received: from nh501-vm3.bullet.mail.kks.yahoo.co.jp ([183.79.56.133])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqimA-0001WB-Oy
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:15:26 +0000
Received: from [183.79.100.141] by nh501.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:15:20 -0000
Received: from [183.79.100.134] by t504.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:19 -0000
Received: from [127.0.0.1] by omp503.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:15:19 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 877140.85057.bm@omp503.mail.kks.yahoo.co.jp
Received: (qmail 97044 invoked by alias); 4 Feb 2019 18:15:19 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304119; bh=6GEiwHdZfYDeZ8hUIjLN2DlJA6BFtP9ferZNKTz3HCg=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=hpuA2rt8J0TOl/wC2nNASg6/RtFL9kYRUWdMMeoKqcpiYsMl/HCIGhOLzvZE2twQPGC3mawpQjQAF1xHqOFrNfTqdqTKjnRfqd7NFbOrluLflYwjw9L3wHWl9/YuwXLr7pYcct/8OjM4/RSuzuvsC6LQ9c0VW2yzxEIM8HDUjYs=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=Z6RQS75QXRiqma+RSwsibxMNM09BIc5tGLxSqPTu3jsNBWZSlFaThbBxbHRRccLGIaaWXQLjf0dNSPNlMXYAE8eGXDKNO2499A4a8FxsNaH14+xRPaYxghGLiy1jPpcW1ms3iQVqsbx+JxgQ+Zkwl+aqhH50s54LtlzhgO9FFFo=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6010.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:15:19 -0000
X-YMail-JAS: T18F8y0VM1kX8Lut44qNDqRKqQXOtlWEgnYz4OPQqrKh_GnZATKBXc4qMcXkmcMq1BNYy.6HEqavlP2iK_Z7GN2Ji2egLfrgr7deoXOm7g3_TisNhStvOHJsKJwkvAISLswWgb1h2Q--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: mcWJln0VM1kFbjSHVf.dxdYlCYNDc5KI.qSMDEFmOXNRFn7
 gbuIy9Obsj2IAHqIfiPplmg9Jp4VONsd.dOJ4zNAThURvRrDc0tksz72AXwG
 Fp4aOMzoLS._MQDchBYiJDgts3PK_SI_W1IqyzYcWDkm4AWe.Mj4Cv2ThqqS
 4G2Gf_2ARkm._CyT9hecn9mh8U.8.P9cUZfXIQpbjBr9rC2rNapCueKfiDt.
 f5nuE8_4HvtYBQQvcNhFlukdYneeCcpRLTrhgcBLT0ptn.T9vXohhh_QdBU0
 .DxMJzyZq5M10fdBe0YWVggdcpqopkmqEz.uykV3Uh5pgjMLRD7zjf0KLE0K
 H_GDcU0YYqO42LhTZS8b4Daa3qkHOPOWSAqZKFxj2GGlpgj5Q5d.m68L.6Uk
 lH2aVfQvdCUuWIibrZJDzlhBWakHQTbyBfoUKtEbWaq.8fBCUOYqexoidEY7
 Uh9YbbCR0.tn8SDpXohTgL5nmTG7NsX2fI0LikWmYmcHJ7ez6vZDDPWuL88l
 3yO96kpOjrXed9L7WLa4bulBdKFnDzFd11KwDRrGtGbxNkyjxRMS5wxzCerO
 Q8LXdtcRZ4OtjV2iNZ88X9fQ2vXNBGy1mpvVQeACtWOYPTE7J
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: [RESEND v4 05/11] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce function size
Date: Tue,  5 Feb 2019 03:14:59 +0900
Message-Id: <20190204181505.29841-6-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
References: <20190204181505.29841-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_101523_109783_F2D70A83 
X-CRM114-Status: GOOD (  15.99  )
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
 Tokunori Ikegami <ikegami_to@yahoo.co.jp>, linux-mtd@lists.infradead.org,
 Fabio Bettoni <fbettoni@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Reduce the size of do_write_oneword() by extracting a helper function
for the hardware access.

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v3:
- Drop the unnecessary comment and blank line.
- Change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- Just update the commit message for the comment
- Add Reviewed-by tag.

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 89 ++++++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 92d3e82..6393af4 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1547,11 +1547,10 @@ static int cfi_amdstd_lock_user_prot_reg(struct mtd_info *mtd, loff_t from,
 				   do_otp_lock, 1);
 }
 
-static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
-				     unsigned long adr, map_word datum,
-				     int mode)
+static int __xipram do_write_oneword_once(struct map_info *map, struct flchip *chip,
+					  unsigned long adr, map_word datum,
+					  int mode, struct cfi_private *cfi)
 {
-	struct cfi_private *cfi = map->fldrv_priv;
 	unsigned long timeo = jiffies + HZ;
 	/*
 	 * We use a 1ms + 1 jiffies generic timeout for writes (most devices
@@ -1564,42 +1563,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	 */
 	unsigned long uWriteTimeout = (HZ / 1000) + 1;
 	int ret = 0;
-	map_word oldd;
-	int retry_cnt = 0;
-
-	adr += chip->start;
-
-	mutex_lock(&chip->mutex);
-	ret = get_chip(map, chip, adr, mode);
-	if (ret) {
-		mutex_unlock(&chip->mutex);
-		return ret;
-	}
 
-	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
-		 __func__, adr, datum.x[0]);
-
-	if (mode == FL_OTP_WRITE)
-		otp_enter(map, chip, adr, map_bankwidth(map));
-
-	/*
-	 * Check for a NOP for the case when the datum to write is already
-	 * present - it saves time and works around buggy chips that corrupt
-	 * data at other locations when 0xff is written to a location that
-	 * already contains 0xff.
-	 */
-	oldd = map_read(map, adr);
-	if (map_word_equal(map, oldd, datum)) {
-		pr_debug("MTD %s(): NOP\n",
-		       __func__);
-		goto op_done;
-	}
-
-	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
-	ENABLE_VPP(map);
-	xip_disable(map, chip, adr);
-
- retry:
 	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
 	cfi_send_gen_cmd(0xA0, cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
@@ -1642,7 +1606,52 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 		UDELAY(map, chip, adr, 1);
 	}
 
-	/* Did we succeed? */
+	return ret;
+}
+
+static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
+				     unsigned long adr, map_word datum,
+				     int mode)
+{
+	struct cfi_private *cfi = map->fldrv_priv;
+	int ret = 0;
+	map_word oldd;
+	int retry_cnt = 0;
+
+	adr += chip->start;
+
+	mutex_lock(&chip->mutex);
+	ret = get_chip(map, chip, adr, mode);
+	if (ret) {
+		mutex_unlock(&chip->mutex);
+		return ret;
+	}
+
+	pr_debug("MTD %s(): WRITE 0x%.8lx(0x%.8lx)\n",
+		 __func__, adr, datum.x[0]);
+
+	if (mode == FL_OTP_WRITE)
+		otp_enter(map, chip, adr, map_bankwidth(map));
+
+	/*
+	 * Check for a NOP for the case when the datum to write is already
+	 * present - it saves time and works around buggy chips that corrupt
+	 * data at other locations when 0xff is written to a location that
+	 * already contains 0xff.
+	 */
+	oldd = map_read(map, adr);
+	if (map_word_equal(map, oldd, datum)) {
+		pr_debug("MTD %s(): NOP\n",
+		       __func__);
+		goto op_done;
+	}
+
+	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
+	ENABLE_VPP(map);
+	xip_disable(map, chip, adr);
+
+ retry:
+	ret = do_write_oneword_once(map, chip, adr, datum, mode, cfi);
 	if (ret) {
 		/* reset on all failures. */
 		map_write(map, CMD(0xF0), chip->start);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
