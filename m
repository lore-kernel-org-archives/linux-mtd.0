Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B198BCF6D38
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HHwJItL6t2o0HNaEktmnBa9T2VecBBHtCzRkKIT8280=; b=KCC6LuLt/9LyGL
	LeZbr5moinRsx/YdW0wfBBRgEN6mg+3Dv2iY0yH1agWyO9tCNB2+RQqYSmS2U0B/Gew258IE4EgoY
	BHYolh995IrTQqjjSIj3u3kjv9DrZp49fZ0GGY6uiQ8IFqXxlF2byWjLof4zrQHR5mCH2S3x1PswF
	b+Uz/cadiB+B+RdykVxhnGFORMJWlcgMkHWz8Xx94ixMr8yY37nnWsuYiVCVLoaIl0edkwqq+Vsk6
	kJzRgRemb251utUeUcjHwOU6feUBCD/0U/YpEvwRTuu949Gkw9PbA2LHjft9+l9mxKwWRw9uD2WXM
	HAL1kBbH3tSh6qBWmczQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1WC-00000006jeQ-22zl;
	Wed, 02 Oct 2024 15:44:00 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw1Sj-00000006ifE-1qiH
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 15:40:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aU9Rcni7w2jw1XGCtYjN0flg14o9pGeMUbA4VC9HGMC5ixm8Fd4PZyzZogHXzklfKsBVtMg7m+LSI2EcpqEhUpWyHuE5TPjKfHVA6Et8F02gUN0aMC4IdxaKBmQR372Z/ddWf8vjXCpRd6WAoJ+yjeIxN7odUUo06VkjI0JVc+8tst1wZEyZ4bYIRkD3ksyYOLrYnQGj7dd7V8c+/oR0Fce6Sczp6Cn1f5545V8MAfNaajReFzwFT/bSJ3vDxtXMbZ4fIhyuk8ADkt/McLu0BqHI3ZVZyhlQLlWByBO3+mRYoVTeVAVWwG+hi/p1snc9QfFB6yot02y/9SzWseRocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkJcuYAfQ6vrm6XgvILz4eC/rN0FXB7BLp6QS+WkW+Q=;
 b=Abrj+UaH3pi6N79GjMV6J2X9jAcyVL8l7r3vRNiYiIabPkjvLZlRNQdUpUMwANw6SCTTAjdQKw2zj21a56yo6kgfhkhXtVxX2HdTCkXHk0r9ABZY3YYt+ob7m2VoToUl74tDotD+ghj3tHLgnkzj90vAxsTDPxUAroqXFgv1U22Y8kHDVXGOrwoUEbPjPL7Fu3yNZmR+YjwYF+I0BD8MwgYj0vbNtLnZ4ZjVtzlBx3NS0m2y8SFdeXuilVD75ZTKgBGsWIHLT/ZpqHNeLq5S4EJvBQP+b0BzFIt3dvjMZFo9Qsp0CaypurmFwsvxanpcSP8WMafmlrqAl1DXdBt92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkJcuYAfQ6vrm6XgvILz4eC/rN0FXB7BLp6QS+WkW+Q=;
 b=CscPW7Cw0S6cq6plzrjs3NcdfqDqK905Iz7hc4PwkOJ8GS+di9YQhiwW7IUob0CwwhRGenAb6en5Aa8LdIqimc4BI9nwxVAVImkiQIKAkuIWdlldvkJGiwbBAPWxnD9SOAFtz37g5EdSIO3EL66PO2//cKWI/ubW25FmoZFaXIBfYgmth/YtDljzaKfdgFuBSWWrhsN+niC/RW1N++yAisxDa2W+wd34O0LerT78Kqy9fiKwn36LiSR97dwP7D7FnzON347OR3GUa/Ood6qJFMx0LCZg1CAhmDFvLUK55hJ7VzLC9GwaVr2wPDmBtSVA0TSeEz+5TrqwLCOY3mGong==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11)
 by AM0PR04MB7106.eurprd04.prod.outlook.com (2603:10a6:208:191::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Wed, 2 Oct
 2024 15:40:11 +0000
Received: from GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::b7f2:1d0:6b6a:ba58]) by GV1PR04MB9071.eurprd04.prod.outlook.com
 ([fe80::b7f2:1d0:6b6a:ba58%7]) with mapi id 15.20.8005.026; Wed, 2 Oct 2024
 15:40:11 +0000
From: Han Xu <han.xu@nxp.com>
To: Han Xu <han.xu@nxp.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: imx@lists.linux.dev,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] mtd: nand: raw: gpmi: switch to SYSTEM_SLEEP_PM_OPS
Date: Wed,  2 Oct 2024 10:39:43 -0500
Message-Id: <20241002153944.69733-1-han.xu@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR13CA0044.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::19) To GV1PR04MB9071.eurprd04.prod.outlook.com
 (2603:10a6:150:22::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9071:EE_|AM0PR04MB7106:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c22853c-df64-4e68-055e-08dce2f8804d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TFnOYB2WBxGvN8v58PKk1wUzIvfV+PB8FvTnecnlsKv1mUuPeDEjtDTHuR4K?=
 =?us-ascii?Q?GJLXn9TbFrGxkNsn8XsUvmHbdMb9yl+zbd75TIAtLlt0MRUKkpnuZwtMhcGV?=
 =?us-ascii?Q?c46iIHBm/GidofYuLGW3XZD8O80IVsUP6QLIw/QfR3PqMjQxLqRTol7ystcY?=
 =?us-ascii?Q?9m+ZJq/eSNwn0aF0Jf0r4XA6k5LbtH92DOQ2B7QglwRw/a7MKJX6vjCQ7AGt?=
 =?us-ascii?Q?uJ/pai9bIGUgrJLrAErYTngtiLt5MoV58HEoL40053O4UKsK5V9iurPbtgHx?=
 =?us-ascii?Q?B1vd7lU2vdpBliR2hcPTtDJcPr0lTyG1VBk/e9Pt8wjC+AjPEM6V03/0Ek/e?=
 =?us-ascii?Q?a657lTF/cSVmJuLMkVphFEYGD6eiCbt1bNI0celueVT5Av4vtBDrsbC5VlwW?=
 =?us-ascii?Q?AE2LsTCmXmW37e4FGl3jXMcNE2Xb9zPN7mM1tX9x1Mz6XOhIJDUz6JuQDc0Y?=
 =?us-ascii?Q?dzTCs1rRA64w3SWhRazu5jB+UiTJe6eehBnxrEqxV7r6/uA1qNZfKAK4yAUp?=
 =?us-ascii?Q?7LzdZF27F/wHPC7ObZIyLAnXWGaHaYz5t3WGfXtFmpc+10mOllvE7PcbryCZ?=
 =?us-ascii?Q?SJEC4BJrsGVJcRmM8kpuo7CnWfaqG8bo0MCdrSegDZGI/KENpl74VBvRm3zu?=
 =?us-ascii?Q?tYZxGElpcifQtL3oES5r1+Zq7I+q+ZBZyiX5pvabDq5yCyuA4gNFfL5z5jsO?=
 =?us-ascii?Q?ocnwzdoOmMM4FLQiVPv8WInLwap6Hyg0IgLJxjPM1iJTm7c+piGYS0/Q+v1y?=
 =?us-ascii?Q?sfhaZ2WhFkLRMRFT8CmN5rHOTBYLvb2a3BJr4ov4yCtPc3IHDnz44M9vb07b?=
 =?us-ascii?Q?2AN/qW4REPOamkopcOmnwXQ3CeSfZc3Ue9sU79scSr3NFhALvXZlyGUV+s/D?=
 =?us-ascii?Q?3ebTUPkqBVDv26nRV82QVQjtlu5ibAf8rjlnuKYWwI8px1udtlo1+OEkeTcE?=
 =?us-ascii?Q?Od9Hum+BU/jJ0BVEuEkVbD/qC4YMWFFYwunecImcFltQMXiJRmO3nqY1Je78?=
 =?us-ascii?Q?56+eU0rjf7vIJEq3/aUd/1VFRwhLFjh9Z8I4lghcZI475Ju/MiG+Y4oNRb47?=
 =?us-ascii?Q?z30+kYTuuEiBPknNwo9maZvklpO1GvViw97NdU1JY7yCuYBGmayy02dp4OiA?=
 =?us-ascii?Q?oXXNWPOLYkc4fWlHPyiNlleqozJ3AOvgs2866nrjITXVZu+dy2OjhYHvyCBF?=
 =?us-ascii?Q?9bqpk1k+ZtdnbkzWoe9BzAxlUHaetED0OM13DpeTV2y9tRHLGtz2khfJJ8sb?=
 =?us-ascii?Q?ZWzTArBApn3non3M7RAcESd1zOROa1XTSKUfnBJn5+R6gtad/uCBrhy3rRZ3?=
 =?us-ascii?Q?0OfQiwq5XSmnbfla6C5to8D+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9071.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YvNcG1B6wvmzLSKz9H1YKW1YlctfWmv3zpfxhTmUwJFT72rHQOp+nms4f62m?=
 =?us-ascii?Q?pQrybMG7U8JIaMbAMj7F2ZZZ6sMhKKnq5Q8M4yiJou2RCQg86jB6sUjAyNLG?=
 =?us-ascii?Q?m/GUYzV53pjumDbXxkOhyYJ22hs/HOFpVIe2qrpqFq9O3vedrckea1hDWL8/?=
 =?us-ascii?Q?8q0qYIB9+rLlYUgqeMRHAxzSfoUZZy3m2uO8kT8H0YjTAOJUqZJMVtP4kL6W?=
 =?us-ascii?Q?LNVHDli4lMADYJO8SFeRV4djrLiz0lQc5NIFPnAGipJ3fsEPNoOoaoIa2hDo?=
 =?us-ascii?Q?ma/bUqmYkdtSB941Vm52b2qgNQYpMb1ZznsF6KKhPIjX1DlBi5g6ROd6c0kw?=
 =?us-ascii?Q?GMpJ96mhOdT+lgvZOyBiKBq1E3SjnWKGoVaYKFQ+sgzLUIatKHMwDUQ0zzrI?=
 =?us-ascii?Q?0ZxkCI9JjMdCQRRnMdqZ356kHlIpBgsLkzhABAfWWvIzpP0oOlE0BSZuJS1A?=
 =?us-ascii?Q?vkesjzlptoHexT/oFhZx39NPYOE/iBvrzDLfHpnjZEeJa9XWraUP3HWisi5x?=
 =?us-ascii?Q?PwA+uS3xyNthV2rP6wWJPOvLRNlEpQt3WPFDplBdsUMcjWBNaLC8DD2rp5Et?=
 =?us-ascii?Q?PLqpmgbgQbQ5G6n4zEj5GnLO+3ZXSEqmBeqZuhbtq3cXfvlPlZE70kPSV+ep?=
 =?us-ascii?Q?JaGg2fCxWHTUyFkUe2cl7kS5bofUejeSih3cdn4ZN2t2rYRCzXMYAH7550vy?=
 =?us-ascii?Q?B4pUW2YRunfQpIUo1yHisSvsiE8mKsz4AnUNgNiVrCZwlEEzZlqCbjDvBHKr?=
 =?us-ascii?Q?AU6UFIVi1uNZ2ectyL8mq6TCUoZ6AbZfKz6dREkYEyPxb9pUqZdQSgCN9hPI?=
 =?us-ascii?Q?qKBch6AT+fpJIM3e65rfz4Kjrr2K/HrR1/Z7vNx9PcYP8sUd/8kLkyT2Ebmx?=
 =?us-ascii?Q?h7JHvl4SVBB+mkt9s0tlW35rcv2t9TiyiNys4Ac2nWzF/X1fZaaCK3zIR9Y5?=
 =?us-ascii?Q?8iRbZwf1pTi7poUbANgpj7LgdH5pL+R1xxZjcW5ZlIXVZdLug20vqmFuoq9v?=
 =?us-ascii?Q?3nAw2U4aQ2BPux9jd+O9uacJh8y7wLNquyttvgBV6QpSQ0w2wyAwIkLqF4JP?=
 =?us-ascii?Q?TsWLZYALNf6ACQD/p9Giz5obJuaNeFDLMAg5l9K7JKnHRjE3awHLnGRFxMZy?=
 =?us-ascii?Q?Fdaut5xnQKiMHc0sr32YLR/LiizBqTbnUGXZCH18lYFfZZ4aPaqfl+CBS0m8?=
 =?us-ascii?Q?aXT7PZRG8kM0C3CDjYZgquQFmLMh38wJPS9LzulTlRma9dbm91EpbKLBdomD?=
 =?us-ascii?Q?wefmxOQplAh1pFuaQpMyQuhiZ5q4cGOIdQk2ZnLMxvQqmrrcSvWVW3MdkZ7C?=
 =?us-ascii?Q?SocPw4ySsXd/UEfmkC7WVsm5bL6D7kcK5vH30uTCbFrCEYP5USCjPAXKciYL?=
 =?us-ascii?Q?rgM0WG0wLh27Dn4ZJNj324Rryxppt5LVH0/eA57q7FbGTJeoXYY5pb++ZYsY?=
 =?us-ascii?Q?HI3P4fyuyxvQnjomPRPFlLSD25MXhNY72YDXNEN4weo743x0EdYTIfaV0QpN?=
 =?us-ascii?Q?S0BvzQMiU9rIo+PEAmsOkLiXcFWJ3N+fZoxEVL80SLbPsHagpBCSw3NYXaUo?=
 =?us-ascii?Q?ZI6hmpnzgYcomOhXPc/4gpA7V/PkXDq5oLO86O7w?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c22853c-df64-4e68-055e-08dce2f8804d
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9071.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 15:40:11.3939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AVwoCcnElTRyWQnBhfyDr9AyIpKnX41Fl0O8MrbIyjtNknqjJru4/PdGkcbyNXAA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_084025_502671_A1481014 
X-CRM114-Status: GOOD (  16.60  )
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

Replace the SET_SYSTEM_SLEEP_PM_OPS with modern SYSTEM_SLEEP_PM_OPS
alternatives.

Signed-off-by: Han Xu <han.xu@nxp.com>

---
Changes in v2:
- Add the missing pm_ptr() macro
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index e1b515304e3c..a7d79679248d 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2811,7 +2811,6 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 	release_resources(this);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int gpmi_pm_suspend(struct device *dev)
 {
 	struct gpmi_nand_data *this = dev_get_drvdata(dev);
@@ -2849,7 +2848,6 @@ static int gpmi_pm_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
 
 static int __maybe_unused gpmi_runtime_suspend(struct device *dev)
 {
@@ -2866,14 +2864,14 @@ static int __maybe_unused gpmi_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops gpmi_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(gpmi_pm_suspend, gpmi_pm_resume)
-	SET_RUNTIME_PM_OPS(gpmi_runtime_suspend, gpmi_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(gpmi_pm_suspend, gpmi_pm_resume)
+	RUNTIME_PM_OPS(gpmi_runtime_suspend, gpmi_runtime_resume, NULL)
 };
 
 static struct platform_driver gpmi_nand_driver = {
 	.driver = {
 		.name = "gpmi-nand",
-		.pm = &gpmi_pm_ops,
+		.pm = pm_ptr(&gpmi_pm_ops),
 		.of_match_table = gpmi_nand_id_table,
 	},
 	.probe   = gpmi_nand_probe,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
