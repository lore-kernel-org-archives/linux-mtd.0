Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C06C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Apr 2022 13:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcaemG7Wb6p70txwAyxvb4AxNgT4lBxTkxXV1IB9Thg=; b=QxFXbWd8aTKLdF
	SWo8QGPvWklesGdrHoQDEHOPFL+I/QRZ46ZOkyGeufiI1iUZyQNmw5oQUL++5wrg92UkSTHEjgKh2
	Ad3e4CbnYl7RaGQL0usKvJgOu5WcOoBlg2UiVBGhla8Cto6R7GDbDE/T+/4mr/IS2cwGnTs+o0IU5
	DCdo9GZ51LEnaFPK9gHAxIaA5xWyxuASeNOEOOH8oox28zY/Q/EIm2DT/nCq0Bv1AjSbnuWkFc3Y7
	yK/cdceE2AhhtSvLfejn11+zS0g6ZW3F6kygxJIDTHg4w1Xmy25cDaiwbY5ow8kd6YL4IBoqEnKMT
	WreveD4zv1Yqm26YiCag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbirD-0012kB-8Y; Tue, 05 Apr 2022 13:04:27 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbiqp-0012f8-8t
 for linux-mtd@lists.infradead.org; Tue, 05 Apr 2022 13:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1649163843;
 x=1680699843; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7cRqrzsYNIRfiAOotHa409y/Hl5ia/NeruEwkXktTvU=;
 b=ofevv2iWy9NAfdsBHzpboWivsBTGjQwG1Of3SuX6wsNU//Fa1eZO2W2D
 v2XmDHG8DRg1VKInpYQgQeR4wDdxz9bgWSx8B4KWO580r+ZoPzA/gRO93
 j0PMJeUAi0yJcGCxjkqwNGJCc4Jn7T7yoFw15G6VNFuYXjR4ZKpqddh1l
 3KtsEZA9BUG6rNTIDxws9MV0dQzocjGMAZIDU+qlwxKbDMF2EyvMtzK34
 JXbyKpk+e09jQO5Pw1f+Gmf8t4SPQ6ZeIOcrWBakMQpsC7llp2H/4/b8X
 Ewj3ejX/+N3uuB0NlXmLzi5KmASMRAgsqIKOZQgCh9T6sIcE7JqGSk4+/ g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <robh+dt@kernel.org>, <krzk+dt@kernel.org>, <frowand.list@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/4] mtd: core: Check devicetree alias for index
Date: Tue, 5 Apr 2022 15:03:47 +0200
Message-ID: <20220405130350.1640985-2-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405130350.1640985-1-vincent.whitchurch@axis.com>
References: <20220405130350.1640985-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_060403_666894_23B8BEA9 
X-CRM114-Status: GOOD (  12.15  )
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

Allow the MTD index to be specified via a devicetree alias, so that the
number does not just depend on probe order.  This is useful to allow
pseudo-devices like phram to be optionally used on systems, without
having this affect the numbering of the real hardware MTD devices.

Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 drivers/mtd/mtdcore.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 7731796024e0..9eb0680db312 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -557,9 +557,10 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 
 int add_mtd_device(struct mtd_info *mtd)
 {
+	struct device_node *np = mtd_get_of_node(mtd);
 	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_notifier *not;
-	int i, error;
+	int i, error, ofidx;
 
 	/*
 	 * May occur, for instance, on buggy drivers which call
@@ -598,7 +599,13 @@ int add_mtd_device(struct mtd_info *mtd)
 
 	mutex_lock(&mtd_table_mutex);
 
-	i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
+	ofidx = -1;
+	if (np)
+		ofidx = of_alias_get_id(np, "mtd");
+	if (ofidx >= 0)
+		i = idr_alloc(&mtd_idr, mtd, ofidx, ofidx + 1, GFP_KERNEL);
+	else
+		i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
 	if (i < 0) {
 		error = i;
 		goto fail_locked;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
