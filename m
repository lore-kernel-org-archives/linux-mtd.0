Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC40C4167B
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Nov 2023 00:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaLcBvWPs4jzzQDnLe+lsllxuZIDVTEQWKoT41YwViI=; b=CXe3EjW52qp1nQ
	1nXR4/Ke2fYA3+tepu5n0+PFQk6Hxv4FyOK2MgN439mwYDF9nS1mcZk/JQEGtTaFQS1mJwmTK7EII
	g09ShKlngpLlah+P/kTSVVZwHqzGAsUGW4Cn1aRxchRDWx1SkK7XREkxQHO4Mjt9Nnagm9doK9LWD
	rxcGC4XuwCmqJx+ufBxljymEHLiXSVDApvbN+vGLkPV5rIHIbGFqsvDFp+x1Qwu4VGlW9Qp86dYk6
	whgjtjA7WyQx3Z9fe/O1xQL5PidKH6NBvjTyMKkQ5KBrEqBmU4kcumI0ZjZ9Z1Ga+H39cd5TB/JeD
	Y15T8LBSoPDp0GbZXmmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7mEr-003liM-1x;
	Tue, 28 Nov 2023 00:46:09 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7mEo-003lhv-0V
	for linux-mtd@lists.infradead.org;
	Tue, 28 Nov 2023 00:46:07 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1r7mEg-0001sM-2y;
	Tue, 28 Nov 2023 00:46:00 +0000
Date: Tue, 28 Nov 2023 00:45:54 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] ubi: don't decrease ubi->ref_count on detach error
Message-ID: <8d48839a1bf928886e86de8fdc09dc0676fc187f.1701132215.git.daniel@makrotopia.org>
References: <771902199.32600.1701116758852.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <771902199.32600.1701116758852.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_164606_219284_91EEDD73 
X-CRM114-Status: GOOD (  11.87  )
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
despite the error. Rework detach function to only decrease the reference
counter once all conditions for detachment are met.

Fixes: cdfa788acd13 ("UBI: prepare attach and detach functions")
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: also catch negative ref_count and add ubi_assert as suggested

 drivers/mtd/ubi/build.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 7d4ff1193db6f..2316f6014c7f5 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1099,16 +1099,17 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 
 	spin_lock(&ubi_devices_lock);
 	put_device(&ubi->dev);
-	ubi->ref_count -= 1;
-	if (ubi->ref_count) {
+	if (ubi->ref_count != 1) {
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
+	ubi_assert(ubi->ref_count == 0);
 	ubi_devices[ubi_num] = NULL;
 	spin_unlock(&ubi_devices_lock);
 
-- 
2.43.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
