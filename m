Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5158F33A92
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Mar 2026 21:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIf3Jnq3bVCaBE6mbV+wPBh/gtDE6n6O4H5lYicjzEg=; b=f4EsrbE8vzMpuX
	faV+eyR1toQ1kWpavrByHPz8H7HS/GpxFtduNYqX9RZIJ1dA2Y0Efpt+J5FoAtwOiGUb/9qruz4ar
	zKaAAkyQJnMGiIn6N6fMlCt9gEiJQP4IdGc3eEsUS3y9COvZiLwTZh/G2X1iUOeYYuS1o/Bo7y9b6
	4Sod+GUhwqB/TejfFlttY7j1RrYzzz6V38b38JcNOSa8jXRqtkxokU/Og0fcjBs919pwmaPj+ceBg
	1mNwTWYvPUmtoOWI6crHmYDzpxNo3TtNSJxUJKPo3qwi1Us8R+qnGFLRqaPkvPJOF94qzl6sEhDwq
	rbcJ9XN/MI7e8jO2PVVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycwm-00000004XnB-1xzp;
	Fri, 06 Mar 2026 21:43:00 +0000
Received: from mail-northeuropeazon11012052.outbound.protection.outlook.com ([52.101.66.52] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vycwj-00000004Xlt-35j0;
	Fri, 06 Mar 2026 21:42:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtHu+u3TonCIXR+pswiwCGFV2CTvY3j3pSSSz11dkDZK8zJo/jtTMj0w0ZQ3a8JYPK0pU72R0fbBvObW4E9L8kZsHxL4w7au9LZXevhKmY5sQQ+XN82dgqMECMaK1dHwmntMxN4xbPWQmvv/kZeHVhVL6fhWkYQphxi7vdZlvRZCGADLSbsTZfMe2YI0/xLrcIJ4rjRzc657sgfp988n2Pl5imKuvFY8fNIQqZedo4/qTplLY2Dn0mncReEyUA969ePJ3xmjPAU2dF55oPho89Io0gaShZ8IZctwNTE237JspTGY0VUI1x4JybbYwKTpDoFxGCwlOx22DSRlPt2g7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SLQQNVyQRiZFcM80CxeHL/yMKRTwDwwpmY0x/E7fr/4=;
 b=htwsxg2DCrDL2oJzGJ++AJpYNPZNB8Mvw47Pw3VBUNS7VSIYuSH5qPm9+hV5ttqvOWxuxabmURC+YxLkE1pJsRlwA+5pGvLXNwNBuJM53j1ryFkBK6VshSXU4i/tuoJFLqlXKbH8Gmr8pi/KbbD+urUtUQMMoqxYRDNjO+B7Iy6Tby0i8CZMgin8rXcLW8S6SCdJSSH6gc2Qi0K33FgcPYXDuCWp5hgxW+prIs4GJZo2Gr7JlAdhXyyGFu1D7JArqzQR0N95dVCK7/SJJs8IYdE0COlFhyOHBmAHRtugJc3RJfWxsbxoLWzyNtXZH4oBNSrHtf7X3mBxSsRXaOIcEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SLQQNVyQRiZFcM80CxeHL/yMKRTwDwwpmY0x/E7fr/4=;
 b=GGO2dJJJGOYDl8q4RkaVY6MvbuS/ov+FL003gjNq++bC8/gAF/rdNE3r5LsX//xVCCRXMyMraCJj3j9Nx/jV7ChXRddrSSXDK4t5CwTdOriYulHa9hATSRdjwxtU+m84oFxPJDns47LPipBDBOx02LCyeZKRIFD8cRISumFoWbyPZ60ehet1n226u5tqjGSsQGqsXkhSn4qdS/dkTpx0x0zSgJkPkAlWyl3oUuKh9wCMEz93vGdEenSvUj1t9yfKToglalewjdvbI5K7Z2YvbWuBJ/C2TjwlJUdpM04pg/3yL6eJYHGWk+9yQNA0tvrEBoWZQvFa6sAVWbHi109MXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB6770.eurprd04.prod.outlook.com (2603:10a6:208:187::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 21:42:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 21:42:53 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 3/3] dt-bindings: mtd: mxc-nand: add missing compatible string and ref to nand-controller-legacy.yaml
Date: Fri,  6 Mar 2026 16:42:19 -0500
Message-ID: <20260306214226.403672-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306214226.403672-1-Frank.Li@nxp.com>
References: <20260306214226.403672-1-Frank.Li@nxp.com>
X-ClientProxiedBy: PH0PR07CA0010.namprd07.prod.outlook.com
 (2603:10b6:510:5::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB6770:EE_
X-MS-Office365-Filtering-Correlation-Id: 348d66c1-f0c5-4f31-1a0d-08de7bc951ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|19092799006|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: XDFk6COz441e/WjO/2O6iEV/pOiYHYsuw616Qzn5H0GXaJJoeO61LMjIt6HWfOgazAa5SvXjRG9uH8BoTrIN2ZZ05otC8OssfGqNQ8Dne7FC/YDT0ApyW/7BUUPeeFRX/1rYjbWFdE9d/u8xy7IXui9me9iiyJ3f1nYDk/BKJAznlTMa2Dxi08Vbd7jCmdbV7f0muqUCi//mpHKsR+WGI2HzzoRFBCueibiBZMyyZ4w53IWCL8HLQ4TAVZUO0+d8MZ0kxl71v64dXapFoed6FM3q+2xjMDs4dX9B2uWKQjc+jnhrE4Ll3Kukh6AQmH8DqQRgQXVmujB4qrnrAIXL4xuFSacrxqhgLkUaugIbJLG0ZtuGpnvlrlfg3bsojM3nn2FSxPV1kwMKKe4gf0e7tzfFSWcuL0NxJnaZ0SevkERgoZFbTFQva2ds+VH81O/NXUXEUuBbrnqvDsK5qgSrW20EYlcHvIGY+ke4YmvMTalswtl5GmA4sPTi+doVuufm0bC5oKMWHmJUyfl7XPN4/VxajdwejALXokwKruPzu34OBkUXbkDl078iLbtBQ8iCTPRKxX0O8O71jaEr7pxknMoGVjjFui4aZk6GlR5oU1+V8+9ch4rSwwCMzJZbWS3NJhEQ99J3dCtdQqr/hP699Xvr5lC0OLpyOoeORoMbGTgmnSCT5wnuwLB4UXoa7LrftW8woEBJh7ofcEfVjeHGgdyFoxwJFz38NZW5/Zfls3ue5zH6x4pa5aF/aiH6g3qsNa3YfM0nGgZbIlE5BVcqM5+IMqw2FwzEw8wBDNKUhfEmakbWxG3OLzoc4z+CXrBR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(19092799006)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFRGYXUzVHcyR3Y5V3hMM014d2pCVHQvYmZaVG1QQ0ZXalhGdHNwTHExUEFy?=
 =?utf-8?B?b3NrZzU0eUNWcVJFYVNFTS9BT3dTZmFyd295TXZnZE8xZjNOTTlkN3l3aGVW?=
 =?utf-8?B?MFV4VjBrTWN6OEV4cWpWV096SzhCcjdSTHkzQnNEUWl4am9PbVBpdVBYcTE2?=
 =?utf-8?B?VDRHL1grbzVhakxYN29XeXhjN2tLRDBvKytML2VwajlYU0hHYndET1NkLzlW?=
 =?utf-8?B?SUVPcGo4N293ZFo0cUdDY0xwQURpSDNhNGRpOHVaSmhEemlQNlVvazJ6UlpT?=
 =?utf-8?B?dlRtNzBhdmxmc0gyRGJxdWJtUlMwM0M4TGlWSEhUUmpHSDZUMi9jTU01WTJD?=
 =?utf-8?B?dS9rYTJFc04yZjI0aEt2VHNqbjFRdE05aWZwWXQ0QmZjTzl2bkVJQjZBMTNI?=
 =?utf-8?B?WnM5MmhrTzkzSlZUZnVTbEdDbFczUnY2ck1HQVRFNHlSWHhyTGR3L1ZDcDlD?=
 =?utf-8?B?WmNaajJpb29oVytRU3QvSHdVY3JGdEdUVnpRbW1iamJYQmMraGNmbXpJckRG?=
 =?utf-8?B?N05TQUxIbmVJVk5oVW9FQStlM3MycUtucDRnSzZrTDFXT0lwUmVaSU1yVzkx?=
 =?utf-8?B?cW1wNDhIVUtVUjF3dlM5MVp3REFsRFRnQXFmQUZCUGdpc04vQ1JxanpsZG44?=
 =?utf-8?B?NUVhUVFFRzUzTEZkcnNFUGU1RXJvb244MFFRZklIckt3R0FpUElHTUprMjRX?=
 =?utf-8?B?YjdDTWVQUHNaNEoxcmQyM1paNzNxamNVWmw4Um1jVEYweU0vRTJuOUF6TWU5?=
 =?utf-8?B?QUNHbm9IR3hHQllXbHRlWWxvZTNPeXM4S05TRUY2WHhxeU1MZFhNcjJEL1dN?=
 =?utf-8?B?TnpRWmFZNTJPSmxjZlowekkrOWdLVjlLSWlQTDVMUWM2U3pRQlFweFpQYnF6?=
 =?utf-8?B?WkR0SzFPQ2pPTE1uV2h4SVk4bUdnNFNDOSthL2VWcnBWaVNZaUZlNWh0Y0hJ?=
 =?utf-8?B?TkYxWUd2VjZZUy9XKzFSOWkrNm11SitueVlBZTM0anZyMzhPa2pUYWRWdWVi?=
 =?utf-8?B?N1Ywa1FxRm93NSswNFU3K2JNdStqZmtPUE0zR0gxdU03Q0QvUGo1Yld6Njdn?=
 =?utf-8?B?bFNlaDNNR3Jnd05RODBjZEtkdlVxU20wQ0J2aG5LNUxPUG40eGV4NE5rMkYz?=
 =?utf-8?B?bENudjlnZHVZTEhNQnJOaHVXQnhFTVduVzVsa1NMV0xsdGViem1na3hqRmZC?=
 =?utf-8?B?cVJYWHh0Y0tmNnk0WDEzZGtaQlZWNDA2RHpmQllzMitrbVUreEhRV2N3Umps?=
 =?utf-8?B?NzVWSXJJbGRoYTY5SXFKbnNNNSt0NWpQWisrb3lVV09uNWd6VVZmVWt4b3NW?=
 =?utf-8?B?M3BvVGhpM011VDlOV0ZOVlU3WDN5aHdFUU4rSmdlMkdGNVRmUkdsZTcrc2o5?=
 =?utf-8?B?Wis1NFdJczB3R0JPYU5oN3lQYk5uckFURElrNWI4VkU3NzNZTGxiaHZOZEpt?=
 =?utf-8?B?UTJDL3JscFNPQlZZY05ZWHh4c1VhTDQvakM2Wks1ZjBFOUtuTDFVc2dEbFlV?=
 =?utf-8?B?ZlJvZkNEQmZid3VLRWZzUGZ0akF4WENZYnV4SE03MDNhVjRqSy9naiswTy9y?=
 =?utf-8?B?akY0NkFNSFBNVE1USXhjcnBaa2pHL0Y2WVg1eWFiV3pQb3NYdGJZSzVFRmZo?=
 =?utf-8?B?cGp4S042NnZqMjMxdW5oNVdGaElNdWxFVFJCVU4wM2NxMDJqM1NsUXRpTmxu?=
 =?utf-8?B?dDRlRld0Y09FZWtvaWZ6aVhZMkhiRjJ3eXloWnJhdVl0VmR1OGw4eXpCL0h0?=
 =?utf-8?B?QU9ERmd1NHZ5M3l6ckh4QzgwT2tMc0JxNEdRR0ZOaDBMVXIzZmZoSW0rUGw1?=
 =?utf-8?B?cE5hc0p5TkxQV3RGbkk3emh6ZUJoWkxTRHA0ZFNkUVEzdEkvVXR0TjZEbnQ4?=
 =?utf-8?B?WlpkVVZNM2htb1R5cXdCV2pNMWtUUHZmS3Z6TFpTaVBKaGRTMFlvWnhQeTZZ?=
 =?utf-8?B?VE4yS29BZDRDR1V2RHNDM25XREkyL1FndFlQVWRpaE83dTVmTGhVVUhzVjMz?=
 =?utf-8?B?RnFNd1lnUGl4bXpmYmJDUURpNksrSFlzcnhacG1WWGdOdXpBeHJhcXU1RzRm?=
 =?utf-8?B?SWd4SXcrb2VobDlMUS9SWXpYc200S0w4M0YvUnk5RjVwdmFXelhIVzVYcSta?=
 =?utf-8?B?Vzh5b3lra0FETTRpL0lyb25MQlBGbXZraXN4dVc3MEpCSUpKcTdybGU0dEgv?=
 =?utf-8?B?TmlxcWhjUThpenFLQnJuUVgvVXloaUVXVDNtMncrbDV4Y056YnB4SXk1Y2hT?=
 =?utf-8?B?WmJQSUhBaGNJZ2huR3FEVXkrc3p6d2ZhcEVVcHZqaUZCdTVqdUM5a0ZPUkpX?=
 =?utf-8?B?S2ZCcXRlcndkUWNuSEJHVWZLMUJjZFB1eWtMam5mQW1FZ0FySldPQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348d66c1-f0c5-4f31-1a0d-08de7bc951ef
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 21:42:53.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wh2dnDPXD4+n+Cwc/L8iiS41/kWOZVMTVlq3AFkxkn7gmp1l5Ofpag5cg+nkVGwVEO/GKw7exsZAYDtVAy/7Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6770
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_134257_799582_8B203242 
X-CRM114-Status: GOOD (  10.42  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QWRkIGNvbXBhdGlibGUgc3RyaW5nIGZzbCxpbXg1MS1uYW5kLCBmc2wsaW14NTMtbmFuZCBhbmQg
ZnNsLGlteDM1LW5hbmQuCgpBZGQgbWlzc2luZ2UgcHJvcGVydGllcyBkbWFzIGFuZCBkbWEtbmFt
ZXMuCgpDaGFuZ2UgcmVnJ3MgbWF4SXRlbXMgdG8gMiBiZWNhdXNlIGkuTVg1MyBoYXZlIGFkZGl0
aW9uIE5BTkQgZmxhc2ggaW50ZXJuYWwKYnVmZmVyIHNwYWNlLgoKQ2hhbmdlIHJlZiB0byBuYW5k
LWNvbnRyb2xsZXItbGVnYWN5LnlhbWwgYWxsb3cgbGVnYWN5IERUIGxheW91dC4KClNpZ25lZC1v
ZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgotLS0KIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL210ZC9teGMtbmFuZC55YW1sICAgICAgfCAxOCArKysrKysrKysrKysrKysrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXhjLW5hbmQueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvbXhjLW5hbmQueWFtbAppbmRl
eCA0MzNhZTU3MjdhZDg1Li5lYzViMTUzNDFlYjA3IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbXRkL214Yy1uYW5kLnlhbWwKKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9teGMtbmFuZC55YW1sCkBAIC0xMCw3ICsxMCw3IEBA
IG1haW50YWluZXJzOgogICAtIFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVu
Z3V0cm9uaXguZGU+CiAKIGFsbE9mOgotICAtICRyZWY6IG5hbmQtY29udHJvbGxlci55YW1sCisg
IC0gJHJlZjogbmFuZC1jb250cm9sbGVyLWxlZ2FjeS55YW1sCiAKIHByb3BlcnRpZXM6CiAgIGNv
bXBhdGlibGU6CkBAIC0xOCwxMiArMTgsMTkgQEAgcHJvcGVydGllczoKICAgICAgIC0gZW51bToK
ICAgICAgICAgICAtIGZzbCxpbXgyNS1uYW5kCiAgICAgICAgICAgLSBmc2wsaW14MjctbmFuZAor
ICAgICAgICAgIC0gZnNsLGlteDUxLW5hbmQKKyAgICAgICAgICAtIGZzbCxpbXg1My1uYW5kCisg
ICAgICAtIGl0ZW1zOgorICAgICAgICAgIC0gZW51bToKKyAgICAgICAgICAgICAgLSBmc2wsaW14
MzUtbmFuZAorICAgICAgICAgIC0gY29uc3Q6IGZzbCxpbXgyNS1uYW5kCiAgICAgICAtIGl0ZW1z
OgogICAgICAgICAgIC0gZW51bToKICAgICAgICAgICAgICAgLSBmc2wsaW14MzEtbmFuZAogICAg
ICAgICAgIC0gY29uc3Q6IGZzbCxpbXgyNy1uYW5kCiAgIHJlZzoKLSAgICBtYXhJdGVtczogMQor
ICAgIG1pbkl0ZW1zOiAxCisgICAgbWF4SXRlbXM6IDIKIAogICBpbnRlcnJ1cHRzOgogICAgIG1h
eEl0ZW1zOiAxCkBAIC0zMSw2ICszOCwxMyBAQCBwcm9wZXJ0aWVzOgogICBjbG9ja3M6CiAgICAg
bWF4SXRlbXM6IDEKIAorICBkbWFzOgorICAgIG1heEl0ZW1zOiAxCisKKyAgZG1hLW5hbWVzOgor
ICAgIGl0ZW1zOgorICAgICAgLSBjb25zdDogcngtdHgKKwogcmVxdWlyZWQ6CiAgIC0gY29tcGF0
aWJsZQogICAtIHJlZwotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
