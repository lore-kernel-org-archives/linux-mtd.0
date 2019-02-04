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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FC0C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:21:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1EA320821
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:21:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lxh5rBUw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="nIoBtCia"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1EA320821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iHd8+8Y0rm3HJy97fFufwWHu+2stElXv+xNs+yF2bQ0=; b=lxh5rBUwxlrI5dtEfjG395Uoi9
	YJfPwQL9UrDa/xXxS8DeNqaubS9nLtDGaFDVO6SbN0xp/LKl2ucKH7qMcqPzlmTuH5SxiQ5Ond/95
	D6RJm9PRGDCXynOl6P1VAzmUsm2HfcK57j/oBc/oQ/57ImHuvC/eIwCVb0E4dxcwG16mfUFu/Pt+b
	JgiN/2wvp4rbdnq+ZIdOcfzb+G4XYOZx7O+X6xLJaOyQR/muMF6GwdDXpAtuptYv3k/kgh61J5dwO
	wv6msiYuQrKW/jxQ+C9kGuac0ZoRE0hkOaOuodu6hZtXgAFAwRbkjgWXZMUVwejGvhPmV9P7tp+Cz
	nEdpleCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqisA-00070k-7b; Mon, 04 Feb 2019 18:21:34 +0000
Received: from nh604-vm4.bullet.mail.ssk.yahoo.co.jp ([182.22.90.61])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqq-0005jC-Mt
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:19 +0000
Received: from [182.22.66.105] by nh604.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:11 -0000
Received: from [182.22.91.205] by t603.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:11 -0000
Received: from [127.0.0.1] by omp608.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:11 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 233328.12694.bm@omp608.mail.ssk.yahoo.co.jp
Received: (qmail 42056 invoked by alias); 4 Feb 2019 18:20:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304411; bh=shtsQhD3oYmF9HMNqb67lol2o2CH8/cQt3N1PAUo3ak=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=nIoBtCiaX/kd0ok5VBwG3TrHxcfnax1a5GUg6nVsnmb/oBOEZLWcbmEuRzbpVqrZN6bVszSL/c9+wb65u6CGlK4EW/hcqfv6OazxgHJC6390LoIRM/293G5BDZgobD1uNdTHPLnoGlCv/dpMZ31P4UySa0Q9m3bmNulpPjWpV8I=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=UJ1eEUWVE+5cGMvmXzBNG2PmUAxDwVBXcFWJ3DrTntcb4YY9WTd0hKGF0VSF7iMzpMDqM8yYTGAOvCUCmNEsg21MhO9LXMC0X6gC2lZrX5jEskal5DF9ESCVvo/mFssxWtM9LwXbehsZVS/6AutC2swa/H8L09EybhyCdsHmYWI=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:11 -0000
X-YMail-JAS: UzMMa0gVM1mWms_LOl6Zur2Kd7FJjO1dtmucjlx3VPnMFohZJJBpwhNNUTjtyGrQseGx1dZo8LzS7fTtRmDluG09.qhgo2f9LTFydxl.SWHc81Q70xOwwE0gppefZq0Zj2Ljfj2Mrg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: sK7BeE8VM1klF_BIeam3qj.Aguu9mgfQuMc7MCrG0qMtics
 i85LlqMb0HvIfWAwdsbcxa6wK3YR7FiP7A8aaCZZvH9uHS4SEp1ibbCpnXiW
 kn0bA0ySt9ruI5jW1YT4tFuW51wxSGjJ6sL8TioHSHP_2StiiUcftwJZ8ohl
 eRJebL5bIB46hKF7nhEfj7C.6OA6tlJHoH7AKIUp7IF2EwRvbfvsJmaaEs03
 E_zS9ioRrKMrRHUpIVj7IC5mwTagdnnO9b4U6dgZVx.GYlpb_SBOHM5PQnu_
 tjO_.NlbgO3mk1phwP7niisXrQ4ytEDESMK4iDTgWHtr8ctB5xfNNFMPWPQy
 eDZywCojjR4V5KG31aOPldHG_q5U.oy2m5kbuKT0yNUFJl9LPO6DJbvlpxCN
 iOmGyLQuTDYxYWhNMjgxz_BYPMDEAg06F4VLa8nnH4ZY4JgUaADT6GqQCo41
 WMT1OK.h34GyoxpqvydcA8gaqc.txkj7hYGykayM8QzJFNP.cr4Euq1Cbuke
 CXLqnld68I.hsFVfaPs.hf5w8IlNFAEpf_vZ_.RQNPIFK4jeV.nmYHWA8Ye0
 6wMtLIiBSlPcSbeyYPf2qSrhbtp8JETTlsq0cKwmPOzkdjb1R
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 06/11] mtd: cfi_cmdset_0002: Split do_write_oneword()
 op_done goto statement
Date: Tue,  5 Feb 2019 03:19:59 +0900
Message-Id: <20190204182004.29894-7-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102012_996704_C0DA1B43 
X-CRM114-Status: GOOD (  13.98  )
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
