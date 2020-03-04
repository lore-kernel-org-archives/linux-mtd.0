Return-Path: <SRS0=wBEz=4V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1C7C3F2CD
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 11:09:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36EF920705
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Mar 2020 11:09:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EGQQ+v4l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TbQ+DD7X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36EF920705
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkBEOsZN12K/juOzz2IsyTWrv4WSyoCGx79T/nB6uHM=; b=EGQQ+v4l6Al4zn
	nyxB8PyZeu+UM6y/PybfPWoK9w/d+nizxz5AeJFa9ofAtZqd5tAOrc86i9/U3gGJM/16+4ktWpNdf
	klvw6S6QdcHT5EM813b7+WuaRe4Cl22v1K90f8NnswMukEu04NXAn5brLFZQlbyT6E16rBAhXTutL
	lbtI76eT/nJirMS7F0jaNuytBEWJRJduBOsqcGm0DDnIbc5lTzP7TplNIaUm5ff6md5T0igRLzWW6
	8MlaXDOOukX94ti5utoR/iiWunPFwT5/xNZ6yRYvO9CeV4kmay35kooXJMZTMu6rcBUzw1yKVUZfW
	0kYi+hr1FlQyeia30DIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9RtS-0001uB-M6; Wed, 04 Mar 2020 11:08:50 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9RtG-0001Z4-R7
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2020 11:08:40 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200304110835epoutp025b6f1b451bbdf940b0d2de7aade8b523~5FUGrM4YF0822708227epoutp02j
 for <linux-mtd@lists.infradead.org>; Wed,  4 Mar 2020 11:08:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200304110835epoutp025b6f1b451bbdf940b0d2de7aade8b523~5FUGrM4YF0822708227epoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1583320115;
 bh=qwH9bxYg1y8k/+bp8MECxfu8al0oT5PDCogRcfrifl4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=TbQ+DD7X0Xsj5/CFq8DWEV58p/gaQLFbKUSZdl6L1yL6tcLAkwWuk/svEOX4qFatW
 PzHlkxGqPUPKkMN/A/63gaBVTxS8M+94Qf4wC9psg1wodAWPuk6vJ9/QhZ4ZrQcRQW
 9ls0uQjQa6087ZZ78j3bWVH/Z/9m5ox9505C77wY=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20200304110835epcas1p3718a3fe14e88ceb7924aa14216e65e3b~5FUGGodfY2829428294epcas1p3S;
 Wed,  4 Mar 2020 11:08:35 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.161]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 48XWMk20x1zMqYkV; Wed,  4 Mar
 2020 11:08:34 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 64.AD.51241.23C8F5E5; Wed,  4 Mar 2020 20:08:34 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20200304110833epcas1p42958d6dce0081afabfdd4200258eddb8~5FUE6UNJJ2835628356epcas1p43;
 Wed,  4 Mar 2020 11:08:33 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200304110833epsmtrp2ea6160c33bfe6383716281bb6ec6710c~5FUE2umxD2028620286epsmtrp20;
 Wed,  4 Mar 2020 11:08:33 +0000 (GMT)
X-AuditID: b6c32a39-163ff7000001c829-da-5e5f8c3251c1
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4F.36.10238.13C8F5E5; Wed,  4 Mar 2020 20:08:33 +0900 (KST)
Received: from localhost.localdomain (unknown [10.88.100.192]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200304110833epsmtip1510105d46e6a019c1af62f5cf7ccdc86~5FUEnrXKa3147331473epsmtip1Q;
 Wed,  4 Mar 2020 11:08:33 +0000 (GMT)
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org, js07.lee@gmail.com,
 js07.lee@samsung.com, chenxiang <chenxiang66@hisilicon.com>, Michael Walle
 <michael@walle.cc>
Subject: [PATCH 2/3] mtd: spi-nor: add 4bit block protection support
Date: Wed,  4 Mar 2020 20:07:59 +0900
Message-Id: <20200304110800.20658-2-js07.lee@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200304110800.20658-1-js07.lee@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02SWUwTURSGuUw7U4jVSUE5IRhxEhdQsKUUBqQGFc0oaEj0RR9aRpgA2mXS
 aavog4hEDYJrwkO1CVEQBIkIRAWDCyiNMbggYQkaVHBha1giAdFoy9To23fv/f6cc8+9Mkzx
 RRoqyzVZOYuJNVB4oORuW0RUVEyxXqcsuiane7q7EP3rqtuf/tQ3L6UfFNwg6PEXdQQ9WZ5M
 /+6YIJIJpsnxnmAGnXcIpqH8OPNutgIx5xqrEePqvefPPG4pxNOJ/YakHI7N4izhnCnTnJVr
 ytZSqXv0W/WaOKUqSpVAx1PhJtbIaamUtPSo7bkGTz9UuJ012Dxb6awgUBs2JVnMNisXnmMW
 rFqK47MMvErJRwusUbCZsqMzzcZElVIZo/GYGYacc/15/IWNR/pdlZJ8dDmyCAXIgIyFsabn
 yMsK8j6C3t+7ilCgh6cQjLZ3SMSDGQTlAxv+Bp4+PI+LUguCacdPibiYRjDUM0t4LZyMhN75
 eqmXg0k3gjcPkr0cRKbA6UufMS9LyFUwU9yMe1lOJkBzTRshVlgBNXWPF5wAMhEKT7Zh3gJA
 luFQMjknEaUUqOrIx0QOghFXoy8cCtPuFlxkAZpuXiTEcCGCT5XlPkkN7vFaT1gmw8gIuN3s
 u9pKaJp3LswCIxeD+3ux1KsAKYczpxSiQsHYh0JfCwCvB0ukIjMw0Dnnm0oJgifVZfgFtNzx
 r0IZQtVoGccLxmxOUPGa/x+pHi38sciE+6j9ZVorImWIWiSHHTqdQsrahTxjKwIZRgXLgzR6
 nUKexeYd5SxmvcVm4IRWpPGM8iIWujTT7PmxJqtepYlRq9V0bFx8nEZNhcg/7ovQKchs1sod
 4jies/zN+csCQvNR/ZW8g/K3A13Okv0nRmrCtlUdr8jMUGpdTjuccK3opB16++2H9tcJTEPa
 rUfv9n6tCwl5FdajxMMOK1Y3LFlfVTrBbx4C1taX8mP3M+eWxJ9xg6ZUx9nSjIr2m8dq+eE1
 68OuD60bHeoO0X4raFEuKcb7/XYOT61tDfRT9DgP1FISIYdVRWIWgf0DPvQrDXkDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPLMWRmVeSWpSXmKPExsWy7bCSnK5hT3ycwa+Z2hbXr11htPg75x2T
 xaObv1ktdjctY7d4e3oDu8XHJQ4W/89+YHdg99g56y67x+O5G9k9Ni+p97jzYymjR9+WVYwe
 x29sZ/I4sLeFLYA9issmJTUnsyy1SN8ugSuj73ZlwQTritvHl7M0ME7W6mLk5JAQMJE4sq+f
 DcQWEtjNKHFjCi9EXELi0c4vLF2MHEC2sMThw8VdjFxAJR8ZJU6e/sQMUsMmoCVx4/cmVpCE
 iMAXRonLmw+ygiSEBVwk2ic9BStiEVCV+NazC2wBr4ClxK7Vh9khFshLrN5wAKyGU8BKoqX5
 MDPEEZYSf7deZZ7AyLuAkWEVo2RqQXFuem6xYYFhXmq5XnFibnFpXrpecn7uJkZwsGlp7mC8
 vCT+EKMAB6MSD6+UZ1ycEGtiWXFl7iFGCQ5mJRFeYdP4OCHelMTKqtSi/Pii0pzU4kOM0hws
 SuK8T/OORQoJpCeWpGanphakFsFkmTg4pRoYl0k+z5ho3b+K1zO7wp4r64Xoz/9zOFQfNxwQ
 uJRkUrrrTyPH6lWVt4o4lgUeW1bLs5W7vfUQe8tMsaz0fd9vVtjs3CTbvvI6+6syx6bGS5MN
 71TXLVjGaB5bkef5Oe4mb8UBe1vdJ1e7vbbY/CubmjXlzJTC53tZNN+0BhpNm/qiWoH1J89e
 JZbijERDLeai4kQAoMQUJzICAAA=
X-CMS-MailID: 20200304110833epcas1p42958d6dce0081afabfdd4200258eddb8
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200304110833epcas1p42958d6dce0081afabfdd4200258eddb8
References: <20200304110800.20658-1-js07.lee@samsung.com>
 <CGME20200304110833epcas1p42958d6dce0081afabfdd4200258eddb8@epcas1p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_030839_235404_E06BDB72 
X-CRM114-Status: GOOD (  20.74  )
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

Currently, we are supporting block protection only for
flash chips with 3 block protection bits in the SR register.
This patch enables block protection support for flashes with
4 block protection bits(bp0-3).

Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 82 ++++++++++++++++++++++++++++++++---
 include/linux/mtd/spi-nor.h   |  4 ++
 2 files changed, 79 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index c58c27552a74..31a2106e529a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -238,6 +238,14 @@ struct flash_info {
 					 * status register. Must be used with
 					 * SPI_NOR_HAS_TB.
 					 */
+#define SPI_NOR_4BIT_BP		BIT(17)	/*
+					 * Flash SR has 4 bit fields (BP0-3)
+					 * for block protection.
+					 */
+#define SPI_NOR_BP3_SR_BIT6	BIT(18)	/*
+					 * BP3 is bit 6 of status register.
+					 * Must be used with SPI_NOR_4BIT_BP.
+					 */
 
 	/* Part specific fixup hooks. */
 	const struct spi_nor_fixups *fixups;
@@ -1786,7 +1794,16 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 
 static u8 spi_nor_get_bp_mask(struct spi_nor *nor)
 {
-	return SR_BP2 | SR_BP1 | SR_BP0;
+	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
+
+	if (nor->flags & SNOR_F_HAS_4BIT_BP) {
+		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6)
+			mask = mask | SR_BP3_BIT6;
+		else
+			mask = mask | SR_BP3_BIT5;
+	}
+
+	return mask;
 }
 
 static u8 spi_nor_get_tb_mask(struct spi_nor *nor)
@@ -1797,12 +1814,26 @@ static u8 spi_nor_get_tb_mask(struct spi_nor *nor)
 		return SR_TB_BIT5;
 }
 
+static u8 stm_get_bpval_from_sr(struct spi_nor *nor, u8 sr) {
+	u8 mask = spi_nor_get_bp_mask(nor);
+	u8 bp = sr & mask;
+
+	if (bp & SR_BP3_BIT6)
+		bp = (bp & ~BIT(6)) | BIT(5);
+
+	bp = bp >> SR_BP_SHIFT;
+
+	return bp;
+}
+
 static int stm_get_min_prot_length(struct spi_nor *nor)
 {
 	int bp_slots, bp_slots_needed;
-	u8 mask = spi_nor_get_bp_mask(nor);
 
-	bp_slots = (mask >> SR_BP_SHIFT) + 1;
+	if (nor->flags & SNOR_F_HAS_4BIT_BP)
+		bp_slots = 1 << 4;
+	else
+		bp_slots = 1 << 3;
 
 	/* Reserved one for "protect none" and one for "protect all". */
 	bp_slots = bp_slots - 2;
@@ -1821,9 +1852,8 @@ static void stm_get_locked_range(struct spi_nor *nor, u8 sr, loff_t *ofs,
 {
 	struct mtd_info *mtd = &nor->mtd;
 	int min_prot_len;
-	u8 mask = spi_nor_get_bp_mask(nor);
 	u8 tb_mask = spi_nor_get_tb_mask(nor);
-	u8 bp = (sr & mask) >> SR_BP_SHIFT;
+	u8 bp = stm_get_bpval_from_sr(nor, sr);
 
 	if (!bp) {
 		/* No protection */
@@ -1881,7 +1911,7 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
 
 /*
  * Lock a region of the flash. Compatible with ST Micro and similar flash.
- * Supports the block protection bits BP{0,1,2} in the status register
+ * Supports the block protection bits BP{0,1,2}/BP{0,1,2,3} in the status register
  * (SR). Does not support these features found in newer SR bitfields:
  *   - SEC: sector/block protect - only handle SEC=0 (block protect)
  *   - CMP: complement protect - only support CMP=0 (range is not complemented)
@@ -1889,7 +1919,7 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
  * Support for the following is provided conditionally for some flash:
  *   - TB: top/bottom protect
  *
- * Sample table portion for 8MB flash (Winbond w25q64fw):
+ * Sample table portion for 8MB flash (Winbond w25q64fw / BP0-2):
  *
  *   SEC  |  TB   |  BP2  |  BP1  |  BP0  |  Prot Length  | Protected Portion
  *  --------------------------------------------------------------------------
@@ -1909,6 +1939,32 @@ static int stm_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
  *    0   |   1   |   1   |   0   |   1   |  2 MB         | Lower 1/4
  *    0   |   1   |   1   |   1   |   0   |  4 MB         | Lower 1/2
  *
+ * Sample table portion for 64MB flash (Micron n25q512ax3 / BP0-3):
+ *
+ *   TB   |  BP3  |  BP2  |  BP1  |  BP0  |  Prot Length  | Protected Portion
+ *  --------------------------------------------------------------------------
+ *    0   |   0   |   0   |   0   |   0   |  NONE         | NONE
+ *    0   |   0   |   0   |   0   |   1   |   64 KB       | Upper 1/1024
+ *    0   |   0   |   0   |   1   |   0   |  128 KB       | Upper 1/512
+ *    0   |   0   |   0   |   1   |   1   |  256 KB       | Upper 1/256
+ *   ...
+ *    0   |   1   |   0   |   0   |   1   |  16 MB        | Upper 1/4
+ *    0   |   1   |   0   |   1   |   0   |  32 MB        | Upper 1/2
+ *    0   |   1   |   0   |   1   |   1   |  64 MB        | ALL
+ *    0   |   1   |   1   |   0   |   0   |  64 MB        | ALL
+ *   ...
+ *  ------|-------|-------|-------|-------|---------------|-------------------
+ *    1   |   0   |   0   |   0   |   0   |   NONE        | NONE
+ *    1   |   0   |   0   |   0   |   1   |   64 KB       | Lower 1/1024
+ *    1   |   0   |   0   |   1   |   0   |  128 KB       | Lower 1/512
+ *    1   |   0   |   0   |   1   |   1   |  256 KB       | Lower 1/256
+ *   ...
+ *    1   |   1   |   0   |   0   |   1   |  16 MB        | Lower 1/4
+ *    1   |   1   |   0   |   1   |   0   |  32 MB        | Lower 1/2
+ *    1   |   1   |   0   |   1   |   1   |  64 MB        | ALL
+ *    1   |   1   |   1   |   0   |   0   |  64 MB        | ALL
+ *   ...
+ *
  * Returns negative on errors, 0 on success.
  */
 static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
@@ -1960,6 +2016,9 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		min_prot_len = stm_get_min_prot_length(nor);
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 		val = pow << SR_BP_SHIFT;
+
+		if (val & BIT(5) && mask & SR_BP3_BIT6)
+			val = (val & ~BIT(5)) | BIT(6);
 	}
 
 	if (val & ~mask)
@@ -2042,6 +2101,9 @@ static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
 		pow = ilog2(lock_len) - ilog2(min_prot_len) + 1;
 		val = pow << SR_BP_SHIFT;
 
+		if (val & BIT(5) && mask & SR_BP3_BIT6)
+			val = (val & ~BIT(5)) | BIT(6);
+
 		/* Some power-of-two sizes are not supported */
 		if (val & ~mask)
 			return -EINVAL;
@@ -5244,6 +5306,12 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 	if (info->flags & USE_CLSR)
 		nor->flags |= SNOR_F_USE_CLSR;
 
+	if (info->flags & SPI_NOR_4BIT_BP) {
+		nor->flags |= SNOR_F_HAS_4BIT_BP;
+		if (info->flags & SPI_NOR_BP3_SR_BIT6)
+			nor->flags |= SNOR_F_HAS_SR_BP3_BIT6;
+	}
+
 	if (info->flags & SPI_NOR_NO_ERASE)
 		mtd->flags |= MTD_NO_ERASE;
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index de90724f62f1..0190ed21576a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -129,7 +129,9 @@
 #define SR_BP1			BIT(3)	/* Block protect 1 */
 #define SR_BP2			BIT(4)	/* Block protect 2 */
 #define SR_TB_BIT5		BIT(5)	/* Top/Bottom protect */
+#define SR_BP3_BIT5		BIT(5)	/* Block protect 3 */
 #define SR_TB_BIT6		BIT(6)	/* Top/Bottom protect */
+#define SR_BP3_BIT6		BIT(6)	/* Block protect 3 */
 #define SR_SRWD			BIT(7)	/* SR write protect */
 /* Spansion/Cypress specific status bits */
 #define SR_E_ERR		BIT(5)
@@ -240,6 +242,8 @@ enum spi_nor_option_flags {
 	SNOR_F_HAS_16BIT_SR	= BIT(9),
 	SNOR_F_NO_READ_CR	= BIT(10),
 	SNOR_F_HAS_SR_TB_BIT6	= BIT(11),
+	SNOR_F_HAS_4BIT_BP	= BIT(12),
+	SNOR_F_HAS_SR_BP3_BIT6	= BIT(13),
 
 };
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
