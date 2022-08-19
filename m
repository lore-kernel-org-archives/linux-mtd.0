Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE0AC32771
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Aug 2022 12:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r280MZUD9/xI/ax+FIm9MnVfz28KkYP77K8MXNNBP2E=; b=nv+x4Tm5jW9fJe
	NeRcJGVW5KdUg/5zlrUs1e5nYrQdINziegNyYgswQq5OqHNjCJ4Nzfw0UOq53iKV2rUeTXTZFAWCE
	5/DIvh1YbpHVdZcbEOZ2M+GOvQPeI7HTc0XtlzBylPVnyN2CA25s580gAuPhWDfJHLbrG+ub1e3O1
	nddxgSm3kySgO+k6IZPTxP03Lyu+e41DpfXsqxGYH+92W0Ac8EcCKHmt5pftP4sRTS6BL4kS3LB3l
	2s/kuwEC8GTLm/x1ADzjBKKQKsWq51arQL3hCskRFqUhXp6y2fS14/+nHAmpnWSzyOPwG0oz52zJh
	Q4AgaldLNhjDvfqftFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1Ar-007w2p-IM; Fri, 19 Aug 2022 12:32:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1Ao-007vvT-37
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2022 12:32:27 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=aspire.fritz.box)
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1oP1Ag-0003wI-3G; Fri, 19 Aug 2022 14:32:18 +0200
From: Enrico Jorns <ejo@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: ejo@pengutronix.de,
	jlu@pengutronix.de
Subject: [PATCH mtd-utils] libmtd: do not ignore non-zero eraseblock size when MTD_NO_ERASE is set
Date: Fri, 19 Aug 2022 14:32:13 +0200
Message-Id: <20220819123213.211840-1-ejo@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_053226_228131_8F3B79EA 
X-CRM114-Status: GOOD (  13.54  )
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

In 54d68799, mtd->eb_cnt was enforced to be '1' if MTD_NO_ERASE is set.
This was done with the aim of preventing divisions by zero.

However, even if MTD_NO_ERASE is set, mtd->eb_size (eraseblock size) can
still be set to a non-zero value which would not cause a division by
zero.

Instead, enforcing an eraseblock count of '1' here even leads to
inconsistent eraseblock counting in mtd-utils and lets for example a
'flash_erase' on an mtdnand device fail:

| # flash_erase /dev/mtd0 0 0
| Erasing 32768 Kibyte @ 0 --  0 % complete libmtd: error!: bad eraseblock number 255, mtd0 has 1 eraseblocks
| flash_erase: error!: /dev/mtd0: MTD Erase entire chip failureTrying one by one each sector.
|              error 22 (Invalid argument)
| Erasing 128 Kibyte @ 0 --  0 % complete libmtd: error!: bad eraseblock number 1, mtd0 has 1 eraseblocks
| flash_erase: error!: /dev/mtd0: MTD get bad block failed
|              error 22 (Invalid argument)

Also mtdinfo would look inconsistent (eraseblock size vs amount):

| # mtdinfo /dev/mtd0
| mtd0
| Name:                           mtdram test device
| Type:                           ram
| Eraseblock size:                131072 bytes, 128.0 KiB
| Amount of eraseblocks:          1 (33554432 bytes, 32.0 MiB)
| Minimum input/output unit size: 1 byte
| Sub-page size:                  1 byte
| Character device major/minor:   90:0
| Bad blocks are allowed:         false
| Device is writable:             true

Fix this by enforcing mtd->eb_cnt to be '1' only when mtd->eb_size is
actually zero and would lead to a division by zero otherwise.

Fixes: 54d68799 ("libmtd: avoid divide by zero")

Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
---
 lib/libmtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libmtd.c b/lib/libmtd.c
index a363e56..4aee947 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -792,7 +792,7 @@ int mtd_get_dev_info1(libmtd_t desc, int mtd_num, struct mtd_dev_info *mtd)
 		return -1;
 	mtd->writable = !!(ret & MTD_WRITEABLE);
 
-	if (ret & MTD_NO_ERASE)
+	if ((ret & MTD_NO_ERASE) && (mtd->eb_size == 0))
 		mtd->eb_cnt = 1;
 	else
 		mtd->eb_cnt = mtd->size / mtd->eb_size;
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
