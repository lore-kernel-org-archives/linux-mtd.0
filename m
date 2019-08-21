Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBDFC3A59E
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 05:17:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB56B22CE3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 05:17:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MHPM6vAP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VnwLCS5G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB56B22CE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JY4bWrlC9eXsuVuCaw8FHtWWF+4hhASIStJ9McYo/Gs=; b=MHPM6vAPzpS/Np
	fCYW0KfCWl3jJ+05OiYs+/y5Wdbgwz2T3JDPY0OGV5Bmr4FMQO/qXRnPZ6JF7ag2UMwlk1k9u1yAj
	3SRp/j345Wtsf8/ma4/ftOW149O/LBnY72UtBQB6SPvylKhAxYjC5zYTIWc5dgHdLQYZs/juyCDfu
	GthluOAZ5qgnqFKVvTEiddDoyxrVpiPEts6rwOr0i0D4LOvWkUCHgegL3wfexblhx8ASlp94un5eA
	Ginh2/cGSNn4sl/3Z53085/zkMExwn43LJiLfp6MT63v13HUce4b23vszHEwKgu8J/8yrSLN4/9YB
	pa7b2Imy9fnMHetRbkhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0IzT-0003xZ-IC; Wed, 21 Aug 2019 05:16:59 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0IzD-0003jo-0E
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 05:16:45 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190821051640epoutp04879761af284aa950781a2a9a0881c970~82E4xPKZV2575925759epoutp04C
 for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2019 05:16:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190821051640epoutp04879761af284aa950781a2a9a0881c970~82E4xPKZV2575925759epoutp04C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1566364600;
 bh=gzwmkUSfTCDAuhAcf7sLq4gRzFPR+BoPWePtV2CcjxE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VnwLCS5G+uC+I0Bgni+QEPKjUGR4FaUKg+Y9mcWaF1FjdFmZEbCwbd1sNGKzVVKv/
 5HUONPuHenNOcCwO6+uY4rv03Hvko0GUo6P3JF/FTjaT+mzXxNP5KkNYDiX9hzw1pl
 JivL3qIFGe0drfYjJRw1+2G6li/S/0VL6LRMlg1o=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20190821051640epcas1p4387748b947c0f8a3c6c71f2829978758~82E4PdXAy0236702367epcas1p4J;
 Wed, 21 Aug 2019 05:16:40 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.159]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 46Cwr644lZzMqYkg; Wed, 21 Aug
 2019 05:16:38 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 20.5E.04066.5B3DC5D5; Wed, 21 Aug 2019 14:16:37 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20190821051637epcas1p48d70755f6a16f04c3af59e73945b4674~82E1vKerj0619606196epcas1p4s;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20190821051637epsmtrp256b562a074ec27e886e66c6ebf50252c~82E1uRyBy0532805328epsmtrp2p;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
X-AuditID: b6c32a37-e3fff70000000fe2-77-5d5cd3b505d2
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 3A.2C.03638.5B3DC5D5; Wed, 21 Aug 2019 14:16:37 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190821051637epsmtip296806f4bdbdfdac6d6071a6688b4f5af~82E1i93a00443104431epsmtip2p;
 Wed, 21 Aug 2019 05:16:37 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v5 2/5] mtd: spi-nor: Fix wrong TB selection on
 winbond/gigadevice flashes
Date: Wed, 21 Aug 2019 14:15:38 +0900
Message-Id: <20190821051541.6083-2-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190821051541.6083-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTH+e3ucZUWl2V5mkR6pYcjdWtNr5E9yOJS/SEW/mEOvbiLrz1u
 u5uPInpJL6w0paByGGrqxMpl4TR7LMMiX2BPKouSqLD5wrBEattV6r/vOedzHpxzcEwxI1Hi
 uWYbazUzRlIaLL7zKCom+vZgul59pF9HNZVcRFTXQDNGlTdWYNTsFa+I+vRmRkJ1HL0mox7f
 HcKoCvcIosZrN1NvyyvQ5mDafem9jL7VoKJdzlNS+lbtIfrddB2i3zj20edm1fTZVidKxtOM
 G3JYxsBaw1lzlsWQa85OJHfuztiaoYtTa6I1CVQ8GW5mTGwimbQrOXp7rtE3IBlewBjtPlcy
 w/Nk7MYNVovdxobnWHhbIslyBiOnUXMxPGPi7ebsmCyLab1GrV6r85GZxpw/345hXGNE0cP2
 k+gwqlOeRkE4EOvAM+GWnkbBuIJoQ+B1VokEYwLB+IcnmGD8RND98hs2nzLo8M5RnQhaHp+V
 CcYkgo/VQyI/JSVU8HrGJfEHQoivIvhx77LEH1hEpMOzjueBUmJiBVwfPY/8Wk5QcP9yp1Ro
 sRyabj4IMEFEApSNTAbaAXFXCh1jT+fmSIKeX2UiQS+C792tMkErYdI7X4gHd2O5TEguQfCp
 vnYO0oL3R7OvEI5jRBTcaI8V3BHgnqkKDIQRC8E7VSrxI0DI4eRxhYCQMPKxRCxogIHPZySC
 pqFvrGZuLaUIml3VWBladulfh2qEnGgJy/GmbJbXcNr/D+VCgcdTxbehm327PIjAEblAnvlq
 r14hYQr4YpMHAY6RIfKiK2l6hdzAFO9nrZYMq93I8h6k862yHFMuzrL43thsy9Do1mq1Wmpd
 XHycTkuGyq9OU3oFkc3Y2HyW5VjrfJ4ID1IeRisrN4VsXZ2Qcmy47usqpcym79xWHHm82xFl
 T9GfKCzZwUX27XHXbSn43DP1JSw0LLXrd96qB/0tpgsNKWcW5PXsbOGIiJpeZSsWtRRVtg23
 vKjoDYKLNUfHww4ekHlf1q/JdyZETvGOhcOpT2DodW7hhTSVzi3usThLe12HRg+SYj6H0agw
 K8/8BXEgzcqOAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsWy7bCSvO7WyzGxBk+/SlusbpnOaHHkwlpm
 i4krJzNb/J3zjsni0c3frBa7m5axWxzdc4/ZYvLON4wWH5c4WNyeOJnRgctj56y77B6bV2h5
 bFrVyeaxeUm9x50fSxk9bs4r9Oj/a+DRt2UVYwBHFJdNSmpOZllqkb5dAlfG/5fNzAUrFSsO
 7upgbGBcKtXFyMkhIWAicXneO6YuRi4OIYHdjBLtxycyQSQkJB7t/MLSxcgBZAtLHD5cDFHz
 kVFi/sX9LCA1bAJaEjd+b2IFSYgIfGCSuDzpFFhCWCBK4tP6yWCDWARUJda9n8QIYvMKWEjs
 n72XDWKBvMTqDQeYQWxOAUuJCW8+g9ULAdUsW9zIMoGRdwEjwypGydSC4tz03GLDAqO81HK9
 4sTc4tK8dL3k/NxNjOCQ1NLawXjiRPwhRgEORiUe3h03o2OFWBPLiitzDzFKcDArifBWzImK
 FeJNSaysSi3Kjy8qzUktPsQozcGiJM4rn38sUkggPbEkNTs1tSC1CCbLxMEp1cBo7vf+mneD
 jPMR1Y43Nz/7NPKbF3F/+eDP29Ju6t/z+nzk9oklMvHhR6ayCqy7+uyMxLl6+/Oea/P+NPi2
 O16//9p4Ns8f1iWODzOu3yv+uMXxQtsv4fX2IufXGbKFmz4rPmPyZsm5pVxiEq618er72wT7
 Tc/5pFhkFfR3pbWzHjE5eeKA9R4lluKMREMt5qLiRABAfdIhRQIAAA==
X-CMS-MailID: 20190821051637epcas1p48d70755f6a16f04c3af59e73945b4674
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190821051637epcas1p48d70755f6a16f04c3af59e73945b4674
References: <20190821051541.6083-1-js07.lee@samsung.com>
 <CGME20190821051637epcas1p48d70755f6a16f04c3af59e73945b4674@epcas1p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_221643_697802_5F0BC90A 
X-CRM114-Status: GOOD (  22.02  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

For winbond and gigadevice flashes, wrong bit for top/bottom selection
are being used. Fix it to use appropriate value.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
v5:
 - remake patch based on latest spi-nor/next tree

 drivers/mtd/spi-nor/spi-nor.c | 24 +++++++++++++++++++-----
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 587f23480e5d..5bed03e61bd0 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1411,9 +1411,14 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 {
 	struct mtd_info *mtd = &nor->mtd;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 mask_tb = SR_TB_BIT5;
 	int shift = ffs(mask) - 1;
 	int pow;
 
+	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE)
+		mask_tb = SR_TB_BIT6;
+
 	if (!(sr & mask)) {
 		/* No protection */
 		*ofs = 0;
@@ -1421,7 +1426,7 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	} else {
 		pow = ((sr & mask) ^ mask) >> shift;
 		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB_BIT5)
+		if (nor->flags & SNOR_F_HAS_SR_TB && sr & mask_tb)
 			*ofs = 0;
 		else
 			*ofs = mtd->size - *len;
@@ -1500,6 +1505,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 mask_tb = SR_TB_BIT5;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
@@ -1534,6 +1540,10 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs + len;
 
+	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE)
+		mask_tb = SR_TB_BIT6;
+
 	/*
 	 * Need smallest pow such that:
 	 *
@@ -1551,13 +1561,13 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (!(val & mask))
 		return -EINVAL;
 
-	status_new = (status_old & ~mask & ~SR_TB_BIT5) | val;
+	status_new = (status_old & ~mask & ~mask_tb) | val;
 
 	/* Disallow further writes if WP pin is asserted */
 	status_new |= SR_SRWD;
 
 	if (!use_top)
-		status_new |= SR_TB_BIT5;
+		status_new |= mask_tb;
 
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
@@ -1580,6 +1590,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 mask_tb = SR_TB_BIT5;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
@@ -1614,6 +1625,9 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs;
 
+	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE)
+		mask_tb = SR_TB_BIT6;
 	/*
 	 * Need largest pow such that:
 	 *
@@ -1633,14 +1647,14 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 			return -EINVAL;
 	}
 
-	status_new = (status_old & ~mask & ~SR_TB_BIT5) | val;
+	status_new = (status_old & ~mask & ~mask_tb) | val;
 
 	/* Don't protect status register if we're fully unlocked */
 	if (lock_len == 0)
 		status_new &= ~SR_SRWD;
 
 	if (!use_top)
-		status_new |= SR_TB_BIT5;
+		status_new |= mask_tb;
 
 	/* Don't bother if they're the same */
 	if (status_new == status_old)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 66c891f0d328..654992a829bd 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -128,6 +128,7 @@
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
 #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
+#define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect (on Winbond/GigaDevice) */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
 #define SR_E_ERR		BIT(5)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
