Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F085C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Mar 2022 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuoETWioSxbKtkP7G0MOAREi4+4OpoBX3Uqxbe+qcqo=; b=dCNL6yDvQ2E6At
	ioK1PsRGYnIlBYQDxv5/A11L3qJYevMDA4/UjxGu9acRCwYO99xILWZ1y6/5OcYeEUHFUtJdP/ozm
	4M/uO4q3BCCUYpvG122BJD4o91KLXx5YA3QhW9FlBKPy/0qpXk9KDR6pxwX8iYqxU9UGvH6yhtRRb
	w5VLpjqF7DOi418iHS/RwGx5GbaYwcaRlcs3K8u6uw6wc1z2X5nYT1eLIjiPv69mZIuQOXC1M83K5
	5RsQuaKAfpyquMzejiWR5lRRSscWSQQRJJXvNFq4gWgpx2OhoNp7NP3bXflM9Cat7eZ1/ulh95vd8
	3r2afmhDX32jyCRFCWzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTjHn-005Fs0-H6; Mon, 14 Mar 2022 11:54:51 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTjH6-005FSI-5K
 for linux-mtd@lists.infradead.org; Mon, 14 Mar 2022 11:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PTwOcgm2slbmg9VL7iVtoVa9+P+qCUypTT7BxbCACEc=;
 b=MBne6/9eSWzHJJv1CzvQEflUBhYI5DdP9CaBpGjCMvDcLoHbnQ4MEshV
 VUpNuvPV1eKLCIDT1VulXc8zYkVXuWspnvNwcqhpiqHwfXZxJzmdx42FJ
 70uWnBON0BfBSw0iGr7irSvTDsi1H8f2ledzsBuaM+fuIVqaF4TAJ1CsP Q=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,180,1643670000"; d="scan'208";a="25997346"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 12:53:59 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Richard Weinberger <richard@nod.at>
Cc: kernel-janitors@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 13/30] UBI: block: fix typos in comments
Date: Mon, 14 Mar 2022 12:53:37 +0100
Message-Id: <20220314115354.144023-14-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220314115354.144023-1-Julia.Lawall@inria.fr>
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_045408_522937_0799BEF9 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/mtd/ubi/block.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index a78fdf3b30f7..d32768f7fe5c 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -441,7 +441,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 
 	/*
 	 * Create one workqueue per volume (per registered block device).
-	 * Rembember workqueues are cheap, they're not threads.
+	 * Remember workqueues are cheap, they're not threads.
 	 */
 	dev->wq = alloc_workqueue("%s", 0, 0, gd->disk_name);
 	if (!dev->wq) {


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
