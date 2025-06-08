Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727C2C5B552
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Jun 2025 16:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7bXJKXkwY96Ccxmdhg+DcEmoS1WMclywGu5zOK9kBxk=; b=1LPN0NzwCiqIOq
	9MIANb82mBoX6Ng1GGxRFGCDaLYWUuYB1I04/ZY4WwLypLadsY8d4mKyaNOjregrkehzas7eLSqvt
	Us6z3ZA49+yKSI6K5qmUdkq4WlaQxGvOjoWeyVxBPRczXlXXXAP7rpAP2uwSjKGDt69ExWxc+h4ZU
	aupAFB1MJNTcQnZFuoqQpaxGIIRSax4Rbip0WB2bVdED6wpxRmApvDMoH+CmEOu9A05kDImkCAgqP
	URHEZahKdp1yyyYperYcPkk+OwUl+XuglowKEoHvQFNlDgElPsXziE1UZa58XoL6iNPhIOJXDiopm
	i4InUaVRvoZ/ng3eY8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOIge-00000002mS0-32QE;
	Sun, 08 Jun 2025 16:15:56 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOIgc-00000002mRd-2jmN
	for linux-mtd@lists.infradead.org;
	Sun, 08 Jun 2025 16:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=zJRQ3uMzczhw8zoS9UEtZ+ccogb2vXX4Opul1mk0vkk=; b=g8aLhamMQG8FXYMv
	1SQ4ZwRPE1V9j2pvNlDyOCRVs754GLZL43v4ICmC00e6gbx9prjvTJMNDzJW33IZaIkKyG6nqOfCJ
	ql8JinlHq7guNl01fQRbkMjcSpIlQa9TgtYLtdMVguhJqXDpjq450AMXELotre9deLytNp985hA7h
	vD9LDAa6HSFHZaU11xVl4MioTLvb26dPaQgE+hBcHStLoDBz1MUmtzQdHH3E0pXg+gWO2CmQeqtS4
	D1Futbv60MRufbnJvIpofHrahsXvg/j08rnn1lt23/EU4k+/wgVUGRO2bqbhj9shgdacaOB9N+rAj
	BNm4JMsV6l9NVANqYQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uOIgJ-008Gsb-2B;
	Sun, 08 Jun 2025 16:15:35 +0000
From: linux@treblig.org
To: richard@nod.at,
	chengzhihao1@huawei.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] mtd: ubi: Remove unused ubi_flush
Date: Sun,  8 Jun 2025 17:15:35 +0100
Message-ID: <20250608161535.90030-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_091554_742131_991C1996 
X-CRM114-Status: GOOD (  11.47  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ubi_flush() was added in 2012 as part of
commit 62f384552b67 ("UBI: modify ubi_wl_flush function to clear work queue
for a lnum")
but has remained unused.

(It's friend ubi_wl_flush() is still used)

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/mtd/ubi/kapi.c  | 27 ---------------------------
 include/linux/mtd/ubi.h |  1 -
 2 files changed, 28 deletions(-)

diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index f1ea8677467f..df0a5a57b072 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -791,33 +791,6 @@ int ubi_sync(int ubi_num)
 }
 EXPORT_SYMBOL_GPL(ubi_sync);
 
-/**
- * ubi_flush - flush UBI work queue.
- * @ubi_num: UBI device to flush work queue
- * @vol_id: volume id to flush for
- * @lnum: logical eraseblock number to flush for
- *
- * This function executes all pending works for a particular volume id / logical
- * eraseblock number pair. If either value is set to %UBI_ALL, then it acts as
- * a wildcard for all of the corresponding volume numbers or logical
- * eraseblock numbers. It returns zero in case of success and a negative error
- * code in case of failure.
- */
-int ubi_flush(int ubi_num, int vol_id, int lnum)
-{
-	struct ubi_device *ubi;
-	int err = 0;
-
-	ubi = ubi_get_device(ubi_num);
-	if (!ubi)
-		return -ENODEV;
-
-	err = ubi_wl_flush(ubi, vol_id, lnum);
-	ubi_put_device(ubi);
-	return err;
-}
-EXPORT_SYMBOL_GPL(ubi_flush);
-
 BLOCKING_NOTIFIER_HEAD(ubi_notifiers);
 
 /**
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index 562f92504f2b..c3f79c4be1cc 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -250,7 +250,6 @@ int ubi_leb_unmap(struct ubi_volume_desc *desc, int lnum);
 int ubi_leb_map(struct ubi_volume_desc *desc, int lnum);
 int ubi_is_mapped(struct ubi_volume_desc *desc, int lnum);
 int ubi_sync(int ubi_num);
-int ubi_flush(int ubi_num, int vol_id, int lnum);
 
 /*
  * This function is the same as the 'ubi_leb_read()' function, but it does not
-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
