Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3421CD98E4
	for <linux-mtd@archiver.kernel.org>; Sat, 20 Jun 2026 16:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYzE7PtkwYPzqEEjvinpfCtCVxhRN5FE50keY7HGk9A=; b=LPEx9w++e8bjK6
	qEd23EKLp6UgEqnZXna4tMsyN+xiQslx7XPw3h6EUS1OWiKOy1h+Eze91vFTmAvlVVtaYXm1v7kRr
	YBL5GLW2Ei1jfBXp8U5FWr3KNZ6xCpl1ivnq3gDGLnEWMPq6L5wdMkopuKUI+gl7GrQsjj2gMI6/2
	1X7lOU8wt4Tn8p8YrIp/bFnEqlOPAM6CfILKP8+VEJh+L6QZP9Ut0eE3K0gHokGwKFDzVkCoZfeA5
	huPvxfvFXB4L+HwAgzoT1gc27XGMM4v/Ilt4OzATwlY7wWesPzkGl+tRmw3eLFZNvwwZb4iZLlkmA
	YyVIhFNGEzRuPOXfMmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wayKd-00000003S6u-33NP;
	Sat, 20 Jun 2026 16:14:07 +0000
Received: from mail-koreacentralazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d40f::3] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wayKZ-00000003S6M-1f1P
	for linux-mtd@lists.infradead.org;
	Sat, 20 Jun 2026 16:14:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jk8VIfP183y175YpoAbusMnrM2Im/ecs1k9RfKgEYt+vzpja3Ppbw/nuVSRsQbO+kxxqHMYsu5sIr5roOhgV1gaWQ3RfrVGH97uTBvaUbg7Qddotys0YiwGwE7vFyQZ96ty97PUW4jqr9SVX02bRNqSH3JTuqJFJU9e9QT2vCRDxtxrd9uCUpR3/etpjlNsI7LLwW0/rcCFRhNYtr3A6/otYwz7fgXO5tt1eTFtD4ABMxcLjJKXq0dp8xYG8ejckHJ+wgWX7o2hLyVdiBYCcUp/tYqnj26MKwlT9D5ocYoS0x1jYGd1t5qhOK6xpmUbeum7DRxuep0Ds0sYIiUytbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ML5Ut8FRuUZuh5+1qcw5pg4aR+56+WTLBGSXFXdlKRY=;
 b=w1/xzXyvoIcqdh1FhExqkaPAjvZFp37bs4ghD4etVe/cGMyx1HNdkGaCLqfGK1em91RowfUGxDn5AVjHUxddMMU0E08H+LZBp/iKzgk5awe7SXwfCkJlwG7qW+5ae2zxjCKSpOQnSRILjO76k88yctOol5LJn/+eObK2Nd2MaajNp7l2wGDrDcEvv5S/pS9zN15KrqZS2HbP4PmZ4C2J8Mw0EwQfEhRa6ojbYnfPxwQn9dLETcLk9NCAVFv/7Yjb/Ax7I3gRqi8CUb09DTWQBXgPY6d9rKvLvpCmmCjYWtarWSFbhgZ+SscIfEzK1EL/lT5nQx44R5c6JK9wFOUKyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML5Ut8FRuUZuh5+1qcw5pg4aR+56+WTLBGSXFXdlKRY=;
 b=UL4hpN4YyXKcTIdu0icH9+InSUP+I8jJT4J4zwo2Z44DdPojvbEGDstypDNUY69TL/kFE8Y3WNOkGEnc7gkDGhFwLv3aRFBMNqU8i4EF5QQiVcxbkJ1sp07HzSxW/1yzrlLH4jiC0GY3ShkamepyBjXfRJ9fJQYA9y1ivB2i0yBGrXr9G4gj3cjX5l8SKwoC0pA8w2k3hDEyb4207CpDBMumZH/R1OD598Jk++vx+nqGDGRrRCPj2qMVsmXxfVjoLyf0c7PfEUb1Bepq+97gR9H8xNIUOYFizACvPmplYasAyGNncb4CRhWug+ssMCBXltp+8aFw8lsUc6bQ3G8mTQ==
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9) by KUXPR01MB8117.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:a5::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Sat, 20 Jun
 2026 16:13:48 +0000
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612]) by SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612%5]) with mapi id 15.21.0139.011; Sat, 20 Jun 2026
 16:13:48 +0000
From: Ziyang Huang <hzyitc@outlook.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	cnsztl@gmail.com,
	csharper2005@gmail.com,
	mikhail.kshevetskiy@iopsys.eu,
	hzyitc@outlook.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] mtd: spinand: fmsh: add support for FM25G{01,02}B
Date: Sun, 21 Jun 2026 00:13:19 +0800
Message-ID: <SEYPR01MB58820CD8B60FF0712FF31B42C9E12@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <SEYPR01MB58821E380C5DD8F7B3FFDA23C9142@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
References: <SEYPR01MB58821E380C5DD8F7B3FFDA23C9142@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
X-ClientProxiedBy: TPYP295CA0049.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::13) To SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9)
X-Microsoft-Original-Message-ID: <20260620161319.363940-1-hzyitc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB5882:EE_|KUXPR01MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: a03058c1-247b-43d4-43f4-08decee6e8ae
X-Microsoft-Antispam: BCL:0;ARA:14566002|19110799012|4140399003|51005399006|23021999003|5072599009|8060799015|15080799012|25010399006|41001999006|24021099003|26104999009|40105399003|3412199025|440099028|10035399007|12091999003|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VPaKIprI4GoonjNAy51vswqBqPNMrPLahtjU4ojbn6dGm8SKseNbVwgNrSSF?=
 =?us-ascii?Q?bcO7hGCB8bY3Tx0Cwrfd01rZbfNv5jV4BwO+TZs4Ea8AJ84R7z0ktZykuBtZ?=
 =?us-ascii?Q?nbTP3uHv9dZokgqSQHIvTtrbZXMiSq8rXSeCHNHGCmrgKfTELCTBq8qh+52y?=
 =?us-ascii?Q?cWQeh2xQfrxIC1/m264l9vt2zWRV8GvnVCLCl4oWQuheoWyg/yUfSEDmYhgs?=
 =?us-ascii?Q?42x72BdprhF65nHGTlfT5QlejMeTN/6OTyVJTFYd+nwyEV+2swAcXNBXpq6m?=
 =?us-ascii?Q?302x/WXFgRQuLfKhznxwfiSxh0AXARj4VX2rvaoMCLPhe7wYnR7/8n2Iwfyk?=
 =?us-ascii?Q?toGoaUhkxkpZ+hL7LN6EKXq/mCpaZ/EhP5Hu4sboUtTJG712R87pCy3f+psm?=
 =?us-ascii?Q?aPfnhhRVrippdAOW/mhRJAkhi9eB+UJfIjvZEZTO0qQxjk5V3EQgCTDGul2Q?=
 =?us-ascii?Q?W5BKEqEBDgDOsAl14MEVRZIBIeGqSE2l3zSInrhRq9/m3Okm/1hC0Ih3uvc+?=
 =?us-ascii?Q?I9h8W/zAdt1J2wHoUYfgIIMnoK6egcHu4VLQHcR64iToi0OInBQDErMtvqIz?=
 =?us-ascii?Q?aLg5MJgsfYeMrTQIyHxsHP/U6wdoXdBAsB3zTcOTPrEWZfMnfNOYYenn3ysO?=
 =?us-ascii?Q?LK8prpQP/nGo4xoojcpVxivRs1VIDJjcu9RpdCNETtkQDvqN2TXzo172h3xb?=
 =?us-ascii?Q?ui6FWX/1Q0rh0ZDpNoJ4JAC7c2ScvnNws0IpCGzllgahQlGVZDpCro0ZH6SO?=
 =?us-ascii?Q?Bc7wyAIxGP3P6fKykx2RpaCKIbVlwJ5jYIsg413LkQ1j+Bke2jaX41J5Xyd5?=
 =?us-ascii?Q?T43l73a6p/8U88XQ9HA1noc/xVRcpmXr0T/Ypo5J+0qLsrVVBij+8pvNRu2x?=
 =?us-ascii?Q?9e1DYX0GytqlBpHlGY33HnNlbODSRr9GGsqHEwpjp/ChukGGPLbNUpBBhy2S?=
 =?us-ascii?Q?vxBVnFw8GGdR+vv23lxA49SAqijUKoIb4mew4bXtubyfzx7Wv+9Jb7VhR1/i?=
 =?us-ascii?Q?y5wY?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q5tnyn751qzrAKL8Fgl/t2GkfGxGbllz7i+JnDDw6Tj6IDg9EPUZO2TYrLu0?=
 =?us-ascii?Q?mzKQjvuAus2GIL+SIc29hUSY12f8wUdEZNMiIFNQCkgu9c7q1ZA851G2v6og?=
 =?us-ascii?Q?bE8Bg+WuPsJhYpzb0guop85fqlJ3BY9EhKGL8gvKFmr64YE8fhH7CU3ONlBX?=
 =?us-ascii?Q?3GQVdtqTiHy5ncNFC1BB4o7haRH03DuSf0+QsGudlcXx7JbHYmkokTuG7ovH?=
 =?us-ascii?Q?Cb6GOvFtn/YbycNo2z808wk1J5fIbMe1X01cseKbRDazT4vvr/PccrCgvAJW?=
 =?us-ascii?Q?bFWgqTqikF3LX9NQ2WTQQGKQeKbv2SAX76ZA3cQGSkjntbzotIVvllFEKP6U?=
 =?us-ascii?Q?S6fapnjw+bjRaIp581pjQUKqT7c8KOYt/gWmXAMQtPgBLNSjOLZoBzdfMSTf?=
 =?us-ascii?Q?Q5pa4/RCchkZKOOM15cOiQDc577iItpzRrdvHnGDVU/kan1zQRD9wo7VlMKG?=
 =?us-ascii?Q?xbXrMTrLI99l22TDtdaKrgW+n3ywKn43mRhhjOkfhPq7vxpA0/SDKHzpJ4B6?=
 =?us-ascii?Q?ZvX/1pfLxwVFTyj7cYuCOVam7GI/7USTXGYedh5yJr3gqzL7wLk6oSm/1Slg?=
 =?us-ascii?Q?AgcwibUGdSMULBlg8tMjupvU/2Ao9QeKlTY4nSqL6s1dqMfS6dvd8buszLL5?=
 =?us-ascii?Q?MCx+zErqndOIVYv2DVW0LVEySJXAm09P2jf6oZ/BgVSu9vf16OrHFgDsblyo?=
 =?us-ascii?Q?Z3YVRKo/a09RL5BX+rKIPAEqjRoSUXsw9gm9k9hjEQIYJRrOFL52ajjQaczz?=
 =?us-ascii?Q?q3IiiT4hVOih0b7vMqRUbI5mkmYFZ9SlpuJnNYXQfOblHOIT0MYtPH2n1FDg?=
 =?us-ascii?Q?7ATGbfZ9RmT2/iq30Xpk1u2UmFiQQmSKrMPOwgyNOm+fh30Zm+E6pOkbulXk?=
 =?us-ascii?Q?jdfz7jFNlO0uGUAoA32rk1cJVh1sJ6OBjsee+Jx+0/niFCnko4KqaaUAuBHI?=
 =?us-ascii?Q?aGJGFK7BEo1/kSsiVa4OQVv+pImyOj8Mw3mJbGV4ekWDB5ijq72rMLEKnf00?=
 =?us-ascii?Q?w7YIez14/heBRQNP5oHGn1QA1BeLHDIcUYo038XbGRYqwGJxp+mVbJq/jRPi?=
 =?us-ascii?Q?WRmMZWlMnnHDnWbsXJSmyfJWy6KwgrnFjauO0UojCXU0BEdt8SD/hZ9uxPe7?=
 =?us-ascii?Q?T5Cwm4+RZTRWoTtfMzQtTvqFeXCoeefUCNOurg6UShiG2NgQol7Vm6XWFMRp?=
 =?us-ascii?Q?KwnhgBrGCY2yyIKUuuihTQsv9KGCStJIkhPVswo9kwZtfdRib0wxH2EvXs5h?=
 =?us-ascii?Q?mm/34oXYZH4+AVbeX390io1ATjQ/EwyyU+9hgWOMUCzZNUJukEoIDyKmKom+?=
 =?us-ascii?Q?eGb3knmdxtVkRYEjPHO1pQJQasyVnqH91r9n/KHh9KAcaIJaLh+QcK8TRhGB?=
 =?us-ascii?Q?obFgMKeROhEnVNUt2tWKL2BvnVne?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03058c1-247b-43d4-43f4-08decee6e8ae
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB5882.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 16:13:47.8216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR01MB8117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_091403_776027_FBA38C18 
X-CRM114-Status: GOOD (  11.12  )
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

Add support for FudanMicro FM25S01B SPI NAND and FudanMicro FM25S02B SPI
NAND.

FM25G01B datasheet: https://www.fmsh.com/nvm/FM25G01B_ds_eng.pdf
FM25G02B datasheet: https://www.fmsh.com/nvm/FM25G02B_ds_eng.pdf

Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
---
Changes since v3:
  Remove the double empty line.

Changes since v2:
  More verbose commit message.
  Use only one section in fm25g01b_ooblayout_free().

Changes since v1:
  Fix copy-paste issue. (Correct FM25G01B size.)

 drivers/mtd/nand/spi/fmsh.c | 95 +++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/drivers/mtd/nand/spi/fmsh.c b/drivers/mtd/nand/spi/fmsh.c
index f417955f7d1c..598529f74694 100644
--- a/drivers/mtd/nand/spi/fmsh.c
+++ b/drivers/mtd/nand/spi/fmsh.c
@@ -9,6 +9,16 @@
 #include <linux/kernel.h>
 #include <linux/mtd/spinand.h>
 
+#define FM25G01B_STATUS_ECC_MASK		(7 << 4)
+	#define FM25G01B_STATUS_ECC_NO_BITFLIPS		(0 << 4)
+	#define FM25G01B_STATUS_ECC_1_3_BITFLIPS	(1 << 4)
+	#define FM25G01B_STATUS_ECC_4_BITFLIPS		(2 << 4)
+	#define FM25G01B_STATUS_ECC_5_BITFLIPS		(3 << 4)
+	#define FM25G01B_STATUS_ECC_6_BITFLIPS		(4 << 4)
+	#define FM25G01B_STATUS_ECC_7_BITFLIPS		(5 << 4)
+	#define FM25G01B_STATUS_ECC_8_BITFLIPS		(6 << 4)
+	#define FM25G01B_STATUS_ECC_UNCOR_ERROR		(7 << 4)
+
 #define FM25S01BI3_STATUS_ECC_MASK		(7 << 4)
 	#define FM25S01BI3_STATUS_ECC_NO_BITFLIPS	(0 << 4)
 	#define FM25S01BI3_STATUS_ECC_1_3_BITFLIPS	(1 << 4)
@@ -34,6 +44,66 @@ static SPINAND_OP_VARIANTS(update_cache_variants,
 		SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
 		SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
 
+static int fm25g01b_ooblayout_ecc(struct mtd_info *mtd, int section,
+				  struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = 64;
+	region->length = 64;
+
+	return 0;
+}
+
+static int fm25g01b_ooblayout_free(struct mtd_info *mtd, int section,
+				   struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/* reserve 2 bytes for the BBM */
+	region->offset = 2;
+	region->length = 62;
+
+	return 0;
+}
+
+static int fm25g01b_ecc_get_status(struct spinand_device *spinand,
+				   u8 status)
+{
+	switch (status & FM25S01BI3_STATUS_ECC_MASK) {
+	case FM25G01B_STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case FM25G01B_STATUS_ECC_1_3_BITFLIPS:
+		return 3;
+
+	case FM25G01B_STATUS_ECC_4_BITFLIPS:
+		return 4;
+
+	case FM25G01B_STATUS_ECC_5_BITFLIPS:
+		return 5;
+
+	case FM25G01B_STATUS_ECC_6_BITFLIPS:
+		return 6;
+
+	case FM25G01B_STATUS_ECC_7_BITFLIPS:
+		return 7;
+
+	case FM25G01B_STATUS_ECC_8_BITFLIPS:
+		return 8;
+
+	case FM25G01B_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
 static int fm25s01a_ooblayout_ecc(struct mtd_info *mtd, int section,
 				  struct mtd_oob_region *region)
 {
@@ -102,6 +172,11 @@ static int fm25s01bi3_ooblayout_free(struct mtd_info *mtd, int section,
 	return 0;
 }
 
+static const struct mtd_ooblayout_ops fm25g01b_ooblayout = {
+	.ecc = fm25g01b_ooblayout_ecc,
+	.free = fm25g01b_ooblayout_free,
+};
+
 static const struct mtd_ooblayout_ops fm25s01a_ooblayout = {
 	.ecc = fm25s01a_ooblayout_ecc,
 	.free = fm25s01a_ooblayout_free,
@@ -113,6 +188,26 @@ static const struct mtd_ooblayout_ops fm25s01bi3_ooblayout = {
 };
 
 static const struct spinand_info fmsh_spinand_table[] = {
+	SPINAND_INFO("FM25G01B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xd1),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 21, 1, 1, 1),
+		     NAND_ECCREQ(8, 528),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fm25g01b_ooblayout,
+				     fm25g01b_ecc_get_status)),
+	SPINAND_INFO("FM25G02B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xd2),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 41, 1, 1, 1),
+		     NAND_ECCREQ(8, 528),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&fm25g01b_ooblayout,
+				     fm25g01b_ecc_get_status)),
 	SPINAND_INFO("FM25S01A",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0xE4),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
