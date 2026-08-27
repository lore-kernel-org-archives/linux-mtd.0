Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E45C61DC7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Aug 2026 20:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:Message-Id:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OORtYNPfMUAUmtw8nQR5RTfMMiqqPy5l/+yuJK8TQxE=; b=c2rILY2RM0X1VL
	8tK+sNV8OCFs5OEMtm2swpMhTQuEMLl5pa1w0B8TB2D4uGoCt/bohwJqqzpm0qN45FCZt7OE67S3O
	wwVO0mJdevgSAdc0Y1IUFrNvTjFvVq3BUEm2scsJHg6OQST98AJqfz4rkUm6jPJVshmUMgxFS976X
	OflWFHtHRzFhlQM6hR0vi7HkAy7BiFzEjG8TIDh3BGyuV/7cCiw632MxuprKn+qP0F34Q3pw/fJPi
	TbUPmCyXMgeLzOGMkfzi9tXaPsAAhl8XYvzJh6UQTyILbIfpAH9KcSsPNNLlpJjDIfA+hKoElQ3om
	9HSgGLKUahb1OsSpPgSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzgsk-00000004m4G-35Z3;
	Thu, 27 Aug 2026 20:39:30 +0000
Received: from mail-francecentralazon11013039.outbound.protection.outlook.com ([40.107.162.39] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzgsg-00000004m3V-0KXo
	for linux-mtd@lists.infradead.org;
	Thu, 27 Aug 2026 20:39:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTQxcrRw2znLNgIOy1YJhrMzI3PzV0dnR0RmVu2JzODjawIy3RV/ib+7bbKnO6Ctf4trpcaT3p1HWecH9BSow0nHnMcz3ELS+XtnQ/cNRRsR9hUZ8/inMpRTUOXoIxr6OZFg2A/+g8erCd1cIXOEW4S4i4sCxQ8MoOLYik6MMIATQP2uAvnRmQ39g4xr46sSnlVh1LSyBqSrTrMuo0lS+fiwc9dF+JdiiZcQZMv2OtWshWu1BShZi066XLXjhCUP9i043DXJvJzr8ZY/54802P4Mdg2eQBvzMRVB7aqW1lC4QJ0GoFgva2wJK0Wh2VPfequyZAoeNw8KR/+LceH1Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24ksJ/oPsRx1y8bcpCXr4ir6HLy7Jozv29st/47D+qk=;
 b=npIqzHByoFPVONcSywBxFIi4NFvI5eQdDi3unz6LFSHxaYmDS4AAm4IF1yQb1kZoDbzazMSNtXbPr2reNlPNsgCxgkeYIdM/1aYR8hsfn5vqN0VdBG6oUj0zDNDX5moar8G1Lv27NoFloBmarVAArvlU+3qC/Di4kUAKiCG8uKqA6jt0xJG2bfQi201H31wSfBSNnV2dhpSUW8iKKXRBz7Cy/p0vTOinWgFxc02pXdibXfr3rA12N6djmlKKI6kAepxE2H+NsoDyPA4aHfVIFLl6WJWogx5BZT0/SwuLBFpNNjlXvpsJShpn4KL6dQcHX+C2b+sPxkosQg+dLWcK0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24ksJ/oPsRx1y8bcpCXr4ir6HLy7Jozv29st/47D+qk=;
 b=anR/jvTAF7DmnhzopiwJcxxhm/3nK+SRJ1Ur5WUHGYaVeBFk4CdwFUD8Gg9KTcDcZMNnxJAgIH1MKttfyO6FlAP8jYufwLd7ZyWwnOeplrRssxg1vuWpWRIciHUZ38br5Obb/o1IUzTRhhjzHKjAq3dL4Lqj8tYkPp127Ej8LEIw/yH9dc+zaJeR3P+hDy0/CCsRyVMWBgj+zlViR/9MFyWyc10CfVqoAkD5ZmZ8iJYtN7bogCrji+x0WmcUrcegcWXBoyLiGMJz48VwvPRNfIj+xjQs34GF5VPdd3ZQKMAec1UBW8h0SwY8uigYmnxx1nnKYEDo3jOHGzpJByf8Kg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com (2603:10a6:20b:446::12)
 by DU4PR04MB11316.eurprd04.prod.outlook.com (2603:10a6:10:5d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 20:39:19 +0000
Received: from AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308]) by AS8PR04MB9079.eurprd04.prod.outlook.com
 ([fe80::9761:3d78:e9db:2308%3]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 20:39:19 +0000
From: han.xu@oss.nxp.com
Date: Thu, 27 Aug 2026 15:39:12 -0500
Subject: [PATCH v2] mtd: spinand: add support for ISSI SPI NAND flash
Message-Id: <20260827-spinand_issi-v2-1-88e04b19f4fa@nxp.com>
X-B4-Tracking: v=1; b=H4sIAG+gkGoC/3WNQQ6CMBBFr0JmbU1bo4Ar7mGIgc4gY2JpOthgC
 HcXcO3yJe+/P4NQZBK4ZjNESiw8+BXsIQPXN/5BinFlsNpedGHPSgL7xuOdRVhh2eUloT450rB
 OQqSOpz13q38s7/ZJbtwam9GzjEP87H/JbN6fdDLKKCxMi5g7ayxWfgpHN7ygXpblCwaRquC4A
 AAA
X-Change-ID: 20260825-spinand_issi-d9f79ed03ce0
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 imx@lists.linux.dev, Bill Lee <blee@issi.com>, Jeff Kim <jekim@issi.com>, 
 Han Xu <han.xu@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787863154; l=9064;
 i=han.xu@nxp.com; s=20240131; h=from:subject:message-id;
 bh=C/39LmYjn775zenuuGZ18R0Wka+n0R/EaKDO3v8BuYI=;
 b=AeyuvRndXtL7KktC69DjYDc/05CyfHZv5yGvSRz4OIwI7Kdki469drXsc8He814bRnrwy+1SC
 idcSAFJjHykD98Dav+ql10A8aIaPN3Bqk0GSdBDvZ6w5unrpyHaUc9p
X-Developer-Key: i=han.xu@nxp.com; a=ed25519;
 pk=XSryOlQ4EKXqt7ZHz2D+BcDu1AWYF0m5bX48xQOVF5A=
X-ClientProxiedBy: SN7PR18CA0023.namprd18.prod.outlook.com
 (2603:10b6:806:f3::16) To AS8PR04MB9079.eurprd04.prod.outlook.com
 (2603:10a6:20b:446::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9079:EE_|DU4PR04MB11316:EE_
X-MS-Office365-Filtering-Correlation-Id: d31051ea-897c-440b-0810-08df047b4471
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|19092799006|366016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: Pp+4qfqf1NJFsJETBKuM8Xpm7eeUwgvx+1gA5BiI7PLt8cZRZhelf88LBnUZDc1qTm6qrY3czjIfcHhnCYWRUGCkg1kFlSV8SeuZnT3VsjJy32YLO/pU9XwkeiSyC1rFl0DjC5dcYQ7aq5JF9u8gHuuGHInvfDHTDA/OC6I+0UVuHWazODZch1BV53nN9F1dHU8KhI6AvmvXRZXBnY27q28fYIFzPsaMhZNhj0JG9XXhgKf+5C68XLdIW/HNtZFLT0pVONdCucngamPn1Vf8Ba6/j4/93QFYzdrgjwdXQrOI+2rRMia8XYAJiv9a6SUcht9r/UMBO217uJyD5VZU6vo/aP9djL8Ar4Yp7/Se+alGmKG0wKv58u7ND8Y/AD5AVqqWC2kP0LrRYHKuuCbNL9U0Wh48IlMJVKspHb+PJbHa++zvxjEV5mjv8HegKRWJhpmz1X/qRnK4bk0j1o0brtwcGw5/oHxNjondcDsUutd9wgxEEN0mqlUgwpFdDHM6hhbaPfJAUj2a057y+F5XFfk2Q5i9RtY0MtNsX1FLv1PK55y3CDLcCjC63yj8huuZloZES55f57ysCFRsea3Tpb5bHAln8PQCdLo/iQQVXo0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9079.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(19092799006)(366016)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXBzZnJGL0Z5MnZIbE9Cemt4VEpiYXQwenpXZG1LSG9yeURlOFhmVTFLNGVF?=
 =?utf-8?B?RmRtcW1JUnV5OW1xSm5oc2VpakMyaUduL2hTMngvejhwVWMyM3NGSmZZcVAz?=
 =?utf-8?B?RnBPOFQ3Q3ZUbldQTXhmZWF2M05KQlhKWHZNZTVkdVptcXV5dFErZVJJVjM0?=
 =?utf-8?B?UFFrOTJjRDJnblkwNU5HbkFJNU0wcUo1NUZxOVZUVU93czk2RmZuOFlvb3kv?=
 =?utf-8?B?ZGNoREhMTEplWG8zOEF0QW8xNWVmektIZXNXSFlxbGcwTmxGdTJSdWFLcUpN?=
 =?utf-8?B?OElPSTQvbjViZXd4MTIzbWlQamI2cSs0Y3E1MFZsTnVKQ0JWcWx5ZHpWT29o?=
 =?utf-8?B?RldCbUpBOXRsVG8rR2dyK1N4MExRQ1ErZmxaaE43TjY0bldlSkthbWdmWDgw?=
 =?utf-8?B?Zy8xTW9IM1ZOQ3BwdndpSEFnY1lGNHBxdXFsOUMrYmIxMjYrVXF4R2hVTElG?=
 =?utf-8?B?eWZmMFZtZERJMkZ2aHhuQVZEODlWR3NvUkdSN3NUZ0s3SFBNR1dPa21GejYw?=
 =?utf-8?B?TkRNRGgzUlhWNmhTc1QwbldmWFBXTzJWV0JSczhDYTgxMFV0anQrMUtoY2w5?=
 =?utf-8?B?SlZQbzAvSEh1dFZYMnk4SzU1YndZSTk5a0VrRFNXaWZNcURyc0NMRmhJWXlT?=
 =?utf-8?B?WWJIaUlLTmtvYy9XRzRxb3ZhSVpOT1BZNGNSTEx0RkpoKzN0bXZheXFtMHRw?=
 =?utf-8?B?NzMxSkJBaGJLUWN1aU1rcTBzV09OamYrYWdyRlJPc2lTNEptLzdSazhNZDBn?=
 =?utf-8?B?QitNeGpKd1l2WW91L3FybmUyY3dyTjZPN3FoRSszMm5UWm5NdXNHWWNmb2RY?=
 =?utf-8?B?VTJ4ZWxIeCttRWpFWU4xMnlDd1VEWmVrM1pPbG5ETTM1ZitFWTk2VUNCS3lo?=
 =?utf-8?B?c1JLWkRuN1ZqQ0EyWnIvVExIMm9ndlpIajlhWmZiL0hWZjVseEpINjJGbkIw?=
 =?utf-8?B?T1czYnpIRUE2bUdMcnp2bVhhaFV5ZXlwMHlwamRDajdzN3JWd0NqTHJLL1lF?=
 =?utf-8?B?YW9hK0V3Y2dMb3puSll4MUNzRkliYkE4L0lGa0NqM1pacGlRL3ZPWlQwSW80?=
 =?utf-8?B?SzlXT3RBejVGdUZFanE3NTBnSTQyNERmZFpId1VVVXFVS0NVNENSTTdvQTV2?=
 =?utf-8?B?cDB2am4ycllkWTU4akdYa2NMNXIxS0RKaWpRVGN2TFRoM1RlYlZxQ09wMzBL?=
 =?utf-8?B?N3MvajRTNlhzZ2lROUpoOWlkSlB0K2NCRXA5RitIRDVYblZDMkd1TjJ3OXJU?=
 =?utf-8?B?R2RKR2xKamkvWFo2aCt3d0x2VytnWDlxZU12TGJXYkEwUEpTMkpNbGh2QXFw?=
 =?utf-8?B?ZXVTWEtFeUJPM2pQaEg5Qmo5WXMwTFVTdTdjaS9OTnlRV0lHd0ZuRXdqMkp6?=
 =?utf-8?B?UkNIWG1QSGROMlE3R0k1TVVYUDhBUHBRMFM0djVQRVZvbHBLaitQMUtwUmhs?=
 =?utf-8?B?OXNjaStidWh6Q2dkU3NRYXNNZEI0MWNYYkd1LzVxSlFpandyY0QzV21hNm5N?=
 =?utf-8?B?TzM0TDVoWk1RYzZneVZUQnpBbTZQV05BUFRyREQwTHF4RmxTck1kTXE1Znps?=
 =?utf-8?B?UDNMdGUzaWFabHYyU0FwRWtjYzlFRk40cGUvOVRSMHZwUTNCTWFHclJpdUMx?=
 =?utf-8?B?aWtOKzJxc2JXUk9kVkRPcW4rNENnNFBBM0tIbndkUHRLaUFHV08zQWN3VjZI?=
 =?utf-8?B?U0ZKNjNjc3NJb0pTSmhqSmRhOVFwQUIvbkMxZTlyZ0hRcytmU0xDMlcvdm0z?=
 =?utf-8?B?TkRsMHRHV2JVbThkOXdHNlY0V295SzZTc2dVMWxxcGw1bmpSNCswdG04RXVX?=
 =?utf-8?B?S3R2bk1jbmtrY0FvbnM2emlMeUJtWXJVTnkvU0Nhb3JIN252OGk0bUhmeU1h?=
 =?utf-8?B?UkJmRUJCNitCbFFRZVNDS2owdHZiZklzcDVtbVFYd3hpZHB4K1kwT3g2KzdI?=
 =?utf-8?B?bEl1Q1BwNzVFa3Ntb2NpM2kwNFZhR2ZPcHNCTys1UTMrc1F0a2ZQQ1JBRld6?=
 =?utf-8?B?OWw5U2R3N1M5VzI2ODZHUGZ5amlnVnJSa0xUdlR2ZHppTTJIVlpHSkRYRVhJ?=
 =?utf-8?B?ckN6S3BBbllZTXBFVEZrUDZGVWpFazJ0OVlQYjZ5bUJscGxvYUZmdlhiNWda?=
 =?utf-8?B?QmdGckoxNXphRXpKU2VtM1Q3L2lDUHVFWlpHNEpqMmFsb3Y5aHZyRDRLK1lR?=
 =?utf-8?B?U0N3UTAxa1lmYXUyUHY5YkFCRzBRNlJsUmtLS3RwV3UxNFpFanhKTlV4Q0Fs?=
 =?utf-8?B?Qk9oOFVQdkpEL1JGOGRlTks2OWg3dFB6dzFrR0IzSnNNSzUyM0kvZGc3bmwz?=
 =?utf-8?B?QVlJYzlnOFpKcWhRV3AwRlZwNTZJaHVIOVdYZHhnVm5od2pCeXpmWTk2QWtF?=
 =?utf-8?Q?MIyrcNHobNmsplMs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d31051ea-897c-440b-0810-08df047b4471
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9079.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 20:39:19.0838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cwcjMqBB76ZdBjLjhqKQfAwBQnlSz26BwckwMCM/2helicnGba8OBv7IL94JHrT7h/uUnj/my+WYWhiQLG6XVgFJbdz+CDF6gCfLgUkQTU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_133926_319029_C9611769 
X-CRM114-Status: GOOD (  19.82  )
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

From: Bill Lee <blee@issi.com>

Add a new manufacturer driver for ISSI SPI NAND devices (manufacturer
ID 0x9d). The following devices are supported:

  - IS37/IS38SMW01G8B: 1Gb, 1.8V
  - IS37/IS38SMW02G8B: 2Gb, 1.8V
  - IS37/IS38SML04G8B: 4Gb, 3.3V, 2-die stacked
  - IS37/IS38SMW04G8B: 4Gb, 1.8V, 2-die stacked

Signed-off-by: Bill Lee <blee@issi.com>
Signed-off-by: Jeff Kim <jekim@issi.com>
Signed-off-by: Han Xu <han.xu@nxp.com>
---
Changes in v2:
- Convert ECC status defines to plain values and decode with FIELD_GET()
- Style fixes, drop unhelpful comments and blank lines.
- Reword commit log, list supported devices as bullets.
- Link to v1: https://patch.msgid.link/20260825-spinand_issi-v1-1-d81bdd7c212d@nxp.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/spi/Makefile |   2 +-
 drivers/mtd/nand/spi/core.c   |   1 +
 drivers/mtd/nand/spi/issi.c   | 187 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h   |   1 +
 4 files changed, 190 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefile
index b5ccb44860df..f6b2a094fafc 100644
--- a/drivers/mtd/nand/spi/Makefile
+++ b/drivers/mtd/nand/spi/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 spinand-objs := core.o otp.o
 spinand-objs += alliancememory.o ato.o dosilicon.o esmt.o fmsh.o foresee.o gigadevice.o heyangtek.o
-spinand-objs += macronix.o micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
+spinand-objs += issi.o macronix.o micron.o paragon.o skyhigh.o toshiba.o winbond.o xtx.o
 obj-$(CONFIG_MTD_SPI_NAND) += spinand.o
diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 35365b67dd8e..c11d74450257 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1360,6 +1360,7 @@ static const struct spinand_manufacturer *spinand_manufacturers[] = {
 	&foresee_spinand_manufacturer,
 	&gigadevice_spinand_manufacturer,
 	&heyangtek_spinand_manufacturer,
+	&issi_spinand_manufacturer,
 	&macronix_spinand_manufacturer,
 	&micron_spinand_manufacturer,
 	&paragon_spinand_manufacturer,
diff --git a/drivers/mtd/nand/spi/issi.c b/drivers/mtd/nand/spi/issi.c
new file mode 100644
index 000000000000..122b3a6e2f62
--- /dev/null
+++ b/drivers/mtd/nand/spi/issi.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2026 ISSI
+ *
+ * Authors:
+ *	Bill Lee <blee@issi.com>
+ *	Jeff Kim <jekim@issi.com>
+ * Co-Author:
+ *	Han Xu <han.xu@nxp.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/mtd/spinand.h>
+
+#define SPINAND_MFR_ISSI 0x9d
+
+#define ISSI_STATUS_ECC_MASK		GENMASK(6, 4)
+#define ISSI_STATUS_ECC_NO_BITFLIPS	0
+#define ISSI_STATUS_ECC_1TO3_BITFLIPS	1
+#define ISSI_STATUS_ECC_UNCOR_ERROR	2
+#define ISSI_STATUS_ECC_4TO6_BITFLIPS	3
+#define ISSI_STATUS_ECC_7TO8_BITFLIPS	5
+
+/*
+ * As per datasheet, die selection is done by the 7th bit of Drive
+ * Strength Register (Address 0xD0).
+ */
+#define ISSI_DIE_SELECT_REG 0xD0
+#define ISSI_SELECT_DIE_MASK BIT(7)
+#define ISSI_SELECT_DIE(x) ((x) << 7)
+
+static SPINAND_OP_VARIANTS(
+	quadio_read_cache_variants,
+	SPINAND_PAGE_READ_FROM_CACHE_1S_1S_4S_OP(0, 1, NULL, 0, 0),
+	SPINAND_PAGE_READ_FROM_CACHE_1S_1S_2S_OP(0, 1, NULL, 0, 0),
+	SPINAND_PAGE_READ_FROM_CACHE_FAST_1S_1S_1S_OP(0, 1, NULL, 0, 0),
+	SPINAND_PAGE_READ_FROM_CACHE_1S_1S_1S_OP(0, 1, NULL, 0, 0));
+
+static SPINAND_OP_VARIANTS(x4_write_cache_variants,
+			   SPINAND_PROG_LOAD_1S_1S_4S_OP(true, 0, NULL, 0),
+			   SPINAND_PROG_LOAD_1S_1S_1S_OP(true, 0, NULL, 0));
+
+static SPINAND_OP_VARIANTS(x4_update_cache_variants,
+			   SPINAND_PROG_LOAD_1S_1S_4S_OP(false, 0, NULL, 0),
+			   SPINAND_PROG_LOAD_1S_1S_1S_OP(false, 0, NULL, 0));
+
+static int issi_8_ooblayout_ecc(struct mtd_info *mtd, int section,
+				struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	region->offset = mtd->oobsize / 2;
+	region->length = mtd->oobsize / 2;
+
+	return 0;
+}
+
+static int issi_8_ooblayout_free(struct mtd_info *mtd, int section,
+				 struct mtd_oob_region *region)
+{
+	if (section)
+		return -ERANGE;
+
+	/* Reserve 2 bytes for the BBM. */
+	region->offset = 2;
+	region->length = (mtd->oobsize / 2) - 2;
+
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops issi_8_ooblayout = {
+	.ecc = issi_8_ooblayout_ecc,
+	.free = issi_8_ooblayout_free,
+};
+
+static int issi_select_target(struct spinand_device *spinand,
+			      unsigned int target)
+{
+	int ret;
+	u8 regval;
+
+	if (target > 1)
+		return -EINVAL;
+
+	ret = spinand_read_reg_op(spinand, ISSI_DIE_SELECT_REG, &regval);
+	if (ret)
+		return ret;
+
+	regval &= ~ISSI_SELECT_DIE_MASK;
+	regval |= ISSI_SELECT_DIE(target);
+
+	return spinand_write_reg_op(spinand, ISSI_DIE_SELECT_REG, regval);
+}
+
+static int issi_8_ecc_get_status(struct spinand_device *spinand, u8 status)
+{
+	switch (FIELD_GET(ISSI_STATUS_ECC_MASK, status)) {
+	case ISSI_STATUS_ECC_NO_BITFLIPS:
+		return 0;
+
+	case ISSI_STATUS_ECC_1TO3_BITFLIPS:
+		return 3;
+
+	case ISSI_STATUS_ECC_4TO6_BITFLIPS:
+		return 6;
+
+	case ISSI_STATUS_ECC_7TO8_BITFLIPS:
+		return 8;
+
+	case ISSI_STATUS_ECC_UNCOR_ERROR:
+		return -EBADMSG;
+	default:
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static const struct spinand_info issi_spinand_table[] = {
+	/* IS37/38SMW01G8B 1Gb 1.8V */
+	SPINAND_INFO("IS37/38SMW01G8B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x15),
+		     NAND_MEMORG(1, 2048, 128, 64, 1024, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&issi_8_ooblayout, issi_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(issi_select_target)),
+
+	/* IS37/38SMW02G8B 2Gb 1.8V */
+	SPINAND_INFO("IS37/38SMW02G8B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x25),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&issi_8_ooblayout, issi_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(issi_select_target)),
+
+	/* IS37/38SML04G8B 4Gb 3.3V */
+	SPINAND_INFO("IS37/38SML04G8",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x34),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 2),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&issi_8_ooblayout, issi_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(issi_select_target)),
+
+	/* IS37/38SMW04G8B 4Gb 1.8V */
+	SPINAND_INFO("IS37/38SMW04G8B",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x35),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 2),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&quadio_read_cache_variants,
+					      &x4_write_cache_variants,
+					      &x4_update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&issi_8_ooblayout, issi_8_ecc_get_status),
+		     SPINAND_SELECT_TARGET(issi_select_target)),
+};
+
+static int issi_spinand_init(struct spinand_device *spinand)
+{
+	return 0;
+}
+
+static const struct spinand_manufacturer_ops issi_spinand_manuf_ops = {
+	.init = issi_spinand_init,
+};
+
+const struct spinand_manufacturer issi_spinand_manufacturer = {
+	.id = SPINAND_MFR_ISSI,
+	.name = "ISSI",
+	.chips = issi_spinand_table,
+	.nchips = ARRAY_SIZE(issi_spinand_table),
+	.ops = &issi_spinand_manuf_ops,
+};
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5f4c00ae72a7..b42407b69db3 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -438,6 +438,7 @@ extern const struct spinand_manufacturer fmsh_spinand_manufacturer;
 extern const struct spinand_manufacturer foresee_spinand_manufacturer;
 extern const struct spinand_manufacturer gigadevice_spinand_manufacturer;
 extern const struct spinand_manufacturer heyangtek_spinand_manufacturer;
+extern const struct spinand_manufacturer issi_spinand_manufacturer;
 extern const struct spinand_manufacturer macronix_spinand_manufacturer;
 extern const struct spinand_manufacturer micron_spinand_manufacturer;
 extern const struct spinand_manufacturer paragon_spinand_manufacturer;

---
base-commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f
change-id: 20260825-spinand_issi-d9f79ed03ce0

Best regards,
--  
Han Xu <han.xu@nxp.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
