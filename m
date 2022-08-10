Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFD9C00140
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Aug 2022 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nNZccGXfaIESnOZGDXSjk7IhVmZZFtr3jq/mCcLiXeg=; b=TCESmcurYVBhfu
	DPOTzMRQf7t00aE8axUt5YkgGcdD6HDgLcqqsmCDp5on5xYQdB/HswlsQOqYZ/Wy6tH5lCdGsdCyH
	L3eqLEi5q9ZCCcurseoIF8fU/n87fdlhSBadYOIJH8eEYK/azERnV1s3rwSbpvYBfE3hyOvyS16VR
	fKdBAR0XECbg4RJM6sC/nExjaXOv1cJJ98nqU60HkKQFvN7E0DyXZllflm/XJpSAqZQBt1YyhtOzD
	bl0TEvMqpZJOoNTLNYbNkZBG+/jpVNPyz9AkTq38XhN5uFt/B60Kg9Y0EiPg7jDYN8bblWGzzocqY
	+mGMdtp7KcuClGk9CP3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlqR-00C2b6-7b; Wed, 10 Aug 2022 13:33:59 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58] helo=bg5.exmail.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLlqM-00C2Xt-1u
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2022 13:33:57 +0000
X-QQ-mid: bizesmtp74t1660138426tqj5j1xu
Received: from localhost.localdomain ( [182.148.14.53])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 10 Aug 2022 21:33:45 +0800 (CST)
X-QQ-SSF: 01000000002000B0D000B00A0000000
X-QQ-FEAT: +ynUkgUhZJmuCGP1dVsvZHXlmfLiTwguN9yV5v8DbcWO9ohSM1HVPABikZtJ9
	T2ULm2o36HD7DPNHi8AC2NhvpHzampE6jvX4R2yCnt5NDC5eAZ1VpbHOIdjGk/VtPTz6E9l
	cF5Prv3oSjaLEuh1O5H8YQrYM2JsUtIwIKg2GVWZoom+JPy30MkghpoUY2pMyrou2+cKLFf
	OFvQVg/CTc59eBf3j3IhB/bVyC4phWdU33Pyq02B3FwbrcPYXCCqXFSVy95vFpnCDm78U5p
	iG/nE44g1VI9AKLNDAM2gPXV1gOgAAkrOyNR4Fe6rG19R8yRPBDCZL6G0f+nAvgLb808U9X
	q3e/plo1DLVITFQHj4lGBQKWE6TA88+xEHREaYkTjlF/PvW+EsyZWSa+9Gh2LYQ8Ddz2Zwu
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jilin Yuan <yuanjilin@cdjrlc.com>
Subject: [PATCH] mtd/ubi: fix repeated words in comments
Date: Wed, 10 Aug 2022 21:33:37 +0800
Message-Id: <20220810133337.2172-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220810_063354_467759_ED77C640 
X-CRM114-Status: GOOD (  12.37  )
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

 Delete the redundant word 'the'.
 Delete the redundant word 'and'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/mtd/ubi/cdev.c | 2 +-
 drivers/mtd/ubi/eba.c  | 2 +-
 drivers/mtd/ubi/io.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index cc9a28cf9d82..1d3bbcfb4bb5 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -672,7 +672,7 @@ static int verify_rsvol_req(const struct ubi_device *ubi,
  * @req: volumes re-name request
  *
  * This is a helper function for the volume re-name IOCTL which validates the
- * the request, opens the volume and calls corresponding volumes management
+ * request, opens the volume and calls corresponding volumes management
  * function. Returns zero in case of success and a negative error code in case
  * of failure.
  */
diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index ccc5979642b7..09c408c45a62 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -377,7 +377,7 @@ static int leb_write_lock(struct ubi_device *ubi, int vol_id, int lnum)
  *
  * This function locks a logical eraseblock for writing if there is no
  * contention and does nothing if there is contention. Returns %0 in case of
- * success, %1 in case of contention, and and a negative error code in case of
+ * success, %1 in case of contention, and a negative error code in case of
  * failure.
  */
 static int leb_write_trylock(struct ubi_device *ubi, int vol_id, int lnum)
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 8a7306cc1947..01b644861253 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1147,7 +1147,7 @@ static int self_check_ec_hdr(const struct ubi_device *ubi, int pnum,
  * @ubi: UBI device description object
  * @pnum: the physical eraseblock number to check
  *
- * This function returns zero if the erase counter header is all right and and
+ * This function returns zero if the erase counter header is all right and
  * a negative error code if not or if an error occurred.
  */
 static int self_check_peb_ec_hdr(const struct ubi_device *ubi, int pnum)
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
