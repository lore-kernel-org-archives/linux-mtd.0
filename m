Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E203D116F6
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Dec 2025 15:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VjFPmJfTLnDEVqr9RngxhKGXC+W9tAMFfEuHJs5JUaQ=; b=R6QHyg4MEJlYLz
	PU7V5PdWp+drLHcKIhYhcARk5ru0j3db4N0Yz1luFyX+thAeY4HVlr0ZsDGbsMdgK6MPLfnopFhtn
	+I/4LJ8CFuZeypFju7ihZ9jyeGCTw7ZGZIFjrG0k9POYfoUs+KXG5wi/hIQncBMruXhbay+9z6HXJ
	XgNqS4tI6JHco/dw2Y2ZDRyveyllvpbHPdZhFOUccGCQFtmftouKPBUKH9ugKmg+vBtNKfodtlrNI
	ZPQahHTyTgmq1aI0RA6L3QFTbs0kI7S/qksDY7MeQRNr+63VmMt2+/me7oQsxUwpC1j0QPz/lW9Pz
	nWuzzy/qH6cQSTMvLF4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRxH-00000005XB5-2tNL;
	Tue, 02 Dec 2025 15:06:15 +0000
Received: from mail-japaneastazolkn190120002.outbound.protection.outlook.com ([2a01:111:f403:d405::2] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQRxE-00000005XAj-2MzT
	for linux-mtd@lists.infradead.org;
	Tue, 02 Dec 2025 15:06:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ObXp8j8804jPXkdUJsCBck1VizBNyyY76GP8RH3IIPM4V2cHgSGQQhdOL3fp3bLKfL78Gn7f3Cph29fkpMAj9SAKlrFt0ksAPhdQdSlVrvpHZFkQ+mOIc/5l0HYBKVJMLXDb3C4iiAw6Ougl8QZ6SNBekG0yxXFtTBHP/WUDYz2efL/bd2gRp/AXHkgO4xr+xOh+6PKnQrbi51Kkm317SYSHBdcasg2vuTEH5qz+kLSNuTtWxbT/jKtI6jS6n0BqixTaghiKwic2owV9PMS6a4Y2vB2vpo+HYYQk5Mam+00nDtk5esvYaGvfX0D97GOkoFOKFpL44u0lb8dhpYK2Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PkW52iIrdwMxExDYCrZ3Wj78zLlsRieasc65dD3gag0=;
 b=MKAmqS0tS2EUe0D9TdPn/afC+Ha5f/c9knfsQ5NmaBvl12oA6UD8kBJDGiNniIOkW4I3x7s0QC7rjsK1Tm+A2ROnWu1Qnw1of5UrI45LOGZM7pIkyBq8Op+lz8+9TJLKzrEwvN79z+0iIkRtPN3sUqE6CF82oZEhOy/vEaZpPJvkGGBa0fbz4AaQQgN44AGEZVUwkIWaqEpx5XwCbccmldQ4gq+75IvjWAwrUJips1N+ll7d45pkUaQAL39rjM53KH6oB8T1kew4qclCfe6+vsreKwyuaDvdWsuLUepbqMbAn0KxJQDRB4mom9kjQifeCXNSSTeL3nfrAOu02AUdgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PkW52iIrdwMxExDYCrZ3Wj78zLlsRieasc65dD3gag0=;
 b=TjrnF4/XSF1pZGKhjtXCGUEg5XmZljcxUFrW6Efhf8nbt8OGMICzSsptdAkY5DTcV5W28FXaghGKkqp9ZbjxI2I0VJorTD1ucMbI5qv7r1/Lx7SZ7zueqHow9j4VE0oSMTeFi7NDaYK9UQjr8i4TokoxGviAqmsDhhKTDouOINti4SP4WToszZB/XS8s7gt06FNwyKblOBWk/CHDozcfiKGWhkqgD3Q9RwikvOKsr1t3uolGIOlH0CzOlbU99wS7FgQv4S/sF39VZCbnwlJSWZFonpxE/4X39Fwm8/6PuNr7ofn/7KwKEBaXTV1eyrwD2seEzbSyLnFOPbqjyeQFmA==
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9) by TYZPR01MB4761.apcprd01.prod.exchangelabs.com
 (2603:1096:400:287::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 15:06:06 +0000
Received: from TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3641:305b:41e2:6094]) by TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 ([fe80::3641:305b:41e2:6094%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 15:06:05 +0000
From: Ziyang Huang <hzyitc@outlook.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	tudor.ambarus@linaro.org,
	mmkurbanov@salutedevices.com,
	hzyitc@outlook.com,
	george.moussalem@outlook.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "mtd: spinand: esmt: fix id code for F50D1G41LB"
Date: Tue,  2 Dec 2025 23:05:56 +0800
Message-ID: <TYZPR01MB55567825EA7348A0482DB916C9D8A@TYZPR01MB5556.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: TP0P295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::13) To TYZPR01MB5556.apcprd01.prod.exchangelabs.com
 (2603:1096:400:363::9)
X-Microsoft-Original-Message-ID: <20251202150556.2457566-1-hzyitc@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR01MB5556:EE_|TYZPR01MB4761:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6e1272-6b42-4389-df8a-08de31b450c2
X-MS-Exchange-SLBlob-MailProps: YfhX3sd/0TUwlisFgok55ByVVBrZcIFI1Mlf3njiaWJyMCTpcglPFW60iroK0RKVaYXvJSLYO0urDjMt0L1Bk/WfykvUlshnk724T7HL6SEHIEo/xoMu9U457uQ2CZ2UxEir1Aaja3J35vgc1UQuRugj80zVldsT9ez2N77i2kaQZchNWMPDdbEJfM0iwUKUU15z3DwxcXv+gWHuMseHXWTyfh41B0xIU6xLi49PiF7xmxtcWRZWILJctOsA039LL4JVXFtg2syZm0ToLsqO0lXexX7rAdRlN09GS4/CHQVRihJgAj+mgw1/aB3Bk+SmWyqS3JPp5IDK3Agil2BCgRu62RK++QQsY0rDgcaMRnnu3yFHqiqt54en9EuiyoGh2eiIXJuVbhZ0OgnGL88UUK/An6XhahHvzPbXkupgDBA91SJxr0pbyZzSIx20fSmLiRD429PaHAOY755x9DmG52W7oViHG67dd6TsbKYqzYJ9fdybga65B9lnVigiSPWmswJerqpFYW4ZOr1wY12GzNlEUuxZIlN2Qt3UzYvS0azf8dmn/KpYz2Bp+xUKGiLDYFM/1/3yT7bz7Io8Bi4Fa71r9y2p8DrniycAcM+0x5mL85goWs0ABmrLOv5DOURNvjTqaNGH8q7/JkhvIkAbvaayX9Xx/K/vNYC0t605KmPvAeZP/RCA2VVzmIgBH3d59YDuYSgpDJJZ5zoLa5hBtxOlDJjDgL/kcQfhZHqtbpK9sHCRIrxMqzuUVZN8U0qS3MdMxZbmpRPCq6TUr8zPMSld6IoDIysvESZ7Jv2WPBY=
X-Microsoft-Antispam: BCL:0;ARA:14566002|461199028|15080799012|23021999003|8060799015|19110799012|39105399006|5062599005|5072599009|40105399003|3412199025|440099028|26104999006|1710799026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sBXtA0MZvvy9HvC8HJIdqPlGniWUdFQfTfMn6T7JQI/QM6pnLqtDXIhcyYxi?=
 =?us-ascii?Q?AA0I23p/0Ryw0Vv9IcH8lR+CoTA8YykWe60yVyRsTcd8ncHfzRkcm4oNtsRl?=
 =?us-ascii?Q?Z0cawVN4f5kZAqkaquAZz32WpehYYI9m0AE4DWskjjKE+xTEgnGZQCjHpLDl?=
 =?us-ascii?Q?YuIfGWvBGchYWZPjJ5+/4ffLGIzXlr2lR9aFK39FBtvXbyH+6jA4c26GLK5c?=
 =?us-ascii?Q?zGy3uA42d22vXhf+jQFkpnRvWmvbnGer5Mlct10J1kBLVCOblV2Xi7CcdEqu?=
 =?us-ascii?Q?XNb8R0thZhqGY3JFZjqh3wuzIrAIFMCUD0BmANbMyPs04wYy+tfbqE4XwBRs?=
 =?us-ascii?Q?rzrin83GI9fVIBAi5WhemhY29TfUzUZFYTdS3CcusSZ0kGM54iZJduh4hMJf?=
 =?us-ascii?Q?ajLP3WtzPr0jSkdk1OhbwqeEKaQg7xbvuxAYow/UURyZlIbrJhwg5l4Py0a+?=
 =?us-ascii?Q?d5gcMpNx9RdRCqb0YvsSz7TaP9J5EBgIVEsY+j8Rl7WMmVmGnO/R8EgQsm6E?=
 =?us-ascii?Q?4PoPPw58T0qNdr4Vl1ApwSnsZtOVODdbdwBRGDpnUCtgLABjE8EZtJ3RpWoE?=
 =?us-ascii?Q?pvse/mqKS7VvBWYzfu41byuO881Cn2/KzgrpHiY880SQiAbgfzdAh5FGbPh5?=
 =?us-ascii?Q?Rhg2hwdfnY9CujiqrT4wrCUxoYQan/5Hnb4+tTlnBBO+tJsBy3SU8PSGI2Y4?=
 =?us-ascii?Q?SaUvdh/g5H327W0ZYmThMmvr2VsIjTtOMmGZujW3o7gxelXKC0nXgqUK70zW?=
 =?us-ascii?Q?0hGzu3dL2JzTfqRMkfek0/BHcCjqQUm6WWy7GZ2s9iMDadmOFJUhgNDp1++l?=
 =?us-ascii?Q?1v9HyeQYQVEB8NxpWfrckpPQRbRpcG+P4Hk8BN1rWlVgE3Km5A5zwx79i38l?=
 =?us-ascii?Q?8YHIlseKs/dmSbSFWyNwf96F9Pqcl27uB2kTomOY3rRALwCZVBBVfyshHhYh?=
 =?us-ascii?Q?GRWwO1G1bXaXpwylIZkDkkB4jFnZivznkZUVTrRcEGo1Nar5eOo3Q/k/dTYl?=
 =?us-ascii?Q?UEuhM8OGm5WXKTDfAI2eUree5RaWqa+JRqfJmaIuN3ZHhuatmVU2cXNhrf3S?=
 =?us-ascii?Q?X5goK/z0ZMDI9UST6oRilcBI//XmnxRjrqA47dQXqGoeUNFZ3md14t1XItnj?=
 =?us-ascii?Q?MVYlVstjjQ+mmbAQCLyz88Lz4ai101JktnAddzuwocCziezHW/YOI4OISqYN?=
 =?us-ascii?Q?vJDPKUS+vvG8r1LsAGEq+49ESHpWS/t6NLYSBoMhL9TJ9/S6t7rUrfC21zm/?=
 =?us-ascii?Q?TtJZW5V761fvu7cM9X1uXUgtUA8zydfvJmj8BsXi+Q=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sQ+C5MEvkmBqOl64NAcTP8EylUORj7UGqYbbPp3caW237U9AY+UZK7WUUaxU?=
 =?us-ascii?Q?SWkzPFagpz0mKkaXoQFQ4CQMQPG7n0o08VcOCOrKm1xUNqK9aV061BOc5e8Y?=
 =?us-ascii?Q?65cbJMqw2MgM5VJFcoOo2OuYCm6lAcVDislh/iS7TQvFCe9KRZonn1flCp/6?=
 =?us-ascii?Q?Xj84BId5RrNglOiDltF0jKVfnUB82WLck5Kl3R/KE6HNPsriEVt5pf8x6+ta?=
 =?us-ascii?Q?WL5fYEQqsAlPdZ6zQag8kfxFNxkzhQuer+eMGi3EPOuINLchHJxPiK62Ab6q?=
 =?us-ascii?Q?97TtEzQ5vzODFubDa/wqUXSBKAmzVD2lx7ybLJi0vvHlwaEAdqelq11A6bXY?=
 =?us-ascii?Q?4PiXR1RbPghgTHUJBgdqvy7Rx9gcaCunWqTeG13V/gXWGtzrjXd6QH4YGvyT?=
 =?us-ascii?Q?ulmMjgYTlVfMSXZaq2vM1msVkAFuH3tBCnsbL0k4Gnm18UF1WQNOVOJr9cCN?=
 =?us-ascii?Q?WpsMiDn+1dyY+PhArtpj1GMSIVGwiyEuI6T+cq31DIuelnlvfbTvi++kTLbs?=
 =?us-ascii?Q?y5Ws0ZfrudQvL3XiaF2B9zaj9/Tk1eT76Fl5iunSPLw0Hb7L+Z+zTyLGahg8?=
 =?us-ascii?Q?+/Si1AIqQzkcNGj8VZ1c8ferzx0X4Em2G1yQANH2kxBLPOYhAn9+sB2OU2fT?=
 =?us-ascii?Q?fSvhdyBqlkV/zPCbxs5GHLid4q32uSe56dUMEe1ANQGQH+86eJ7iVSU5zLTw?=
 =?us-ascii?Q?E1JuJFg58gOMvy5CC4pgc5vbGzGy/EShZbT2eUujkECLPsrbZFHMBOvrqgPz?=
 =?us-ascii?Q?rKbOQTbvhPW0DJnN6UiMfH3dY8iSBbNaNQAIw5xmNwR0/yXpIvK7ha9tVP/7?=
 =?us-ascii?Q?RCNfNDYcJfPtqBWQQ0bITzyHDRZceMZJwShqB/0lm15D/CH+r74m1PDkN/Tl?=
 =?us-ascii?Q?spjVyISp5dDC/FP4/plrtzhcct5ronk9RoSOLs/Af5mUUoOZkbWYnbTMR5XG?=
 =?us-ascii?Q?PeZGSao5cVtDibJKmYw5c1UQHBfRxsDjFB4XeEid+7T3pxFWFTL6DUdXvaF+?=
 =?us-ascii?Q?LR2zt/jrX7EGcLjZE87+TSZNi1GE7uBEjPlsZvtVqtwRpIqSBytoAR8UKWgp?=
 =?us-ascii?Q?aMopHBfqxDh4dutiaRG9Ek72mZuCm6lQlccNrYGzaTciSWsguYkl7CjlJFWI?=
 =?us-ascii?Q?96RREvl+yeOe19CMaRHgXVKemUo/A26mFlrsW3y0IYwcknjHNecgXhSrwbzG?=
 =?us-ascii?Q?mIseNRX0ydm161I2sTRShHjaNW9BuJshfx0SzM2zItoJyUzLxwcsVR/rn5k?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6e1272-6b42-4389-df8a-08de31b450c2
X-MS-Exchange-CrossTenant-AuthSource: TYZPR01MB5556.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 15:06:05.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_070612_627279_8CB19FEE 
X-CRM114-Status: UNSURE (   9.12  )
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

This reverts commit dd26402642a0899fde59ea6b0852fad3d799b4cc.

The issue George met is due to the limit of QPIC, not the issue of the
flash chip.

QPIC only supports 4 bytes ID. So the fifth byte is always 0.

If we use spi-gpio, the fifth byte can be read correctly.

Signed-off-by: Ziyang Huang <hzyitc@outlook.com>
---
 drivers/mtd/nand/spi/esmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 9a9325c0bc49..c1285d52d458 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -199,7 +199,7 @@ static const struct spinand_info esmt_c8_spinand_table[] = {
 		     SPINAND_FACT_OTP_INFO(2, 0, &f50l1g41lb_fact_otp_ops)),
 	SPINAND_INFO("F50D1G41LB",
 		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x11, 0x7f,
-				0x7f),
+				0x7f, 0x7f),
 		     NAND_MEMORG(1, 2048, 64, 64, 1024, 20, 1, 1, 1),
 		     NAND_ECCREQ(1, 512),
 		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
