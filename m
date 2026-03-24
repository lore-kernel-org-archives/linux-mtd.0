Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6E2FEC11C
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Mar 2026 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5MU0dFhYpBX2kaoeEb9J4p6+4l9+1t+cNbErb1u7eWI=; b=079IxjHmWvJSDH
	wagmvyCGeQySWK63+lIRLbquxJBIwYzf+YNeYJntKRo+4Z1vJkWBo08YNJPsRQifzF1fWiv/uTyS8
	pPo1VfVLJseuZ4GG09T2dEhWjy/w6LdQgbtHGJrmhQ86g2fNuEGR98L8mWGtQon6qa1bmsWiIX9Y0
	TJ5P6kldha9kSWigUxOL2UPK5vFPzXKuzuHu6PvHoNbLHN0LkB+5rXydQL0jSo0OAecDxUldP3FIF
	WjULm9mrmtRhMTntuzzciijZOIYYkmMxPW0lFWz4yOil9Okc47BtjoEwpX3qSBJT70kY8GMM4G2T7
	1qb8CI6RBQUlKMxC12VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5A45-00000002Iba-2xVj;
	Tue, 24 Mar 2026 22:17:33 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5A3u-00000002IaP-1uQL
	for linux-mtd@lists.infradead.org;
	Tue, 24 Mar 2026 22:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MAWqJDz0SDVn/VSckpNPBh/hrk2UTf8w+Z6RHBdcieCs39MdSMzEySzswPqOXfHZHkkSaUuPm4ztxpo7jTZE4nSDPz08UDCdffCJpGSP5zTy52+p/ZJmAkWgugVTuOmAwIKOmbAfh/7PPHlEMDEhDUWRq2ggW2QvNidy6JYXVa+LKjSNJ5HIYHCmM8DWZr7GDZS3GPEXCWgWBOKI3pTjFB9V57KuQU/4DHwbd1apQvbn8NpDlyXoltffRCu19cx0W85saN5ueNBpECHXn9DAMyIFpifIhbaMmUk1DMYwDnRWztyF7PExKq2RuRR9dlLe2e9buemneWx68MbQCTjjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BylMmpiMOJw0L11y6pl0L9M634sPDvm8hEyJYiJVRDk=;
 b=Shwbrj9VpSoOkd7oaWgpY8Vo4Kt8xm6TvWGT3MjiCLPv5Jca7hF8Hk/bDfeSodMXPdrYQpn7/FPOtZiv89twnb8BHsVbj+8fFyvJinxVrMI3oD3oabNitgLIPis0ff5ZAqx1ZBng2OOvbo0wpkPJp5MlyTYefl72shsX8flReIPl+icy+w9+L5e66xxOzZYsUqCDXNoawkCu6qyLbp2UldqawcfquJtvZirrLpSj1jGkYM9CpI7wPRCvelUR1dDiAGM5YBHBStuW/f9EeQDgirdQn2mNgN1wvzIZRJf42jlu608yKiOFFFFRBFt+KiLXKLmC/FJFs4ztlB54HP9Yrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BylMmpiMOJw0L11y6pl0L9M634sPDvm8hEyJYiJVRDk=;
 b=Tky+t146pvlfo3o1BZ+W6CshbbMp1OT5EKUsCZpivBewgeGwoaLVP9WEmdFraZlZPoestpQrFYymY0kxU32BGR+gI8KF7JpTD0aoEYaHV+6F+K3ujwt/L4gXZxTOjWYESRrKeJdXCOboa17zE2IZl/k8RO4Lij8IbMAgLReedXJuO0mrnSEy+jT0lADzn/9ZeYRhHgDcAKAGzisOuTirSNY/Y8Lzovuv6zptP95XAA4Cp+rsFidWrTEU2vmPUdEfp/AMcUMkJTe29Z5Pnr6iPz0JFbUqHvzNIvOcEPmNN8C0kIvC8hCcvADwHB7iSq1rkQilhpWchL3mydNn6rqkyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8128.eurprd04.prod.outlook.com (2603:10a6:102:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 22:16:44 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 22:16:36 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Han Xu <han.xu@nxp.com>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 2/3] dt-bindings: mtd: gpmi-nand: ref to nand-controller-legacy.yaml
Date: Tue, 24 Mar 2026 18:16:19 -0400
Message-ID: <20260324221624.2424092-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324221624.2424092-1-Frank.Li@nxp.com>
References: <20260324221624.2424092-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SN1PR12CA0075.namprd12.prod.outlook.com
 (2603:10b6:802:20::46) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8128:EE_
X-MS-Office365-Filtering-Correlation-Id: 7049a38d-afc3-4b60-54ff-08de89f30380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|52116014|366016|1800799024|376014|19092799006|38350700014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FWFgdCr6Fa1exT1+SMRcOfM7wMxEj+5sJGn5sBeY7laSN3T0c5WEE20xwM+gUl/yl8BdsMzM062K8eXWHZFeIPypg7RhLvoBIo9xTOnyKOXt7pP8Ly0WEmj0AxRwz9ubJ6AH3vYNwweRWq0H7WQLTqgDKKaciWAwAZRWfvebBoJDs79PmkhPCXlnWIpc0E4nH/4fg08okcrvfjW2h9hI6aem6qjWsUuNhdn3BxIQoXpyI+DVDjtSsRj0Qr6mIGd62lrT+nivIpKksg+MnH+0OWcfIeOLHIxJ9Tg/nyKBOAHp3wVreBdYmg4dPzfmfnYXLcca7SEjVpt0Z6mVeMz2YLJlbl2BCE7XLhHioG0JPOE4k/mPemhnrVERP2OXMXe8d5Y/syXqIhDYq5iimyyPU4tpR9BqkDCs8MkGGNQgZ/u1UfMSZCTKtfxwC83Sc20Di86DidkdjldSpyJVl6CwF1kjkWE2S4Mchv//Qh3MXmdZN9mqI1rtgiJSYEe+TQoxWA+XscujeAt0f1YiFrr8LUbdCat0wXc/J2MAVScN5ABbbqsLPI6PPSWsGPEqsmuKk6NL5Y5xDzaIRiVcp7mNygNNPVPa+6Razzl5y65CqIzpmy6DJJob0hxHoho3XqpJfYTkJp44iERe+xcBaVe7To+So8pldKz0VJ2n79mIKnWSCdFJOe8DUm2E6MZdiR0zXLgR+DtM6oeXkTD3EV+ygzEE4dzH3PbP4ilhvUHX999yOU3x9hLWDJYnw5dFS2l0ZyLpkZWGCDo2o9+LiZLloDVEUqyrvDKfFEPDGs5bv7RqcURioGm/axZGLns2HhsO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(1800799024)(376014)(19092799006)(38350700014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PXo/f+siintF8SJ1Pnn9u4VcozYZvJYMdeAeZHsEJcyy/SvAyMWf8uYmH/HH?=
 =?us-ascii?Q?w9hOwgjevVWPFuHbNVo8Gj6KtJZl+5JXXZd7y/FNj67lpX/Bwmg7lYCUkZSZ?=
 =?us-ascii?Q?47F44O0oF8jJhZUs2VZh9e+IxFlxYndxa1mTeBNPiO/ZeeRitaw8FOJS8l22?=
 =?us-ascii?Q?e1erEbIScAfEDYAapxhP1X/4+Xc0d92muQQ0lxpu6ABfDRLrOvoyCO7XaIgJ?=
 =?us-ascii?Q?+jiXbyAu7DCXVbamD9cf4x6ku3Umr7kO6cMiGfcC0A0LXjpL9V7u8kjHSKXE?=
 =?us-ascii?Q?24BnhsFGzfVui/wYifJt4rAGGiVf9ICjoFYxuMKkmAX4fes3PmrA9byBNDne?=
 =?us-ascii?Q?LXNjkfdRRCAGbtBbc/0vlTaiJiJ41UYeEc2I9fhvknRm6YdScLj5M61YblVa?=
 =?us-ascii?Q?2HfR21HfuI0TlZ1MsTTKG5UEBllNVbovnuGbc6hNmIfqXK3huKfsnvITau3G?=
 =?us-ascii?Q?p6tdS5qjEF9WBP4kbHbbok6zfkjuiSU2zrLBlTione0da5MNIo19RI4y5jtM?=
 =?us-ascii?Q?Wm5wL9tcYUqeBcPBPH8LVIPm5KLzfgzIjA+SJqsKC4Ivfz2MlDWcmFktbole?=
 =?us-ascii?Q?ZJSvuSaxMMlfiYK/Us6Duxaj8jk+8ObypoEvOPKtE8JY8djiypyrEDfDzwH0?=
 =?us-ascii?Q?uZxChWGRAfXhSWWba0kVmUm/DzGUzZ4ttlHL4tQEaTMZFrTJGMqwPoIrhTBJ?=
 =?us-ascii?Q?ROx2szs32M8kDik5UKqCR5E+tv5AEJiW5UvKyqtW6SwB1orRX/SYxhFcqBZT?=
 =?us-ascii?Q?pLTQ1++Y8MsK75Qoc2tq/9A29L1SofP5O6ivpuHLcIHOfmcehR7jh/DOJx3k?=
 =?us-ascii?Q?6+0W7W2h0DLiJOoSxIdfKRYHl4DRJv8mgGmXVUlpCaD4Ks+7X03AcGH63V5q?=
 =?us-ascii?Q?SSZeTPM5kLHwnoUxyxjvDqE/INvP1R1Pkb72c2yIaJbz6phqw340aEU8sL8n?=
 =?us-ascii?Q?ZWXiKRVIUkGSwN3AsYJTGDhP4nWOeD8ScF3Z1XRp/cAOdturQOx2ZounPpoG?=
 =?us-ascii?Q?hGt2qVzSy4zroy2Yy1xMqAJRjK1n2X91S8vLB7C1GFrAbJEdrY/F31Zt2a3M?=
 =?us-ascii?Q?9/IY4uyKMFqe1XF1/ynCoJAevN4W67av0R405RemLxyDF/k+Y2dMaJqcsOo+?=
 =?us-ascii?Q?3yO6CLUNbWx8qK/pdB9N+oA36g/0aBhzsmFhE1yxgrvCDIDbJ2l/Y/EagYTf?=
 =?us-ascii?Q?iTsaXGNdzHyLqrFVccq73eUM+Es5cNRTikjW+iCibs7oWsXBakkiHOwCoY56?=
 =?us-ascii?Q?KgOHrYK1VLshGPQ0uqKdWQ2Awp+VVUI5yAN3dJFVG/rGvNIZH1KuEK2wwH3b?=
 =?us-ascii?Q?bvpM3c/gOm0nEEdASp15v4qVGq8wUHc69dbKPNq0xkHLM8pZ15Zj/SshLuq3?=
 =?us-ascii?Q?jRkfIVLiQ79PLycQ3ziFf2/EFdj7iXs8ciburJbHwuestk2Mm5oKl5bUUafv?=
 =?us-ascii?Q?dFhNxK/q6H9aC7NSj6fQSoButhDEZjS5NuZVoy+WIG/VTWZaDvCZrsjUM0Xo?=
 =?us-ascii?Q?VEOxD7t8FGKgAhwV7eCGrIBamkVdS3uSdZpe3KCfZZlvpuJ/SwRdQWrgu38G?=
 =?us-ascii?Q?dlKVmEplK/ZIxxSZCmHLfcmGluXWITOnIhZpsftLOmMp78ucG3jdLpGx6r5i?=
 =?us-ascii?Q?b48GFTaouBLcBjhL8ARyBcGr6d96s/Q0keoBvnRf0xx1c4xxl001T18kDi7F?=
 =?us-ascii?Q?W+/slrAcnDC/li6mtn1xk5ttNOTrQ5VvKMD+k5oiFvTlE06t5Szfxxkd1EYg?=
 =?us-ascii?Q?5+S9X1aVcw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7049a38d-afc3-4b60-54ff-08de89f30380
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 22:16:36.5166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p575u1zDJjTvbRgVdeLgblptk7anOVmLzX2/BAA22LaRLdMuehmbnhn4HNObB5jaouHyQRDjkQBVqg61YJrMjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_151722_514774_2898200B 
X-CRM114-Status: GOOD (  11.14  )
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

Ref to nand-controller-legacy.yaml instead nand-controller.yaml to allow
legacy DT layout.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- collect rob's reviewed by tag

change in v2
- none
---
 Documentation/devicetree/bindings/mtd/gpmi-nand.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
index 0badb2e978c74..adb684e3207cd 100644
--- a/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/gpmi-nand.yaml
@@ -101,7 +101,7 @@ required:
 unevaluatedProperties: false
 
 allOf:
-  - $ref: nand-controller.yaml
+  - $ref: nand-controller-legacy.yaml
 
   - if:
       properties:
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
