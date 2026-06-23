Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8420DCDB479
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Jun 2026 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4RluaufgC3BnqZCUPMUSetEEj2BfZ5SK+heHKQj34z4=; b=3DOn7WBKwoL5//
	pN34bTJqrDO2zEUa6HeRSMvP234yMu7nWLxU/8oC6NnoP+9GDOaDT/gxm80mp8JFkUno+ml1Izhuf
	BJNHYeTYkKo22NYJcE8EPTOJZnik4ZioNce3mMbO6ZN/kl03+J0N8PtqdZPyv2RtH/o15rE6ptKro
	CciWceKu6O6uj9p0f63NvcgJ3poO5oXoubDA1wP5bayEbdumjhV26wD3Qzj2bq4WRTv2tyOyJwkiQ
	OQGiKuFZo2gJ2jue0GRXmgrCCQhg8bdwqx3u/WoeiAXGBi7EVacJM7PsScsyOpsdNY0sUmfxn4fDQ
	3bZsRaAk0XNy2h4qxvNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2We-00000006UI1-1PEG;
	Tue, 23 Jun 2026 14:54:56 +0000
Received: from mail-koreacentralazolkn190130003.outbound.protection.outlook.com ([2a01:111:f403:d40f::3] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2WY-00000006UHU-2Ena
	for linux-mtd@lists.infradead.org;
	Tue, 23 Jun 2026 14:54:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6d1CGNavJmboa1w7zGOEm6m1Uv7twKchKluCQYF2lomnbFmMHG2MsmPojTS8EeEsKmxkvP5WQ3w8m80gwVs4InCM2mUXi62WRItaLdSDBxx5UfXI7UvacpADIwqv7Y+cQbYJlMQkhpRJW1NC69ES1C0FzccfLSTdvCDPljPmo4f+WOLC81l4KHJ/TREPJMHwQu+F66eIFHif2ydq5xbCwh6xjYh1Pb7urp6t9+NEv8COp+o+aOm9JoYNwbRTIkaV3el+m0c7LCUowPsYV9jjdfuhvkmd1UPjxNl5fkaQJxRdAZyOuhfGic1RW1F9uedwbqrgVd0Hn0aNGeGB4W4Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lWarfS61uejDnnVNmttDbvkEs7kJvK703e4PGgDuUM=;
 b=kep0d0jgjQPRHl6M3cAk5Q9dsXyVDjjN9bHrPgT4R+zZcoNxfNiccsz3ZpDVJdqzesxnOnP72ogUzCc5Vmfa8YM4FZCUni7bmYFnnZujwO5EPuzLmjMU0d+Y6uXkmuzqjE9YzHL+CstfmXjpEm88VUFrfNQF7X1VCqr2iR7B7Jq+VmcpIdWZEhJdEIpgzoQgLDIfYD707cLhCNnqMo34ZXDaqGpEpuJcL++MWbBiYk4KeMBEF0EqvsIBcI4KwczQOGnmLgChmtoictwxTd9l2Ejndp3wVNaE12DNO3jyBDebJ2znY1oO/hW7xX7mWze8p3WZGpwdQrdG0zcGExKWwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lWarfS61uejDnnVNmttDbvkEs7kJvK703e4PGgDuUM=;
 b=ensK+skV8KF30QKLGAtKNFZfD3/cXs1IL/qmncq1nmXtAHm5lqJ7Wb474JVHQcqGPkWahOtpAUhvGKnT70CHPX5NTftwsXhKfiGpumXHZQ3YejxVje9SUkYuHcSMqtdJUxJDZ9d2R8rJjAKApWY4PfuQOQklLtKv6L7oAMx3hOUlZFHVIH6u7GtbwV55dEtIBhwzMMgl3tSqOHlIan/V/4Jl/NARhz46DMYvt3yjzc/rQDRP0+UpZaVzDwTlLxuRPvAogTijJeBaQvSwxQC+TGaraTrLg5Tomul35uQVnIn+cv1kaFgZz0iQI7h6KDgW3JOjD+e3FNdSaT7+MlqW7w==
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9) by SEYPR01MB5810.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1a6::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Tue, 23 Jun
 2026 14:54:35 +0000
Received: from SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612]) by SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 ([fe80::36dc:66d8:26a6:5612%5]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 14:54:35 +0000
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
Subject: [PATCH v5] mtd: spinand: fmsh: add support for FM25G{01,02}B
Date: Tue, 23 Jun 2026 22:54:22 +0800
Message-ID: <SEYPR01MB5882BF9E8BB94DA488A3A2ABC9EE2@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <SEYPR01MB58820CD8B60FF0712FF31B42C9E12@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
References: <SEYPR01MB58820CD8B60FF0712FF31B42C9E12@SEYPR01MB5882.apcprd01.prod.exchangelabs.com>
X-ClientProxiedBy: TP0P295CA0032.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::20) To SEYPR01MB5882.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1e1::9)
X-Microsoft-Original-Message-ID: <20260623145422.377934-1-hzyitc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR01MB5882:EE_|SEYPR01MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: c466deed-fee5-4095-b56e-08ded137573a
X-Microsoft-Antispam: BCL:0;ARA:14566002|51005399006|23021999003|15080799012|24021099003|4140399003|5072599009|41001999006|8060799015|19110799012|25010399006|10035399007|12091999003|440099028|3412199025|40105399003|26104999009|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?isSmiFdzX0Xt1zIxwx9xexhQTT8UlDY7tpdyE+l6+lXwW+hWPbB4/TzSMSxE?=
 =?us-ascii?Q?s4vhMbhkEh+YACiOKMJcTk7zDR/TydIafa6BE1zvcEZfU7NXYIq/aEdpdbw2?=
 =?us-ascii?Q?CBZ8Q/oOqrN6apO0WTnvyzbdpFoLLUqS6/xmO6MvU+oum23gNRAcCXVSSbTR?=
 =?us-ascii?Q?E6eVT/h6ihIpWApzlZikOjOD769pyqzhPhQhzgIatNSwxak+vXIOnT7Zt0p8?=
 =?us-ascii?Q?6g2Vn7wPcmSMh8HV5OLsQtxvoL2wRt6I1CdWkDfBHckG0Bj9654J3Q8kPY+A?=
 =?us-ascii?Q?HYbL+D/qVcm9rYiXGDAVt6SSt3PRJ35pFgqw4Ek/zFheWi0/p8UbF0CkKpzZ?=
 =?us-ascii?Q?DexNBM5sUdV1txm+CuAKzSmEBRFxcWKQKYrJVk124XIprrZytpDvdFfX/IYl?=
 =?us-ascii?Q?QpOadW/P+k2M7+Q4ABkmP/N/GhNQlkc2v1BnO7mFP9KjgfMUHnGEbnh0bi+4?=
 =?us-ascii?Q?jy9Ki6LgnzvV1FKOU1YE8IkPrD6ZljkAbt3g0t5nxt3LEvr8JEcU2ImAqYpD?=
 =?us-ascii?Q?3BWtJI8Wemo2sSfho8/TgSqjgcZr+xcrjY6eBbUuF0NEQ6Dmtr8cdR0hnJCf?=
 =?us-ascii?Q?XMseEukWOrbFZtfL6iq/Aohocn9gear9Ry1ewn/ac6fTNn6ajj69D/0yEKih?=
 =?us-ascii?Q?vdOgrO/NtAuP48RdMidfKo3vi0eLAkuCgWLJnj5QD4c3BIoL9vLEZOJCQ/7Z?=
 =?us-ascii?Q?+sxCvzdvLpfKPxFQm40B8jcAntukl9FN9Sb9qWZ/iQK9uhJHT/NnCcQDWhFl?=
 =?us-ascii?Q?5qCJg53RQMapSHF0FIv/6ZEmYQ/R51TJBEyqLaoXloMONKFrFK3eRd5u0D/J?=
 =?us-ascii?Q?sMCuXucr4Oau+Rcdm7msfYtWq3hmlxoZmketcshXZ5v2Ng6cXJ3uocleSWHN?=
 =?us-ascii?Q?vnPWDIJ7GqPHlybmwZ2WzsxsJ+2UmTY/qBE1gqdrpIFv8IOKt0ZjF2SDakAH?=
 =?us-ascii?Q?kpX7fSlai/r0740ii8oDh5i67ie4zqbF+SnAQ7jMipmd1qXwImIcSHB7Xmv2?=
 =?us-ascii?Q?n82F?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X+i+7bY8cEk88Hu3trVWCry8T6w9NR0SLlZSWYrjlwZPNEmqGZKqeOrBFJM3?=
 =?us-ascii?Q?B66onX22cfdS8Mb+J9oVXC4ef5iJrPEndsjWqmOlUDeBl5IuaUJyFkp46HDX?=
 =?us-ascii?Q?KDnKOP0A7BDJYJsrm5fkecetjfw1BXw3v3VlwW2Vlkz/FS5qXZ7rGmu+NCj5?=
 =?us-ascii?Q?KnspXZV4PPkZIKKqTXwj6hknH+ZCQjfnAMCOWcdopy6HoG3j2V1CHvAbb4Fa?=
 =?us-ascii?Q?qbJW8J6Brobu5kn8SpYXOZzbrK6WhOMMRk/YIZECIphjPHPIVeBmpeTfoLZL?=
 =?us-ascii?Q?0kj2sRuxzbG8o7lG7wPO/RnJzEnt3Zp3T6RhmIoN8k3MBsJ3qMyf/ndZwYRF?=
 =?us-ascii?Q?Ty8bWLEdZCXoK1mnY2tJ+NSRTulc7cJcThs5tKtt0H6a2drMrXkYSfo+xqaH?=
 =?us-ascii?Q?xb6TeT/o4xi4E5MLpRLl27lpbbYl1KtPbeUae9/2a5SBP8MmuUPob2wHABQW?=
 =?us-ascii?Q?fL/Sqr3Ya6IKS3sKBuvXwiik3q14RVLGJ3FCzRMZXWTaDOdKUIYnZ6xav+pf?=
 =?us-ascii?Q?FBqTl4f967QhM6Wluu8eGfkm7JHjxr2uYL60UfIKf76OchQyanDdTsYt2eNt?=
 =?us-ascii?Q?kKQPfVRuIs4cHSVhRXCDOPPlVdg1ypFUnvNWphH3fxWE/MylDKEv4yh3BUHp?=
 =?us-ascii?Q?Tg5NO/reoBCLohu/0ORY1O/59KN/KR05jC5jwliO5fKLbOtZtSJYi8B7EmcU?=
 =?us-ascii?Q?YKEyfzsTIX1WxOrNBsTd1dqOr7ZDLyCDhQqbUG80kOJFZIWgrPzziXI+/cm+?=
 =?us-ascii?Q?3nnU/lWUNziLug75Yfs4IW1KWDlQ8yAxir0CRpJlgR4vugTcGQGPBPmdf4Ve?=
 =?us-ascii?Q?tK9x6wGg4QS/+r1N1EQ0HGkAM+zGekxDNFpKDBQh0oXKTAZviWAtuBLgw5LC?=
 =?us-ascii?Q?0TDo8fqOgvUC+LMq7ylJ2u6Uxp5tN1aX2FMGQlY8fr/X07jFAJXHlMjeLEz/?=
 =?us-ascii?Q?hcI7eHAzPy/mGw7h9ATH8dLq7ejsZ6j4dxYgB9fN2tG+R61uqM+NHsNUaf7O?=
 =?us-ascii?Q?XX+SGWi3FP6Uk1r4YeOZvM9G3KYUm46cPWET5JGmDlDybmJ40lbUCaADesFB?=
 =?us-ascii?Q?T4aS1tOC9ldbe2gUS3PEL6JMveoI1/5KAXAgYbf6hjPU1jaQ6esvjR9ewbaF?=
 =?us-ascii?Q?gIUir84WAcG0YUR7OiN+DUKse9vI2L96HDqoJsh3woYQIrdL/guXtZAWj6bd?=
 =?us-ascii?Q?lXMTriYK/zgycb7S1YEc1eaMyjElKZMcmEHEFsDnw194qzrU4I61tDe3thZE?=
 =?us-ascii?Q?VtN8Yr7iDWMNipGv54Anff9FSabrbjzWzxOjAHXQRYVVPfjorSddZz2Ph0qK?=
 =?us-ascii?Q?XlpxgEjYJxMggf1FUpfaern545ZUGU5sDwZj3x0GSX+DjWsMmsg57f/Skuv9?=
 =?us-ascii?Q?tZyjDC8=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c466deed-fee5-4095-b56e-08ded137573a
X-MS-Exchange-CrossTenant-AuthSource: SEYPR01MB5882.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 14:54:35.4615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR01MB5810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_075450_601955_4C8A2FF9 
X-CRM114-Status: GOOD (  12.42  )
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

Add support for FudanMicro FM25G01B SPI NAND and FudanMicro FM25G02B SPI
NAND.

FM25G01B datasheet: https://www.fmsh.com/nvm/FM25G01B_ds_eng.pdf
FM25G02B datasheet: https://www.fmsh.com/nvm/FM25G02B_ds_eng.pdf

Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
---
Changes since v4:
  Use correct macro (FM25S01BI3_STATUS_ECC_MASK -> FM25G01B_STATUS_ECC_MASK).
  Correct the chip names in commit message (FM25S{01,02}B -> FM25G{01,02}B).

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
index f417955f7d1c..be5db9f9502b 100644
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
+	switch (status & FM25G01B_STATUS_ECC_MASK) {
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
