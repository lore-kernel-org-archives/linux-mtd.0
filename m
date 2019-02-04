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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E996C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:37:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1386220815
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 17:37:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kXNIOAre";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="QtCgMTRW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1386220815
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PcUN48XlKrJTh6qQEXhnL4kkLW6d4sGiBwvGRm3uzlc=; b=kXNIOAredXYLysFnPw1ek2yJTi
	j0DvqVFv8uKCVz8HJCTWGoZ8rMFgtrgYf2fm2CxxAqhBM1Bu9l//RYKto9ZAbOyEseR3KCXcmZhyg
	Z42QS11UuxHmg3G+s2FIlkZfbX3mq6Dnc4IQbD+4+QzYPhXt2vSLfUve0JDhm7V6dXK1s46khGQ7b
	aUg0lD6IyUv08jzpbUNpDgvpkImjL3uZazV1I7kSB3lxosAi5yNKGiPssKDUA8iNaNMZ3OujEbjIW
	mrbiZhdeXF5yCf5j28EFpweB9GP7a0G7qeQggTxILjLBqJdlip4eC3pMDpAdXaLtHgNEhlodmV2E1
	4Aq2BDrw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqiBW-00037q-MN; Mon, 04 Feb 2019 17:37:30 +0000
Received: from nh604-vm2.bullet.mail.ssk.yahoo.co.jp ([182.22.90.59])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiAm-0002Pw-CY
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 17:36:47 +0000
Received: from [182.22.66.104] by nh604.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:41 -0000
Received: from [182.22.91.207] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:41 -0000
Received: from [127.0.0.1] by omp610.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 17:36:41 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 520884.6787.bm@omp610.mail.ssk.yahoo.co.jp
Received: (qmail 78188 invoked by alias); 4 Feb 2019 17:36:41 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549301801; bh=6GEiwHdZfYDeZ8hUIjLN2DlJA6BFtP9ferZNKTz3HCg=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=QtCgMTRWc+KMuv+HekkiAc3qMZHRZK7jTw/hqnewYa1PmcWBbvH5BGAyDZ0Q++U1eGF3x/KtdVWAZXMYMmirQDqDcKlf4POrX8TacGfXxN9+NX31elurwpijaDu5P3HZI7yCRGQkHiQtjc7n0TgztGfiDDZxmq1acA7q/HutQFY=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=Kb8ot+R1aN/8vQ27Iwv5b4S+Nl4LBJ6HWewxwj0TUzpp9NEWFaLB3VrQWcQjo7avCXpQlmr3WrHb25O6pa7fdmpyo69j3wleAjwrKaAUWigATjNyjGo06+oXo7b5+LGcEik/w59TDyyG82nm06vbkNo/1nmof5RYbR5Ev9UP3bI=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp5002.mail.kks.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 17:36:41 -0000
X-YMail-JAS: .KRdpqcVM1nBsnOIHBRrouBH16EKfQqYE1xNnJEYHFgiJ6P4citmAa2He0ma6jdBsdH5Oyw70lTKLsqL1B3G8beZjDbPTRp_BU6bG5h0Lg01u8b3aR0qZkpTPVLwetWK5zcqcUupCg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: M7gUR.wVM1ku7h4Ve82y27L640hXYPhpAMOHlxzcLsfQTu0
 zd2rU51NlNLlgWkxLXtGLH_BYKyrFxsEY_eFMLbWVccf3sFshpAmDHPjOd9h
 7I_FAbaovk321spWP3W05G57mHGYbMh4Ay7Hc7I7YEJcPXkq_JzS4xlwPa8r
 UyyAx.mYSer1VdE9TSl4VqJR4oYcB_0dcpK0qeAxGmOOeETN7olerju4KUXM
 DYGNetI4aGy03iFNTN0_QNx0A9WHK6gPqGqGJdNODsQ_hh7gC6xq2bAZmito
 2J6dhJYwtYWjpHKKgYCdT5bpmjXq1NCjvb9ny26cUliI0p7N_imarzqoYtdV
 0K5nHOIMrh5gShj9nZP5TGXP3XLT_TZkilppvpYUm_NezNaxaIjbD21yTR9w
 nCFNzvXlD7j0uZNSgHpdqOB5XY3Vi8NwBhwcEwsV0eZMDVh4wgRWwfADVDUp
 uqCDAcV_Ya7BBpMn4o_iNUNcj4DIUU9DYbAvyxurh._rJH4nr7.Hu9u1MOFU
 HykH.w4VyUDykDqpxd9zQTGmgYyWo_s6bzsFg6aLGrrPUGBpBqyWc7QMEt9V
 KHkOIymJjCPHjC9aWTAIw5fSs.FOJj1pcKq1PFMurfm7tU.I-
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v4 05/11] mtd: cfi_cmdset_0002: Split do_write_oneword() to
 reduce function size
Date: Tue,  5 Feb 2019 02:35:44 +0900
Message-Id: <20190204173550.29703-6-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
References: <20190204173550.29703-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_093644_680139_23D33B1D 
X-CRM114-Status: GOOD (  15.69  )
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
 Fabio Bettoni <fbettoni@gmail.com>
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
