Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B89FD3C92D
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Oct 2024 13:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ylAjrvvf29Pp9QoT7qYCwgqRGaTzTbmiRaQBAUOHpxY=; b=l+IMB8HI9uLpuS
	AC524wIJmpBpnvKm1pAw6kq2b2cBJ4j+aaKOUNGm9b3unakFCZwNCuUk3mp5ygTaqqHPX+NJHDD01
	H3Q5FyElXAeDV1+kQ1QfpEZTlzW34CmE/n0Hlsp85Ogup6L/0HkRS1Wu7C28xXetQHWCv/tdF8feH
	LrVh6hB5yLqlEF9Exx1u8F8KiCgZtQ2MtaXoOEtZ1mCXrX9+HyEY/FHCaBU6l4MiIywrcaUrTGJu7
	3U0Z9nt6sw0b/Ib7PDoEXJqISNXRp4emA/2iWuXjlpsrazdb61jC2TcTboJwnP2NsN8MrmImCSz/y
	bi4xYp+In1iEdSPvm7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2W41-00000004wHq-0Odr;
	Sun, 20 Oct 2024 13:33:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2VzG-00000004vdj-07po;
	Sun, 20 Oct 2024 13:28:53 +0000
X-UUID: 3b91e3108ee711ef9048ed6ed365623b-20241020
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=2G1oHhlieHVhAY567gkNMmzlsnu2+sPvTe7p5o7ZsNk=;
	b=jpyzAVCHpGKDVyz8vX5qobQk0Iy/BG/4AZxBSHZzpLF6NiWwCoPA1CY3Jgz8U5ZOfSsT0tvaXCY0kvBTQyH4yyAsk0IzDtkEbXhTw6x8s1L3mIpnt7G0FNjZ2FfeG/Fbv8eVkJRfwYBftE6e+ARw0CE1OTGhow+KHp60/tUgeWo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:108a9adc-8b7f-4de6-9e44-1b51ddabe879,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:af255925-9cd9-4037-af6e-f4241b90f84d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3b91e3108ee711ef9048ed6ed365623b-20241020
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <skylake.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1982015101; Sun, 20 Oct 2024 06:28:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 20 Oct 2024 21:28:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 20 Oct 2024 21:28:42 +0800
From: Sky Huang <SkyLake.Huang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Miquel Raynal
	<miquel.raynal@bootlin.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Daniel Golle
	<daniel@makrotopia.org>, Chia-Lin Kao <acelan.kao@canonical.com>, "Mika
 Westerberg" <mika.westerberg@linux.intel.com>, Cheng Ming Lin
	<chengminglin@mxic.com.tw>, <linux-kernel@vger.kernel.org>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
CC: Steven Liu <Steven.Liu@mediatek.com>, Sky Huang
	<skylake.huang@mediatek.com>
Subject: [RFC PATCH nand/next 3/4] include: mtd: spinand: Add CASN page related macros and flags.
Date: Sun, 20 Oct 2024 21:27:21 +0800
Message-ID: <20241020132722.20565-4-SkyLake.Huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
References: <20241020132722.20565-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.446200-8.000000
X-TMASE-MatchedRID: oCsWEly1aNNM4VjZ76ar2LMjW/sniEQKmX+W7bzPOQF+YesuCgkiXJpx
	JPA5ZIe+2lO9wdJIjwWwYEHOVohSR8a1KU/oEEOPogGd8wIUGIJo3Yq5PCwLAhL6MU7t349bo7e
	vliYi17DYcB744kzEdqnConkZyCes/Y8bXtyBbJB0CDjJ3XioBPBkYT/50xzWf7dwGsQvXvzIrf
	3gn7w8oqP8wcVXpl7OgzXM/1S8rGibGHSBj+j5Wd35+5/2RxqmCv3j7wdXxBibKItl61J/yZ+in
	TK0bC9eKrauXd3MZDX371moSn0VOL9msMtG43RP5Oy4n7TTsM8D5mBwNiJFK4Dro/jMlndlBrNs
	Id/ubdefkcesyQmuoXXWg7RXgpNfEi71zuMNe2ygzDosNXeeAhdGg+ZY7eN6THB2Q+oKru8MTI3
	4nyF36MJL1aANdU8Knqg/VrSZEiM=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.446200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7EF0422110CF8F2371BA6587828AFCBCFFF5F5E629928B88ECDE63BE23BB0CB12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_062850_208328_CC139373 
X-CRM114-Status: GOOD (  15.65  )
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

This patch adds SPINAND CASN page manipulation macros for
SPI-NAND driver to use. Also, some important flag bits, like
SPINAND_SUPR_CR(continuous read), are added to show the
SPI-NAND device's capability.

Signed-off-by: Sky Huang <skylake.huang@mediatek.com>
---
 include/linux/mtd/spinand.h | 100 +++++++++++++++++++++++++++++++++++-
 1 file changed, 98 insertions(+), 2 deletions(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 702e5fb13dae..de97994c357b 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -62,6 +62,59 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
+/* Macros for CASN */
+#define SPINAND_CASN_PAGE_READ_FROM_CACHE_OP(fast, naddr, addr, ndummy, buf, len) \
+	SPI_MEM_OP(SPI_MEM_OP_CMD(fast ? 0x0b : 0x03, 1),		\
+		   SPI_MEM_OP_ADDR(naddr, addr, 1),			\
+		   SPI_MEM_OP_DUMMY(ndummy, 1),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 1))
+
+#define SPINAND_CASN_PAGE_READ_FROM_CACHE_X2_OP(naddr, addr, ndummy, buf, len)	\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x3b, 1),			\
+		   SPI_MEM_OP_ADDR(naddr, addr, 1),			\
+		   SPI_MEM_OP_DUMMY(ndummy, 1),			\
+		   SPI_MEM_OP_DATA_IN(len, buf, 2))
+
+#define SPINAND_CASN_PAGE_READ_FROM_CACHE_DUALIO_OP(naddr, addr, ndummy, buf, len)	\
+		SPI_MEM_OP(SPI_MEM_OP_CMD(0xbb, 1),			\
+			   SPI_MEM_OP_ADDR(naddr, addr, 2),			\
+			   SPI_MEM_OP_DUMMY(ndummy, 2),			\
+			   SPI_MEM_OP_DATA_IN(len, buf, 2))
+
+#define SPINAND_CASN_PAGE_READ_FROM_CACHE_X4_OP(naddr, addr, ndummy, buf, len)	\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0x6b, 1),				\
+		   SPI_MEM_OP_ADDR(naddr, addr, 1),				\
+		   SPI_MEM_OP_DUMMY(ndummy, 1),				\
+		   SPI_MEM_OP_DATA_IN(len, buf, 4))
+
+#define SPINAND_CASN_PAGE_READ_FROM_CACHE_QUADIO_OP(naddr, addr, ndummy, buf, len)	\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(0xeb, 1),				\
+		   SPI_MEM_OP_ADDR(naddr, addr, 4),				\
+		   SPI_MEM_OP_DUMMY(ndummy, 4),				\
+		   SPI_MEM_OP_DATA_IN(len, buf, 4))
+
+#define SPINAND_CASN_PROG_LOAD(reset, naddr, addr, buf, len)			\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(reset ? 0x02 : 0x84, 1),		\
+		   SPI_MEM_OP_ADDR(naddr, addr, 1),				\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(len, buf, 1))
+
+#define SPINAND_CASN_PROG_LOAD_X4(reset, naddr, addr, buf, len)			\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(reset ? 0x32 : 0x34, 1),		\
+		   SPI_MEM_OP_ADDR(naddr, addr, 1),				\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(len, buf, 4))
+
+#define SPINAND_CASN_ADVECC_OP(casn_adv_ecc_status, buf)			\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(casn_adv_ecc_status.cmd, 1),			\
+		   SPI_MEM_OP_ADDR(casn_adv_ecc_status.addr_nbytes,		\
+				   casn_adv_ecc_status.addr,			\
+				   casn_adv_ecc_status.addr_buswidth),		\
+		   SPI_MEM_OP_DUMMY(casn_adv_ecc_status.dummy_nbytes,		\
+				    casn_adv_ecc_status.dummy_buswidth),	\
+		   SPI_MEM_OP_DATA_IN(casn_adv_ecc_status.status_nbytes, buf, 1))
+/* Macros for CASN end */
+
 #define SPINAND_PAGE_READ_FROM_CACHE_OP(fast, addr, ndummy, buf, len)	\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(fast ? 0x0b : 0x03, 1),		\
 		   SPI_MEM_OP_ADDR(2, addr, 1),				\
@@ -312,8 +365,11 @@ struct spinand_ecc_info {
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
-#define SPINAND_HAS_PROG_PLANE_SELECT_BIT		BIT(2)
-#define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
+#define SPINAND_SUP_CR			BIT(2)
+#define SPINAND_SUP_ON_DIE_ECC		BIT(3)
+#define SPINAND_SUP_LEGACY_ECC_STATUS	BIT(4)
+#define SPINAND_SUP_ADV_ECC_STATUS	BIT(5)
+#define SPINAND_ECC_PARITY_READABLE	BIT(6)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
@@ -406,6 +462,28 @@ struct spinand_dirmap {
 	struct spi_mem_dirmap_desc *rdesc_ecc;
 };
 
+/**
+ * struct CASN_ADVECC - CASN's advanced ECC description
+ * @cmd: Command to access SPI-NAND on-chip ECC status registers
+ * @mask: Mask to access SPI-NAND on-chip ECC status registers.
+ *	  ADV_ECC_STATUS->status_nbytes | CASN_ADVECC->mask
+ *			1		|      0 to 0xff
+ *			2		|     0 to 0xffff
+ * @shift: How many bits to shift to get on-chip ECC status
+ * @pre_op: This comes from CASN page's ADV_ECC_STATUS's pre_op.
+ *	    After reading on-chip ECC status, we need to do some math
+ *	    operations if this is specified.
+ * @pre_mask: This comes from CASN page's ADV_ECC_STATUS's pre_mask.
+ *	      This is used in companion with pre_op above.
+ */
+struct CASN_ADVECC {
+	u8 cmd;
+	u16 mask;
+	u8 shift;
+	u8 pre_op;
+	u8 pre_mask;
+};
+
 /**
  * struct spinand_device - SPI NAND device instance
  * @base: NAND device instance
@@ -464,6 +542,23 @@ struct spinand_device {
 	u8 *oobbuf;
 	u8 *scratchbuf;
 	const struct spinand_manufacturer *manufacturer;
+
+	bool use_casn;
+	struct nand_casn *casn;
+	struct spi_mem_op *advecc_high_ops; /* ops to read higher part of advanced ECC status*/
+	struct spi_mem_op *advecc_low_ops;
+	struct CASN_OOB *casn_oob;
+	struct CASN_ADVECC *advecc_high;
+	struct CASN_ADVECC *advecc_low;
+
+	u8 advecc_low_bitcnt;
+	u8 advecc_noerr_status;
+	u8 advecc_uncor_status;
+	u8 advecc_post_op;
+	u8 advecc_post_mask;
+
+	size_t (*eccsr_math_op[4])(size_t, size_t);
+
 	void *priv;
 
 	bool cont_read_possible;
@@ -539,3 +634,4 @@ int spinand_write_reg_op(struct spinand_device *spinand, u8 reg, u8 val);
 int spinand_select_target(struct spinand_device *spinand, unsigned int target);
 
 #endif /* __LINUX_MTD_SPINAND_H */
+
-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
