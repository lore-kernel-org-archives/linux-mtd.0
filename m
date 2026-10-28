Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B993606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 12:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qKHtB8Hl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=E0ltjMdMMGvgY2E0e6pOsdxJX5sYOgUVLBK8w7jnQvw=; b=qKHtB8HlT+zsjYFX1aDFyRw8D0
	35mipSTbBoaA00g3lf/SGQU4LoYeFiXrenh0K+bIOlNJGYRcwipQM4mu3m2T3Bj/8I6s/uuYeXwuQ
	gluzVt2gG6Lye12wAc4IUTbuaypF+mw9sNP67Oq0Ynd+shPaMkwVDdqV2Bwu2AtqdpSjKQx+6hJg/
	wsKUtQWcgAAajHozovfXfd29UYxZw0V2c03ecrhBmSn5ERUdOoQ6mL74KFJrdWdT8cVo7zBWO3bUi
	hG/kgQf88rjvhstw/9zms5PRfBLV1j2MZOle4mRosqILDMVzn2Vg5ALYLSEyN2dx/hepoGE53kTMw
	1uiL5W9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2VP-00000006vkp-3G8h;
	Wed, 28 Oct 2026 12:11:47 +0000
Received: from mail-sh0chn02on2071f.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::71f] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2VL-00000006vgh-3QWH
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 12:11:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgZdmNB47lqdsHlE7pzZDkYHMBx3Fgzh5YJKsTOey4dyqmw35YfpAJ+KKjL9hS4UBNmDzDJdY/rddkRYUo7qZVGqBWelwD0hsHC4jyBgh2W9ejIngn01hxL6MZYAO+tKhiUmuv5iv67genAfgYSF7DslkAj5uyNEvWOXwaaNgmLeR6E8rvTpFcQzI6/JPJ9Cf1qHRUHdg7sFvcYr2GyoM3LbywSSlSb1SoBrQ6aB4Lcin+4s2Pf3AZaCCtS1uONxzd1g2k3vbPty9XuduPC7HvCoNQaEEqeOJERYu2ASB3dNRn/mYISpOq62vB4EteYDCBj5lsRRLBFMOU3rcdHUlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rnjUPM2GuS95A+lP0lgI41j+KRXHz8rqkEMXUcDlNZA=;
 b=Q/l7itRxQn/ZVOjdv2SGW8ai/Smx6eCVPN0Xwuv/LcFYGVOQXvFW5CGBe5DeSqWqvmD9hSPSrRSZt60Ty9DruXqeCd8Z2yG6wR5/of/K1lJgbMy0a2dS4kULoyfOI4mTrpHe5xGwD6bJ79vJV+yOKS/UcSPsSxO8/6DV3KoLiVWz8jla7D6kZrES0wi3uNKOcQBaER7TnhmeisEwy6jwm7TuyWwdJDnVv7EIQK/V3NkQEbRa5UMrlQc99JLhj/bYaJOSJtnxX/M6iCCYSAKRDXAUoloUX+FECHe444Eecufe9gvS2QXVvZzJehBLzrMb8RAFQMcMoiinU9kFop7UpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 12:11:25 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%4])
 with mapi id 15.21.0546.021; Wed, 28 Oct 2026 12:11:25 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Mark Brown <broonie@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 4/5] mtd: spi-nor: debugfs: Correct DTR protocol names for 1S-xD-xD modes
Date: Wed, 28 Oct 2026 05:10:59 -0700
Message-Id: <20261028121100.79667-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261028121100.79667-1-changhuang.liang@starfivetech.com>
References: <20261028121100.79667-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0007.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::14) To NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1216:EE_|NT0PR01MB1070:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d15b1f-285a-48ca-ab78-08df34ec9668
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|7416014|366016|261021121427099003|261022075727099003|261021123027099003|261009223027099003|10067099003|56012099006|3023799007|18002099003|22082099003|261026121527099003|38350700014;
X-Microsoft-Antispam-Message-Info: SJJcUnFlmRTLc2gouKgV+gZfI79unTp/cWiA033usFlaQSGABTca32FELtLZoM5kjVP6R1xr/y/GlwxAD3boXmbrks6oR9RSyg8VySCE14TdHN1qaYBPZBAutTgLvdLmvibK4S60pPI2W2VcyJzqeyJDDgDqzjynps+vJpj1ilgKTH+wr5usv6jWc/KTZYOQqxq0txwHNSQ+94k7nk0oOhpVDZZBP6VBRnhKvkFMm7+ijFIWFgMl97BMGjktM5/2+8i0otx7PXLLoth9waEBcz9cEF76V/lgP4SzaCsiQO7x9TaVFS/kAcWoYp1OjoGzT6A4SXIpGQlgNNm7UFKh5QneurP8sulH1lxu9ANx/nz9LAM/iv51H7u79vY4nN1SiMfDx+LmMwoGBM/Ej7BxwjGT2Kmxd1fPewD08l+83ArF/WyFHj9iYrEkyQ7J2BerQu5TZN6JVtYjfPeQEvJIXLviZ2Z9cBnSKK3fQexh9l+ev91nnjOAB7OvhOVDnzDI0Z6nWdadwvTOSfrdXrAtxAstwnwDcPrPEN29bMD6YAPsEn4H7AK+YMkWD/ZR01+q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(7416014)(366016)(261021121427099003)(261022075727099003)(261021123027099003)(261009223027099003)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(261026121527099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q6vARmy3Kgh8ApWepvxrCS1UdF22QO2+yXWpEAU7fSrXZF1LLV6+xnuQasR3?=
 =?us-ascii?Q?mssZx9qKhTVR/KEyVmnDMiRB+93JpOSDCPyiyB/JjClpE1YTjmvZa8lZFz+q?=
 =?us-ascii?Q?pw4EsfdDFqYGdDk2VZXsmyCAnAlo7P4y/3iGPLGyS/JEgi6XFU4sgl9/UZjp?=
 =?us-ascii?Q?58jnNjcT/2cpIx1Ii1f1dGK4MLvMJWGGL5hudh8AlvjyPxWGDNjqK0ZBU1VA?=
 =?us-ascii?Q?hdObqwqF9jOyy9J7I5nDnq7AVQsxy+U9EZmnuJ8jwK0FV/c497xFfibmyq4y?=
 =?us-ascii?Q?57FTIhTnKio2XY/RR4BdWBOVtUyKi8zaU+jyYkcLbEtBz0YaKoTYSbuzIKeG?=
 =?us-ascii?Q?HFEuP0jM9nbr+0hB/zlYz0CUETxidU8fKOzj8DWDlSDUcpml+KdY19+vZ/bS?=
 =?us-ascii?Q?2SPsvj7NCdopXTOfRvF43OX93fqDpHOZjRl058burnXOG+6iZ5Utfixll2Zc?=
 =?us-ascii?Q?K7mqJi/8aXjRFMauTQDIFs8pdZUyRrwDt0S4GfW4QLTbhYPijoPNxQZtePZ5?=
 =?us-ascii?Q?pgPECrhXOebsugYbb0grOJzSDTQVOPlD5NlSKIsObejc4+ajjaHednTBLWn6?=
 =?us-ascii?Q?U87udvkADlLmqBZfWV3y89RlKyRWjRnqXcJBdwactttLONQWYL+bvYJ36eyQ?=
 =?us-ascii?Q?4Zx1NQ978JBlNP8UbfqBj2VHzeuJdX+nH/OxK7+lUGYGd1bXSG2tcOlNeXEf?=
 =?us-ascii?Q?iBansWV2JFKuOrxnb0fBkeOIw9TzCmQnYkqlTjCJ9+/F1x5VP/kKpUCSNjTt?=
 =?us-ascii?Q?1FyiskWfTDIwtsbTID3En3njLUfYpk6SF8Z5rpNLw00qDZ+0ZACHMDhxtWSa?=
 =?us-ascii?Q?BYYhOxV97yTuTYXKSU6uoTsTaTyjZnY4p4A8wQqDNUb6UrUZ4AVZI20Q+4xA?=
 =?us-ascii?Q?rVt9MNPts4LTBFa1rfp8TtyxpAkD1tEkn71/Zf4lQw/txH63g03VC7VfJc9Q?=
 =?us-ascii?Q?Ln7triNSXbEyxtkP9KZWslBJzyXJZwjeJYAy+XsNENmT0gxEgiFT/rUMVzNJ?=
 =?us-ascii?Q?qjuRfm7OkWs54pDn74UZzcsPOABgEuvAxKRY4/6XsB5JT1mY/lX7iQVIqxQp?=
 =?us-ascii?Q?LdAYM/p9AxiSItvtdMSPEQcRBQ4yP75GEuimZeU07G5REyCTNNY4M5KDnKAA?=
 =?us-ascii?Q?jPEhbIxeEFj54edF27d3hDQ5ECYOYldEfGqzXcbMgZacEtfEVSmEk7FbgF4I?=
 =?us-ascii?Q?yU22VQ5hFVIhj7OvRqRVSyyH382jWzvrp/1Lv3vOJAwF0/Joq/1khuLJ0t8Z?=
 =?us-ascii?Q?4o2AZvyu3/gESGh/k8VF98CnEgLkpI4uwHlvwyCRxiNMo4rPtLdjUpOmTLxm?=
 =?us-ascii?Q?JjeMTyGB4AgqqGcMbyzcvaonAbAyGF0NRpNYP8kDsW5qhJvZAteJbEvWNhyx?=
 =?us-ascii?Q?5hoxtGmQbzr6hephbq6TMS8Hf/AFccfyCi0KXBvPLlhqzQWDh9rUZiSWbzGB?=
 =?us-ascii?Q?BR0Sb0CE6P7Q2NhjRszTgq+3yvhhPR13p7KrlCk26Gs6tGQoVl4TScF1fF7Z?=
 =?us-ascii?Q?4DNyVRlGGjZT7PJ8VjrWosOT0jqHwOdUfvIw2m01NgWAHusTPLGNEqnezSxX?=
 =?us-ascii?Q?XIhU8mEg5BPx5Nt/V/bZsILJDVDkis1eySlVzZr1w8/JydZ7z62o37fQy4Fv?=
 =?us-ascii?Q?z2dBE7kz7UkYgg+Pup4C+M+K1DE0h/LL8M5rV+wHp33wgT608tfJaOSS813n?=
 =?us-ascii?Q?HKWrnwyUjPCw0ed2gS8o+gh2dM8nsSxZOu73J1UyWhLl0kbCCl0GAqC9cdhR?=
 =?us-ascii?Q?vHyxmCJIXZVHOKcJqLztiS2rvWIX1VapBTdiuDIfxDCoB2jHROVh?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d15b1f-285a-48ca-ab78-08df34ec9668
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 12:11:25.1741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v/PpUp5l3YcTKBGuu37W2xuzwxduobB57TK4cveJu9eXlYBLtjVcbtKkyhrZKPJtl7p0Go52UfWO042cRmhl8HClBO88mVLmdeZJg/LovjK2o5qra/EUnVBD1gGB2ppq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_051143_880315_E8B9D91C 
X-CRM114-Status: GOOD (  10.85  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The debugfs protocol names for the mixed DTR modes (1-1-1, 1-2-2,
1-4-4, 1-8-8) currently print the command phase as "1D", i.e. dual
transfer on a single line.  That does not match the protocol
definition: these modes issue the opcode on a single line in single
data rate (S), and only the address, dummy and data phases use DTR
(D).  The "1D" prefix is therefore wrong.

Rename them to "1S-xD-xD" so the names reflect that the first phase
is single-data-rate on one line, consistent with the "8D-8D-8D"
naming for SNOR_PROTO_8_8_8_DTR.

This only changes the strings printed by debugfs; no functional
behavior is affected.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/debugfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index 3f8d586a7622..f9ec5697aab0 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -45,10 +45,10 @@ static const char *spi_nor_protocol_name(enum spi_nor_protocol proto)
 	case SNOR_PROTO_2_2_2:     return "2S-2S-2S";
 	case SNOR_PROTO_4_4_4:     return "4S-4S-4S";
 	case SNOR_PROTO_8_8_8:     return "8S-8S-8S";
-	case SNOR_PROTO_1_1_1_DTR: return "1D-1D-1D";
-	case SNOR_PROTO_1_2_2_DTR: return "1D-2D-2D";
-	case SNOR_PROTO_1_4_4_DTR: return "1D-4D-4D";
-	case SNOR_PROTO_1_8_8_DTR: return "1D-8D-8D";
+	case SNOR_PROTO_1_1_1_DTR: return "1S-1D-1D";
+	case SNOR_PROTO_1_2_2_DTR: return "1S-2D-2D";
+	case SNOR_PROTO_1_4_4_DTR: return "1S-4D-4D";
+	case SNOR_PROTO_1_8_8_DTR: return "1S-8D-8D";
 	case SNOR_PROTO_8_8_8_DTR: return "8D-8D-8D";
 	}
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
