Return-Path: <SRS0=ca8F=QT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2FCC282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 06:25:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79DE120863
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 06:25:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MexJ6lGw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=procenne.com header.i=@procenne.com header.b="WbI37cY+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79DE120863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=procenne.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hquSnkmFU7b3u+5SLNwhVi8OuiOJEhXaLQGbuzu4OGo=; b=Mex
	J6lGwTjEnoj7lqTCENML4cFkR3G4Bm8URcYP+NKmjqQ0uviyeqqdAlJPJ169nwbNGg1VpqtPvWPld
	u5gA4LWKXolLfwBBYswCOu7NnS0k5IK9vqOMO4Tt2xyEQLxH+aNDUejN+UgzfyJ8kk61ei6FO0vjo
	mUK+RLZfKhHCjiP9yQnhaTr/HHhrDo16dDTIGoKanO4SgO2eBo4oujb4stHL52ynAbSyLWXGlQhac
	SR2fy0YXioI3jP5Qp91N6VD/c1nau8YG6Ov23IIvTzo9ZJPfbPnSK2osQUMeWHoJFK4aFmzeqBBNJ
	G0FRpFgt//XkSvtwVeipfSHJQ7OETpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtRVP-0001sT-9z; Tue, 12 Feb 2019 06:25:19 +0000
Received: from forward102p.mail.yandex.net ([77.88.28.102])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtRVL-0001rw-El
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2019 06:25:17 +0000
Received: from mxback1o.mail.yandex.net (mxback1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::1b])
 by forward102p.mail.yandex.net (Yandex) with ESMTP id 524AB1D42878;
 Tue, 12 Feb 2019 09:24:53 +0300 (MSK)
Received: from smtp4p.mail.yandex.net (smtp4p.mail.yandex.net
 [2a02:6b8:0:1402::15:6])
 by mxback1o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id KyO13qWKWF-Oq3K7UE7; 
 Tue, 12 Feb 2019 09:24:53 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=procenne.com; s=mail;
 t=1549952693; bh=bJhAJWNWZF6a3iruE89/5ecqz0/GFu1KMPRE18VP058=;
 h=From:To:Cc:Subject:Date:Message-Id;
 b=WbI37cY+IW9Ojk5d0vBtX1QOkLW+mozMka1oiJOyh1hupfnDTgNlx2ks94cTgzFur
 yb4zIyKUYwM7j7TVcj80HhxxPMtee3dm/FBk/GGK+8B0/EkiOV/TR39Prg8qRQy3Od
 pTW2rNDWmfL+4cr4LtzUAD27hG0YcI1qS+CPP59s=
Authentication-Results: mxback1o.mail.yandex.net;
 dkim=pass header.i=@procenne.com
Received: by smtp4p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 cGgzQjR4JG-OoE02eWX; Tue, 12 Feb 2019 09:24:51 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (Client certificate not present)
From: "A. Celenk" <ahmet.celenk@procenne.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH V4] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
Date: Tue, 12 Feb 2019 09:24:42 +0300
Message-Id: <1549952682-9649-1-git-send-email-ahmet.celenk@procenne.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190211_222515_764263_D2FC732C 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ahmet Celenk <ahmet.celenk@procenne.com>, Marek Vasut <marek.vasut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: "Ahmet Celenk" <ahmet.celenk@procenne.com>

Due to two different versions (S25FL128SAGBHI200 and S25FL128SAGBHI210) of
the s25fl128s qspi memory, the single "s25fl128s" device entry must be
split into two to match the correct JEDEC ID's for each version. Solves
paging related issues of S25FL128SAGBHI210 chips.

Signed-off-by: Ahmet Celenk <ahmet.celenk@procenne.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marek.vasut@gmail.com>
---
V4: Broke the over-80-column lines and put entries alphabetically into
    the list
V3: Added missing SPI_NOR_DUAL_READ flags to new entries
V2: Removed the old s25fl128s entry
V1: Added 2 two splitted entries
---
 drivers/mtd/spi-nor/spi-nor.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index f9f7de2..6e5b591 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1893,6 +1893,10 @@ static const struct flash_info spi_nor_ids[] = {
 	 */
 	{ "s25sl032p",  INFO(0x010215, 0x4d00,  64 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
 	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64,
+			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
+	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
+			SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
 	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
@@ -1900,7 +1904,6 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
 	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
 	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
-	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl129p0", INFO(0x012018, 0x4d00, 256 * 1024,  64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25fl129p1", INFO(0x012018, 0x4d01,  64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
 	{ "s25sl004a",  INFO(0x010212,      0,  64 * 1024,   8, 0) },
-- 
2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
