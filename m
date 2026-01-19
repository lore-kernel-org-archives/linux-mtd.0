Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76222C98315
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jan 2026 04:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y6uMyPoYi+nLuDXKN2IWSR7H78AzMSFZBtMKlkZolLw=; b=V99E08P+eEytFQ
	5hQipaavani92eEGGgc+e5ri3Pqtatfxg8VtkVzwt/7BwsCCges1w1cXFKABGR54BmYDxqhzJ4cgB
	v7iVcsIg8DrdaDIXvmZnM6Br/PwbdA0w+puc/0jiuYBiaQdR8nazBsgi9UyDC9OkSQQ/f5H5+k5xy
	+qzyrWxgJD8SKQ8eEPhiBdebYZ+33DiZnqbUk50EMaKLxM/NRRbXtfPRp387aTM1YJk2uASGmbksu
	DzzzY4obkcsXFu1jc48y3rJ/FZNKxbAxLyLiEnlMs/sSRAqXMA3Gt34EhczxDN+dIptCFwFrDEqLj
	1/zE4ODfIQgOwxl3/gHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhgTi-00000001Kww-2l9C;
	Mon, 19 Jan 2026 04:02:58 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhgTf-00000001Kwb-20Gg
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jan 2026 04:02:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yvv733HFXcRerSupzOoXFVXYsCsUI2EzPWOhWtJQnoeqNg3pc5g7PcP2esXccvQ4Qr9Lq7xu2ZCQGOo/CywVk3ewcTs9ixwHGk67FdKGhIaybv9H87oA0JptvWB+YD9J6W0/ySGLsg18x6OtyLdj32szBbeqAjVzYg9w3kpY9BX0ihHrmsBQa+aTCkVmh40yP33trnTqpXtNBUW0Wo3rOQrHqZ/gTStSU05+oHQVejvrDh7qkaTQobmcb3J5dhjq7xj1KcVdZzlSRqdrWiRJ325YpGD/vhkWHXGtuptsQqQtklpWQ8xviTocCvC15D1iFs484zTBpm8jH1sWFegEvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzlIQLxczTi/+y04lRo2ZGQkvJSRZ9f8PJV82xaEq8w=;
 b=LbUd2y37fII50pLuWigz4jMEdGhHo3OQwI3yEMabNnNRNEl2tk0+ks9r+N/Oq6L3fH3ZorG3xqKYv9h5BdGWH00+xHIZ7CYrb/GpSoErdiL9NUf9rHOVNjQhYii/MfC7NiWjTugS/Phl6ZvmV4x+RB/Qpfup4kt87X98wdyfugVx9VoF2UbchF1D9tuMvA4dWAtYwdj9WKNEUhekvfI40tJze2sj/hukH/7GbuiwmtEm8BwMc/q5vpTHPLg3NeGXpL1EzqG/9uKQJEAetX3v2LAESzp7hQhBfo0Aj3Lpgb9w3cwVJ8ohzWtKWa12DRcV8yp/3vvMdlbQVLOgf9bpjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzlIQLxczTi/+y04lRo2ZGQkvJSRZ9f8PJV82xaEq8w=;
 b=pO8OuTW/RVCyGM1MQ506mUJhZmkGaVT5PQgL24iXN4he1R4luy/C9XYE28FMUI39EekBr7TWBwlXgf5MJHaW0AiKnpfs38YUxoDQAM3Czqo09J4+YSbdUKYqLx4333gXKck75YHVw/lVBcuWhiA/WF9LUATsi1D35/8K2nyhu+ivcCYPmXKRHgHw0aR38EXdBhly9w+yKzE6mC/GkR/X6ztnAoBcHzawzxfegrnRsOcBu2dixPWxit72qHVjdzEDuLGLVt3axj7Qgw0cnsDDaaUMvjRK0PhDVozeJiebG3EpHJDTPtzf8HiHcvwiAKMqKofoRbK+dnBNs/LhwaYDAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by GV1PR08MB8474.eurprd08.prod.outlook.com (2603:10a6:150:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 04:02:47 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%4]) with mapi id 15.20.9520.005; Mon, 19 Jan 2026
 04:02:46 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH] mtd: spinand: add Foresee F35SQB002G flash support
Date: Mon, 19 Jan 2026 07:02:37 +0300
Message-ID: <20260119040237.775649-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
X-ClientProxiedBy: MI2P293CA0013.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::8) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|GV1PR08MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 5139944b-3c3b-4159-ae7e-08de570f9ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3gz/mNJfkR9hRO2EOsSr5BF9Yr2LrklUAMrDffSA6YL3Yh8DxhL1kYn3dCq+?=
 =?us-ascii?Q?CeT4hpwnan2j4TmqFuJhh1BejUiTGa/SfXbHRbteexXVclut7fCgYaG6wLDN?=
 =?us-ascii?Q?M6WMLIRuY7WnH8g2BMVfrCCW+P5reEcdXQSrDUWeKbqRoAlyhbK488E8OPy3?=
 =?us-ascii?Q?Qt3+gN7JLw6iddwH6eV+qWUZ2vt0VpcQRCHUfR0l89/+PI191kdZRwo7/ulL?=
 =?us-ascii?Q?YUWyfHwcAC0DFGIOaluK8sPDzSYK/69OzCJxI/S7j/erc2GFTUhP/5zcBl/h?=
 =?us-ascii?Q?5LHVhGHWNM9Ucdc0CBk62X6rT7HguIRmjAd3cplsnIBIBzKDGFz0EnOfQWre?=
 =?us-ascii?Q?nGaqFBVBe+ugbqRNVcL1EF/oIOjMfFhL20GDPUs/fhoiAd48trRlNWRvt/VJ?=
 =?us-ascii?Q?8FW51D+/bKi3ZRKi34bl0eAEH0jBoKsdOjm2xyuB+/Cn341BFLiyOJrD5A8C?=
 =?us-ascii?Q?zEW6MBEp2OjRSUjKOpbJ+nAwe2KxF1dNE/RHqc9pgkDy4R8fYmENrsmcBaee?=
 =?us-ascii?Q?tI+ZUbQrH+NgMTgJdI+oERjXellDffyrqWhbEgoMQ8kgSRojjgghgIFtQEPB?=
 =?us-ascii?Q?DBF6GRyfgjhLSPsA1FT0Qix/NyimOvfFQKKimqRn1oc45ieI5C5IqdgfWoaC?=
 =?us-ascii?Q?45/U6davASKl3WYHg6FDVb+zFsYPeQh9omullSiI5Upw5T9jWKpZ+PLo6m6H?=
 =?us-ascii?Q?HW3Dr7/ZFGRqzbNvN4cndFYiQUifhVTkgfcs8l/lj3+MalKJRTaZKJqJuT5N?=
 =?us-ascii?Q?jKugnWHEDDRkq+7vFx0ihhiwgeCKYHh0cvXy7XzORkKrXm12hTqXSeSzRY5h?=
 =?us-ascii?Q?nnZ98xv4G2MafqPzVoWHFfBA9bc10H5O0UiFXPDEw+i/P8V0iy0U9FDMxsGv?=
 =?us-ascii?Q?T8KQPx8J6G6RUOMagSMYrJoVkrMNv1aRzGqt+j94XT3NTdRjD1A6l5GQRfv9?=
 =?us-ascii?Q?b+94puL1MuIRdcsyA7T5uMf+a56i25NkPyL3au52S1CY/9YDJY7lBJkHdmez?=
 =?us-ascii?Q?lacNAC3DcnRiEn/0fVMgUjZ0qfgQ8jiLUeVrJ8xGHIfHD0m7TRcgUOklKvbI?=
 =?us-ascii?Q?sFzT5v2h4CTk0Axit3QxD0F0LU0JONvVHkNUUfG9VZCci1HkmkSJnwkXVPNx?=
 =?us-ascii?Q?cDE+M3xKcyCKONlvFU1afVGdWwAELXn5nhngdycLNSaKZMi5dBRw+hB+U+nz?=
 =?us-ascii?Q?cahy/Am61Bx4ZeONv8nrsc82tFmmiVzGm7ie9dOPNeASQZRpDFVtko/aUhx/?=
 =?us-ascii?Q?5TNFZvrziDj/aNNwV1JffdzivSWQaTToMSF7MQ2FQrQlm+Kge8lzxpjAcDr7?=
 =?us-ascii?Q?Z0oaFJoGtNs4UloDZXRpcm6ffd2cMz4JlmiG4sxerggsevdd84Xgx/Fo6X2a?=
 =?us-ascii?Q?SDRB+kmotBGyQB9BKJ/cfrZERG3EXmkQuhcyTS5UmDOiK2UyGJUz/SZpe8Or?=
 =?us-ascii?Q?FFMCDLSCBCC4jdhFF8PxP7zZn4Qi65tYSJLc6gg7qJ4o5Vsh3i8XOGQIiyxb?=
 =?us-ascii?Q?6ComeRr2HRU7FUK5NwU/i2obl1zVpWPfLJlQgBBwA6Ta0xCegurkYDBdiHZ9?=
 =?us-ascii?Q?3T80Xk58CedXeFOwVWIQOLxCldA3hyfGD3vh7bWn/K21aHeRKXsgmdTcOb1F?=
 =?us-ascii?Q?tgvjMWUo9khaadR6QFNqL7Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wpB1PBINmT1ExvkRP7745m+iqKZ55sKTkLoFyOH1au9gsjg1crxUtRRwI7ru?=
 =?us-ascii?Q?26rhRhbViaF1NuzHcnUyFnOmEefuVr+nh9ZIcmg3IrL2U8Dkedkv8Es+EroK?=
 =?us-ascii?Q?JkH26S7a3Pyc4wsY6RIzO6+NUP5V5Mg4QwQbskItuuDnPhddEraNpnjiDYqW?=
 =?us-ascii?Q?KX1Z3FqRAIv4qKdogyGcI+ahocdCfDbwmw8AMyYKEo3Lw3LXKuY0HuHeu6r6?=
 =?us-ascii?Q?ik5x1BPhM3vyxdovToXUcbBoo5hSeabx9LGyjy4ObMCdqQwvrnbqo0Nffl7j?=
 =?us-ascii?Q?9hvGIBx7049GcJDJRXW0+0xjKuNTRZertDLJEY4C/U8By2NpWK9s0Tmkqjdc?=
 =?us-ascii?Q?rMl88SajXcelzyFRwNQU5Yp2Tv+toxd/Zr8H7VVe8QW7wT28NAZmO+pG6upU?=
 =?us-ascii?Q?nLU6WG8UQxcAyDJi0N+vfg3WLvPyohkjmfaf7yJDuxy2YT1wr87VGREGbQc3?=
 =?us-ascii?Q?5F+bHIlje0ZxUd4RtDVCWSmulj7c+OJoVxa5VGtvmPnRjAhQ/J5kqP38UD7Q?=
 =?us-ascii?Q?23TIePy38a3mWMtGcHEPHTwf4iNMtz+I0V/lQCHoGP2NCQPXrgOiUN+2wT6M?=
 =?us-ascii?Q?4NaRC78qw5HA5qEVfCokE1IrCEMKeIqMefP6EfsUXHwPM2mLCbLyi4/aRpkk?=
 =?us-ascii?Q?c0eeCRRED3jmLZDBumDCHlRHRZgDSBkql3H6b6baeQZfLX4QnunbHwr/4mJU?=
 =?us-ascii?Q?9l3MKE91X23SCACxSxt6j5nq7GFb6tDa0K2Jewou0SgqrtKCckZn4C4oU3ux?=
 =?us-ascii?Q?r0PDHovDK7rLU4KWmTK2pnxMOmLTyAAsR1dWvN7WvooIGz/+VoR8gQKunRZ9?=
 =?us-ascii?Q?Nc6gK5fBcSI1vVE8d1DqzklqI7tVYzu6gnFo13KNgtMHp8ldoKVsLuOHlc5k?=
 =?us-ascii?Q?OHxsVrmG+nShDylup2sHFBKV9TSLCi34mx4gEcY+8G42K5N1NfpOLyA1LhzZ?=
 =?us-ascii?Q?GaUEndb6LgQhjpEyGP76dJ16DFbFrcasLh1Cy8WrXQ2trrX0xxbbp9ea4V5D?=
 =?us-ascii?Q?s45JH51dBI1Mj6qOzhE2iPUoukErQ2cmOkfXC529fIYrBRXAyarGtLXe4Fep?=
 =?us-ascii?Q?X2gnWidBb7OL8+QXnvOeCza9Gb9L9sZgK52PDuNRuAPbxuS97a03eCqvcF0o?=
 =?us-ascii?Q?OKglLY0BaoIBZY0ecuvqkYkpdQU1FgPNtMxRbqpkN9JZ0uApoLer8yWVpTF7?=
 =?us-ascii?Q?hu2HuoJCXqZ6HjaOB8nFxevghtBXvBE2RdB6kYeihsQOe/PdoWpWBscypiZR?=
 =?us-ascii?Q?oK2QKQ4V7cG3urVGWBUJV7gvlSODgeilfwsB0fTx27CWq2eQnfnZ/yMj/jXw?=
 =?us-ascii?Q?DAhS4r6cXfhsW/oUMFtX1TqOQtF4w9P1qsLa+rSGTddm3TtNss9cEmYu0D14?=
 =?us-ascii?Q?v+ODbCkUZxpGhnL+8HtBTe19w5SE1Ho5RP9vRgq1M4Six4KNjc8weF7mIQBK?=
 =?us-ascii?Q?UjGJggx2Oml0VEECzbusUNuE5f2HV4IPUKdXIm1Kj7S5ckEM3xzMFrtgcM1K?=
 =?us-ascii?Q?xp50TPnYICMVHK74LtC+5IDwLcAAUsMW87pWKcSKwc1pR2reG2+oOGjD3FZI?=
 =?us-ascii?Q?qL0OipjBdprQz+Bn6RjU3ogqKWIcBEgC38s58gf6bFLd3mGbv0auSZbO4Q8H?=
 =?us-ascii?Q?12yRGFSxdK8HGp1Qj1irPlERN1XkZbezpRpsh7sWKp5eby4acodNkQ/LwxzL?=
 =?us-ascii?Q?vAB960eZZV6zcGqlgVZ4Sz7NORjkzFSxb7OMMpzLxJYhl5GNWI85k5mv6Gjd?=
 =?us-ascii?Q?6HOTM2q9Tbd4HhG1ln5jKyqNlle3RZw=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: 5139944b-3c3b-4159-ae7e-08de570f9ab7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 04:02:46.8221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EMY3J7lF82vaObRXD7NXnj9kA3l8crdEr9yKTM4aFc4XIfPNLUHL01mMxjfGsynrboqPofxhEt412uHfts6Sr3M0j+mWvTNs4WNT7Dqsc7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8474
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_200256_017997_D410679E 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Add support of Foresee F35SQB002G spinand flash

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 drivers/mtd/nand/spi/foresee.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/mtd/nand/spi/foresee.c b/drivers/mtd/nand/spi/foresee.c
index c521dd6abc4b..5ff18316092c 100644
--- a/drivers/mtd/nand/spi/foresee.c
+++ b/drivers/mtd/nand/spi/foresee.c
@@ -11,6 +11,11 @@
 
 #define SPINAND_MFR_FORESEE		0xCD
 
+#define F35SQB002G_STATUS_ECC_MASK		(7 << 4)
+#define F35SQB002G_STATUS_ECC_NO_BITFLIPS	(0 << 4)
+#define F35SQB002G_STATUS_ECC_1_3_BITFLIPS	(1 << 4)
+#define F35SQB002G_STATUS_ECC_UNCOR_ERROR	(7 << 4)
+
 static SPINAND_OP_VARIANTS(read_cache_variants,
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
 		SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0, 0),
@@ -70,6 +75,25 @@ static int f35sqa002g_ecc_get_status(struct spinand_device *spinand, u8 status)
 	return -EBADMSG;
 }
 
+static int f35sqb002g_ecc_get_status(struct spinand_device *spinand, u8 status)
+{
+	switch (status & F35SQB002G_STATUS_ECC_MASK) {
+	case F35SQB002G_STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case F35SQB002G_STATUS_ECC_1_3_BITFLIPS:
+		return 3;
+
+	case F35SQB002G_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+
+	default: /* (2 << 4) through (6 << 4) are 4-8 corrected errors */
+		return ((status & F35SQB002G_STATUS_ECC_MASK) >> 4) + 2;
+	}
+
+	return -EINVAL;
+}
+
 static const struct spinand_info foresee_spinand_table[] = {
 	SPINAND_INFO("F35SQA002G",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x72, 0x72),
@@ -91,6 +115,16 @@ static const struct spinand_info foresee_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&f35sqa002g_ooblayout,
 				     f35sqa002g_ecc_get_status)),
+	SPINAND_INFO("F35SQB002G",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x52, 0x52),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&f35sqa002g_ooblayout,
+				     f35sqb002g_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops foresee_spinand_manuf_ops = {
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
