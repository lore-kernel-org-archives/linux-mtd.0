Return-Path: <SRS0=3VFJ=LW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD9DC11F64
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 21:18:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9690E61CB4
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jun 2021 21:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9690E61CB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+On0/7QIZfDUEWWArJRDPURsaKM2e0/Vta7EWcEudwc=; b=BM/3X1SEOsrmTk
	hE+ZxfRA6w5S/jNXSEDtrH4xkOQBZXe87qj3oqLQDp6KSgZzw4MUn3ZFDKpk1cxI8ZS9stWkDcKyl
	JZK8MpJb+iaMiT+Pt2mKWqk9XkYtbbTWczP/cpeClOIW80qbBBGnx9OJdCtLzKz4VJ+qJZA3uN+2h
	qehMsJ45NGJSQOsxUl6301ZbLwAtEphRfaarJGqxE8I6uFlA6hikK3VnjD1IMQFUxaymR5pheM3/k
	UK9bKSbhP2HqbvcoC8qaVNL51ISKR+T/gnkmbMCt0fMhMx29O6byLMHTONO9wrcsg2RIlJ/oXuS7/
	csiQ+PW/6rryjTOWx44A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lxydT-009DBQ-Ty; Mon, 28 Jun 2021 21:17:44 +0000
Received: from mx0a-00082601.pphosted.com ([67.231.145.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxydQ-009D8E-Vp
 for linux-mtd@lists.infradead.org; Mon, 28 Jun 2021 21:17:42 +0000
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15SLGCXp001482
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jun 2021 14:17:38 -0700
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 39fkfgs3ke-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Mon, 28 Jun 2021 14:17:38 -0700
Received: from intmgw001.37.frc1.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 28 Jun 2021 14:17:37 -0700
Received: by devvm2494.atn0.facebook.com (Postfix, from userid 172786)
 id AD000CE7F735; Mon, 28 Jun 2021 14:17:29 -0700 (PDT)
From: Jonathan Lemon <jonathan.lemon@gmail.com>
To: <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <kernel-team@fb.com>
Subject: [PATCH] mtd: spi-nor: Enable locking for n25q128a13
Date: Mon, 28 Jun 2021 14:17:29 -0700
Message-ID: <20210628211729.3625017-1-jonathan.lemon@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-FB-Internal: Safe
X-Proofpoint-GUID: A36WE_m4P4dOtheiZSjOps1DFA2cfm__
X-Proofpoint-ORIG-GUID: A36WE_m4P4dOtheiZSjOps1DFA2cfm__
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-28_14:2021-06-25,
 2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 mlxscore=0
 mlxlogscore=492 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 clxscore=1034 spamscore=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106280138
X-FB-Internal: deliver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_141741_059471_8BED69BB 
X-CRM114-Status: GOOD (  12.24  )
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

As 4bit block protection patchset for some micron models are merged,
n25q128a13 also uses 4 bit Block Protection scheme, so enable locking
for it. Tested it on n25q128a13, the locking functions work well.

Signed-off-by: Jonathan Lemon <jonathan.lemon@gmail.com>
---
 drivers/mtd/spi-nor/micron-st.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index c224e59820a1..f3d19b716b7b 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -146,7 +146,9 @@ static const struct flash_info st_parts[] = {
 			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
 			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256,
-			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
+			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
+			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
 	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512,
 			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
 			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
