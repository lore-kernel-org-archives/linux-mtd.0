Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91995C6FA89
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Sep 2022 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5mtidZ9gSa4G7KZ4AfcMVS8f7zWZ8kenywH9OQvw5rI=; b=RJnfg1DFL+cLOk
	OEQfqo83L1fGhjbxLvUqV5uHsMz+WLDnKjLWf3tk6w1bdtKKz4mjUUjk0Zh/rwVJ+uTuWsUBS7Cgf
	Kpxl5wubakZ8CctvpJHbO1ydRfwebrmDdMZglzFbw/EvRpUCP9mpDHVj11AaBrj5Ah7Cncqm4nM4S
	tepv42vuNXt7tViTtLffdU1R84lFcKPcIHqLZtQZT/BoR+dKqsl9gyZl/GzIg2I0H1VB0QZ9ztQWo
	HXCMSp+wXf2r1Xm/Wxt9Y1OwCJKqZj+9E/Fj9QvtR9PgP/sKktYAbpZFw7NHxzI5usndztPF4t8KX
	53mPyTlhIsZJm7e0GijA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYqVj-00Bsde-J4; Thu, 15 Sep 2022 15:10:39 +0000
Received: from mail-vi1eur05on2044.outbound.protection.outlook.com ([40.107.21.44] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYqVT-00Bqkv-IC; Thu, 15 Sep 2022 15:10:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWQ1O5hf3IB69CtrZbProj1vhlZYNvlOWdvzdtxEhUVAzq/WELN5sQMcXZwzk92MkmMcqNYKpXv82gYJIWUe5yJCW0AYk8+InnJyNPrsXLp/7Ul2TewIYFPTyOu7HLaCYcm+KZgL3cfqqZV6Aq2sjKyFJl7wK9XA6wRpJoy8XgNfMb8kp6KvwOT8tvqq+jOQsJN7O8j8WGyKVrwI1oEVkURMPuk8//bM/R6CqifoqviQMPkEDuoeIo7qoFHtITUrItYYs05toIZmfNxe8eKhk6uWwWroW0GDLA6rKmw8ngxyjkNQ+UBodwN07b8jbQC4d1fwgzwULkRDMMg9ujX0PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgD8Cnm3WYv9KHSEo21zE5jGuEImiRA9dbMHn6AsRe8=;
 b=JzUgjj4y5r76uVn5/5+9zV84aYVzvziQMz3o7wgaVpDOLCOJdf9rWhgTGCAm2Qk+x33d308DV+vaxNPLm9fCSDA6rIPE31J/eexsCKz8uKwW8DPLhcsrTsfDO9Kf6cmmufrVMam7a993VA/73DAxBajQOoCH1STVYDFnDZavRsK/SACscR6lEPMkVBG+ldh7kk1zxoaJyJGqdv21KoL6I6KLWYF4wWgOGlqIE8LMn36y+WWDZt6UAaEM4QZ8T1hmVtGDVYncY38olMBnCZjMtRT2K0frnrP47kOrKcd7nvO9X+6fG16Yv4Edijm1UIFQ/jVPkR1f5y3lwLCEOH5eug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgD8Cnm3WYv9KHSEo21zE5jGuEImiRA9dbMHn6AsRe8=;
 b=hS3LmGWrLLY3anWw++hYIbbOCqCvGhsz4IpFQlvA8ybelCOBxbyAosHjRUW2KGIKjXTL5F6mbgSFP0A4TeNJA06xGRjASyxvKYN/UCgRE/9yjpVn0JmAqA459BcT46b9c9ehCuL99Fl6bwCTBJ+unGymQgKTsquSpn/lFOhZrU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com (2603:10a6:10:2e1::21)
 by AS8PR04MB7814.eurprd04.prod.outlook.com (2603:10a6:20b:2a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14; Thu, 15 Sep
 2022 15:10:17 +0000
Received: from DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::a673:b7a:de19:d0df]) by DU2PR04MB8774.eurprd04.prod.outlook.com
 ([fe80::a673:b7a:de19:d0df%3]) with mapi id 15.20.5632.014; Thu, 15 Sep 2022
 15:10:17 +0000
From: Han Xu <han.xu@nxp.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org (open list:NXP i.MX CLOCK DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org,
	han.xu@nxp.com
Subject: [PATCH v2] clk: imx: imx6sx: remove the SET_RATE_PARENT flag for QSPI clocks
Date: Thu, 15 Sep 2022 10:09:59 -0500
Message-Id: <20220915150959.3646702-1-han.xu@nxp.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To DU2PR04MB8774.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8774:EE_|AS8PR04MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: 3650d05b-b5a8-471b-fedc-08da972c65cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/zQzo0NcBg1y8fqTve1/dJLTP4e96YQLFt0hh0K3Kp6PhstI6ArbYaqJQ0UbHVHthT8MKjXQkzavUbf6/DNxES8z2uyhVS/OcBfQu/FiQbcYnqJabJ2d9ywjzdSnVFoVWFkZMp9zfX3okBa970mDotJS4i+C2zCX27L4f+dBnnoQM9QfVT/KFA4Y6RCGISSvXxgM3osnXbTZHS/+0nL/iIY5B+cYD/EYCxIw9K6T8fT4mHP5+I4EaWG/a0iFsqviqXvatVJtheq3Gq3J1iGkHRfYrRQD5ys4DKOitf8v7VUH/citAnR/HpprWzRV2+ugMQQBAXBbIZbKSN2YHShICGA8vJ9UmvAOTyfTNIX6Fpe1KbPCR58PK34hBM5BZRyezH/e57iZJ/VgpJiEeBH5yWU9xfXCTirvVWM+oGdu1nYqkx033EH33D7zHGgTj6KLiGapArMHioxf2nFdpMsAcNVBkRjZJqdweWXsyPqlu9Cb5ndE6K4JmKcdgyUY/8NoCiWpZGuUESis2V+QiZ5aFCRNtSqEaHpUb31WyIvZ71oGE1ph3fikIO2ndMxI/IgOTkPi2KOgCVSd0f0ew4jdPNwEWwfC3jqp6Iss+afILeCU1kKsI3R3KkfZN1aH8OoFFxnJhD1cyZH8987rkpvm2UIgbSb7lbnIQSdMnI7AwRFm8MV7B1Ntwflu6rOqlPNhctJLePQXH112/vbI0/6AYjOONMgS8XKMl87w1o9ZBGEuCMRmueGA51oJyKhoPtyPP7SM2YStMEik6KP6wLAovpicWaHuXpUrXfWm7ITzRcAe5dkG4Cn5WP/aAz7WmdYK
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8774.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199015)(44832011)(8936002)(4326008)(66946007)(66556008)(8676002)(66476007)(2906002)(7416002)(5660300002)(6486002)(36756003)(478600001)(38100700002)(38350700002)(26005)(6512007)(41300700001)(316002)(6666004)(52116002)(110136005)(6506007)(83380400001)(2616005)(86362001)(921005)(186003)(1076003)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?FY3pt8wUOto06xR43+ET8xvGLdRwlqU3sb6q5xQHANF/tePVK8JkATJlg4r/?=
 =?us-ascii?Q?AjOJX6vpk77y3GqRT/3e3rTubuQzAXQrxKvUJVTpTwO37vpQkrMIS7U8pnMC?=
 =?us-ascii?Q?Ac/WQLniQfIvWRPMFcLLMrEvzsKsDJyvrfSvJ5OVa0fIX8WyJL1EJQPaBY9B?=
 =?us-ascii?Q?Z00U+5OAuhYmGlwWRJpKw6BqLRn9/V9hXEIqp8eHHPz6cazZLc0xDNc5X0/U?=
 =?us-ascii?Q?acd3tXP+R2b5BO86tXfQBKhed6gTiXmkAnZHA0tK7cZzHwFoVL71EwPYuDU0?=
 =?us-ascii?Q?jDM3WrIpyhe+0sK8+lSN3CcsjhdEMZiyBi78EARdiz08BIU1AwmA+JkJEHkn?=
 =?us-ascii?Q?SxV874vdeGhEcT034PrTYVJ++WPujueA0dIucnZLFwy5chKfE4Ufxh4yN69/?=
 =?us-ascii?Q?xr3jGVMzgznbTH/FkyQMC4LNKqCRWhhvo7oTSr9JRPigsvfyC8XgIVEoJPOb?=
 =?us-ascii?Q?ZYk+5bu/4biAK1vnwqEafT73MVXRa2iNmmPO3b0RtW3T4vfjxlbDxkLu38h8?=
 =?us-ascii?Q?XjjRxW9c4k/M3XTZgpPTBRhS0Q7Vi/JvaeGp3mSDG4ZdAjnP8hA0bVsCEVfP?=
 =?us-ascii?Q?Mr5Mxjjui+tacHFxJERb0t1VQlbf8js7LIgWE/Qp4hPS/akU7pPmVGwLUeWP?=
 =?us-ascii?Q?FSvobR6RrARqPosebiKHhJZTEOUldqL4E3J1PEzrn4pit8tIRo0zb3EEzzWF?=
 =?us-ascii?Q?U/L3R+JptsjoVxf7GMJ5EOx5kitmsSY/ntgAwbAmRMY9NLFp4/kadRhVOQhv?=
 =?us-ascii?Q?bOgTP6yuWqqn/Nqns1BPBmFEzJ2OMGKgzCl4X/CxYG77NbMYp4uhWcw9OdxK?=
 =?us-ascii?Q?J4K79BCVV+2LMTAqJQlfiFxRlWx8AyzCNR0ucuJkvdahb3v2EhunsXS1jI8d?=
 =?us-ascii?Q?eiUirWBxyNk6wmkrOmRAzdn5nKUX353P+DRB5qinkwFfjz4zCEgkqX78P9kf?=
 =?us-ascii?Q?0+CBHBFxsc+G9i50Cwl65GbyfCmpI4BTUx5CsL3a6GFyGbwhNmOhRfLsS+X6?=
 =?us-ascii?Q?PyteAQAp8WEgsYF47EzYvajeMXO2/ATAOuUWbwlvjUesN5Mm2/jTuk9Srkjc?=
 =?us-ascii?Q?ZJkA7ENPRMUaEeRauWMFcXGD9R8aSRzl0MZxV1B2KznEw3JOlRKIUaFnpUQg?=
 =?us-ascii?Q?KlND+4COcLNO1ivG1KHkcpMIX1oYYwok+GMFYA5p/WSNpRxB8nl7yJyHnkYt?=
 =?us-ascii?Q?k0jW6PUp/5akuRi5Th+NWKJkb8xNfJE/ya396ykAPBqzS6tyDGGbMfUWQ1Fo?=
 =?us-ascii?Q?woxswbUXwJSRnL76slYwqLt4pnu/cNpbQhPG4Z+I56SbmkIqX6Qk0tE4mall?=
 =?us-ascii?Q?gKorJwXwnMcXAHxBI8QgkTdCjB1lDoPYKqMnMhFZjlCcsEh7jlwtV+/aWpIu?=
 =?us-ascii?Q?DOeuxJIj87+cPNLbhULTUMrFjpgt+QDUBW+Noa9M6bHV0xFHIHODLIXNULZl?=
 =?us-ascii?Q?RjOr3mahIWYAKvZ9WNXB2I7gMRlwEY73uA3uHNCdo+qhf4inGc6vIHHfT825?=
 =?us-ascii?Q?Dsjo6dTgvAbsdjrnoWWV2DJx5OrKbb0I+h9xzBCu0bCPVLBfOcl9AAJ/j8Xw?=
 =?us-ascii?Q?asqVPwveS7zktivauLY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3650d05b-b5a8-471b-fedc-08da972c65cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8774.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 15:10:17.3074
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBF0aDzZF68jO/GDVTC/BPIgBM8ayC5Jeg7tfsgCWkl8In00iReUEtq83SlSPpuw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7814
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_081023_635213_96599204 
X-CRM114-Status: GOOD (  13.97  )
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

There is no dedicate parent clock for QSPI so SET_RATE_PARENT flag
should not be used. For instance, the default parent clock for QSPI is
pll2_bus, which is also the parent clock for quite a few modules, such
as MMDC, once GPMI NAND set clock rate for EDO5 mode can cause system
hang due to pll2_bus rate changed.

Fixes: f1541e15e38e ("clk: imx6sx: Switch to clk_hw based API")
Signed-off-by: Han Xu <han.xu@nxp.com>

---
changes in v2
- fix the build break due to missing close parenthesis
---
 drivers/clk/imx/clk-imx6sx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
index 2301d8fb8c76..d9ff831bdf47 100644
--- a/drivers/clk/imx/clk-imx6sx.c
+++ b/drivers/clk/imx/clk-imx6sx.c
@@ -324,13 +324,13 @@ static void __init imx6sx_clocks_init(struct device_node *ccm_node)
 	hws[IMX6SX_CLK_SSI3_SEL]           = imx_clk_hw_mux("ssi3_sel",         base + 0x1c,  14,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
 	hws[IMX6SX_CLK_SSI2_SEL]           = imx_clk_hw_mux("ssi2_sel",         base + 0x1c,  12,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
 	hws[IMX6SX_CLK_SSI1_SEL]           = imx_clk_hw_mux("ssi1_sel",         base + 0x1c,  10,     2,      ssi_sels,          ARRAY_SIZE(ssi_sels));
-	hws[IMX6SX_CLK_QSPI1_SEL]          = imx_clk_hw_mux_flags("qspi1_sel", base + 0x1c,  7, 3, qspi1_sels, ARRAY_SIZE(qspi1_sels), CLK_SET_RATE_PARENT);
+	hws[IMX6SX_CLK_QSPI1_SEL]          = imx_clk_hw_mux("qspi1_sel",        base + 0x1c,  7,      3,      qspi1_sels,        ARRAY_SIZE(qspi1_sels));
 	hws[IMX6SX_CLK_PERCLK_SEL]         = imx_clk_hw_mux("perclk_sel",       base + 0x1c,  6,      1,      perclk_sels,       ARRAY_SIZE(perclk_sels));
 	hws[IMX6SX_CLK_VID_SEL]            = imx_clk_hw_mux("vid_sel",          base + 0x20,  21,     3,      vid_sels,          ARRAY_SIZE(vid_sels));
 	hws[IMX6SX_CLK_ESAI_SEL]           = imx_clk_hw_mux("esai_sel",         base + 0x20,  19,     2,      audio_sels,        ARRAY_SIZE(audio_sels));
 	hws[IMX6SX_CLK_CAN_SEL]            = imx_clk_hw_mux("can_sel",          base + 0x20,  8,      2,      can_sels,          ARRAY_SIZE(can_sels));
 	hws[IMX6SX_CLK_UART_SEL]           = imx_clk_hw_mux("uart_sel",         base + 0x24,  6,      1,      uart_sels,         ARRAY_SIZE(uart_sels));
-	hws[IMX6SX_CLK_QSPI2_SEL]          = imx_clk_hw_mux_flags("qspi2_sel", base + 0x2c, 15, 3, qspi2_sels, ARRAY_SIZE(qspi2_sels), CLK_SET_RATE_PARENT);
+	hws[IMX6SX_CLK_QSPI2_SEL]          = imx_clk_hw_mux("qspi2_sel",        base + 0x2c,  15,     3,      qspi2_sels,        ARRAY_SIZE(qspi2_sels));
 	hws[IMX6SX_CLK_SPDIF_SEL]          = imx_clk_hw_mux("spdif_sel",        base + 0x30,  20,     2,      audio_sels,        ARRAY_SIZE(audio_sels));
 	hws[IMX6SX_CLK_AUDIO_SEL]          = imx_clk_hw_mux("audio_sel",        base + 0x30,  7,      2,      audio_sels,        ARRAY_SIZE(audio_sels));
 	hws[IMX6SX_CLK_ENET_PRE_SEL]       = imx_clk_hw_mux("enet_pre_sel",     base + 0x34,  15,     3,      enet_pre_sels,     ARRAY_SIZE(enet_pre_sels));
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
