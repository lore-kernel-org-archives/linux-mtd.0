Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E835AC48297
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Feb 2024 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:In-Reply-To:
	References:Message-Id:Subject:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rdhV7jghXXnUOQknIxEm1rebyeq/y7kZfTxPdEeGUqM=; b=o0T3KFfZ9ac3EXyDJvmXEUp7yG
	KRbcWcnCaP1WTLFLXLpXY6wEbiWCnqVcHlXSb3kIoHSEK5GgykH6FD96eHcZJliO6XBoZbGMc6QX7
	eeImd6sRyVJ00oJN08zL3DLJTZxxpFAf+FV9N3cwu6fRBSt1yMo2vN8eYlfqrgyr5EDiUn6F8iSGr
	eQCIpXxKvQc+UKhNUBQolWTCPabL1AUS8eIjvlF/9Z00Sj4nZz/VHvSGDXXN6BwsYPaAotKKsd5Qx
	OzICx5jqIFmK+AYbrCuoZc+n0lQVZrWoesVZBEteNuFc9slOV9B5UwYWyAaoXPbUpLrPaVXylAoUL
	rFQESdSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaGb-00000006TUn-0qd6;
	Mon, 12 Feb 2024 17:38:53 +0000
Received: from mail-ve1eur01on070e.outbound.protection.outlook.com ([2a01:111:f400:fe1f::70e] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaGF-00000006TAP-1JSy;
	Mon, 12 Feb 2024 17:38:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CaSGICG+B62e+xmskiToteYm9UQhs1RTsS0WWUQZM5gDR1x/D18/t/qWX9QG9tr2dR+gb/qiI4lrkdMuaAy2+gXvdO9YgqHI/u9wYYGUD70eMPqHp6+N8icFNovuwZURMtDSTSSFZEQpba7ns//qLjIcDyjwpQgL+QK5RN596gTvC4cTMwxur34w/CDeU2aykClwdEgBYerwfN6iMh/luPIovwlY5qOW5BIzYQZtdJ/HxJbMYpNXoHcx+vsvhROdNoSkt4BE8tLLhKIaHFJpMEuQZUau23yPXLE5tPoRFIjv9aEbnI4N06KQmATTp00sHV6GNQ/BvgRUvfKX3yDK0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfPS2lRGdbZjmZYgpFzRBxBvjVvEdGtlPClZeNFE1lA=;
 b=bs3veHCjNS9gOcUo9LoKys301/DHCmJg3iNdBddCChDBShlIEq8MzoTa0ddSFCFPUMFwsw3NG6C72yr7B5tgVh/hDHpd0mwi9wiEfLirfS7dYq977bBABc0AWWb1C1bTnlqY3xqu1ltFHAB1wXWPBPmxWLURVZjFkjilkYj1X5naADqx4lMGhrwBxNnUJ9SPdhAmJBjbrNNx+jcjnCkViIM0xFpXJrsmBul1X0lsZsUwTGJdzrBTbPEtwkwk3kigqj7J/8uO7mu0/Zy94WUZp/VqOJ3PXI7ZynXbXeM6Qe7C3mLN4PvuVfI79nUSIapgwOMOfNw5c2R4go1Vs/CcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfPS2lRGdbZjmZYgpFzRBxBvjVvEdGtlPClZeNFE1lA=;
 b=BhfT9vr5Adpd1alrLQkUdGXMDXNhCD0Eiqr+k1A88qtDH65u7eHRqSHNRegfiZnL/0L9fb6FcFwNagZftaPRCfeoruug2dFUu/ttErBNijHajDVkEaNbtS//Iw84ZRw5ajKFabYz4fYi31knezIfPBRaA23P3l26yegeCGZ/CYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::17)
 by AS8PR04MB7909.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.24; Mon, 12 Feb
 2024 17:38:20 +0000
Received: from AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::3b94:f607:ebe1:7d6c]) by AM9PR04MB7586.eurprd04.prod.outlook.com
 ([fe80::3b94:f607:ebe1:7d6c%7]) with mapi id 15.20.7249.039; Mon, 12 Feb 2024
 17:38:20 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 12 Feb 2024 18:38:12 +0100
Subject: [PATCH v6 5/7] arm64: dts: ti: k3-am64-main: Add ICSSG IEP nodes
Message-Id: <20240212-add-am64-som-v6-5-b59edb2bc8c3@solid-run.com>
References: <20240212-add-am64-som-v6-0-b59edb2bc8c3@solid-run.com>
In-Reply-To: <20240212-add-am64-som-v6-0-b59edb2bc8c3@solid-run.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Eugene Zaikonnikov <ez@norophonic.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-iio@vger.kernel.org, Rob Herring <robh@kernel.org>, 
 linux-mtd@lists.infradead.org, Josua Mayer <josua@solid-run.com>, 
 Suman Anna <s-anna@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
 MD Danish Anwar <danishanwar@ti.com>
X-Mailer: b4 0.12.4
X-ClientProxiedBy: FR3P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::14) To AM9PR04MB7586.eurprd04.prod.outlook.com
 (2603:10a6:20b:2d5::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB7586:EE_|AS8PR04MB7909:EE_
X-MS-Office365-Filtering-Correlation-Id: 1233cbb1-0a45-4821-6c93-08dc2bf167b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9jf3Td+TfW4YEkFT7sGnWnc4jrHKQnmmz026GAUc/uDUfcjgcvRF5ponz9teWO5wRQZlhnqSKDDlPE9wEMPoUq4rPb1VbPivbjbURxk7VhuGSIdwmbW/cnqF+JLXUHs+hTwrqy4EWCTyNKa379jLo9nHBUmvsGU38WD9r5kL7Rk4I3na9UKDTBwcQ8+5+l44AQOQCG1MJvJyUrI9HlE0ZbxITuHkb7DwJHBlBh9g522XdJ91di+pRMunhq9c0hxf4pWexTa3q4IizigP+laPF3D1QEwTCLG0bhRhRjDtVeOXKKzVcB2ORhUzfSh3CEUsQ5Sn4q+ldCm/KsWlSflrbWe/HFnRJ18o/GRZVyI+FstnDSB+RG5VeAxk/Z4owYFUVJguj7TgHerZxe9fKJtIWUFHD+E8Mqh3b+VrKLSoDO3Wn2tn8WEuQyENjO/7mwXRobLxld3Cktrmpp5KEGMfx9psU1krYoNObNGqjI8LSeqZzAH/917Ad09THHWToRYWLBo3MirvOdYK7uWLl0vjXdhvbzfAo9TnpBrMRB3RMFa6PKZDo9+Zt1STCB4xqZIycCuBWd5lsV9SaN4Ojvv5C5tr3uT123YURP6Hf9r+Pl4JqWJ//4egVD3syWQrc2ILqFxAu2yY3224vK91mViWBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB7586.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(366004)(376002)(39840400004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(8936002)(7416002)(66946007)(4326008)(66476007)(8676002)(66556008)(5660300002)(2906002)(41300700001)(26005)(2616005)(38350700005)(36756003)(38100700002)(86362001)(83380400001)(110136005)(54906003)(52116002)(6512007)(6666004)(6506007)(316002)(921011)(6486002)(478600001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVBJaWlMUDNrdUtrZEtDT1h3aGlSaFlPdzFQYmFWVkJKVmdGeW1MU1l6cnRK?=
 =?utf-8?B?U0R1bFQyWExHcmpEZmpIMVpjS3pXRlp3bjhBSWNUS0lqMW5vVHk5VnZiSWZ1?=
 =?utf-8?B?dGcva0FveUdPZUVxRDlUcHRYbzRyY0JXdzl6T1E1TkdSdnVRUmhucFQ4N1dv?=
 =?utf-8?B?NlZyRjFNcDc5L3QvRE5NUW9yUEhiVVduM1g3SWQyYVBTa1FDRXB4ZTY1Snpy?=
 =?utf-8?B?UGdQdmtoRWVscDdWN1FjYzdBbWxvWnRyOHZSV0dkZlQ3bm5KckVDai92ZlZh?=
 =?utf-8?B?Snh2RVVEUXRpK3F5VXNPUW1zQmhwcFBSeWUzQmdqSjViN0ZSU0t4NUNVbll0?=
 =?utf-8?B?OWgrekpXR1ZjaHhvaXR1ZThhVzdLWmJmUEd5SjFiZWE0Wi8yNUVpbUczemRP?=
 =?utf-8?B?cUpDZjV4cnhDUUtBZTVlNjNxZldrRGpGQXBDMUNHdVMrak1KY1R0cmFTeTBF?=
 =?utf-8?B?OVl0b1Z6RjdLR3dNdVBFZW9WaVFIY2oxYzVIR3MwYTd1V2ZIQ0ZWYmRyV0dt?=
 =?utf-8?B?Q09xZ09jUld4b3JNaGtpRVNCd3EzandLV1NuaVBlN2gvOXJ2T1hNbW96ZHgr?=
 =?utf-8?B?NERsWTBocUpqTmZrZXBrSkh1YjRkY0tWZTJ3OTVjMTdsZ2ZTQi9lSEtxeUpx?=
 =?utf-8?B?UDlRU1EwczlKa05OSnhRd2IxV3A1RlN0eURvbTVybmhGRkFYQzdSWmVrOVY4?=
 =?utf-8?B?aDIydmxXVm5qN1BaYzdnQ0xpaWs0Tmc5U1ZEOEh0WkR3L0g4bm9jR3RyVHhl?=
 =?utf-8?B?Tll5R2NRSmJpTmJXbi9UbGF2UUFmVTc4L1REZURqVkpXRkFDRGcvb0VVQzJP?=
 =?utf-8?B?clZsZG1wcjdPOGdXU0QvbVVSN0YydXBORWJYeHIvdEhmZ0RTNW9oTEgyVHBF?=
 =?utf-8?B?R3N3U0F2V3VZY0puU2lPU0I5MUdWNkV0Y1h1Mzljc3liY2tQSUJhdng2ZXJ6?=
 =?utf-8?B?a2lDckhDMDhxeHNROHljdG83U1dzM0xhK0FTOEhjcUd4Szg1T280SGFnOTdP?=
 =?utf-8?B?ajNDamdwOVF6amxXQStGcUtTWWI0ZEtLNmdHVGYyOFJzR1VmSU9Pbml5czRr?=
 =?utf-8?B?S05pQ011UG1xZ29lOVIzeGJoWXU0U05wQ0J4WXVhSjQvcVhSWkFoU3loeStu?=
 =?utf-8?B?bVpIY0pneXVGL0hiK2RGRVY0MjgyMk9VMFZEMVBYOXR1Ui95TnE0bm8xY0xP?=
 =?utf-8?B?ajFXeVBxVWovVS9ZUmF2QkNlamlleHoreTllSEhaTG16amZHNEh1REIyV0xZ?=
 =?utf-8?B?dGZpOVh5Z2h4TGlXUkZtSGU2dW5OVU5zVjZUTWJFQWlPdlltSHhBa0N4MWFE?=
 =?utf-8?B?U002eFRGOEN3SGs1Q0VwNVc5My9Jb2NFVVBzS1dYK3EyVklxcEFvOVBJSUd3?=
 =?utf-8?B?bUJuUGdjeExiTzI1Z0dQbFZrZDAzWjF1TEVUcEE2QUE1THcrNmFsTEtRVlZF?=
 =?utf-8?B?SkcwWjFXcXJvS3plaXhFeHU5K1lVSmNvb1oxUityQmxwQTNhaHFBaGZ0d3Js?=
 =?utf-8?B?MDJmWmtvUFhodmFOK0FqbEdXNG5kN1EzL1A5cjZrYTdPcHdET01ZRjlvSmx6?=
 =?utf-8?B?MUI5TDVCU0RXbytOcnJubVB0VFE5aW5qeWhnclI2emJDNnBHYnZ2bmVvc2ZO?=
 =?utf-8?B?SU41TW43MzUwcnBHVHViSHR2V3ZxK1FJbFlSbUNnalNDNVNvZXlqKzA0M3Mr?=
 =?utf-8?B?VlNvRFlvMGlGd0tSOXcrbDI5eW1pQ241VXpya24wQ3plMlhEUXhrM3FWYVBk?=
 =?utf-8?B?a2VYOUFRUkp6UEs2MHNlM05lZjRrRlNlQXZocEM3anljM3VtRUJEQW8vZUVT?=
 =?utf-8?B?aWxFQmFQdG85aVVLb3VCUUFZV0lvUllwSGp5TUVkOUk4amM1bi9vQjYyWGVO?=
 =?utf-8?B?V1kydlA1K09BUnhwL3QraVV5eGlZc0pwc1h2RGFIN1VrZU1SZGw4V3VmNDJD?=
 =?utf-8?B?eGtUWkN4aENGcEJiUk1JTnhCc05MMlhpRUt6RG5McURsdWFNSWxCNXY2WlZS?=
 =?utf-8?B?L3dWSDFrTjg4Qmd6T1dRMjg1QnBBVnllaGZTSWZ5ZVRUYWpnUTkvZUVzNjVm?=
 =?utf-8?B?dnZGQmw1OGZLaFhQNStUb2ptVGZWY2xyWkFaYUVNZWpnNUx3MUMwRXFHOUJN?=
 =?utf-8?Q?Jtch/R+l/pXvt+tHKltt5LuOQ?=
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1233cbb1-0a45-4821-6c93-08dc2bf167b8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB7586.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2024 17:38:20.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4TUgESycoFYK2HFkK2bjXtHQiUEAJKfo2GNkzbdy2bkscjSYOlrj2eZSBMbAESPxBFTsNaRB0ENqoplYBO8Uog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7909
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_093831_425478_06567B29 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Suman Anna <s-anna@ti.com>

The ICSSG IP on AM64x SoCs have two Industrial Ethernet Peripherals (IEPs)
to manage/generate Industrial Ethernet functions such as time stamping.
Each IEP sub-module is sourced from an internal clock mux that can be
derived from either of the IP instance's ICSSG_IEP_GCLK or from another
internal ICSSG CORE_CLK mux. Add both the IEP nodes for both the ICSSG
instances. The IEP clock is currently configured to be derived
indirectly from the ICSSG_ICLK running at 250 MHz.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
index e348114f42e0..9d2dad8ae8df 100644
--- a/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am64-main.dtsi
@@ -1244,6 +1244,18 @@ icssg0_iepclk_mux: iepclk-mux@30 {
 			};
 		};
 
+		icssg0_iep0: iep@2e000 {
+			compatible = "ti,am654-icss-iep";
+			reg = <0x2e000 0x1000>;
+			clocks = <&icssg0_iepclk_mux>;
+		};
+
+		icssg0_iep1: iep@2f000 {
+			compatible = "ti,am654-icss-iep";
+			reg = <0x2f000 0x1000>;
+			clocks = <&icssg0_iepclk_mux>;
+		};
+
 		icssg0_mii_rt: mii-rt@32000 {
 			compatible = "ti,pruss-mii", "syscon";
 			reg = <0x32000 0x100>;
@@ -1385,6 +1397,18 @@ icssg1_iepclk_mux: iepclk-mux@30 {
 			};
 		};
 
+		icssg1_iep0: iep@2e000 {
+			compatible = "ti,am654-icss-iep";
+			reg = <0x2e000 0x1000>;
+			clocks = <&icssg1_iepclk_mux>;
+		};
+
+		icssg1_iep1: iep@2f000 {
+			compatible = "ti,am654-icss-iep";
+			reg = <0x2f000 0x1000>;
+			clocks = <&icssg1_iepclk_mux>;
+		};
+
 		icssg1_mii_rt: mii-rt@32000 {
 			compatible = "ti,pruss-mii", "syscon";
 			reg = <0x32000 0x100>;

-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
