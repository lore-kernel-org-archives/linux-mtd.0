Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=DATE_IN_PAST_96_XX,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411C5C433FF
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 10:26:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CC882087E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 10:26:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YraYwh71";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sNkM9vVS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CC882087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ON4YXYADjH1jcUyLang8t7D8jQqG0QFlnDfLi4LgH0M=; b=YraYwh71+1JzvS
	qIMCsBCuspqMOO8i0s8WN7ghJGHKy5h/I8plguYrL1CaeQZKQSGkFDMmS7l3VdQKfMQ9sRcfobFkC
	Y7XmJbGcoR7J8DLHrszkm4H1tL9M1wNynSIyWQ2jugGsWaWU6errAfi7qf7HMsj8rdrCnCjvdgsyC
	n0c6LTzXPy1v4RHWTMEl1GD85xG8eiO3lxrRcAIcYwkFJk7fW7cxc7DrVozq8HGVvGrlw2pKwzVS7
	Ll/fLlBU62wPjHIN25kx6FDCMkQkarqI+b0HZevGUeq+ea3y6whNh/lUnE+x/6cWg4rhv6Yod8LaZ
	Aeklyo3rDlR4aWfb5h8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ht8Hr-00025V-PV; Thu, 01 Aug 2019 10:26:19 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ht8HP-0001Ss-Sx
 for linux-mtd@lists.infradead.org; Thu, 01 Aug 2019 10:25:55 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20190801102547epoutp0399d91cc452655f7992900edbcc73f747~2xZEzNsD31104611046epoutp03I
 for <linux-mtd@lists.infradead.org>; Thu,  1 Aug 2019 10:25:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20190801102547epoutp0399d91cc452655f7992900edbcc73f747~2xZEzNsD31104611046epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1564655148;
 bh=Xe2m1YInrUWcJZYMMyKJYFH5VXZps0ZOUivfgx0KLXQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sNkM9vVSsD11TAORqTOLVG/X/mT8/Vma2y/pPOtRcNln4wLGUHckKulZ4gNeFPqfR
 kfuu7NZBiHcOR287d6Gz0x6+xlMt4q+E2RBPKbzs3Pi4ZhjArB9COihEQDlHhN9vCt
 IvsoLlJA/aaQ5Z/ZwDC0Hj9Gko43SMNfS0mo2lkw=
Received: from epsnrtp5.localdomain (unknown [182.195.42.166]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20190801102547epcas1p20414bf966e704c018249de37746cad7b~2xZEdDqAQ0744707447epcas1p2C;
 Thu,  1 Aug 2019 10:25:47 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.165]) by
 epsnrtp5.localdomain (Postfix) with ESMTP id 45zmf22FnczMqYkc; Thu,  1 Aug
 2019 10:25:46 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 E9.18.04066.A2EB24D5; Thu,  1 Aug 2019 19:25:46 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20190801102545epcas1p30a36729bcb5b727177a9bf395f09cc77~2xZCjLPmO0924409244epcas1p3y;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20190801102545epsmtrp131b0e14291d4e959dd8defb3676eb1d2~2xZCia4Qa2006620066epsmtrp10;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
X-AuditID: b6c32a37-e3fff70000000fe2-1f-5d42be2a8ae2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 CE.9D.03638.92EB24D5; Thu,  1 Aug 2019 19:25:45 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20190801102545epsmtip1925fb3ea532985fe534d0d88fb907560~2xZCYdPvm1882918829epsmtip1Q;
 Thu,  1 Aug 2019 10:25:45 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, Boris Brezillon
 <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 u.kleine-koenig@pengutronix.de, linux-mtd@lists.infradead.org,
 js07.lee@gmail.com, js07.lee@samsung.com
Subject: [PATCH v4 2/5] mtd: spi-nor: Fix wrong TB selection on
 winbond/gigadevice flashes
Date: Sat, 13 Jul 2019 23:59:35 +0900
Message-Id: <20190713145938.19203-2-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190713145938.19203-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTmt7s7r+bqtqyOQrQuCTVY7rqmN3Fq9vBSRkL/SWNd3MUN92p3
 9vqjdEzJkToRemgPzVk+imxKqZWUFSqIWREUWYRFZQ8l7YkkbbtG/fedc75zvu93fofAFD/w
 BMJid/MuO2elZDHSa3fXqtWqvmyDZnhsMdPuPYGYe6OXMaamtRZjfp+elDDjz2Zx5obnQhRz
 /+ZLjKnt+YSYL4Es5nlNLcqKYXvqXkSxnS0qNthWIWM7A0fYsZ/NiH12di9b/VvDVnW1oTwi
 35pu5jkT71Ly9gKHyWIv1FPbdxk3GXUpGlpNb2BSKaWds/F6anNunnqrxRoySCn3cdbiUCqP
 EwQqKSPd5Sh280qzQ3DrKd5psjppjXOdwNmEYnvhugKHLY3WaJJ1IeYeq/nhxFXMOaU88PXq
 JVkJ+hXvQ9EEkOvhtHdE4kMxhILsRnCi14OLwTSCicabmBh8R1A33IJ8iIi0TA7mi/lbCIIj
 pyThUQpyBoH3rDmMZaQKns4GI5PiyPcS+NxXj4cLS8jdMP52RhrGUjIRmr++Q2EsJzfAY/93
 XPS0Eto7bmNhsWgyDfyjyvAcILtlcGewUyZyNkPrTKlUxEvgw0BXlIgTYKK6fB4L0NNaEyU2
 exGMXwzMF7Qw+flyRAAj18KV3iQxvQp6Zs9E/GDkQpj8dgwXHyyHo+UKkULBp1feeVmA0deV
 85ZZuNE6h8Q9VCII+Gk/WlH3T6ABoTa0jHcKtkJeoJ3a/z8piCJHp0rtRh0juf2IJBAVKx+s
 2GhQ4Nw+4aCtHwGBUXHypuWZBoXcxB08xLscRlexlRf6kS60yBosYWmBI3TCdreR1iVrtVpm
 fUpqik5LLZc3/mQMCrKQc/NFPO/kXX/7JER0QgnSLcgJDpEGXDY9m0l7Puo3DSuPt2z7tfS6
 vrKozVSV2GQZelD2cIfHV5d2fqAjZ9EH/OS0Z6Ih2b+a7Z170h5LVh7ufZOYXJpdlvNCqM+4
 w06rmx/RvpTzfc2rGo5bclc8UsGWxrKX/VPp56pdayTa/Ull1+KNgfr6pp0Zq7dPUVLBzNEq
 zCVwfwBF7eY3igMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPLMWRmVeSWpSXmKPExsWy7bCSnK7mPqdYg7unZS1Wt0xntDhyYS2z
 xcSVk5kt/s55x2Tx6OZvVovdTcvYLY7uucdsMXnnG0aLj0scLG5PnMzowOWxc9Zddo/NK7Q8
 Nq3qZPPYvKTe486PpYweN+cVevT/NfDo27KKMYAjissmJTUnsyy1SN8ugSvj4suNzAXvFSq+
 bFzD1sD4U7KLkYNDQsBE4t2JqC5GLg4hgd2MEveOnGfsYuQEiktIPNr5hQWiRlji8OFiiJqP
 jBJPj01nA6lhE9CSuPF7EytIQkTgA5PE5UmnwBqEBaIk2vvyQWpYBFQlln55DjaTV8BS4vKE
 b6wQ8+UlVm84wAxSzilgJTHhggJIWAioZMPhH8wTGHkXMDKsYpRMLSjOTc8tNiwwykst1ytO
 zC0uzUvXS87P3cQIDkYtrR2MJ07EH2IU4GBU4uE90ekYK8SaWFZcmXuIUYKDWUmEd7G4fawQ
 b0piZVVqUX58UWlOavEhRmkOFiVxXvn8Y5FCAumJJanZqakFqUUwWSYOTqkGxuDpXdKVx55E
 ONyuCVf1aynao704+XzmmfSDs2zvvyk78dM0kp05lKs38alB0suEP5flnVbU8QsumbT58/8N
 6jwzDVjmlt59z5P0jFmlWuScmvPJpbOYUgPXxSqxRBxMuf1TIu2FslfYxsjT/yzC09NMgpJU
 7TIncjCqTJbnUk8unKyuekhViaU4I9FQi7moOBEAs18msUICAAA=
X-CMS-MailID: 20190801102545epcas1p30a36729bcb5b727177a9bf395f09cc77
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190801102545epcas1p30a36729bcb5b727177a9bf395f09cc77
References: <20190713145938.19203-1-js07.lee@samsung.com>
 <CGME20190801102545epcas1p30a36729bcb5b727177a9bf395f09cc77@epcas1p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_032552_276036_B386FFBB 
X-CRM114-Status: GOOD (  20.08  )
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
 drivers/mtd/spi-nor/spi-nor.c | 24 +++++++++++++++++++-----
 include/linux/mtd/spi-nor.h   |  1 +
 2 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 612a6f0a87c3..f522201d22a5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1089,9 +1089,14 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
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
@@ -1099,7 +1104,7 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 	} else {
 		pow = ((sr & mask) ^ mask) >> shift;
 		*len = mtd->size >> pow;
-		if (nor->flags & SNOR_F_HAS_SR_TB && sr & SR_TB_BIT5)
+		if (nor->flags & SNOR_F_HAS_SR_TB && sr & mask_tb)
 			*ofs = 0;
 		else
 			*ofs = mtd->size - *len;
@@ -1178,6 +1183,7 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 mask_tb = SR_TB_BIT5;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
@@ -1212,6 +1218,10 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs + len;
 
+	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE)
+		mask_tb = SR_TB_BIT6;
+
 	/*
 	 * Need smallest pow such that:
 	 *
@@ -1229,13 +1239,13 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
@@ -1258,6 +1268,7 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	struct mtd_info *mtd = &nor->mtd;
 	int status_old, status_new;
 	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+	u8 mask_tb = SR_TB_BIT5;
 	u8 shift = ffs(mask) - 1, pow, val;
 	loff_t lock_len;
 	bool can_be_top = true, can_be_bottom = nor->flags & SNOR_F_HAS_SR_TB;
@@ -1292,6 +1303,9 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 	else
 		lock_len = ofs;
 
+	if (JEDEC_MFR(nor->info) == SNOR_MFR_WINBOND ||
+	    JEDEC_MFR(nor->info) == SNOR_MFR_GIGADEVICE)
+		mask_tb = SR_TB_BIT6;
 	/*
 	 * Need largest pow such that:
 	 *
@@ -1311,14 +1325,14 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
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
index 06de3e6e8d4e..67cdbed6611a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -127,6 +127,7 @@
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
