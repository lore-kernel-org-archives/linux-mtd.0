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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DD3C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:20:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D003420821
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:20:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GYiojIsL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="G9KDjWJ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D003420821
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=62vWV55eIaXbWwMap0aAbw/NtfqgumINyW2d5okrl/A=; b=GYiojIsLO4hqUG/QLlYMK9FsA1
	FJXuwt9jthyxlr+bPnQc24oVU9OJoswmPw7OjtbkUFT28ZyAIJyRt/XZC59jzpKzAwmxIx2rJf9pk
	LnqPTdkkW3APZ4mILgLQs9vS2inU9XxNI7CNgoqQVhBRnwhkUgx5tsFA8QT1mXJvxjcAjYBn/Ldi1
	W4jiVaeCI3vTp70UNiTH8QqYfm16VImi0KQz2M3NjLpI5EuQQmVAyV1TVDCDA7fcTt9kcZJmS4kob
	QvSqdaHDOZCAyl6APtzuMGQyc1y4sAERphrBLopLFBS1qXn8TRqRhP+hhf8x0TzDuFZQOWSoKmYXg
	OiDfo3jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqirU-0006N0-V6; Mon, 04 Feb 2019 18:20:53 +0000
Received: from nh503-vm13.bullet.mail.kks.yahoo.co.jp ([183.79.56.199])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqq-0005jH-BX
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:15 +0000
Received: from [183.79.100.141] by nh503.bullet.mail.kks.yahoo.co.jp with
 NNFMP; 04 Feb 2019 18:20:11 -0000
Received: from [183.79.101.123] by t504.bullet.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:11 -0000
Received: from [127.0.0.1] by omp510.mail.kks.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:11 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 614937.98491.bm@omp510.mail.kks.yahoo.co.jp
Received: (qmail 42064 invoked by alias); 4 Feb 2019 18:20:11 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304411; bh=EdCtHefv6XFBS3rj7pMB9qT5mf2Y1Nhoy3G/fIisQhY=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=G9KDjWJ7hO/EM6LcbE3ueHIHP0EFSxAwzEr3K1LlyoN2FY6ZndyCRj+zYt0DCMWZd0o9P6VSc/Wt/lwXLVxyKoFrr+T9nLCQxrb/7fDJW3Tj1Eh5ROcUu6zH0xffxdio0X+PmcVn2dRoT/3DA39wpcuLqQuDOe6FtYJH2kEL8J8=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=pNOSn+LdSiAXILeRnk9p/t0o6I76jGiEF4QyC530eGpSXwbLYoQD05xZISzPKTzPeDZ6uiLhWJRJ+XgbfK/52qMTlzc7GZbQqFMQVMg8tRayORearxSxjNwt0cMmZI0aMml8ryA02EFy1wdaSQOElxEX4NVGKLAa2AbdGVYA10s=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:11 -0000
X-YMail-JAS: UzMMa0gVM1mWms_LOl6Zur2Kd7FJjO1dtmucjlx3VPnMFohZJJBpwhNNUTjtyGrQseGx1dZo8LzS7fTtRmDluG09.qhgo2f9LTFydxl.SWHc81Q70xOwwE0gppefZq0Zj2Ljfj2Mrg--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: VAwVneIVM1k1rjsgZo7yZ6FUsYz8_pgRltX6u2C8e3_ekK6
 vIKhzaGxxdpR68T0Rvrh9hcFo0gvQtY7RX6F4.JpoLPChCDvIhNFbf62GYuG
 ndL2fbx0N4ijxjI_mIU5w8TBPcAXFs2ydo6mb1K4WZN6n8whUgTo_Hl.lKcq
 dtC3WlWMcXBSUWAf35sH5UwYU2rINNig6lE8UFfQB_OelW7vaoIhAgiBcG7m
 7r11tK0wAkIly1aV8TTHYO2jejS5T85gfg8mGIftQDEMxndHDTwRrmi2fr9F
 aBfbX.Evu4OZrbFxgyCwylYxdS..C5kI_ad4KzoAsbHtMiqHEJoRRBca.2AK
 rJfL_94V.jPDTum40tsLPRkBtoRKAb9fF986bpjxpzvMzT7_LwlK_zK5hT7L
 Ryn2ggdElC9dusWUaDs4nPoqCaIKU0YD7ECvAqhmMCoWXB88G6l8TdPyoOcN
 XwOYJWDgjhkTKXTe9gfqBtQ9ttL.3TNV2nJlV4PIJcyReXfDkmiixfz4jgNr
 MsQB0JEIYty00eBXYKha_xMwQQS1Fhj0L.DFOtFZ4f95m078.WuqG_9VFksj
 SB2fccTjgkDijyASAfw.aEN9wAV_854fsVVyFGYmQ4fB2V5VP
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 07/11] mtd: cfi_cmdset_0002: Remove op_done goto statement
 from do_write_oneword()
Date: Tue,  5 Feb 2019 03:20:00 +0900
Message-Id: <20190204182004.29894-8-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102012_661933_232CD8B3 
X-CRM114-Status: GOOD (  10.58  )
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

This is just to refactor the function by removing the goto statement.

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
- Just rebased.

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index a11dc40..a5513bd 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1671,7 +1671,8 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 	oldd = map_read(map, adr);
 	if (map_word_equal(map, oldd, datum)) {
 		pr_debug("MTD %s(): NOP\n", __func__);
-		goto op_done;
+		do_write_oneword_done(map, chip, adr, mode);
+		return ret;
 	}
 
 	XIP_INVAL_CACHED_RANGE(map, adr, map_bankwidth(map));
@@ -1691,7 +1692,7 @@ static int __xipram do_write_oneword(struct map_info *map, struct flchip *chip,
 		}
 	}
 	xip_enable(map, chip, adr);
- op_done:
+
 	do_write_oneword_done(map, chip, adr, mode);
 
 	return ret;
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
