Return-Path: <SRS0=RlT6=RH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179D2C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:15:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC53B20823
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Mar 2019 23:15:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A6bohTYJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Zf9nLbgh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC53B20823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PHs6TzgGn/1pPgN2eP1GX79KuXWsXEl6m1kCk1Mkqc=; b=A6bohTYJYoDHW1
	leacgBJbi9bQpzGnDM9lgnVVkIUo9F8LZmrwVU+KtnpCR5NzoikAKTN3u+UsZVsTB0WuRs0nijMGO
	Vnk10qxy4Aw3cEcq7ue8Yob4zUKsDeyyl2y/hdXtFspBWSmPx74c5L4eM7spDmeN/r04xRg+FFEO1
	wsV+0frBzXyglrjCIz47xH47c2zi3zl23IhSEssNbfPe4fqmIneoGcPO9KnIr7R0d9wTe7ppTaG+G
	U3f+Xh+Vn54vfPDMae+3DMkk55ybXVE5lv8Bl6KMTcS9GGV2RKkgubQ9cnlmNWUzPqjqruOYBATPl
	uxGQbUP1cFB+zFsC39uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0wo4-0005zI-FF; Mon, 04 Mar 2019 23:15:36 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0wjh-0007DE-EZ; Mon, 04 Mar 2019 23:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+bblNy0kCIv7HNAOgAIVx8ZKiR7cP7t/DOy7Fx5WXds=; b=Zf9nLbghGsUOF0R8p+LFjFIGFy
 hEEUU8NGgtGTa+uMsmzi4MY/9L6nGqKaXfLQWEgq5gCEw8w6SezIMqmJ7xqNsvgja/wli1DSgb4EE
 WPzVTer2E2TotqcS0GyK9Mf1ZiVk14lpExFn/fz/4vpSHBG3WuYlZgCxDRpfPbSMQGymqM198n+kx
 1H4shksOJKpwHS/e4naNrP3HgKw/qLEwRLjERO5L+cEddO0OIkSEOtUaNRshkV1MVm2I+IbUndPfq
 ZCvrjCsZ/EMBo9bELVjB4Waq/rBHdLz7lm8q+NiHbHoSbBa6qCo62QoPfBdY95JB89UccHuUs8fRP
 J7r3ukRQ==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0w62-00015m-6S; Mon, 04 Mar 2019 22:30:06 +0000
X-Originating-IP: 90.5.42.199
Received: from localhost.localdomain
 (atoulouse-657-1-1088-199.w90-5.abo.wanadoo.fr [90.5.42.199])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EC2B0240009;
 Mon,  4 Mar 2019 22:29:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 11/36] mtd: Fix typo in mtd_ooblayout_set_databytes()
 description
Date: Mon,  4 Mar 2019 23:28:16 +0100
Message-Id: <20190304222841.13899-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190304222841.13899-1-miquel.raynal@bootlin.com>
References: <20190304222841.13899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_173006_422067_EB2DEF6C 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: Vignesh R <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Julien Su <juliensu@mxic.com.tw>,
 Schrempf Frieder <frieder.schrempf@kontron.de>,
 Paul Cercueil <paul@crapouillou.net>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fix a probable copy/paste error: the function works like
mtd_ooblayout_set_bytes(), not the *_get_bytes() alternate.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 21e3cdc04036..6ed48018163c 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1592,7 +1592,7 @@ EXPORT_SYMBOL_GPL(mtd_ooblayout_get_databytes);
  * @start: first ECC byte to set
  * @nbytes: number of ECC bytes to set
  *
- * Works like mtd_ooblayout_get_bytes(), except it acts on free bytes.
+ * Works like mtd_ooblayout_set_bytes(), except it acts on free bytes.
  *
  * Returns zero on success, a negative error code otherwise.
  */
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
