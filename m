Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3717AC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 17:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VIqEY+guE9e5tpmz6bFQa0CJD3mTSlBPg37/FK6vlEQ=; b=RqZLUvCCPSzYC5
	OX5a0IMyXc2Hx0v/DYnNDAHtIpv8OeSD0pJQjJqFBigQoSsIksQWjay6EY+VzQD1gDqVnPgoXHJ/u
	EhxwiOZ09oz0P6OruTTcOMCPHwvT/pL34RM+uPmSI/5P80oC6BwrJLWJwGtXHfAUN0SQ5pwcN0Dwr
	6Hnz9cRSjkEDOcfxJxUHVIUhEcbSMphq9Fx5u08zmMa9WWFEJvmkJrjZ8XJIvX94LLuBE5fwQe0q2
	EIvnVa3SrG8G2O3wWq9ZljaH86lpes5t32ayA9tljwf+uupYSqxkZPrwPD6ciUOomfzhcFue8bz+V
	RffnRmgQf73yajacyMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7f74-0035h4-27;
	Mon, 27 Nov 2023 17:09:38 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7f70-0035eZ-24
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 17:09:36 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r7f6n-000892-22;
	Mon, 27 Nov 2023 17:09:22 +0000
Date: Mon, 27 Nov 2023 17:09:14 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>
Subject: [PATCH] ubi: don't decrease ubi->ref_count on detach error
Message-ID: <9857609999c5b7196417474938a7a09892cd1612.1701104870.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_090934_677260_196A633F 
X-CRM114-Status: GOOD (  11.72  )
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

If attempting to detach a UBI device while it is still busy, detaching
is refused. However, the reference counter is still being decreased
despite the error. Rework detach function to only decrease the refcnt
once all conditions for detachment are met.

Fixes: cdfa788acd13 ("UBI: prepare attach and detach functions")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/build.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7d4ff1193db6f..f47987ee9a31b 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1099,16 +1099,16 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 
 	spin_lock(&ubi_devices_lock);
 	put_device(&ubi->dev);
-	ubi->ref_count -= 1;
-	if (ubi->ref_count) {
+	if (ubi->ref_count > 1) {
 		if (!anyway) {
 			spin_unlock(&ubi_devices_lock);
 			return -EBUSY;
 		}
 		/* This may only happen if there is a bug */
 		ubi_err(ubi, "%s reference count %d, destroy anyway",
-			ubi->ubi_name, ubi->ref_count);
+			ubi->ubi_name, ubi->ref_count - 1);
 	}
+	ubi->ref_count -= 1;
 	ubi_devices[ubi_num] = NULL;
 	spin_unlock(&ubi_devices_lock);
 
-- 
2.43.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
