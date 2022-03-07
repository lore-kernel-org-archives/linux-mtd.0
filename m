Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBFFC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Mar 2022 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXQIwPrd9bFeYdn33RlaW4UqQnQCJqeHzPk5V/AnwCE=; b=cWReB7lrIWtOGY
	cyKaENASGCN1OK0Gxv5Fgs2clm0Sado6SqaR9c2lDVsmXwUOXZGf4wvzuQoVYUVuiC66h8snWuMQf
	Dw+FSOySq0wTlo4y6UR87QMypGuyzRPdbmMnAsKzS2RC6OsGsnnFRd0p0/VxiemGSmQ4sztxS8F8l
	Ijx4EuYyd+8l7/rm45yYLpKOT5emxEHWLiDfCho2FBVH/CoA6Yjp+h8X6rSjKXmMMyXR9MfHQDSjo
	r04aSPj+2aWVG5wYOMKQLXJ5eI9dl+tArOv1RRINl9/a/MUr58cwPw6v868+ahtBS92KnBYEMAWrG
	pW6o823fdqLXn19YIk6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nREAK-000LY1-Dd; Mon, 07 Mar 2022 14:16:48 +0000
Received: from smtp2.axis.com ([195.60.68.18])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRE9q-000LJM-Qa
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2022 14:16:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1646662579;
 x=1678198579; h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XwkuwfxcIAxG2OjtkRXL4sW9IDd7MqSywi8/nrfWITE=;
 b=ns1x7N6GvDJWfbvUD54HiqfawDmEVk3K9K1C3lwc0dBfKmbr1BwO+hGw
 PzUSd7lJdQRbANo8UyD8LznhzgNX+dZ1GE523fHhsJcIpMRnr+8VsD2KR
 AyV6zDCaDWpPtHLzfsK5dlOrITp9Et0/2g1QvUBL2WcLcOmoH/ENf9bGE
 XKdoJkoPPONDR1h+v72YbuJiVkl38dJDdJKOyimRtotmkmG5pGfcJdahK
 99WsHQHN4c1Xu0br8o5DM8FJOHJOuBCTGGWl/UOJHLlgreeCOKA7kaQDf
 iN0P1AX57vdMOxHu5rJn3z41bmUvxRNCGumBe995e6uCyxQcFn2MVdXH8 g==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
To: <vigneshr@ti.com>, <richard@nod.at>, <miquel.raynal@bootlin.com>,
 <joern@lazybastard.org>
CC: <kernel@axis.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <frowand.list@gmail.com>, <krzysztof.kozlowski@canonical.com>,
 <robh+dt@kernel.org>, Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: [PATCH 1/4] mtd: core: Check devicetree alias for index
Date: Mon, 7 Mar 2022 15:15:46 +0100
Message-ID: <20220307141549.2732179-2-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307141549.2732179-1-vincent.whitchurch@axis.com>
References: <20220307141549.2732179-1-vincent.whitchurch@axis.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_061619_214351_836ED83B 
X-CRM114-Status: GOOD (  12.58  )
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
index bd4b31023c82..37c8b1b5db26 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -590,9 +590,10 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 
 int add_mtd_device(struct mtd_info *mtd)
 {
+	struct device_node *np = mtd_get_of_node(mtd);
 	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_notifier *not;
-	int i, error;
+	int i, error, ofidx;
 
 	/*
 	 * May occur, for instance, on buggy drivers which call
@@ -631,7 +632,13 @@ int add_mtd_device(struct mtd_info *mtd)
 
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
