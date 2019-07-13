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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E4D2C433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 10:26:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A335E2087E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 10:26:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3jRsepm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="hQETgKnH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A335E2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acDfXQ/MNvu5nCPTye6xliaZuhYMHT/ulKEI7C4xyVI=; b=d3jRsepmOyNL55
	tQAyLNfvwsknkhCLOiqTDXsh9O52IoOD/YHEYr4sNJYdWK2QqCYW1XvKQUTbNqs42ecI5S7Xbk6op
	3DQ0F7c8RdIayQPQ03ombjEsxPXMZ9dl4mhIqAFbtJ7Iheay7zOF2BmRATLHm6PfbVJVdzdEBVWkF
	xfPC9vOs5jZGCn+YCbBWzpi+26VvlrIQCTWa/16ZufwsUGeMuNGEMOd0ud8SW6cytz4/dyF5w8KKK
	/fHC+lXlcL2FtWVo41AZ7qL6NPyMQgCdVrhNtyvvdrViJPLjYEfsUxkucvwLwFIQWXygh3ciE+dSp
	OLBBZ/8WBtSx1IFPmjVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht8HT-0001UT-Fj; Thu, 01 Aug 2019 10:25:55 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht8HP-0001Sp-SQ
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 10:25:53 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20190801102547epoutp01c039b8bd7349a054009adeb33e76b4cd~2xZEkvrNW0962809628epoutp01d
 for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2019 10:25:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20190801102547epoutp01c039b8bd7349a054009adeb33e76b4cd~2xZEkvrNW0962809628epoutp01d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1564655147;
 bh=7qLvwHE7UnvxrYc5272kEgqlJrT5/RKMD02NxNNAH5M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hQETgKnHgxKOBcxhAEhAonMOrkic6EKIjaktymX1j6YN2NDrBDfMnj8uqrecmfTJ2
 NwHb+29EH4HxacHYkYV+GvoGQOFKqHCxFHyti7Sa3VsvKcQoqLNyYUgmgpcTEWtZIe
 rJclg+NRfbesGrCQMHfLr0oUCZE+1kjMLynWjgFw=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20190801102547epcas1p411d4bb58d8d5ba2099af0b5c00b5713c~2xZELDdWC0933609336epcas1p4n;
 Thu,  1 Aug 2019 10:25:47 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.159]) by
 epsnrtp5.localdomain (Postfix) with ESMTP id 45zmf22D4wzMqYkb; Thu,  1 Aug
 2019 10:25:46 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 9A.62.04075.A2EB24D5; Thu,  1 Aug 2019 19:25:46 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20190801102545epcas1p2966140195425fef491d607e3c183f22a~2xZCnlAdg0958009580epcas1p26;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190801102545epsmtrp196164ed86056e3ad3031663ebba917d0~2xZCmvQC52006620066epsmtrp11;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
X-AuditID: b6c32a36-b61ff70000000feb-b7-5d42be2af094
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 65.0B.03706.92EB24D5; Thu,  1 Aug 2019 19:25:45 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190801102545epsmtip16721dc41d2bd66ea18ff17b8a7c3e32a~2xZCccY_w2329723297epsmtip1J;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v4 3/5] mtd: spi-nor: introduce SR_BP_SHIFT define
Date: Sat, 13 Jul 2019 23:59:36 +0900
Message-Id: <20190713145938.19203-3-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190713145938.19203-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTYRzt293jKk1u0/LXIloXwpqpm2vzGq6HSVw0QrCHiMMuetHV3aPd
 KT2gJMxUshIDQXtnD2elLQvN1DIjMyqpCKWysgcVKr1braxtd1L/ne/8zvnOx/l+OKbwSJS4
 2epkHVaGI6Wh4kvX58XEqDuTTZrhF1OoxpIaRPX0n8WoqoZqjPp9YExEDQ96JVT7jpMy6saV
 IYyqbhtB1Mf6JdTjqmq0JJRuq30qoy+cVtNuV7mUvlC/nX7iOYHowUMb6b2/NfSeFhdKx7O4
 pAKWyWMdKtaaa8szW/ONZFpGzrIcvUGjjdEmUgmkyspYWCOZsiI9ZrmZ8z2QVBUxXKGPSmd4
 noxblOSwFTpZVYGNdxpJ1p7H2bUaeyzPWPhCa35srs2yUKvRxOt9ynVcQX3pLZl9JHLT2M5O
 WTH6oKhAITgQC+DBYY/YjxVEK4L9u7IqUKgPf0LwqrJOKhy+ITg9eE8y4bj4cI9MGHQgcLm6
 gqrPCM57y0R+lZRQw4DXLfEPIoi3IhjtrAvYw4lkuF/XFwgUE3Pg14e+AC8nEuFJx0NMiJgF
 jc1XfRjHQ4iFsK9f5b8HiFYpuK6dEfl5IFJgqCZRkIfD+5stMgEr4d3e0iDmoa2hSiZ4SxAM
 n6oPDnQwNno2cD9GzIOmy3ECPRvavAeRH2NEGIx93S0RouRQVhqsi4SR5yViAQP0v6wMlkLD
 wJtxidBDJYL23l2SfWhm7b+EIwi50DTWzlvyWV5rj///l9wosHVqQys6dndFNyJwRE6W95Yv
 NSkkTBG/2dKNAMfICPnxyMUmhTyP2byFddhyHIUcy3cjva/IKkw5Ndfm22GrM0erj9fpdNQC
 Q4JBryMj5Uc9lElB5DNOdgPL2lnHhE+EhyiLUUJ6lPXn7VVp2duMqV3nin41PNho+tE8nOpu
 t3iTo0InRxt7+rgUavxE5suV5te6iCazu2JNHb5jvPaxaGj9Mw2z+/MkT2bE+cy1Hao76E+x
 8ee00uLFkVxIb9ijpcrRA1vnq/tXO77zURmWOEv0XMO5GWe+jE7/fvcUkXYre0AlJsV8AaNV
 Yw6e+Qv2/aBeiwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrALMWRmVeSWpSXmKPExsWy7bCSnK7mPqdYg9kbFC1Wt0xntDhyYS2z
 xcSVk5kt/s55x2Tx6OZvVovdTcvYLY7uucdsMXnnG0aLj0scLG5PnMzowOWxc9Zddo/NK7Q8
 Nq3qZPPYvKTe486PpYweN+cVevT/NfDo27KKMYAjissmJTUnsyy1SN8ugStjSdtJ9oI34hXv
 WvexNzB+EOpi5OSQEDCR2Hqlj72LkYtDSGA3o8TuWasZIRISEo92fmHpYuQAsoUlDh8uBgkL
 CXxklNh+WwDEZhPQkrjxexMrSK+IwAcmicuTTrGAJIQFnCQuzYawWQRUJf58OMUKYvMKWErc
 2XuFGWK+vMTqDQeYQeZzClhJTLigADHfUmLD4R/MExh5FzAyrGKUTC0ozk3PLTYsMMxLLdcr
 TswtLs1L10vOz93ECA5HLc0djJeXxB9iFOBgVOLhVehxjBViTSwrrsw9xCjBwawkwrtY3D5W
 iDclsbIqtSg/vqg0J7X4EKM0B4uSOO/TvGORQgLpiSWp2ampBalFMFkmDk6pBkbBrHBOm9v3
 M7tXnM9tYv49XyxcVK6oMn2zXmVRy7vGziarxrNrL7pJT59SapS55V/seYEn/VPz+ysPWJWJ
 5X1hLOtYXvhoi/7ZveG9O6ZttNa0Ouo/d9ss3gN2OQfzLXfOWPMgw7NHTbhgtobiz2U99unv
 n6zTZEvysH9gMytgo/SDP1Kpf5VYijMSDbWYi4oTAcAs2JhDAgAA
X-CMS-MailID: 20190801102545epcas1p2966140195425fef491d607e3c183f22a
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190801102545epcas1p2966140195425fef491d607e3c183f22a
References: <20190713145938.19203-1-js07.lee@samsung.com>
 <CGME20190801102545epcas1p2966140195425fef491d607e3c183f22a@epcas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_032552_161276_59025622 
X-CRM114-Status: GOOD (  22.24  )
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
index f522201d22a5..6d9c63ab6e51 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1090,7 +1090,6 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	struct mtd_info *mtd = &nor->mtd;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 mask_tb = SR_TB_BIT5;
-	int shift = ffs(mask) - 1;
 	int pow;
 
 	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
@@ -1102,7 +1101,7 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 		*ofs = 0;
 		*len = 0;
 	} else {
-		pow = ((sr & mask) ^ mask) >> shift;
+		pow = ((sr & mask) ^ mask) >> SR_BP_SHIFT;
 		*len = mtd->size >> pow;
 		if (nor->flags & SNOR_F_HAS_SR_TB && sr & mask_tb)
 			*ofs = 0;
@@ -1184,7 +1183,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 mask_tb = SR_TB_BIT5;
-	u8 shift = ffs(mask) - 1, pow, val;
+	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1232,7 +1231,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	 *   pow = ceil(log2(size / len)) = log2(size) - floor(log2(len))
 	 */
 	pow = ilog2(mtd->size) - ilog2(lock_len);
-	val = mask - (pow << shift);
+	val = mask - (pow << SR_BP_SHIFT);
 	if (val & ~mask)
 		return -EINVAL;
 	/* Don't "lock" with no region! */
@@ -1269,7 +1268,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
 	u8 mask_tb = SR_TB_BIT5;
-	u8 shift = ffs(mask) - 1, pow, val;
+	u8 pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
 	bool use_top;
@@ -1319,7 +1318,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	if (lock_len == 0) {
 		val = 0; /* fully unlocked */
 	} else {
-		val = mask - (pow << shift);
+		val = mask - (pow << SR_BP_SHIFT);
 		/* Some power-of-two sizes are not supported */
 		if (val & ~mask)
 			return -EINVAL;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 67cdbed6611a..97f0c3a05f86 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -135,6 +135,8 @@
 
 #define SR_QUAD_EN_MX		BIT(6)	/* Macronix Quad I/O */
 
+#define SR_BP_SHIFT		2
+
 /* Enhanced Volatile Configuration Register bits */
 #define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
