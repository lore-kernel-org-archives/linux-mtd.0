Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CD8C5475B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Mar 2024 04:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dAk7kIOpeldWLEYC3OCjgHT1QK1xbyvlYt/2I46dyUE=; b=QAgsT7ywUtNaeU
	Xpa512TX8WBJqH9Qp0/W1vtlg9vD9dXtu2n3b6KlD3N44+ixuVOo+bm36IYrgUzRtf/GLDqv3p3yo
	oLbRyqMqU4f7k2MPM/tclS4CCjd0c0Efv9GeyWJf7YnO7PHQySeQCz8EZR4eMG6vst+deoZCHlQTD
	Qnz015nySOYtOMd0hWvI5Y7bVr6UudINkxXWtJu5nZrpksroKHaKE9vtG7IT7LuQ1sLmjhYPhCaXd
	k6lydY0nlU3SKk+8+jl5MG+wXIH5aQpVccwmr2xmK1U8TwXrxpO82a9JVfmHqAl4aiXKBn64TchZG
	xya1EB6WuY28S0oLK1Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhibr-0000000GDmS-1k7F;
	Wed, 06 Mar 2024 04:10:27 +0000
Received: from mail-sl2kor01on0616.outbound.protection.outlook.com ([2a01:111:f400:feac::616] helo=KOR01-SL2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhibn-0000000GDjo-3186
	for linux-mtd@lists.infradead.org;
	Wed, 06 Mar 2024 04:10:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvDgdQlyAmt6DEMe5TrH/0udFWULVCrtormEWdrVqIahBwAPCfOPsYWZKu72IxZUvebWBX1BfBseYHF3GTVMa+ZPw9RAvlvnPpuYQZClRxJyxAebOh/JZLJGlRhYp5PANlCGhCVTMvw8qfw1mMAwMmgaoMH8EJcGa8OEUDtcck+Fe7+MElDlubZrC8wQxHDA4hgbiC9lDX5phQck4IL0FnaIu1YIvOZj1CxCzsWY8lJ4wdjxvOIkmKGnsXV2FrPfDm5UZK1mwA3jP5wYDLb1u33dW2l+BrrFLkqlKTs+Oe+BtEpn187NzZ7FmgvV83b43ZIjqk91v17YQZUWhvFE3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89trl++5sIrUmtdjWJlt+98R0lOUKCJOxXi8QsSM5Qc=;
 b=f+U76BHbi3//8h76+vHEFhl5NnfX2OEaIRfVaRtM80/ryrjlm3RB1Uoc/BW7zwjECeiscXQHfzJHxCexOODm153f9iBQTkoXeT8L1Q5LcbGAecTNIbqBlCItyt8k/65C0aQ9tU75jNiEJlpjE3ces6VRrnxP7o3sicK/ftbYphouIZ5dBuPfIC3Xzcxd+Blirch6swsvQz7koZ+bVZUuqbGBMSCHnz4RzmIbI6kO+Uc8qCyYiYfrZLoI5OL9tzf+Z9o3dl4fgB+d+EKKRwKz+u+LELlLBh5bJkIf/MLrafuA2DVuhIepySILB4lTO7vr9X2xTQ/XWo59R8hJLrY4KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skyhighmemory.com; dmarc=pass action=none
 header.from=skyhighmemory.com; dkim=pass header.d=skyhighmemory.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skyhighmemory.onmicrosoft.com; s=selector1-skyhighmemory-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89trl++5sIrUmtdjWJlt+98R0lOUKCJOxXi8QsSM5Qc=;
 b=biTw33cKIToAOEkN/OVh63KPL101lNYWYLPo4xgPvvhZIlic6/r3JHtKEn6hRQYjjJgqRo9ys6G95L/j1nls0kL0iuEFM1zDDf5Fq/XBE3ACtpvGxHi9//5S+rRC68xbLQW0B7Ws69q8/4xvcx283V3gjs8RK3StalhRMRFjSw1CHW3f4RPoKwk9PKLUZBUcy0x6HJ19xgzD+xrYLHvLM7EqhU1FlPkZDjLr2ykEzDIgnP0PWSBqKIaNWscvW7fj7zTS/xuCKkq5mYSAhDQNIaMg5N6+TmrryWQaqNu02sK8IsK9/wiwA5+2z4LGS2deS7D70H6JWBrAKU0DmprWIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skyhighmemory.com;
Received: from SE2P216MB2102.KORP216.PROD.OUTLOOK.COM (2603:1096:101:11b::5)
 by SL2P216MB1247.KORP216.PROD.OUTLOOK.COM (2603:1096:101:10::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Wed, 6 Mar
 2024 04:10:00 +0000
Received: from SE2P216MB2102.KORP216.PROD.OUTLOOK.COM
 ([fe80::6bad:dd98:cdca:c48d]) by SE2P216MB2102.KORP216.PROD.OUTLOOK.COM
 ([fe80::6bad:dd98:cdca:c48d%3]) with mapi id 15.20.7362.019; Wed, 6 Mar 2024
 04:10:00 +0000
From: KR Kim <kr.kim@skyhighmemory.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	mmkurbanov@salutedevices.com,
	ddrokosov@sberdevices.ru
Cc: kr.kim@skyhighmemory.com,
	gch981213@gmail.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	moh.sardi@skyhighmemory.com,
	changsub.shim@skyhighmemory.com
Subject: Date: Mon, 4 Mar 2024 15:26:41 +0900
Date: Wed,  6 Mar 2024 13:09:20 +0900
Message-Id: <20240306040920.16946-1-kr.kim@skyhighmemory.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SL2P216CA0223.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::6) To SE2P216MB2102.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:11b::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE2P216MB2102:EE_|SL2P216MB1247:EE_
X-MS-Office365-Filtering-Correlation-Id: 77494794-3ab9-4338-7e4f-08dc3d934ae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LdGVgVhx3T61DwcR+eQKKVzRkXMfghYI05409u6aWmxX7h7FpMeT8vJuAuxy7f/GvNPG4cztLox4l3eJvo/OcBW1PQqKbpEer/VAAXmA/v4mv6SNjt6LTIygK4P2ScO3uVQM5r8woAmHj2qhh1oIHd+NhBRQQXj24Gw++H+j4R7PyRJWaw3VCDj9HfXk89z8vJ0HZQ7BNiBYfPy7Pi8psYV4HsDp+pNGhcc5IWhkcwtx+1zgSZrWLUoQaBNHDrK/YcocoHSZSypwklDLPyXKzck0nsJ6XfkYU5eKmqHIABPz30PYm6F42r+GxAaIxzGdnrB0Fh6pY+FJOXZV3/KFeKxBQjsSNGgoJEnC9wXwNxvdVZ3srCbDnccICQ+nowsJB67pI2QbIC+C1jvpOh6p/d0CN85Q6wbkaF3hMQHCaFZZaU99OdtlRcnsLC2UrPf7+RUJipBI8plWOnHXgaDEuoyRWerDtHLmgBklvrMyLLQn2oHEVDARJxNRPge09btMvqHzzALljy0igMYH+iV+5SrbcxdH3jU0cQdZwJOEXa5qlScq6q7yFv+UWusdfaaoupd+GnnLYJTPv7q9qpISqSb9o+eKy3eg++jm/fVYNnd5gLnfLPlRFbaTB6srklC97CkBscxQ7TB7rV4vuJOMgEEh4UAjipLJR3ePx+6nqUurdbULuGfFa+oUomVCuz+kyicv9dvYQgIeFsYgmX+Ha52bmsS+hAN7dPu8rXOOksL2rN8jee3zl8HYHMLrENBN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE2P216MB2102.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(21042699003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PzisA/J22qBr5Rc1Co59fYCMVL1cG600eEmXnTnaczILRNKdjj+lPUaWka8x?=
 =?us-ascii?Q?j6k9wIQ8vUl/vOpVon2p8n7FGosysPr2tQPRj2tIOIKsJZ6niK8veUH5XOMh?=
 =?us-ascii?Q?BuBxnz2sm9kUYmelZ9MKIqv8D5LcduWzFqs5E36WhRygwYR1f6EzZb1OL4XO?=
 =?us-ascii?Q?+uYxpu22TU+jIkm3RqJdjhOGFwo5a6qxc1DThZgqZcNpybCIXDBQpS0WYE+N?=
 =?us-ascii?Q?fJWGOmizZQzy3sex/u7FdiKjeGoOKvDlXhbsYgRnpHXkvUNQ0i0m6cBffk2K?=
 =?us-ascii?Q?/27sT2zbEo6ZRLKaOsUyDB9IdgOvf7CrRS0G6Am6G/2mDNS2rUydO4nFA/WY?=
 =?us-ascii?Q?+0Gl73WmKAzv573BTMcd8TawIRWj47bvjYHEQ24dh1Olr43wh6AKXPVoA+E4?=
 =?us-ascii?Q?mF+zdUFLC732Ec/4/ZFKtJK98Raut6OndhHaWmfLx+HQ6X7varevkPLd3HEm?=
 =?us-ascii?Q?Cdf4q9fn7q1GRwQiE6BPjWfdDC3X7hYsY4b1A9X4NgGkCCkhbksDMahPejup?=
 =?us-ascii?Q?4ipTLL3SX9neJLWf1evwgL40UKBmLBmIWbenbAcTPchV8XG3sXSdywOsHOyC?=
 =?us-ascii?Q?8J4bTTsiMd+PRuXT3Ee9k+51KNhcatGvRkXoJhyNRTql2U67EDmrishgvgOe?=
 =?us-ascii?Q?hz0VD6EhJuMzy8HBEszdG540Xako7/0Aw1rmaPseigztsRoalhGxFbpO74EM?=
 =?us-ascii?Q?d72KTwB3Wf1wgRU8bsG0k4n/Ae1In02AnU9+rVmwCmAA+qwymN+mgfGEegd2?=
 =?us-ascii?Q?pmJskyrQBp3xPDI1h+BRqByayw9WyEyBx7BOIEPZFYiSXV9fdijDZvRgqyS7?=
 =?us-ascii?Q?ztXy2zhoVyX7oG1cbLaphBbMRBFrzFeq0+Zef7mSGhkn3qdVMBBoxWWSd3p5?=
 =?us-ascii?Q?rb/ujsqZ/Ct5Gt1w5nP4hbUWmpBJWX+SgUBRCk4Q2a//gFHRZK8tfi3wbjRC?=
 =?us-ascii?Q?TP88ISB72FZIl9t9cUGgfNwOw4eUXwPWKCSVfjz0HagxAXRwI9s2nKCdDm6I?=
 =?us-ascii?Q?LXvCCa22ZxuB9IgP2Yg7ELr3nXvlVrNFAUJ7qUH9i4/KiJ7RLpwaBs4OFfLz?=
 =?us-ascii?Q?MILh89yKE6JrKfo9m1UZMWY6Mbyu1Sy2nXvKsD8j04CYcypwZZ+j5l8LAmD2?=
 =?us-ascii?Q?4IN8lu/MKBtvvuX6Zt8KNGVthC34v3JLpYBddQbIDcuIpjgUWZC23vASEerb?=
 =?us-ascii?Q?DCd86mRJb7tJAuNFTJPCoPtGDXh5Z5Q2IuvOsy6cPkJO5qkSJF/KJqdNtxnc?=
 =?us-ascii?Q?mebz+L8OiRXkwhbAlHlXXEwb1c3prIWmyrFpk07DyWCk0L/gTtXk9k9CkvBw?=
 =?us-ascii?Q?baSVjUYIsDwEcBJnSXXZpI6nympj4Tx7NZyfHF8Qtg2G/HlxR6/UANRitJd7?=
 =?us-ascii?Q?IQ86T6rYbUyHEJwpdv1fE0svE8SGf4X1aDb90gCbuxvxzxwJKTbo2O9wA/3S?=
 =?us-ascii?Q?E+rkaZ3I3dYn+mRRJPBjtRRtJ7jFYYJ/+PBnJIeEBUo1ZuIOnXYtbkzvD+s+?=
 =?us-ascii?Q?nSEKeWEimNpnOUVamAlL9XP+Fv766pqIZVemrY6z4rWCTsX8qek+jESmIz02?=
 =?us-ascii?Q?W9KUeuCC04uzZ3BzGtoQBLP8m3s4MQae/971LxMn3BRgEG7/QH6I98+itIaC?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: skyhighmemory.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77494794-3ab9-4338-7e4f-08dc3d934ae2
X-MS-Exchange-CrossTenant-AuthSource: SE2P216MB2102.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 04:10:00.6552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 39b82b34-0966-49dc-81a7-5bcab7ea53c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FANuwhwZQzsdTyI+aVgAK4whTC+t8x6UEIqyKTesZU4YZs6g/xn+IaZGIhpsb8dhvUX9LVwDoeVTuye47nBgClNTFqLZVvKfocKp70EcxCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1247
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_201023_887288_468F2F9F 
X-CRM114-Status: GOOD (  11.61  )
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

---
 drivers/mtd/nand/spi/Makefile  |  2 +-
 drivers/mtd/nand/spi/skyhigh.c | 57 ++++++----------------------------
 2 files changed, 11 insertions(+), 48 deletions(-)

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index 48b429d90460..1e61ab21893a 100755
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 spinand-objs := core.o alliancememory.o ato.o esmt.o foresee.o gigadevice.o macronix.o
-spinand-objs += micron.o paragon.o toshiba.o winbond.o xtx.o skyhigh.o
+spinand-objs += micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/skyhigh.c b/drivers/mtd/nand/spi/skyhigh.c
index 71de4fa34406..dd348849216d 100644
--- a/drivers/mtd/nand/spi/skyhigh.c
+++ b/drivers/mtd/nand/spi/skyhigh.c
@@ -12,8 +12,8 @@
 #define SPINAND_MFR_SKYHIGH		0x01
 
 #define SKYHIGH_STATUS_ECC_1TO2_BITFLIPS	(1 << 4)
-#define SKYHIGH_STATUS_ECC_3TO4_BITFLIPS	(2 << 4)
-#define SKYHIGH_STATUS_ECC_5TO6_BITFLIPS	(3 << 4)
+#define SKYHIGH_STATUS_ECC_3TO6_BITFLIPS	(2 << 4)
+#define SKYHIGH_STATUS_ECC_UNCOR_ERROR  	(3 << 4)
 
 #define SKYHIGH_CONFIG_PROTECT_EN	BIT(1)
 
@@ -62,49 +62,15 @@ static const struct mtd_ooblayout_ops skyhigh_spinand_ooblayout = {
 	.free = skyhigh_spinand_ooblayout_free,
 };
 
-#if 0
-bool skyhigh_spinand_isbad(struct spinand_device *spinand,
-			   const struct nand_pos *pos)
-{
-	u8 marker;
-	struct nand_page_io_req req = {
-		.pos = *pos,
-		.ooblen = 1,
-		.ooboffs = 0,
-		.oobbuf.in = &marker,
-		.mode = MTD_OPS_RAW,
-	};
-
-	req.pos.page = 0;
-	spinand_read_page(spinand, &req);
-	if (marker != 0xff)
-		return true;
-
-#if 0
-	req.pos.page = 1;
-	spinand_read_page(spinand, &req);
-	if (marker != 0xff)
-		return true;
-
-	req.pos.page = 63;
-	spinand_read_page(spinand, &req);
-	if (marker != 0xff)
-		return true;
-#endif
-
-	return false;
-}
-#endif
-
 static int skyhigh_spinand_ecc_get_status(struct spinand_device *spinand,
 				  u8 status)
 {
 	/* SHM
-	00 : No bit-flip
-	01 : 1-2 errors corrected
-	10 : 3-6 errors corrected         
-	11 : uncorrectable
-	*/
+	 * 00 : No bit-flip
+	 * 01 : 1-2 errors corrected
+	 * 10 : 3-6 errors corrected         
+	 * 11 : uncorrectable
+	 */
 
 	switch (status & STATUS_ECC_MASK) {
 	case STATUS_ECC_NO_BITFLIPS:
@@ -113,12 +79,10 @@ static int skyhigh_spinand_ecc_get_status(struct spinand_device *spinand,
 	case SKYHIGH_STATUS_ECC_1TO2_BITFLIPS:
 		return 2;
 
-	/* change from 4 to 6 */
-	case SKYHIGH_STATUS_ECC_3TO4_BITFLIPS:
+ 	case SKYHIGH_STATUS_ECC_3TO6_BITFLIPS:
 		return 6; 
 
-	/* uncorrectable for '11' */
-	case SKYHIGH_STATUS_ECC_5TO6_BITFLIPS:
+ 	case SKYHIGH_STATUS_ECC_UNCOR_ERROR:
 		return -EBADMSG;;
 
 	default:
@@ -179,8 +143,7 @@ static int skyhigh_spinand_init(struct spinand_device *spinand)
 
 static const struct spinand_manufacturer_ops skyhigh_spinand_manuf_ops = {
 	.init = skyhigh_spinand_init,
-/*	.isbad = skyhigh_spinand_isbad,*/
-};
+ };
 
 const struct spinand_manufacturer skyhigh_spinand_manufacturer = {
 	.id = SPINAND_MFR_SKYHIGH,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
