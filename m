Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=3.0 tests=DATE_IN_PAST_96_XX,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4B12C32751
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 02:05:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86E4D20B7C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 02:05:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LlouzInd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="UQdfP0mz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86E4D20B7C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfSlXR1+b4eDMrOVAmcc56bLqG4brql7mfTfIPstCkA=; b=LlouzIndIMyaJ9
	FvYVfQOeijg68xu2lFD7kqWS4O9ZMQN3PFS39GhoKnorn2IS1tyAKMN4J/pXBuEwwBfTr4c8E9q8M
	jJz+1Qjx9/zV1QCSYEg4CLvRC71+jR/KZNCXc82VF7IA1OK4OUw6nvkhfIa9UFa5DapyL7IfYTmmZ
	W0u2vfJD2lWQdLz3LIMHduxcjKHwfa4ExVVsVjWQBBg+hqxoQRtd0h+9cry0x7QOQqVUao0hHlQNp
	Hk6uj865V86XDPgf5s9fuYZcd1PoPLABy2iSWRWV/Iw7WHqiu1PUiBZOFashhGuKImvuzEYiViNOI
	231RMknj0paiTQrCXAkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht0T8-0007nr-MB; Thu, 01 Aug 2019 02:05:26 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht0T4-0007em-CZ
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 02:05:24 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20190801020519epoutp04e96e636a7f27d0b2007f0e78183f2917~2qkGlka8N2736527365epoutp04B
 for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2019 02:05:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20190801020519epoutp04e96e636a7f27d0b2007f0e78183f2917~2qkGlka8N2736527365epoutp04B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1564625119;
 bh=KT4nZD531kuc1gWghf0sFT/zQM8Rwm7eH31rccBhXJs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UQdfP0mzG6DOhXokJJkpTPtbhA5qV6Ce1qj5Xpt0h163XewOE7K6y4B5tEM/LBrn+
 +basOeiTd7epGx8oXVL88baw5wII5WdIAhESXy5p0qlUdWQNa50+WRqdpMgHo9bbef
 16FiI0GM3/Pm9QHqIM9i5SDm4YW8W1xGVnf+IoXE=
Received: from epsnrtp6.localdomain (unknown [182.195.42.167]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20190801020518epcas1p46228cc1fadb053ae43ffbd50bc8a1d3b~2qkGHC9SZ2643426434epcas1p4X;
 Thu,  1 Aug 2019 02:05:18 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.159]) by
 epsnrtp6.localdomain (Postfix) with ESMTP id 45zYXY4ZcbzMqYkk; Thu,  1 Aug
 2019 02:05:17 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 90.86.04085.CD8424D5; Thu,  1 Aug 2019 11:05:16 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20190801020516epcas1p383452adf9755f7121812aac0f335a779~2qkDo8Lvz0077600776epcas1p3k;
 Thu,  1 Aug 2019 02:05:16 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190801020516epsmtrp155f2af233f19d57a634db628edb5e88f~2qkDoMV3M1883318833epsmtrp1Z;
 Thu,  1 Aug 2019 02:05:16 +0000 (GMT)
X-AuditID: b6c32a39-d03ff70000000ff5-ab-5d4248dc9b7e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B6.98.03706.CD8424D5; Thu,  1 Aug 2019 11:05:16 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20190801020516epsmtip22dfa5a7a71a747dab0473035e46b2bf4~2qkDaiCl50879808798epsmtip2g;
 Thu,  1 Aug 2019 02:05:16 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v3 2/4] mtd: spi-nor: introduce SR_BP_SHIFT define
Date: Sat, 13 Jul 2019 16:15:39 +0900
Message-Id: <20190713071541.22090-2-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190713071541.22090-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTut7vH1VpdpuVhJOmV/nCg3jmn18pKC7mRfxgVkWB2cddH7dXu
 jDSoVSJpPhF6a1ZqafRyEc6mmI80ypLCTHwQGqSm60UlmdDmXdR/3/nOd75zOOfgmOKnRIln
 G62cxcjqSamv+GFnKBU2wiSkUgO/VPSt/HOI7uq/jdEVDZUYvXDZJaLHh+Yl9KOT9TK62zmG
 0ZWOGUR/qd1MD1dUos2+jOPiqIyx31QxTY2FUsZee5wZmatDzFD1IaZsgWJKHzSiZDxFvyGL
 Y3WcJYgzppt02cbMOHL7zrQtadpoSh2mjqVjyCAja+DiyK1JyWGJ2Xr3gGTQYVaf46aSWZ4n
 IzZusJhyrFxQlom3xpGcWac3qylzOM8a+BxjZni6ybBOTVGRWrdyvz6rYKFaZJ4MOPKp9Cyy
 oWlFEcJxIKKg5eXRIuSLK4hmBCVVfVIh+Iqg3P4UCcEPBO1TH2V/K2x3AgS+FcFk4Smv6BsC
 x1SrO/DBpYQK3s43STwJf2JSBLNtlySehB+RAK3vazAPFhNr4U1Pi9iD5UQsNIz1ijwYiDVw
 6177osaHWAd9512YxwgIpxQedz2TCGNsBedJJOj9YLrngUzASpgqK/BiHhwNFTKhNh/B+I1a
 b0IDrtnbmMcHI0LhbkuEQAeDY75q0RMjloPre7G3lRxOFygECQkz7/LFAgbonyjxShjo+p0o
 7KEEwUTBZ1SOAi/+a1CDUCNaxZl5QybHq83a/4/UhBafThXbjJ68SOpABI7IZfLewvhUhYQ9
 zOcaOhDgGOkvvx6wKVUh17G5eZzFlGbJ0XN8B9K6F1mBKVemm9wvbLSmqbWRGo2GjoqOidZq
 yAD51Tk6VUFkslbuIMeZOcvfOhHuo7ShFGo9HG07MKMsIvyn9w4v+VXMl4g0K8oHyIzVttpC
 csjlDOvu33PsWvCo+ID2xGDIfdMrJVrYd+ny6zotU73eln6BqtcsPztLfbjQMrhLVayLbS61
 O1PiQzoDdXVXQp6dyRuZM42N9trvH1/6fHiHPFqdZG+bCNkesW133eBABinms1i1CrPw7B84
 fjgIigMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWy7bCSvO4dD6dYgwfXuC1Wt0xntDhyYS2z
 xcSVk5kt/s55x2Tx6OZvVovdTcvYLY7uucdsMXnnG0aLj0scLG5PnMzowOWxc9Zddo/NK7Q8
 Nq3qZPPYvKTe486PpYweN+cVevT/NfDo27KKMYAjissmJTUnsyy1SN8ugSuj7e88poIX4hXv
 +6YxNjC+Eupi5OCQEDCRaFgn3sXIxSEksJtRYsG2zyxdjJxAcQmJRzu/sEDUCEscPlwMEhYS
 +Mgo8bpDDMRmE9CSuPF7EytIr4jAByaJy5NOgfUKCzhJ7H2ygBnEZhFQlbh2fBdYnFfAUmLl
 vRNMEPPlJVZvOABWwylgJXF2xjtmiAWWEvf6ulgnMPIuYGRYxSiZWlCcm55bbFhgmJdarlec
 mFtcmpeul5yfu4kRHI5amjsYLy+JP8QowMGoxMOr0OMYK8SaWFZcmXuIUYKDWUmEd7G4fawQ
 b0piZVVqUX58UWlOavEhRmkOFiVx3qd5xyKFBNITS1KzU1MLUotgskwcnFINjFJXr7U+Te1m
 Lpxrwi74zmjS1d1OOgfkDCu5v+d5SPqUzIgKmXRy8u7eE7KXHVYlP2f6LhQQGW+2bKrapBDv
 FeybXkTXTt75M3zL0xa37VOL6mqfbPkWtkf796mX959ZBPLmLq3Xu7g2V9l3hkRE3pMJ318p
 vT5hplugfccp9ljpkte5v457MSqxFGckGmoxFxUnAgBU+wvVQwIAAA==
X-CMS-MailID: 20190801020516epcas1p383452adf9755f7121812aac0f335a779
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190801020516epcas1p383452adf9755f7121812aac0f335a779
References: <20190713071541.22090-1-js07.lee@samsung.com>
 <CGME20190801020516epcas1p383452adf9755f7121812aac0f335a779@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_190522_781013_70AB45FD 
X-CRM114-Status: GOOD (  19.34  )
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

The shift variable of SR_BP is conclusive because the first bit of SR_BP
is fixed on known flash.

Introduce SR_BP_SHIFT define, and let them used by stm_* functions
to replace ffs operation to get shift value.

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 11 +++++------
 include/linux/mtd/spi-nor.h   |  2 ++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 9ea03f4d943a..dd12d3c83029 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1089,7 +1089,6 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 {
 	struct mtd_info *mtd = &nor->mtd;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	int shift = ffs(mask) - 1;
 	int pow;
 
 	if (!(sr & mask)) {
@@ -1097,7 +1096,7 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 		*ofs = 0;
 		*len = 0;
 	} else {
-		pow = ((sr & mask) ^ mask) >> shift;
+		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
 		*len = mtd->size >> pow;
 		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB_BIT5)
 			*ofs = 0;
@@ -1178,7 +1177,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 shift = ffs(mask) - 1, pow, val;
+	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1222,7 +1221,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
 	pow = ilog2(mtd->size) - ilog2(lock_len);
-	val = mask - (pow << shift);
+	val = mask - (pow << SR_BP_SHIFT);
 	if (val & ~mask)
 		return -EINVAL;
 	/* Don't "lock" with no region! */
@@ -1258,7 +1257,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
-	u8 shift = ffs(mask) - 1, pow, val;
+	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1305,7 +1304,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
 	} else {
-		val = mask - (pow << shift);
+		val = mask - (pow << SR_BP_SHIFT);
 		/* Some power-of-two sizes are not supported */
 		if (val & ~mask)
 			return -EINVAL;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f8bbc98432ff..b8f4439c30b1 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -132,6 +132,8 @@
 /* Used for Winbond and GigaDevice flashes */
 #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
 
+#define SR_BP_SHIFT		2
+
 /* Spansion/Cypress specific status bits */
 #define SR_E_ERR		BIT(5)
 #define SR_P_ERR		BIT(6)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
