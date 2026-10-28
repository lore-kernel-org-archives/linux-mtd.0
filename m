Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79611606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2026 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xUIv/DET
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=O31Ts69MdLar1mRCbjV/OdAksXJet5rXjaNytoxEpTg=; b=xUIv/DETQvDeeiscyYOy9bGMnd
	ipLNuU2K66RQ33fifgp7MrVcqgtcTX6DlEmjCSXF4MK8Aqtpwt6zTLobavSwrS1uSyPQDX9sRxWWD
	ASyYuaiNqfBdBNe4Y8ojGR4rhG7Pm+w2vyO7/O8/W1pBiGuCeBQaI6PBA9f9gyGNKvOs1zTxqtFKA
	qG808R1Fd/Fdm/6CK9wPoWIQc+aO7rFVbJpG3D/CPdcmt3ydgworKTNRED2a0nEKmMFcQbuCn+XsL
	xmyuqyoyPKwmZXcg8qwkzKmfjqsQv5VUwMKbLOqxjZPhA8luLSjn7AkKSw8p5P67ktLcjOFy9i4jG
	ZpDjctbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2VR-00000006vnI-0pWh;
	Wed, 28 Oct 2026 12:11:49 +0000
Received: from mail-sh0chn02on2071f.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::71f] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2VP-00000006vgh-1Qbc
	for linux-mtd@lists.infradead.org;
	Wed, 28 Oct 2026 12:11:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auIxRmQVO7th9ngS2yqgyK1pIXArJVCORdfb5WaWhDF6S201MLOvKqiT18Q2wOoGXQute1Oxm06j/ov5CVsotRm/7I7qpoLg/VZwUkGoiB6e/LaXxkss6AfN8+Z1Xdk2M6hZ62D1/2IWTUSHDIg6JpiWlDx0+tA820w4VBJcfp22wh+n/GBnG/3XGdTBr7q8mDLmZ3ieKzBh6HdJYkeasN/wUoq9GGGRubB689Tkg68lE+pChP4ZU2zM6j1BXeVwrX/+No75fOoTMmX8PZIMUgfWTRJWePf1pr3pwUBYGAqgQQfdL+IT7PA/xEXEtj9Og80qyXRoU2ODKkH6g2Qdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GN+WwHDPg8LekHgdVsttSwXVbh5IlJlEV7WmjubAHuU=;
 b=Z5+qiwAhnmwVXZzUivKihfv2R1SC33NmeJula8mUuj/YDThKyKMXZ3GrNKeHhZUiJN7TL7wgmjCSw3jezEeGvc96F1mx7BADGDEJOytIfbtRd2URbwC7RhyU1fHgVF1TdOm3zD2R/gfqfODq0iBw+pw0JqlmR8OwJoCwqyl2FiBMqzzRKH58cyeFcdSlJMYqmJG1govJ/uHYR2wW08NU2Nt4YDisxorry6V3HsbNxB2z2WluFOFFj2MFbP8ZRdH7b/TrRajAaOjAAAm6o2mFeNEzJEuPEQNlFbXG1U/oyia75a6J9iCC7bMe2mwcyLet8JgMKXH6i1ff80AL/wICVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1070.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 12:11:24 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%4])
 with mapi id 15.21.0546.021; Wed, 28 Oct 2026 12:11:24 +0000
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
Subject: [PATCH v2 3/5] mtd: spi-nor: Support mixed 1S-xD-xD DTR protocols in spi_nor_spimem_setup_op()
Date: Wed, 28 Oct 2026 05:10:58 -0700
Message-Id: <20261028121100.79667-4-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5ed476a7-17b1-4fd6-ac62-08df34ec960d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|52116014|376014|23010399003|7416014|366016|261021121427099003|261022075727099003|261021123027099003|261009223027099003|10067099003|56012099006|3023799007|18002099003|22082099003|261026121527099003|38350700014;
X-Microsoft-Antispam-Message-Info: 7LiBKGlBp2w5nkv0gZQjCY83DvtkbWKMJybIH40H9HoJG6mdFqWAH5mUUR9jl1s26c3B9I0l6t+HFz5IM3ynd39MtYztbyiuVhWYjyFJTDyBE6QUXMGtgmJ/QAfyby7dMV9ag4kZsA1F9QOjkdIDPr+0gk2+zdf4UzAB4Ym98kO+rqZ3Vm+8RdO735I9O1p+ksOBzxzLwIh/Z8dA4H59ZKSZgwjIl9FTsIUvDHviMnFtQdtsn1SL96LMpvEWaPo1QTiQMki7qpOWzTPNneEKzEHFLACgdx5sJdGtpNYifaIjM7U/X3ZnPb8wraWBlNXu3hPaeMSTQnsj0BF6UaTblpupZ5gLd/+2CJvHe4Sj1912L8Av882CMPKmtjmMzmmYNa+g+ny37yCjku8e7E6a8i3thV2K7itMNjsr776UaWu6WcWfOUgKNYk4M/k9C9TPrPtVSzCbmE6n3nkCNYA0tKGXKYkeK/6tAnvJhgbMvDsikuvKO6RSLsfWIeq62GxrNEZ5P1CulviYpyOQkPANpd+9+qxbPPaQWnfsxCNul3rWQup7jtZxw/Bh6tCqF7Xi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(23010399003)(7416014)(366016)(261021121427099003)(261022075727099003)(261021123027099003)(261009223027099003)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(261026121527099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8NDQJZUOIWokirkoN3pwffHt1U8/ItMg8cGLp2wh3BucvB2+ZuOw0U/Qg0kt?=
 =?us-ascii?Q?Ud1YdILtB5cLORUFA03czF6tSVCSFQ3MlPfgb39tLj0mHO6G76h5dXUT8J8f?=
 =?us-ascii?Q?xc1MBPS8zuJdQMM06djR3xXp+TiId2+1r2qudN9Jq+sZeWmuH/J3Zj0DC1Nd?=
 =?us-ascii?Q?jZzsaIXoiJyoipRFejNDPUv4dXZU+PayBM4nMq5MKYY7AsHo+BbHcamEkiXw?=
 =?us-ascii?Q?P6Q5difGCmy60FDQlEFS/m+VWqXAMxv0GjYMhb3BUOVSKRbYeRjrR1fM+pVT?=
 =?us-ascii?Q?ldnZoP/l7JXeVmJ/vKdpS3eilxeZWMK7DFnsIzenHp4AMCNFUHcKMZxuVkmk?=
 =?us-ascii?Q?mbt7+KXjqsdLqrWXxMBm+vL7eUZ8diH1N/nmyPEvU72Ivq2iT7qxlXLM/O9v?=
 =?us-ascii?Q?QbL+C4EIxPUhd1JDcQisNEgTXp+0OKPGJFhynnOa8+VscByH2uFbZ4ceabun?=
 =?us-ascii?Q?MKMDTCEKHV7ZcunaoV6HhzVV3qaI+x0/WXKtvNcPRs8llyqZpyclpVQVDhmj?=
 =?us-ascii?Q?ceDTTM2oUji/lbSpiUx9AuVRWjJYYtHqtlc97amzTjFvelJyVgdTtmO82WrL?=
 =?us-ascii?Q?8u35BmpAUbxFlppU/ch4UNHsEktZbk0/6RkTJ8E9+DaSuNoi+u22gFfAOT1O?=
 =?us-ascii?Q?S+6KU5VXi99q0CCjVvPq5EqTIiOP/pzwYWEWPWSPspEiYv0HugNZaQfS/hSo?=
 =?us-ascii?Q?iRRLWfWIKoKOwZXlUusssLvQyDsLJY1jRND2FoaUpXqfQInkXa0J8kuZHqZ4?=
 =?us-ascii?Q?OTsvHGvuI7IYdhHWxnCYFTUR9g1hXviIH1wbmwv89amhoSVR5CqgCWbwVg9R?=
 =?us-ascii?Q?PgZGsWCDAOU/2MiiqJ9ysMR4kTYEzvkLv90rfGwHb+65VxhVod+x6SmFuysy?=
 =?us-ascii?Q?flcGe+HDWPbGKaT+l3cTRjG7p/Fgu7NVKz7qq+m9Dky91ndjID4ePVqJJxvg?=
 =?us-ascii?Q?51w/jAWEqglTKy5Q09mUQ1viXm528q4zC2J4yDDsNZBz4GnQwTbBnumTLhV/?=
 =?us-ascii?Q?P+wS/dHPDk4iuieZyM+oOh2YhByMQvawLdtAXnOJ3J+v6TXUrt2jqNueJt07?=
 =?us-ascii?Q?9MS/cAL+1Cyh9XF4RUt6rPen+cVha5Iuc5YdtwctWdFjKS+8B2NKsUk08/Su?=
 =?us-ascii?Q?ZZvGkz5Ku4cLi0xu94IlKhukm6OUq2cp76B1Sl/HmBSnVnBCT+xnThvqbuJs?=
 =?us-ascii?Q?AoWuu6+nPK0cWSXV5vVSgI9kVf4GmcbP/T7Z+74MNQQqGve7x8Ps0D2C4b8X?=
 =?us-ascii?Q?9bMsrGJKV+Wy1lycX2cEtZH1gKvIttT2eflflejqDpxLKK0MZhLyQGzeFVR7?=
 =?us-ascii?Q?YknNf7vCxa2WiaogzSOBebFQwz7yt1rBzy5pvqVnlSo8ZDGBb0nAT4Lmpzd3?=
 =?us-ascii?Q?uca1cPZacEJkKNTOi36FHJmLVk1mDd2HKLLxvZv1hOTWDWmZB54Rs2j4F2Hv?=
 =?us-ascii?Q?MGmAGAYcQi3qs8u8eoye8SNRKr8XEsLoMuhE28zLmZQ2O2cWECf4LtsAel2n?=
 =?us-ascii?Q?o5xn7mZiOO9wHNFnVu9jvFkj03TWNQPIB3tOPi4edayiyxVGSho9+jGz22/C?=
 =?us-ascii?Q?DCRneh9c28uFDCXE4END79vn+cnzSVHWhvqS330eQroOqGqQNnYBH170cDVj?=
 =?us-ascii?Q?fKzLqXAO4clkKJEphrk3lTW+y31Y7FzESlCq/Rma7GaQCrSJb5ydgfHql3Go?=
 =?us-ascii?Q?mOr24W8h30jlKJuo+go3N2JUBp22LznVgBJgyIyUOO1rRFRowqrFmbX0MgwS?=
 =?us-ascii?Q?NAZSTI5ViFeVeObW/Cu4sVRlYxDCieDRx/ebrpPoS5rnjkzWOsQG?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed476a7-17b1-4fd6-ac62-08df34ec960d
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 12:11:24.5104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzvbAHmOGPk2HX3pV9eYx3KL3wzYLByCq+ESWiOTDwzJECJNAM8uPsocZ2Jkun+9szZ9wua29imvctWFPCcdyLdYu2YtmRA97vC4l8pnNd0GBRQWQb94iVxULVwfSc5U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_051147_402787_2993A054 
X-CRM114-Status: GOOD (  14.00  )
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

Currently spi_nor_spimem_setup_op() sets all four phases (cmd, addr,
dummy, data) to DTR whenever spi_nor_protocol_is_dtr(proto) is true.
This is too coarse: the 1S-xD-xD DTR protocols (1_1_1_DTR, 1_2_2_DTR,
1_4_4_DTR, 1_8_8_DTR) send the command phase in STR on a single line,
and only the address, dummy and data phases in DTR. SPIMEM supports
such mixed DTR modes.

Split the handling:

  - For SNOR_PROTO_8_8_8_DTR, keep the existing behavior: set all
    phases to DTR and use a 2-byte opcode (opcode + extension).

  - For the other DTR protocols, set the command phase to STR and only
    the address, dummy and data phases to DTR. Double op->dummy.nbytes
    since DTR transfers 2 bytes per clock cycle, matching how the dummy
    cycle count is specified for these protocols.

  - Move the SWAP16 handling into the 8D-8D-8D branch as well, since
    it only applies there.

No in-tree flash currently declares SNOR_HWCAPS_READ_1_x_x_DTR, so
this is not a bug fix but preparation for enabling these protocols.
A follow-up patch will enable 1S-4D-4D for the MX66L1G45G. The
8D-8D-8D path is unchanged.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/mtd/spi-nor/core.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 90524c58602e..78b8ee58382e 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -98,13 +98,7 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		op->data.buswidth = spi_nor_get_protocol_data_nbits(proto);
 
 	if (spi_nor_protocol_is_dtr(proto)) {
-		/*
-		 * SPIMEM supports mixed DTR modes, but right now we can only
-		 * have all phases either DTR or STR. IOW, SPIMEM can have
-		 * something like 4S-4D-4D, but SPI NOR can't. So, set all 4
-		 * phases to either DTR or STR.
-		 */
-		op->cmd.dtr = true;
+		/* we only support 1S-nD-nD or 8D-8D-8D */
 		op->addr.dtr = true;
 		op->dummy.dtr = true;
 		op->data.dtr = true;
@@ -112,13 +106,16 @@ void spi_nor_spimem_setup_op(const struct spi_nor *nor,
 		/* 2 bytes per clock cycle in DTR mode. */
 		op->dummy.nbytes *= 2;
 
-		ext = spi_nor_get_cmd_ext(nor, op);
-		op->cmd.opcode = (op->cmd.opcode << 8) | ext;
-		op->cmd.nbytes = 2;
-	}
+		if (proto == SNOR_PROTO_8_8_8_DTR) {
+			op->cmd.dtr = true;
+			ext = spi_nor_get_cmd_ext(nor, op);
+			op->cmd.opcode = (op->cmd.opcode << 8) | ext;
+			op->cmd.nbytes = 2;
 
-	if (proto == SNOR_PROTO_8_8_8_DTR && params->flags & SNOR_F_SWAP16)
-		op->data.swap16 = true;
+			if (params->flags & SNOR_F_SWAP16)
+				op->data.swap16 = true;
+		}
+	}
 }
 
 /**
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
