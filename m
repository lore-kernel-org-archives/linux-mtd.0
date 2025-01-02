Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D65E77198
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2025 11:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNB5DDvWxGAIgvTQIwuZd2cmISlV3Bu3p5fp3ibS0Fo=; b=009rpn+domgmSF
	0IqpDyIp9itb5IhwKjMey2vTRaplfWeeKSnOGOEKv8UP9OSGj9NOISk+/4E0UYQfBnI4NomuRHdyK
	67LQig86jCMAt8im3OkyVxP83MJxw0S6yxxEAn24ncKnRbsmBW3+zslEjYVcjVBC1U1klvhxlT8kA
	TUhUpri8N/B8PjrWZF41SNCic+GP6mc9sPeNk+tQ7AKjmaSm1Bzj1MHy2BdeTfBrpMJKMJ8ppf0td
	qK95Z0ocY5/YspBCROXi4K8fpS3qjZtiYWUy+kvGS+0F4o+6qV0UjlZWO8n75k7zCV2ghNvL15EKv
	9htFwI+rqafPFV2u7Hlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJjm-0000000AHtp-2rO9;
	Thu, 02 Jan 2025 11:51:38 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJjk-0000000AHt5-0mEe
	for linux-mtd@lists.infradead.org;
	Thu, 02 Jan 2025 11:51:37 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 502BpX2c066186;
	Thu, 2 Jan 2025 05:51:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1735818693;
	bh=2ihi518FrpHlUh7aqD5W5G2gv9XA3z0+PgM902AWRhQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J14/uFTCTJucpIaQMUh4w3GB5hJevBNMiTavzqwJn8qQiZ4eZFsbM+xaqHs8zgb68
	 UamOJqZYTOQtLk9eN8yYM1wTgxh4+t93K9tUPnoe9c3JtBrCtpWA/XpfC/dZ9qqDO3
	 FvWqxX997Kf8C9pkmqAQyJ/nqnUMGa7Pvm4tg5Ug=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 502BpXKf126459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Jan 2025 05:51:33 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 2
 Jan 2025 05:51:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 2 Jan 2025 05:51:33 -0600
Received: from santhoshkumark.dhcp.ti.com (santhoshkumark.dhcp.ti.com [172.24.227.241])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 502BpLpH030343;
	Thu, 2 Jan 2025 05:51:30 -0600
From: Santhosh Kumar K <s-k6@ti.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <quic_sridsn@quicinc.com>, <quic_mdalam@quicinc.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <p-mantena@ti.com>, <s-k6@ti.com>
Subject: [PATCH 3/3] mtd: spinand: winbond: Fix oob_layout for W25N01JW
Date: Thu, 2 Jan 2025 17:21:10 +0530
Message-ID: <20250102115110.1402440-4-s-k6@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250102115110.1402440-1-s-k6@ti.com>
References: <20250102115110.1402440-1-s-k6@ti.com>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_035136_322014_88DD89FE 
X-CRM114-Status: GOOD (  13.92  )
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

Fix the W25N01JW's oob_layout according to the datasheet. [1]

[1] https://www.winbond.com/hq/product/code-storage-flash-memory/qspinand-flash/?__locale=en&partNo=W25N01JW

Fixes: 6a804fb72de5 ("mtd: spinand: winbond: add support for serial NAND flash")
CC: Sridharan S N <quic_sridsn@quicinc.com>
Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
---

Hi, Sridharan,

Do you have a different revision of W25N01JW with a different oob_layout?
If yes, can you please provide the datasheet of that?

Regards,
Santhosh.

 drivers/mtd/nand/spi/winbond.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index fbe41e76ad64..de05b3e2b9df 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -115,6 +115,30 @@ static int w25n02kv_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static int w25n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 12;
+	region->length = 4;
+
+	return 0;
+}
+
+static int w25n01jw_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section > 3)
+		return -ERANGE;
+
+	region->offset = (16 * section) + 2;
+	region->length = 10;
+
+	return 0;
+}
+
 static int w35n01jw_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -154,6 +178,11 @@ static const struct mtd_ooblayout_ops w35n01jw_ooblayout = {
 	.free = w35n01jw_ooblayout_free,
 };
 
+static const struct mtd_ooblayout_ops w25n01jw_ooblayout = {
+	.ecc = w25n01jw_ooblayout_ecc,
+	.free = w25n01jw_ooblayout_free,
+};
+
 static int w25n02kv_ecc_get_status(struct spinand_device *spinand,
 				   u8 status)
 {
@@ -230,7 +259,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 					      &write_cache_variants,
 					      &update_cache_variants),
 		     0,
-		     SPINAND_ECCINFO(&w25m02gv_ooblayout, NULL)),
+		     SPINAND_ECCINFO(&w25n01jw_ooblayout, NULL)),
 	SPINAND_INFO("W25N01KV", /* 3.3V */
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xae, 0x21),
 		     NAND_MEMORG(1, 2048, 96, 64, 1024, 20, 1, 1, 1),
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
