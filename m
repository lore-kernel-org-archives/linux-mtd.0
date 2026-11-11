Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFA4606A327
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Nov 2026 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k1+wTD1b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0gap5amVnPEMG2+kIKIV1bTDEdw8voVl/2wbHVDgd+A=; b=k1+wTD1bhminqeIgFljU61bTvw
	wAEIwd1chGq0x24JsT9TH1Pm1xntzK8mo/gg3ib0S2EB2yUve7GrRTPw0iCaYVC8p1WuwzXiF6nuW
	XD0ev6P6bMX4TrGiwpSTpA4fp2oZ4WklOuDdHp2n0abKMUIY1Zk3j2s7/MzpYiDR+3EIaQ+qj4Xp8
	mRJYSgxeEaakSKGpDlUsz1sYKQugJezv7cdZwc7++aRRFtGWpwGTo+tFhRnMx/tIndnYJl0j8RBGU
	oKP0wly8+7s4+SSmY/1PI7EGKKMTJ2xEWsl2sza0K04691Mcd6v/NQyXafytEvSF9I+IKWFpm+i9v
	eyACJE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5KN-00000006JWa-12hf;
	Wed, 11 Nov 2026 10:13:15 +0000
Received: from [2406:e500:4420:2::72a] (helo=CHN02-SH0-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR5KL-00000006JPo-25E3
	for linux-mtd@lists.infradead.org;
	Wed, 11 Nov 2026 10:13:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVyy+bspQwODIqbdgu2SOEdo3GhUwqHRn2ZtPxebY83GeQflVyN6T3/uOWvifM0Na6YjfSIFlcEX4WGqVXZzvy7IA0OPobXxDZXvaYVtYLmXxvr5QtHYlDISa+pQqhvzQsDUYaiijGvFtyR//MiljEN5kRy6udt9/x4OOm4CH3Zzt0v1+NTY0rsp+1Sg+KZwGXyYDUcZdNOUtRvY9/xglM+gqUEvtXH55ngFd+QlzJ6CqtvhyDkejFD3o7VfLddVSeAVO11PnA6B5zOyEEb7T8NUbK9/c01lDvIdEr953R1PaTrIMoVY979l/rlGak6EdGG0Kc9XuIKDgEfArBp8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lEBpXnR4uRHtfa9gfiu2vrYzB0VxRreWW9aZcrfSUjo=;
 b=NM5qglrAG0uRd45GSa2uJYy42AJK9J4S6wcyUn6WgGZNfnN91Yx/ywAhoTdjFc3UU/Rw4MM/O/zXclefRM34/k2lPWwFfJmK9k2BgJAtnJwqCBaO64rftb9oeHGZ02uzsG1fUFfnZB8UZaZyezZIY7WphmoZagXcVLWa6l55NhCCaqn7Jk845UhvpjfJvtkmt/tRXIyiM736AdI75/cJODt2PcRop50OcWBCJPp8nE24eKIA6tl90IYZNQgg4ERvMuSRQSw2eV87KV50fhkNEVGPvNJjY4Nto47N4SdZKcBMCBsgQ4dHwL1bkdoq5C/JZCwZWtNfuugblmiC85Lvvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 10:12:53 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.008; Wed, 11 Nov 2026 10:12:53 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 1/3] mtd: spi-nor: Support mixed 1S-xD-xD DTR protocols in spi_nor_spimem_setup_op()
Date: Wed, 11 Nov 2026 02:12:38 -0800
Message-Id: <20261111101240.7378-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
References: <20261111101240.7378-1-changhuang.liang@starfivetech.com>
X-ClientProxiedBy: NT0PR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::6) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
X-MS-Office365-Filtering-Correlation-Id: fb512918-47a5-4855-91d3-08df3fdc590e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|52116014|261026121527099003|261102123227099003|261021123027099003|261021121427099003|261022075727099003|38350700014|56012099006|10067099003|22082099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info: lE0gLXFxCcScgQEI5x4P5fLIHo42J57DQOHwU9nJwIWzAe083ZzQOIdH4x99qfxNzDiCpsXxYnL+LbyV1TGIPBztStZaWJGToQ2adVNARSn1SL7eud+H4VLhUgsLpKXMIkq24qTr2GB9JbXjsw8V8SWALb2XyVTPu2n7EfsnAq7s7glkWhxiuzPRGmQt3IJlNns9WSP866fl7mbeOe/ZtcQ+YzhnPP5NBGUG5VakvmqcjGiuSNhV1Tnd7PdtqTmUY1oHsVRw+w5bnt7qq3FuAp8zCwIj4DWmx+dlK+7fWqwtia92kce11/vfThrvUxurWpDXoAHPQCOAOw9Hf9u9HmV6JYrEIrArXqYOXN2V31Yot7F6DPa1aqFhyIFAIEXAg9Oj2vlJSFm9771hNBkgjYx+ADar6WxGr/v3VF/sivfNCw+UF30A+trYWXPdPZk/lqPV7vZgyTVKUf4Z6O1ar/rkdvuch+D3zCaMtor5TdoJf/lpLEMdFLx98n43eHhAxZmkPYbcRlna4xcreyhtTdW0I/qBlxNtLghuovsWIRUebyiQ8nN7p0KIaPr5Tya8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(52116014)(261026121527099003)(261102123227099003)(261021123027099003)(261021121427099003)(261022075727099003)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Miw7Ngnuql1mvs8ECGpozYPPM3VybMV5FePmLKNvxkNDigT1N1+tQO6h7Yta?=
 =?us-ascii?Q?DKSPs8sz+jXwy5HlUgf10NGBT8a4sioTf9vKvwF5ZKVr6bKqJ/ZRpuCvUPmD?=
 =?us-ascii?Q?Ovvu3L1No7crHB/h/93vuiBFsxmtNsX0UbjZo9p6sz13cKxQojxE/7fC0/lx?=
 =?us-ascii?Q?HzRwLpClyI9zsKVcZvertR3O+5EJn6qARqTK9A2DkdXb3DwKjTrepo+GChEv?=
 =?us-ascii?Q?Q5HW3EnAqrD6vphMUpHSa7s9nXeVNVdPzCDh6hH+CeV902zJOjwVIXMNGRBD?=
 =?us-ascii?Q?gyU7XSom5rfF7HTaj+pEdvgrWiSTcD6ZqA/nHc5mk/z5VkIPxt3JM4p3YzYz?=
 =?us-ascii?Q?uCY69Q2qqU7olh1P6XbCaF3/fk0u2GOwiFQN8EQuidbW5cJdJ9egg1b6CF5Z?=
 =?us-ascii?Q?jUv5TxK/4QCCZVc2VVEwCQqeX//gYQo/o8zr5XDO968Z5ZqDfDtOfnHMdMuD?=
 =?us-ascii?Q?8evyrKAU4EhVZRWNwQfppD/EYCU36mGLEZpFTedLYi31cPi+F4Zl19P3dyDF?=
 =?us-ascii?Q?ciw5qFYpum9QYhVC+1W3Wq9CcsJNKCkWk978kOJoKvvKy+g9aXkl6jrHYz3M?=
 =?us-ascii?Q?cIXCqO9DjcLajrzq+qPQrAIucKqkhHoXxXTIWRssCgZEFivTj/lSCRB9PwDu?=
 =?us-ascii?Q?8hQLgd56bvRHivtJK2DS5wwowvaqoeMTAE0BrMOH8L3oCJbyA7PdNnCOnxMC?=
 =?us-ascii?Q?vggMS2KEfcBbF9DJukiDCDDOhqZ7gnqHcdjprmMXanyyXW2TMOlT8T8G0fjF?=
 =?us-ascii?Q?gjLE0gc2sTY56qBh2Vxen1OK1l7i0XOZl5NUGzzO2nq4HssWTY7lTdnab9GV?=
 =?us-ascii?Q?qmt25UshGL31YUNyhLa2H7WwcanB0iTpP3s+2WxVw6xpw8uetuGEvwsl1tPV?=
 =?us-ascii?Q?Wa/j4NwGZQ3YabTX1mLPwdwqVpbCYyOSQzcF6VIZ67tb6X/zXc4YaC7Y0ymC?=
 =?us-ascii?Q?fZu80CIuPClFx0jGTAUY/IsPzNfU7Ox1jToA2+yxKGGSKQb8VVqJQpyG7NTn?=
 =?us-ascii?Q?g79BGly1sf3zTvDg1wohW/6vZKvCv6GaR5H+vFirmgVOWh3Qm1XxmXrJtmnR?=
 =?us-ascii?Q?BM36GoXts0NSzv9U4XYGlFUcVKoDuIu9IUsM5YlcQmCFLX9pj/ZTgv76U+rr?=
 =?us-ascii?Q?C3L999yqpJPW/K+fQ5CB0tcKA3/YQpgoLAdhsdYOwaFp2ZXNgHSnnTI6mBi9?=
 =?us-ascii?Q?h+6e0ur/To1TDstSAnW7c3GU2/y/ROtyQ0lSguUZSV33WDocKO7Hb1Q0JZnC?=
 =?us-ascii?Q?E+zKJjw9XrH1kpfEWdlfYUaJu9m+T8JxXlRQDuTgvrPoNWK9rs6mIsw/V+ai?=
 =?us-ascii?Q?tdAbL62EWlQfSZTBQaRIYzPZ7ixOaapoTCNoAA01GXVUosyFjZH3uJ1ADyfb?=
 =?us-ascii?Q?3T9MmFGsPrXuSShuB+Oivsyl2rL5T66CtxDGlR3VuzmAGPH29fW9QbFqkcVv?=
 =?us-ascii?Q?6XXnysnQcd+STzjc+y+I8eu+ni3wDsLxW9jI4swHBboxnDpfc01TJMLjRYNn?=
 =?us-ascii?Q?wvTDOkbeMj3CdCDCLvxTD4Jix0sT+aFE/Qj5cSEN1LMX5P7z1mSlqCAP9x2j?=
 =?us-ascii?Q?g9IUa6hcH+aI8ZvIM62f8D4qxSIz6qionpdmGdcUdU2EQ8iu+JA5zuay+NkQ?=
 =?us-ascii?Q?kX2+VOO0YmZSkOFRTco3o5EaCrG0U2o3ybbfnChCusn5VRzM3FHLyzwD53MQ?=
 =?us-ascii?Q?El/xSYbVFaMQ5b4xag5Upb8XSemJoNzBdreb8NKFOIsmLQ+UBPhFyJH1Hv+V?=
 =?us-ascii?Q?yClYvPLS6XJkqy3ohzq0kTZAOMRAi+JpCgYXxfowhv2Bvtz7MUzI?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb512918-47a5-4855-91d3-08df3fdc590e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 10:12:53.0947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Lqpeq2Kn9eW/nBWXcEzis6fEY8qnWfVS9ZX38eYYwYAfupZnpPxagoHGy8F4cEyi2ZwcpMBTm7cy346HfDpqFXo6zkouBNq5hf4Ov5jRkJO6f+TRVOMRd+B3b4vbNtQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_021313_554099_9CD2A0F5 
X-CRM114-Status: GOOD (  13.48  )
X-Spam-Score: -1.1 (-)
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
index a04d22d2e2e1..af55578e5877 100644
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
