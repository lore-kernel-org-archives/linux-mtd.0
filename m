Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11A1D3C930
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Oct 2024 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lYOwUl1Ll5XmwBFImM3jyvDA/ZwLqE7DTC+zzFawQ9Y=; b=LU4jMxAz47pwt/
	ipQ8le70CateEAZP+aj0YOf9b/qNSjuALe3kVUNuKZ7T8CWznVPcFCekIxUDHktDz5a9p/d3jMSyk
	lxnlaeOWyXbVFKzgnG4ce4b2emfILmtbgWCEFi9uZzeQCY/IyIxneJBtk/qHJlTYNs8E4AqHace9L
	FC79H/EcWfGmmlFV3TlDfc5UQL8rKjU1MJP3JT8Z7sfJWzCIlGl00nfrfrI+g8PG+vPgASqp+sGB3
	uomIQqpQ3Mn0sRJu9cz93LEMLLtzw487D1UohcifIqZWIp1HEYxIcjWTnYa7g8G3MBR8zcRwvWqJ7
	wGQR+kIAZx6jHBlJ8JqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2W2a-00000004w8A-0BEk;
	Sun, 20 Oct 2024 13:32:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Vz3-00000004vcQ-17WY;
	Sun, 20 Oct 2024 13:28:39 +0000
X-UUID: 33925bfe8ee711ef82ff63e91e7eb18c-20241020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=u4Q+MpwvDdBjqr/mZ0lChqQSwuAsSECFSr3oxS9NmH4=;
	b=WldJ++BGMIeqr7QJZLXsYfFpempzCIrhA07pdDrI7FO7eS8EAP9rMkb/CxMo9BOR6n1EzamikZ6fnVonM5Ghvs7et9p1mEDuFvf9UExHzIYduQeggV6SJ5rxQz9tGxDQW4R8tj7UOq+m1h5H847mxqdrS1aCrZZaxWtXw5HP8uk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:e60f6cd1-447c-4014-8305-012ea204429d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:60255925-9cd9-4037-af6e-f4241b90f84d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 33925bfe8ee711ef82ff63e91e7eb18c-20241020
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 436932117; Sun, 20 Oct 2024 06:28:32 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 20 Oct 2024 21:28:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 20 Oct 2024 21:28:29 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle
	<daniel@makrotopia.org>, Chia-Lin Kao <acelan.kao@canonical.com>, Mika
 Westerberg <mika.westerberg@linux.intel.com>, Cheng Ming Lin
	<chengminglin@mxic.com.tw>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky Huang
	<skylake.huang@mediatek.com>
Subject: [RFC PATCH nand/next 2/4] include: mtd: Add CASN page definition and related structs.
Date: Sun, 20 Oct 2024 21:27:20 +0800
Message-ID: <20241020132722.20565-3-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_062837_341048_ECDF5AAC 
X-CRM114-Status: GOOD (  13.42  )
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

From: "Sky Huang" <skylake.huang@mediatek.com>

This patch adds CASN page definition. You can see corresponding
table in CASN page application note referred in cover letter.
(https://github.com/mtk-openwrt/doc/blob/
main/CASN%20Page%20Introduction.pdf)

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
 include/linux/mtd/casn.h | 191 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100644 include/linux/mtd/casn.h

diff --git a/include/linux/mtd/casn.h b/include/linux/mtd/casn.h
new file mode 100644
index 000000000000..65ebd23c17c1
--- /dev/null
+++ b/include/linux/mtd/casn.h
@@ -0,0 +1,191 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2023 - Mediatek
+ *
+ * Author: Sky Huang <SkyLake.Huang@mediatek.com>
+ */
+
+#ifndef __LINUX_MTD_CASN_H
+#define __LINUX_MTD_CASN_H
+
+#define CASN_CRC_BASE	0x4341
+#define CASN_SIGNATURE	0x4341534EU
+#define SPINAND_CASN_V1_CRC_OFS (254)
+#define CASN_PAGE_V1_COPIES     (3)
+
+#define SDR_READ_1_1_1		BIT(0)
+#define SDR_READ_1_1_1_FAST	BIT(1)
+#define SDR_READ_1_1_2		BIT(2)
+#define SDR_READ_1_2_2		BIT(3)
+#define SDR_READ_1_1_4		BIT(4)
+#define SDR_READ_1_4_4		BIT(5)
+#define SDR_READ_1_1_8		BIT(6)
+#define SDR_READ_1_8_8		BIT(7)
+
+#define SDR_WRITE_1_1_1		BIT(0)
+#define SDR_WRITE_1_1_4		BIT(1)
+
+#define SDR_UPDATE_1_1_1	BIT(0)
+#define SDR_UPDATE_1_1_4	BIT(1)
+
+struct op_slice {
+	u8 cmd_opcode;
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+	u8 dummy_nbytes : 4;
+	u8 addr_nbytes : 4;
+#elif defined(__BIG_ENDIAN_BITFIELD)
+	u8 addr_nbytes : 4;
+	u8 dummy_nbytes : 4;
+#endif
+};
+
+struct SPINAND_FLAGS {
+#if defined(__LITTLE_ENDIAN_BITFIELD)
+	u8 has_qe_bit : 1;
+	u8 has_cr_feat_bit : 1;
+	u8 conti_read_cap : 1;
+	u8 on_die_ecc : 1;
+	u8 legacy_ecc_status : 1;
+	u8 adv_ecc_status : 1;
+	u8 ecc_parity_readable : 1;
+	u8 ecc_alg : 1; /* ECC algorithm */
+#elif defined(__BIG_ENDIAN_BITFIELD)
+	u8 ecc_alg : 1; /* ECC algorithm */
+	u8 ecc_parity_readable : 1;
+	u8 adv_ecc_status : 1;
+	u8 legacy_ecc_status : 1;
+	u8 on_die_ecc : 1;
+	u8 conti_read_cap : 1;
+	u8 has_cr_feat_bit : 1;
+	u8 has_qe_bit : 1;
+#endif
+};
+
+struct ADV_ECC_STATUS {
+	u8 cmd;
+	u8 addr;
+	u8 addr_nbytes;
+	u8 addr_buswidth;
+	u8 dummy_nbytes;
+	u8 dummy_buswidth;
+	u8 status_nbytes;
+	u16 status_mask;
+	u8 pre_op; /* pre-process operator */
+	u8 pre_mask; /* pre-process mask */
+} __packed;
+
+struct CASN_OOB {
+	u8 layout_type;
+
+	/* OOB free layout */
+	u8 free_start;
+	u8 free_length;
+	u8 bbm_length;
+
+	/* ECC parity layout */
+	u8 ecc_parity_start;
+	u8 ecc_parity_space;
+	u8 ecc_parity_real_length;
+};
+
+enum oob_overall {
+	OOB_DISCRETE = 0,
+	OOB_CONTINUOUS,
+};
+
+struct nand_casn {
+	/* CASN signature must be 4 chars: 'C','A','S','N'  */
+	union {
+		u8 sig[4];
+		u32 signature;
+	};
+
+	u8 version;
+	char manufacturer[13];
+	char model[16];
+
+	__be32 bits_per_cell;
+	__be32 bytes_per_page;
+	__be32 spare_bytes_per_page;
+	__be32 pages_per_block;
+	__be32 blocks_per_lun;
+	__be32 max_bb_per_lun;
+	__be32 planes_per_lun;
+	__be32 luns_per_target;
+	__be32 total_target;
+
+	__be32 ecc_strength;
+	__be32 ecc_step_size;
+
+	u8 flags;
+	u8 reserved1;
+
+	__be16 sdr_read_cap;
+	struct op_slice sdr_read_1_1_1;
+	struct op_slice sdr_read_1_1_1_fast;
+	struct op_slice sdr_read_1_1_2;
+	struct op_slice sdr_read_1_2_2;
+	struct op_slice sdr_read_1_1_4;
+	struct op_slice sdr_read_1_4_4;
+	struct op_slice sdr_read_1_1_8;
+	struct op_slice sdr_read_1_8_8;
+
+	struct op_slice sdr_cont_read_1_1_1;
+	struct op_slice sdr_cont_read_1_1_1_fast;
+	struct op_slice sdr_cont_read_1_1_2;
+	struct op_slice sdr_cont_read_1_2_2;
+	struct op_slice sdr_cont_read_1_1_4;
+	struct op_slice sdr_cont_read_1_4_4;
+	struct op_slice sdr_cont_read_1_1_8;
+	struct op_slice sdr_cont_read_1_8_8;
+
+	__be16 ddr_read_cap;
+	struct op_slice ddr_read_1_1_1;
+	struct op_slice ddr_read_1_1_1_fast;
+	struct op_slice ddr_read_1_1_2;
+	struct op_slice ddr_read_1_2_2;
+	struct op_slice ddr_read_1_1_4;
+	struct op_slice ddr_read_1_4_4;
+	struct op_slice ddr_read_1_1_8;
+	struct op_slice ddr_read_1_8_8;
+
+	struct op_slice ddr_cont_read_1_1_1;
+	struct op_slice ddr_cont_read_1_1_1_fast;
+	struct op_slice ddr_cont_read_1_1_2;
+	struct op_slice ddr_cont_read_1_2_2;
+	struct op_slice ddr_cont_read_1_1_4;
+	struct op_slice ddr_cont_read_1_4_4;
+	struct op_slice ddr_cont_read_1_1_8;
+	struct op_slice ddr_cont_read_1_8_8;
+
+	u8 sdr_write_cap;
+	struct op_slice sdr_write_1_1_1;
+	struct op_slice sdr_write_1_1_4;
+	struct op_slice reserved2[6];
+	u8 ddr_write_cap;
+	struct op_slice reserved3[8];
+
+	u8 sdr_update_cap;
+	struct op_slice sdr_update_1_1_1;
+	struct op_slice sdr_update_1_1_4;
+	struct op_slice reserved4[6];
+	u8 ddr_update_cap;
+	struct op_slice reserved5[8];
+
+	struct CASN_OOB casn_oob;
+
+	/* Advanced ECC status CMD0 (higher bits) */
+	struct ADV_ECC_STATUS ecc_status_high;
+	/* Advanced ECC status CMD1 (lower bits) */
+	struct ADV_ECC_STATUS ecc_status_low;
+
+	u8 advecc_noerr_status;
+	u8 advecc_uncor_status;
+	u8 advecc_post_op;
+	u8 advecc_post_mask;
+
+	u8 reserved6[5];
+	__be16 crc;
+} __packed;
+
+#endif /* __LINUX_MTD_CASN_H */
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
