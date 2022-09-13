Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82456C6FA82
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Sep 2022 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HJQuhnxdVpd0BUDT7f1pzhGdu3z9/jiiB/DvZ2L9q5A=; b=JMmcxG2rhyKsDx
	RMth05MMUnJOrO+lO/D1BqJoKLHJNO8zxe5RgaiZVkwKb/82NMwY1TICBCm+2sbDQ5fVMfyER9t91
	aW5wVMuMZ8PI+KY54qPfgEqAeVPUbYYEX6k4H+9k9s/8boAAWbPXOzu0JGbUojzM97QZVeY/CbmWe
	yrRdI3zCvKDE3la12mIx82Ya6/c5stR3fkATIufAXGJO9BfYpVw4/PTWEOSY9yxapgzSLnSzrTYOI
	BzSgyHNsH0ONGfID+ck96TE7DtCBzaW333j8OuCNTaEbMzV9XXst13FbBKwnKhoM8TnL1rui3aY1j
	Gr31DmSCqIVigVM//2eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY1Ti-004WVQ-SA; Tue, 13 Sep 2022 08:41:11 +0000
Received: from mx0a-0064b401.pphosted.com ([205.220.166.238])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY1TH-004W50-Fs
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2022 08:40:51 +0000
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D88iXB007635;
	Tue, 13 Sep 2022 01:40:26 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=UDsHn+9Q4/Sb44o7PGK24bSEg208rNW403NXgpY8lDE=;
 b=bG8XvUx2kRU1NezMtCDLmeiDknljQmkek+28NZ+9QUlOc59/TVphcTUhrEWRqy7WXhuY
 ALjqBhIt1d/IaemuryxqQLS6ZwX6SoW8piAEkRZ37oNY8fhFT0zZ7CEKZxj+PAUOP08f
 NwcDYo/EmWd2CBqSlaVLz7KZMvW2A+Df4qzmw0oO638+gsY3FWy89JMIvgcFciaZBXoo
 BpHIGYdnQ00JnfD79lD6rci0QzjgWB+D0pS6MLkhRCOT26WYZrGP6mPEn/7x2mMH2hVY
 cWwa6AUftwLV6BAov90puZSJRnXyNj183hCH9d0IpyDKW/5M2yCqLgTznpK/iC2SbuPA ew== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jgnv6at2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 13 Sep 2022 01:40:26 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 13 Sep 2022 01:40:25 -0700
Received: from pek-ywang12-d1.wrs.com (128.224.32.146) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 13 Sep 2022 01:40:24 -0700
From: <yaliang.wang@windriver.com>
To: <tudor.ambarus@microchip.com>, <pratyush@kernel.org>, <michael@walle.cc>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: spi-nor: gigadevice: gd25q256: replace gd25q256_default_init with gd25q256_post_bfpt
Date: Tue, 13 Sep 2022 16:40:23 +0800
Message-ID: <20220913084023.2451929-1-yaliang.wang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: uQ_sJLHkaE_jWWPTxhnn7fO7D111R8Mt
X-Proofpoint-ORIG-GUID: uQ_sJLHkaE_jWWPTxhnn7fO7D111R8Mt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_03,2022-09-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=919 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_014044_542788_08E0754F 
X-CRM114-Status: GOOD (  18.22  )
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

From: Yaliang Wang <Yaliang.Wang@windriver.com>

When utilizing PARSE_SFDP to initialize the flash parameter, the
deprecated initializing method spi_nor_init_params_deprecated() and the
function spi_nor_manufacturer_init_params() within it will never be
executed, which results in the default_init hook function will also never
be executed. As we do have quad enable function defined in BFPT, the
post_bfpt hook will be the right place to tweak the function.

Cc: stable@vger.kernel.org
Fixes: 047275f7de18 ("mtd: spi-nor: gigadevice: gd25q256: Init flash based on SFDP")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index 119b38e6fc2a..bdc4d73424af 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -8,19 +8,24 @@
 
 #include "core.h"
 
-static void gd25q256_default_init(struct spi_nor *nor)
+static int
+gd25q256_post_bfpt(struct spi_nor *nor,
+		   const struct sfdp_parameter_header *bfpt_header,
+		   const struct sfdp_bfpt *bfpt)
 {
 	/*
 	 * Some manufacturer like GigaDevice may use different
 	 * bit to set QE on different memories, so the MFR can't
 	 * indicate the quad_enable method for this case, we need
-	 * to set it in the default_init fixup hook.
+	 * to set it in the post_bfpt fixup hook.
 	 */
 	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+
+	return 0;
 }
 
 static const struct spi_nor_fixups gd25q256_fixups = {
-	.default_init = gd25q256_default_init,
+	.post_bfpt = gd25q256_post_bfpt,
 };
 
 static const struct flash_info gigadevice_nor_parts[] = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
