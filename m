Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AB9606A327
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Oct 2026 10:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vSQoWkd+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AEJ++5NlGqRTXfuQg6Yeu/Cz1upwvfz6e8DWPMzS208=; b=vSQoWkd+lA6k4W1pt/3idssFPw
	yq0fb3Skuav8mTZWPSip5sofUFnZAFpgvxaiA88xbSm/iJ1Qu818qr5ZsGTdJAgIdlwQAC7xcHepc
	e/1/pKqogrcAM1z9kQfL3d9omy6kD3je20d6iwdjdnVFSZvGRolHU6wFVSTuWq/+0RNEfCAQvJyW3
	n+eU8bEjJalktfgFBnprgHHTWsxs3jAsghUnDjyQg/kcoL6xe50cLdNVg+7ufIugmGe+GaeiyPN03
	oW1HpQWaSTpXK8vKsk5wC/4DvaoHxPO3RBHBEohST9bYWXmnzsaOYyyKRzuQ3NC3ktYzx1hkDqfbQ
	UJURTYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJq0g-0000000Dvx8-3P3R;
	Thu, 22 Oct 2026 10:26:58 +0000
Received: from mail-sh0chn02on20706.outbound.protection.partner.outlook.cn ([2406:e500:4420:2::706] helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJq0c-0000000Dvqm-40L0
	for linux-mtd@lists.infradead.org;
	Thu, 22 Oct 2026 10:26:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuO1DjfeGet/SDkLd1sdNnvr9LETd3I7LrUXy9kS4Smi49bJfXgkaUNXa5BTkbwUI2wFYpip+3kRwQl74Ai6B4KT0awS+xLVGaJj0gba/S18cpRd6VA+CcR+u5+Tqh73DW71wG9Xb4lTz2BpIBET8rIjNSWjYU44pnEn/6/yUNGw1OtXDcBl05ZyMoARqjfXKM6qIgRdlKHU14PbRnncAxFRcLGV/JI9NQQ5nsLE6YBoo5ZRpODh9WEAOcdiczwuAcncPeelefbNkisfLk8V+9ZOZNkFQ42ppAa7gslkkn82oSDSKWqXHislI6eA+AT6Ju9E1z5TYNV15w6orvGg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlJa8/1Tbf7ie5C2LWZQA5AzFCjkC+NmGVgwSqh38nY=;
 b=kZpVNzPszWq88+7vTy+d2M3DENCoO7G6R46zMU3cJQSkzEjRRKLQq6xlFHZPIxYCF6ifpPVyIQVr0jQ13LfmzGQT925GnP5LK7N3eUoZ78PhnHRn3c0GhnaiLWdl2WRDFCjEax1JGStOFQn+od1JjajWEJ0S+scxobAjYWlXYcQJeoVZVbDbfdclfYYDQHJqMo6MIOEZl2J7NAWIIrpQ/L6hT2SYa8cSRYGmiWPUBo2zwoVxuJiW5BQwU/9pFaDizDbw5DlbIo2MZY0G2MC0MYOualIUZ4W/0rbdtoYQxgj3+IWXH2Uj3dBdNm+4stU1D/G8utFuRSpGcUH1mCLPHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn (10.2.3.102) by
 ZQ4PR01MB1298.CHNPR01.prod.partner.outlook.cn (10.2.3.110) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.16; Thu, 22 Oct 2026 10:26:24 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0546.016; Thu, 22 Oct 2026 10:26:24 +0000
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
Subject: [PATCH v1 3/4] mtd: spi-nor: debugfs: Correct DTR protocol names for 1S-xD-xD modes
Date: Thu, 22 Oct 2026 03:26:13 -0700
Message-Id: <20261022102614.75696-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
References: <20261022102614.75696-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: ZQ0PR01CA0009.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::23) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1298:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af3f102-4959-403a-4621-08df3026ec86
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|23010399003|52116014|1800799024|22082099003|18002099003|3023799007|38350700014|261009223027099003|10067099003|261021123027099003|261021121427099003|56012099006;
X-Microsoft-Antispam-Message-Info: jzXhVrM53wmKBXPWNtgBzT/1HsieKyz75WKsi3WRo7vBiQsHirvxrY8omcHkApWgZ8navTljCfi8E+WYTF6Hk61XCyueX9iKKpwYONr5mq+l1x0FLtKAAMAoRhqQijx+LJOEjutAEwuFjhW3aVLZAYcnv3e71bW6456qry7makB2aB7NuTuVaLrCUlKXxP+yS9dvtF+Zpsa5nkmVY/y1gYY5xpKtlQeIt1f9xZqhTXfzGKH7glw/yUjEt8baDHk6eKeyuAVtM9SY5zrFv3yaDU09uPV1qOmneuz4WFO284N3XPba0ASQO0TkN7eqLXNRIVb8m8or18kTr7nQQ3JsoPDCXOlGB53ipaKb25t1mdeJYA74JxO/aguOTx7w03+8LliivtqdjhTlmlpWePwZqZgIvdEO/OAv5DNFzjkFk/LuKadu2w/KDJZyfDreQn+W0RlA+ujv4omYJ7sylvoay/2drA/R+opQoGe/wGYw02cWN2ftYoxI51kaIooOEufO8y3UCuh3bQotRsIyKXxWydhgv/1P17Ji7CuQcSriweVaBWEh0kcbZb+Eci27Nzdf
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(52116014)(1800799024)(22082099003)(18002099003)(3023799007)(38350700014)(261009223027099003)(10067099003)(261021123027099003)(261021121427099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wGj8cDHZ/8fmMf1B1ZaiyZrT3OOSyBB0Rw8DWBdtSc1wbF9Q4CKVcUpA3Qv9?=
 =?us-ascii?Q?NWqdU/4nRR1qddK6AgdJKTEApoxDPcXqzKpzFr5lKYep778WmjjI2sQtqtTl?=
 =?us-ascii?Q?vGFfC8xu1967cPyNSvYbA9O8yBdclvzjBNATVl6YpTmWymoovulsW96vsPms?=
 =?us-ascii?Q?Vovp4X+i4m9C7vb/p4lQqQXpIhBmIu8lgVCKOfUmhxvxvavrpuaMA2czd0z2?=
 =?us-ascii?Q?/wbi2HlYaTaqx44fkPBlzHO33iZUWU7APQS8wg3uWk9wQyALClVCqqCqqIDP?=
 =?us-ascii?Q?ofRuwAAha51PN3sLlf1hdw4q7NbHv4khRHnVV2K3xwxs01GY5VQJh4gzL+6T?=
 =?us-ascii?Q?BXqx0M8LAGE0I0CBSGJDpYTJR9MS02PDz2Q7RSK2eOBYwcXBHT4br0MXU2HG?=
 =?us-ascii?Q?KA841D02bqa35ADYWBH9kwBfIfJx6hIG8TWwPARUnSIhze1ejxuj90gc3Npw?=
 =?us-ascii?Q?csI9af1r6iAFQ9MDMPm5P6MQwTaLpVn0QoDGF8km647iJ+nudhT/tJ5xQKm6?=
 =?us-ascii?Q?DDFEQaesXMm1a2jTro8M9tDZZh6Oz3JbywLirJGg4EvUUfLrkIOii487wr9Q?=
 =?us-ascii?Q?r2+sXwYP01TvEPu0ZoJvymXPPIL1kj6BFqgLV4GpHT5LX8JGLy9DA5h0ZeQt?=
 =?us-ascii?Q?7tu4FAHwbq5Fqkho1jnOSmfvqbon7/03gfk3/0xaUSUsVcXYgmCXCDCEV44l?=
 =?us-ascii?Q?rLzry0GERcjosGhzIJrLCKnAHRDXO3e0F02FjusZYLMCekH9nAfVzkWNAybg?=
 =?us-ascii?Q?VK7SsV+winenL9VyqMNeeWwM8umgN5GRh/KOPgJ1D5puC++fC4sr7M/kBvus?=
 =?us-ascii?Q?w5KXxPjtYYX1M/Rn7sKBhy+mv+nLqpQZ9+CukYZZ40hfP+GS+/j9L3n1Bdcs?=
 =?us-ascii?Q?5bDldbQ8kf3jduuB0/ST8JV60UczsSEVskN6cGOpjhuUrUmLJyEdHeE4/+3h?=
 =?us-ascii?Q?K5sQHCyIV1y67eU1A8MJ2qJUCKLPLZBllenNxi1WHWPsO3OLqm94Ty0zEHsC?=
 =?us-ascii?Q?mfitCAMevLd5t0StBkXRdx66b1MK5irZrgVQGkh/NMX/P9flDTA3HBR6Ksnn?=
 =?us-ascii?Q?eMcAMapLHTXUm99Oo/KzTehRG5U7m7IhcY7SWNYHt3q2YmHYaHMK2bjnyOCr?=
 =?us-ascii?Q?D0TdrJR9KtYTjTghlu5B+17LTWS4KhLKv1N7e5C/UlxTwhITuhM+VD3rnUVA?=
 =?us-ascii?Q?6Z3u3udcQLIgsmOOz3Hx4hStbIBRfhsvidZrvTxh7Pg64m+DThBtK7hAoId1?=
 =?us-ascii?Q?TTgS1bBHzuP/3d8rnVDBkAkAN3umPgDHWaFuf6kMvvdM0N+vYvsKRu8CGuFj?=
 =?us-ascii?Q?4VnXlA0LCXVzoaTGF+6dYLqlKKSvKtF4CnMvBCdEyosAt1LxnI2g0Hc4d7eS?=
 =?us-ascii?Q?vHiUx+huGV53rdI1QAOhxdzEdToZIxE2VbkMjn1cUEqH2Z1L+MuRAkACT5lh?=
 =?us-ascii?Q?AUwCT9X8A7BE+xF4KL8Q0k99L30NUgUsWFytwcFIzKQzFQb/XILkjPti3Nrc?=
 =?us-ascii?Q?oW0EwLTjwPypSORIAE38NKrItKPS2LGqR/giECJoImJfy98brXap20L59mEU?=
 =?us-ascii?Q?GFL1Q3Mg/HyLwu+Lhp5gN3WFo3U8QewzfTITN0WZzTyj0jVKB+2kNGn8ycei?=
 =?us-ascii?Q?nys+tRob1TCir+XAMPPC7dIF5k9FJgZ9xnTP2FVJ3t1fC8IhsDdEpUDKxA7T?=
 =?us-ascii?Q?y/zoKzjkBaj4jPcI6kJ+ELVzMhwPfR0idmtmLchcPJZdG3rBwepORpa0JH+6?=
 =?us-ascii?Q?sSCUdmA1FNAijdrFrEYsuq11lE/Uzj/Xys3Z/QB7WbLmlavtTwCU?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af3f102-4959-403a-4621-08df3026ec86
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 10:26:24.6192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzdkij/E1vtPLjaP3B7qLkJA1pkNxJV3FtW/EFCJwELOoRZJBBkTOzhl6nsCPPpB3qDvgnXwgTaDhAxIY/DyWSy1M6rgS8qfVOJEebGsD7ANygmzxXKbni8oh9Uk6piT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1298
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_032654_996024_FBD5AF70 
X-CRM114-Status: GOOD (  11.17  )
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
