Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C01C3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2024 21:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A77xe1B3FkrrMgXn7yhhlJ5cv/cyGPs9QbdPegAiBj4=; b=vN+yT+RZGhhvXN
	Uyh1Nid/zPa65P5b9jQuLuOrNKMxdR1sYGstcYNOzukQ7WMwBJ7aPP7Zg9FwzO2vtdXBYzAEUOmgo
	z3pqhMvHxe4Bce9lzUfsT2YypOHfuIztPfdBEZlunst1abNg15GeeySikAnKdhIgQdfY34kwjfPP2
	gKvZdPh6VeDl83SoXDXl6/GiN6KUxp9meA0pmyl/z28E9Y9+NCF3FKOn6LALXvWiOP/kLZUFaJUvg
	/DuRl2ckJth/YGaDi4bkn+cZfbsiaQEowOFYLzDtj2NenGRxhlTjbuIVgMrMPmyxmzei7k3BfJ+Rx
	3BH5OpsGa4scnU9U5DLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZdd6-00000006nKp-12fX;
	Thu, 01 Aug 2024 21:46:36 +0000
Received: from mail-northeuropeazlp170120003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZdd1-00000006nJd-3BQ6;
	Thu, 01 Aug 2024 21:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7EF3BQZPqqefu7EOQekREJBIAOJ28yWzKqWKudYuVg9qSTlzfenQKIxzPbo8FWAz1QPAmEEVJrFWPCMt/nmcDHBpoxjB96MOLJ4oD5jfHr+hnyIsT3llY3ts/WSjXtD2gY6AkSjZNMVQ2WoDMON8N4HE0tqMrS2eV0BJoKqJVR20wH3GVdKGQbHaTkqqqmXd7nDiawfSwhIHjmaCNXOA15POHYqiIpbrsxmhboygZevZb3curv5vtacG9M1wnXf3Uv8eo7JJW6wHQ3HFRJT2byZEFMfhw7RCCm2x11Yl+dkJdU1sUL3al5iEjI7jPytXRyJyLr5cTNB6LqaYehVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nQZ18REK7w96bypl9nZZBt2HQdeBX+SJo8zviafjmTU=;
 b=vu9JKRLSZnrT5vVxlzmk13doLqtmQuoORtsU6bf4CmB761BGd5S63aiIvD1eZk7fDXogRgwF/0Dg/PFqQ8ekUMiTmt1uoVSPJeb4B0kBfqqChBIN8njCUKOoCQRi/O8enxMNOys5W8828r8Qx8GmGHSn5D8tlZJf916aaG08uNTPVl0RhGW6/oUHNqwqU/OSy0d7leqvhmIjaXq+C8uQcrJnEZhbJbsrt+bTndmLdUlzcVyRjeM9YhEjSoVY6FrVECv8PYShM8F44VwrDNo43MiNGDlWow7Ndj2idnxqYrt2sBPeALM/yPtrEzz4Cp7dv6lqQXPCD4wrtibWqr0Dtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nQZ18REK7w96bypl9nZZBt2HQdeBX+SJo8zviafjmTU=;
 b=GBlh/kAmgexPDT77C6ubhXVcwzRS3vazB42dZBPQ0OpNm5xYYV92UwMNWvUcBv+16dEuaWaTQaeaW9sT0ZSxoFSLvQF6tTXgabke2kxnQd8Borm90ywWFC0WOufvdlC/CTj1K40SGQ3WtaHHEJtgmbp/r2H0r2GFq/RZYSi+BjBNwB7qy8iF7l5htpotQWwIJes4uyCnwvhJxZLikARUpDS1EGNLch8VorMiTjt/orxuJmRl839uv+i2hDql0EYXemC3nd6seRzQKngwtqI3j60H+Oj8vdiCIlNJQMo/pp5P+GkjAPqi4yKWI+z1m6zt6iYWut5Z6wWayuVvEFSVtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB9093.eurprd04.prod.outlook.com (2603:10a6:20b:444::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 21:46:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 21:46:20 +0000
From: Frank Li <Frank.Li@nxp.com>
To: miquel.raynal@bootlin.com,
	vkoul@kernel.org
Cc: Frank.Li@nxp.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	festevam@gmail.com,
	han.xu@nxp.com,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	marex@denx.de,
	richard@nod.at,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	shawnguo@kernel.org,
	vigneshr@ti.com
Subject: [PATCH v3 1/1] dt-bindings: dma: fsl-mxs-dma: Add compatible string "fsl,imx8qxp-dma-apbh"
Date: Thu,  1 Aug 2024 17:46:01 -0400
Message-Id: <20240801214601.2620843-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: BYAPR01CA0028.prod.exchangelabs.com (2603:10b6:a02:80::41)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB9093:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c19056-b313-48b3-e537-08dcb2736155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LhNVn38/lmEMwTrXYUzWLZCu6hloz6eqSFaTzq0jvsM3T+zbvzC0d+GTEXWB?=
 =?us-ascii?Q?fQeLX6Uf7Wc9z+BwyUeMviqly/OgqWs0vsSV5Y3MHjn7a3Onng/wTcxaskqP?=
 =?us-ascii?Q?59c/kzIi5AruB8qdFKMRVwsgMnMiyGmIAxd30tZa3cXHxWESYRCkIew/8anw?=
 =?us-ascii?Q?FNDJy4kR3nOC7QthQpISnSyuTnkFATgRJwiYU805YeyBYAB3VTNb9M6TtkQ+?=
 =?us-ascii?Q?3Y/JEYfd6LaiCflfMfov933djGklfR3TvPoJ+fjPDiEEqRA2JpJdjqHPfu80?=
 =?us-ascii?Q?Ngy7bkOIeAsgWsvTFpcAvLQu1ZEC3oD9Oyjt+Yvshp0hgsz7ASsoKh7ObWde?=
 =?us-ascii?Q?GXMlhSjphPb3lO8BrUNq1a+T2DnEy0DhI5wk9RB8lqkC0CYQ5K3k6L1gomA8?=
 =?us-ascii?Q?+EmzmFyZOhDGNIN4g+Wluq74nh9anLHwITr0pd+t1FiRhrIP8qeuFGiYlzpC?=
 =?us-ascii?Q?zRtm5QVTYAJAOJBH7u0nsLjEWdtWnzqPsBtIzF7qfNNbrt84JF22oibCdlwK?=
 =?us-ascii?Q?tVtxf5Y0zNtNppdaZv5jUq0F5x75bhUbDHnqsFUlHyZlMqwc9cM5upYqP64o?=
 =?us-ascii?Q?GHnMI/AnayH4Y36Zkp2eIYKrnvnxuACA+HtxQ1ZZwhBZ1+I5f5vZsVktXtMP?=
 =?us-ascii?Q?ARekCybi1vm/N1OuDUF+xpMdPau7BNHYs3zhKRd6hYzAV6Az4qUMqD72TmQr?=
 =?us-ascii?Q?PfvuHOgIuwT1+vT2sOu7CbpgGNFKKOmVgxhGs6gZHSgNh6jzcQcQYdyCMrVa?=
 =?us-ascii?Q?gdbyQ3x4CMJNwySi1TZNeyv0lac8Ys38xt2WOg9Tjbj+BSJ62w8jrNGd3pXJ?=
 =?us-ascii?Q?l85AmEW5fm5cHXo9a1cVVjG6ssPvo2mla251hJKa7sSD+IsbBzyhHybEjdlh?=
 =?us-ascii?Q?6wI12ZHupBbh0jtmZLOe6eSdXg5hQUp3tZGgOxcUu06kzoW6jyjwmqfZSfXR?=
 =?us-ascii?Q?WT584+x/6fN4KMl1avNy/Upmi/9ZALOfl677axZ0nUar3zVosnac7kkSxL0l?=
 =?us-ascii?Q?GFCZuNT6Hm7VqNYNrTu8wCDvBDT6OZdJh7J/L1jQH43A3AVcE5dPgn3941mf?=
 =?us-ascii?Q?UxE60bTWRmJXiFmFRCAetYjLbUst9wYy2QnBACtbBct++vk6vBtlGoqiM67X?=
 =?us-ascii?Q?pFbA5ztGnN7IONx2YfE31DjmewCCYurXktsBSSXiO2zceiUiYCJqo3IKs7c4?=
 =?us-ascii?Q?yJRcYUc7RP+ahYZL71QS6rzWZoWnLanZ63BTvJIPjNpJlCCN3JUFZlVo9BEm?=
 =?us-ascii?Q?2a8cZiosxn+A3Np/pN2MtZU3kcybg7pwrTj3Nc6FhcAUuThwoBF55lySxe2r?=
 =?us-ascii?Q?obgt9pL5rJDWqa4aIPghd7c+TMMXx+GV4Q555kshA5vUq3vZl1ti5+lHVkaJ?=
 =?us-ascii?Q?s1XJUbI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hfZS33BTHqDVfk0ynTqST1g3io5bEM7beeru210CzHXAJH93O9A1x4n27kYS?=
 =?us-ascii?Q?07ECi6dsG23AN/Yj+9yKy6dyDyNHA9mrlFaj98JTyZE6mXMYWwH3a8i8Mv54?=
 =?us-ascii?Q?tDsF/77PGro1WkGvm9i4RxyS3OpuKQuJdQJNDKEozUlE2ji3Vsp2Vnr6EJwn?=
 =?us-ascii?Q?M5lm8KUjT5hGTVWpWEpzPtnyuMIGlalA1V1Awik8S8TQMpHs7BeUlr+MDbkv?=
 =?us-ascii?Q?Q6ybHgnpDIp0SiSDtNhsxNzS6DQRuqdqFvYLAXxMZ4VoeyGyv6CmBEVFO7DC?=
 =?us-ascii?Q?WwBoYjZL4URwxi8uODaZkwaA+iryjraG9QUnXm1qcT2Ri11YWOooTB0aDlCL?=
 =?us-ascii?Q?3wKY7SfuvgtGBGyyO6tM14B8v0eFM/fIvot3sDK21NDpkEJVGNjrQc7KPbjD?=
 =?us-ascii?Q?7waTPoUM8J2ejn36NbWGhsiJBbQw3Gx3XDYz4+BJC9FKPD/eUXUVKvG2r8zh?=
 =?us-ascii?Q?urEiQtZmGHK6e4Nb0Wz5miPfgP8tqWryFrUhwE65R0r83VyaHHxNEXZJ0Q7K?=
 =?us-ascii?Q?fF2Pe3r1ubl1iJmQuOxekuCVpDAI/NkyZj0QKyW9TTPgy8+zVdl54X+s0v4A?=
 =?us-ascii?Q?j8dQtTjH3BxIldSW1PH6wi3laiCLZxB1uFE+8sabJUK+ivoy0PXc9O3jfiBR?=
 =?us-ascii?Q?1qKrSu1talp2ysfZf9A/f0gvzhS9+zIRRgB+p1zIQFx7Ny1fHsFEWSkPi2ul?=
 =?us-ascii?Q?KRqAsMWoaG+G4HBP/B7Rtlg6fAe51ZGPmoNGfMCjx5Rusq+8JWxk5tmW6W8D?=
 =?us-ascii?Q?0jsiqgDHAg0FdvFnr0/DXfNDdCXfNthsbVwRAT6ttzTBfkePj17Tm5+eT4gS?=
 =?us-ascii?Q?J37RM9i2jb3hUsUC8vr5K5YRP7TimgRmWEZsW62jR1a3tKa1aBb1Fw2YS503?=
 =?us-ascii?Q?EeqjAdllL6bZURQLBWN271LuXGhdBsbj04Dji5do71pS1Yblp6+8DUkx02Yy?=
 =?us-ascii?Q?zeHeZQkLZBa0imFZmWcm+bhLKVkMZfgD1TqJlyFoTP9dw1p1JiYieUT5y0Ak?=
 =?us-ascii?Q?Z5DDM4EtXF8n6PG0/ai1UlMpTBBa//KgoA3MHhZsy1M0uOqltGdWfCmxRSFg?=
 =?us-ascii?Q?ifk4is8qd0SfuIuQBlQJ2oficaByTpBF8wBGpZA4ZoZhQwW6EPDK6E1vN6yW?=
 =?us-ascii?Q?mdtEufDHu+O1TWRxm6y6ffIwP5GhsPqyGH/7tNyd9OwDDQPEYJMXTk3Jz4MS?=
 =?us-ascii?Q?OSZ7xW1Wv0c6w5Y0OvgeFS2Urz6ReE/nMHPud3feiOd9PdiUje6JaxCEGwPQ?=
 =?us-ascii?Q?HJ1c20Olz2fz68GM47lg4+CODgmh/0kcU742+ff6emCXl1paYpMpIKpMIkLq?=
 =?us-ascii?Q?drPV2p9tS2CqBiEAiDgGT0zz4OLmvZRIr6oYmFFLkU0Y8go2T2TzfXxTdTQ+?=
 =?us-ascii?Q?FzutQC11VpZBGNAcVqvUTD6MQDh9YE2WtGPf4S1cQGBhDmsnzuyiw2m/osoo?=
 =?us-ascii?Q?RE20u/HwjJYzNozKMDmXS49J06fCYAsl86vHg1FDTgfO6zX14npCG3+F0RgZ?=
 =?us-ascii?Q?TxgmlnirO57WlMV6WEswne04zmiN46UnmWr3mKmlJuRceaexlI+oLWzNR/bT?=
 =?us-ascii?Q?EuGfmmzy5uGeIZHgW66OIwlH2yUQnDsrcbjM4TZB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c19056-b313-48b3-e537-08dcb2736155
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 21:46:20.5192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5z7fNjO3YaKrZmFAxFWIi+nTvHFojhr6QEWUJYLmTooANU4kxDaaA9v7WvS54qIFyb+Cx0g/fUV/FL0IciHK7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_144631_823502_95876938 
X-CRM114-Status: UNSURE (   9.34  )
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

Add compatible string "fsl,imx8qxp-dma-apbh". It requires power-domains
compared with "fsl,imx28-dma-apbh".

Allow 'power-domains' property because i.MX8DXL i.MX8QM and i.MX8QXP need
it.

Keep the same restriction about 'power-domains' for other compatible
strings.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v2 to v3
- Add rob's review tag
- resend because it is dropped from mtd tree at
https://lore.kernel.org/imx/20240717103846.306bf9fd@xps-13/
---
 .../devicetree/bindings/dma/fsl,mxs-dma.yaml      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml b/Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml
index add9c77e8b52a..a17cf2360dd4a 100644
--- a/Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/fsl,mxs-dma.yaml
@@ -11,6 +11,17 @@ maintainers:
 
 allOf:
   - $ref: dma-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx8qxp-dma-apbh
+    then:
+      required:
+        - power-domains
+    else:
+      properties:
+        power-domains: false
 
 properties:
   compatible:
@@ -20,6 +31,7 @@ properties:
               - fsl,imx6q-dma-apbh
               - fsl,imx6sx-dma-apbh
               - fsl,imx7d-dma-apbh
+              - fsl,imx8qxp-dma-apbh
           - const: fsl,imx28-dma-apbh
       - enum:
           - fsl,imx23-dma-apbh
@@ -42,6 +54,9 @@ properties:
   dma-channels:
     enum: [4, 8, 16]
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
