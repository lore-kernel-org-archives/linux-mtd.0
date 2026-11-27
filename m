Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A28606A326
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Nov 2026 08:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kBN6CvTp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kalO6M1k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YRPuUcuilRRSRRcCikw9aRqT5Gq3X+jvT6T6nTN4Cuo=; b=kBN6CvTpzLLfwnq3POuTVzuFd8
	6yic2EqZHAHS0dqbgRtWM6rFNXx9UjwCihOOfKHTGD5+B7iTp//OfL4Z7Q9tGHSvH9R14v2oUOSmA
	XIELZQ2l/1xxH6PJmssdfEhlBTXqsumgjDgVg+zPkXZzq2zShzbtilWYuv4Fm1wQzYk/02q+7UNqi
	QXn6P1k7llA7mgQJvqjXzjnrASqBblloiYEHl80yr/+raMdj5etj6dBZG5s+D21ggq4Pdlq7bzz5V
	GwMeUyatYKhh7qWH+tmxjB72R0pid3Qi3N7wD+5wXxmqC4Br0lOsaareaW+pieQw4Rsm7N4bT9HmJ
	Oj1fY0AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrg5-0000000FK4a-0tCC;
	Fri, 27 Nov 2026 08:51:33 +0000
Received: from mail-westeuropeazon11010031.outbound.protection.outlook.com ([52.101.69.31] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWrg2-0000000FK2i-1VwM;
	Fri, 27 Nov 2026 08:51:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sH7PHVjxi4yWX9fLJxFqAltokbtVvcs0yllzNlOKbIfrEmaE7uy6JY7AQqRlcNuTllmCSXOhnjvUNZafaR3uoOvsiqMti64Z7Fz5bSmvf1iU9PqzPjH9FkjF4gkHz5Ca82rnlAaGPs1T4jtCqfWiv+mXRNckCCEz9jyDA1D0dSLy13cjOxKw3aHQZ5LUGOOrrmGslQMhVAWC+yTqN0pvgwUfrbA8Wq1bp38mX3JR7PrJTQuf46P/j1ZhPw9ezWre4OUSR3dMLTHQOZAGMb9Bd4VKtqDeml9iVFVc/cuqqBJyknYlAtiDbeaoG2GeC3D5IbICq/kkoa0woDK2p2WEaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AnXUjv+dim9coSKNQ2JdtELmvpQkxKnWVCscccAJskA=;
 b=yLqQuARCtAdHwTIx3DhSnEKDTX/EXaJJnyqI/iar6MK322x3QvehUMTXMQnap8XKbIcZQ/uoyY2Apfy4DuAHaUQ+EFqyze8a8lgIQYPjcqRzaYBIdmb+P+vjLcohC+ll8N1WyYyYnM+BtSm7+ii08tKCcTqeCJX9U/SchhGnbKlWB+7Xwwdg9WrgsWm1sw8D+tXFnC/jHDoU/rV53hh1fxvdxxw+LhECnBraniJEk3qgU8uYKA0R2EypRLOqHVTFakolZMH4W3FIUmQQYvZSR5FK+MAyUl1eY07or4kV1GppKLlLU6GdLCX7y4VAO17E7y3Jf9opAqVbazrK3i0iTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AnXUjv+dim9coSKNQ2JdtELmvpQkxKnWVCscccAJskA=;
 b=kalO6M1kPRxOQe2QMqvvAJwSAYM03ncrnUWwzfBBMD9P7lOdaL2/U294kUeJluSHhglzvR5qxQh2MDDmvykwKdmAQlRiC9e6OJ5d9R/BI1qr9LYFZxNI2oVXnkySPwgyS78xQkFKWC6AY+qH1uTVa/Nzz1FAGNi3H78o7VzBZ8w/yVzYW/PPufSHBNVvkBCffQ93Fi2C75ZXEu52pcEu1GoCUQv2Uq0zfPP3HgDmD6CjrS7gyHA6Cj8pCtZ7pBYXl+LcQrLcZ3/MuS4PV0huIwc66IG2Oa3NbyDjRta/KCwRcXVHP0nBc7LQ3ymsy4Ra53EMBZZ5loqQsFMwaixvrw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by BESPR04MB12564.eurprd04.prod.outlook.com
 (2603:10a6:b10:101::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.10; Fri, 27 Nov
 2026 08:51:25 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 08:51:25 +0000
Date: Fri, 27 Nov 2026 16:56:32 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Mark Brown <broonie@kernel.org>,
	Liang Yang <liang.yang@amlogic.com>,
	Feng Chen <feng.chen@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>, Han Xu <han.xu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Haibo Chen <haibo.chen@nxp.com>, Jyan Chou <jyanchou@realtek.com>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-mtd@lists.infradead.org, Frank.Li@kernel.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH RFC 08/16] spi: fsl-qspi: Consume dummy cycles directly
Message-ID: <20261127085632.44irp2necxfqbbn2@shlinux89>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-8-fd036402fd37@bootlin.com>
 <sashiko-outbox-233875@kernel.org>
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-233875@kernel.org>
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|BESPR04MB12564:EE_
X-MS-Office365-Filtering-Correlation-Id: c269064e-3314-4f93-809c-08df4c639e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|7416014|4143699003|11063799006|261009223027099003|18002099003|22082099003|10067099003|56012099006|261028144727099003|261026140227099003|261026121527099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: Ph4jIp+WEonNMuhReP3apArL4W3/fYmNTnKf8aKtiSz7eoKuNQv8TXu+3ohxWDP7RjE3SJ4OD7sp3gc1eQJU3xkB52NY1hnUQxZBQa6AK9b8lIKO3/yOz0S8Eio7ST4qBskpt8unb7bFEsT09MgB06rEULBRTEb5PC+WiMIb+0CZcuU7FEFaHuFiBmnn7sHdYHUa8fMSoDmgcKPKOX7oi00PnAWEtJ+wFvv8EndmPfcohcPshF4S3JoOpObaeNU9jTpDsRQlBy6ebantKB5I6lE0tbcpthaW3qoXS/WvdRt9QAPSJQZzZDm5bVKD9EsBsmMx0XYkuGc5ZCV+X0mOotLYdhnSZFys8d0cHBI9uSBsqqplpV/hlvkw1TNsZGZQ+h+NGOzvsCsjyVdIco020HwrbilHOHP5Gb7znGR8+W3CDhfe7j/LzH486qClLPvggmU5SCfXDSCOotHfVajzPdFBmwi66g4kZtUBCTiThbQTIzSpWnrRIX+HScD0ct3TaIVpENCWEgewkwhz3L9yNnh3lC7kCGMVgVGrjVvTW0WAFFDyw0D/3e5NGe6SuWN/YH6VFPjGN4Y0aWjMZfcidEGAHAeUGsorDkxDCg9frLY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(7416014)(4143699003)(11063799006)(261009223027099003)(18002099003)(22082099003)(10067099003)(56012099006)(261028144727099003)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0YxSXBMOGFaSGtrR1piK1Z4S0NWc21lK3hab3hYYWp4d0srcW95bXpkL3Vi?=
 =?utf-8?B?RWMxdnNKQWI5dExlM01QR0RlV1BuWnljTG9EVFlvSlZYdkxUY2UrN0NWM3lE?=
 =?utf-8?B?dFNYaGgyQmU0NmlLS3RleG56Z3RhMGJjbVBPdWhrd2ZzZEd1N0V3VkFHVFls?=
 =?utf-8?B?K3BJdnV5SDFBOEdYRktRYlNBbThIRGV5TUVzWkMvUWpZdHN0YWdTT0VBTDhQ?=
 =?utf-8?B?M29yT2ZYYU1vb0V0SjIxTmkrNkF6Q0hQOU9LMVdXTFB4c29FbGkxeFlxOWRP?=
 =?utf-8?B?c0Z3T1pEVHFOUU11M01rclowRXh6eHdZWmlUSGF5RFRmU0hpV2dyaERiZzBo?=
 =?utf-8?B?K01Sa0NmWS93VUk5dXhMYVFzRmhCS1BXWDd2L1dwNUphejBXNlhHQlVFc0M2?=
 =?utf-8?B?Mk1CS3ZwWEU2bnBsRTZENWRmQWRIaUYzRktDYTUrdnlrVENNU3M5VzVhVFFn?=
 =?utf-8?B?dkU0bjlNbDhNWG1WdGIvUTVWdzBvNWEzQmRnNkJIRHVHNURIVm94S0d5dW5o?=
 =?utf-8?B?REgvSG9STG95c08weW05OHRHUlRkWmNJWEloMk4rbW5iUEcvak1rbUNyRzVQ?=
 =?utf-8?B?MzFGMVJmYlA2SjlJS0xuUms1aHdpWlBLNE5JNy9rSVVsVUVRVkxWZ1luMDRm?=
 =?utf-8?B?L0ZPdGpvbDZwZDQ1ZWZCMEJhMFV4d0RFMzNLNS9HWUZ4VEk5cUd2VjZIejBp?=
 =?utf-8?B?bHFaQ3pXWHZwQUFXUmhGU0Q4bXYyTTVyZVBGckNaOU1ieW10blZNUnAyQ2o3?=
 =?utf-8?B?a010NzFLd3RwR3hXZ0k3bzkvVGV5R3RRZE95WU1kTW4zSGVGeUVmdElOZ0hC?=
 =?utf-8?B?cGNrZUN1enFaVDhlSXN5ZGo2dkkvek9LZnlvYzNTN0MyYzMyMElXcmhqMXBt?=
 =?utf-8?B?SzA5UXpJUXR2V05qT3FkMXlKS04yVDBUQ1hXMS9JdkNBYTBKREF5Wm5aZWo4?=
 =?utf-8?B?UE1UMjFCMGNmRDNjeTNPWENPbDdSd2tXUW1xT2EwaTZzbXpyWlR0aWNXQ2Yw?=
 =?utf-8?B?M3pCOWFSOXMyWkU0V1RHK2Q1RUN3TjRQMGhyUlZqZmZaU2JqSkFvN3RJOUlD?=
 =?utf-8?B?aDVXK3huTGNySlozRmlPa0hXZ2tGaTBqOWtxd0xhNHByQUsySnMzV25jdUNP?=
 =?utf-8?B?K2RyNlBGaVJkNGRuRk4xTzdZK3lUY1lMc1R2VFpzR0hhWlJ6T1crWk5rRnFl?=
 =?utf-8?B?WVFpUnMrK3pmNG4rcllPMXg5WUNQK28xTzRheVA2NURrN2pycTY1YkZPNVlT?=
 =?utf-8?B?U3pvN2lWME1lT0pmSTU1U2VmcVp5V3lhWkRpSXI0QkNYQzRNZ1ZXbHpxS05X?=
 =?utf-8?B?SW5yaXo5UWRYd0lmTS9aYURqRW1pNjN4MFUwSkVDS1hpbENzSE9KQzRZeFVu?=
 =?utf-8?B?S1A0T3o3YisxMmZRcEwva1YrVDQ2YzUyVSt0NHlpMHhVU0hDdVphQjIyWFNJ?=
 =?utf-8?B?Tnk3b1VLaDkrUUJHbUZKcDNTdCtxZFkzVnNxcWN2T2NpV2J5VENUSHp5UTVU?=
 =?utf-8?B?N2pDTklnVHVJc2VZSFZSTEFEcldaNThtcWFqa05aR3p5QXlmTmZjdmRaUnRM?=
 =?utf-8?B?ZithWEp4TG9YcEtQbVliRnF5WHBxeUNKUDFPcVFQQ2ticjdFOThQR3hNdzdm?=
 =?utf-8?B?bVlyazM2azFrcDh4dXBsZU45RFhMblA3ZTVFOTJUN0FpZFRTNnkwYmRUcjRJ?=
 =?utf-8?B?bFM5YVYyUndPRnlsRTZkQldISTh1RDRsbktTTG0wbTZPS2l2dFVQcEY2S0J1?=
 =?utf-8?B?NGJ4MVRYeEZXQU53amhqTGQ3NkJvUW9pY3hDZjBqYWM0TmFEUmxyN0graWxM?=
 =?utf-8?B?ZnVtYUx0clBsMndSRjA4dFBIY2d3ZUNaa3FCSVJvZTg3dUY5V0xHdkNqaUIy?=
 =?utf-8?B?bUJDWHhVZUhYN3FDSWdkY3ZuVjAwUFRnSEpVUEN2dm1xT3h0Q2Y0aWhRNSs2?=
 =?utf-8?B?SXkvQ0JTaWlrVTdlZktNaTQ4Ukpoam1VNVNWYWNtaW5yR0tJRHR2M2NaeUJU?=
 =?utf-8?B?KzAxMGRLN2ZwcGFvNEpLSG5hQ2lYK0x2MUs5aHVqOTRSQVI0UFBwdW5uemQ0?=
 =?utf-8?B?WVJ3WFBuVWxvcGVrdDl6OW55cWxDVHpIQkhjNDhDRm81MUNOZ1pkS0ZOOHBP?=
 =?utf-8?B?Y005OEVuTy80K0N1UnpxbXFqRXFSVjBkQnNLcmNraXE2bDR0Sll0bThvRDc1?=
 =?utf-8?B?N1EwOGJZREg3R3htMnIyNDFRczNSelpDT3NTNGYrODR5eTRtY2RJYXA2QVJX?=
 =?utf-8?B?RDdQamlkN2tXNU1UMWswbDY5OEhaWU9sNGhpZDJGNUdWM0xOMG1OWmhOem5a?=
 =?utf-8?B?UnN1dExpZWxHSGgxUklPR1ltaGl1dGdkeWtjSFRxa2k1TG5HaHBzSnlLSlhZ?=
 =?utf-8?Q?lQohoxld2tPuYiCVm+sRLLtGdOr1xIXLHkKuc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c269064e-3314-4f93-809c-08df4c639e76
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 08:51:25.6068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NrM8bnJ8gx37stLDS8c3fCVNayiYcGeGELfCdbHq2aDwOR3UwwEdBo26z0vSYgWo3F2otnFbIPMWVVuMYRFgG0C0x9BmT9yTULLaCjgxWuSz/8rJuhq3Dq1aTZnRI3f0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BESPR04MB12564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_005130_403320_0EAFAAC6 
X-CRM114-Status: GOOD (  17.55  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMjUsIDIwMjYgYXQgMDU6NTg6MjJQTSArMDAwMCwgc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyB3cm90ZToKPiBUaGFuayB5b3UgZm9yIHlvdXIgY29udHJpYnV0aW9uISBTYXNoaWtv
IEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbAo+IGlzc3VlIHRvIGNvbnNpZGVyOgo+IC0gW0hp
Z2hdIHNwaTogZnNsLXFzcGk6IG1pc3NpbmcgZHVtbXlfY3ljbGVzIGluIGZzbF9xc3BpX21lbV9j
YXBzIHplcm9lcwo+ICAgbmN5Y2xlcwo+IC0tCj4gCj4gY29tbWl0IDk2ZjA3NDFjYTJkNzFmN2Zj
M2IyNmI5ZjA4ODQ1Nzc2ODU0ZWI4YTQKPiBBdXRob3I6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+Cj4gCj4gc3BpOiBmc2wtcXNwaTogQ29uc3VtZSBkdW1teSBjeWNs
ZXMgZGlyZWN0bHkKPiAKPiBUaGlzIGNvbW1pdCBjb252ZXJ0cyBmc2xfcXNwaV9zdXBwb3J0c19v
cCgpIGFuZCBmc2xfcXNwaV9wcmVwYXJlX2x1dCgpIHRvCj4gdXNlIG9wLT5kdW1teS5uY3ljbGVz
IGRpcmVjdGx5IGluc3RlYWQgb2YgY29udmVydGluZyBvcC0+ZHVtbXkubmJ5dGVzIGludG8KPiBj
bG9jayBjeWNsZXMuCj4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWZzbC1xc3Bp
LmMgYi9kcml2ZXJzL3NwaS9zcGktZnNsLXFzcGkuYwo+ID4gaW5kZXggZDJjMjA5MDQ0MmY4NC4u
YTFkNjM1N2UzMjAzYSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1mc2wtcXNwaS5j
Cj4gPiArKysgYi9kcml2ZXJzL3NwaS9zcGktZnNsLXFzcGkuYwo+ID4gQEAgLTM5OSw3ICszOTks
NyBAQCBzdGF0aWMgYm9vbCBmc2xfcXNwaV9zdXBwb3J0c19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVt
LAo+ID4gIAlpZiAob3AtPmFkZHIubmJ5dGVzKQo+ID4gIAkJcmV0IHw9IGZzbF9xc3BpX2NoZWNr
X2J1c3dpZHRoKHEsIG9wLT5hZGRyLmJ1c3dpZHRoKTsKPiA+ICAKPiA+IC0JaWYgKG9wLT5kdW1t
eS5uYnl0ZXMpCj4gPiArCWlmIChvcC0+ZHVtbXkubmN5Y2xlcykKPiA+ICAJCXJldCB8PSBmc2xf
cXNwaV9jaGVja19idXN3aWR0aChxLCBvcC0+ZHVtbXkuYnVzd2lkdGgpOwo+ID4gIAo+ID4gIAlp
ZiAob3AtPmRhdGEubmJ5dGVzKQo+ID4gQEAgLTQxMywxMyArNDEzLDEyIEBAIHN0YXRpYyBib29s
IGZzbF9xc3BpX3N1cHBvcnRzX29wKHN0cnVjdCBzcGlfbWVtICptZW0sCj4gPiAgCSAqIHRvIGZp
dCBpbnRvIGEgc2luZ2xlIExVVCBlbnRyeS4KPiA+ICAJICovCj4gPiAgCWlmIChvcC0+YWRkci5u
Ynl0ZXMgKwo+ID4gLQkgICAob3AtPmR1bW15Lm5ieXRlcyA/IDE6MCkgKwo+ID4gKwkgICAob3At
PmR1bW15Lm5jeWNsZXMgPyAxOjApICsKPiA+ICAJICAgKG9wLT5kYXRhLm5ieXRlcyA/IDE6MCkg
PiA2KQo+ID4gIAkJcmV0dXJuIGZhbHNlOwo+ID4gIAo+ID4gIAkvKiBNYXggNjQgZHVtbXkgY2xv
Y2sgY3ljbGVzIHN1cHBvcnRlZCAqLwo+ID4gLQlpZiAob3AtPmR1bW15Lm5ieXRlcyAmJgo+ID4g
LQkgICAgKG9wLT5kdW1teS5uYnl0ZXMgKiA4IC8gb3AtPmR1bW15LmJ1c3dpZHRoID4gNjQpKQo+
ID4gKwlpZiAob3AtPmR1bW15Lm5jeWNsZXMgPiA2NCkKPiA+ICAJCXJldHVybiBmYWxzZTsKPiA+
ICAKPiA+ICAJLyogTWF4IGRhdGEgbGVuZ3RoLCBjaGVjayBjb250cm9sbGVyIGxpbWl0cyBhbmQg
YWxpZ25tZW50ICovCj4gPiBAQCAtNDYwLDExICs0NTksMTAgQEAgc3RhdGljIHZvaWQgZnNsX3Fz
cGlfcHJlcGFyZV9sdXQoc3RydWN0IGZzbF9xc3BpICpxLAo+ID4gIAkJbHV0aWR4Kys7Cj4gPiAg
CX0KPiA+ICAKPiA+IC0JaWYgKG9wLT5kdW1teS5uYnl0ZXMpIHsKPiA+ICsJaWYgKG9wLT5kdW1t
eS5uY3ljbGVzKSB7Cj4gPiAgCQlsdXR2YWxbbHV0aWR4IC8gMl0gfD0gTFVUX0RFRihsdXRpZHgs
IExVVF9EVU1NWSwKPiA+ICAJCQkJCSAgICAgIExVVF9QQUQob3AtPmR1bW15LmJ1c3dpZHRoKSwK
PiA+IC0JCQkJCSAgICAgIG9wLT5kdW1teS5uYnl0ZXMgKiA4IC8KPiA+IC0JCQkJCSAgICAgIG9w
LT5kdW1teS5idXN3aWR0aCk7Cj4gPiArCQkJCQkgICAgICBvcC0+ZHVtbXkubmN5Y2xlcyk7Cj4g
PiAgCQlsdXRpZHgrKzsKPiA+ICAJfQo+IAo+IFtTZXZlcml0eTogSGlnaF0KPiBEb2VzIGZzbF9x
c3BpX21lbV9jYXBzIGFsc28gbmVlZCAuZHVtbXlfY3ljbGVzID0gdHJ1ZT8KPiAKPiBmc2xfcXNw
aV9tZW1fY2FwcyBvbmx5IHNldHMgLnBlcl9vcF9mcmVxID0gdHJ1ZS4gIFdpdGhvdXQgLmR1bW15
X2N5Y2xlcyA9Cj4gdHJ1ZSwgc3BpX21lbV9jb252ZXJ0X2R1bW15KCkgY29udmVydHMgYW55IGR1
bW15IGN5Y2xlcyB0byBvcC0+ZHVtbXkubmJ5dGVzCj4gYW5kIHNldHMgb3AtPmR1bW15Lm5jeWNs
ZXMgPSAwIGJlZm9yZSBpbnZva2luZyB0aGUgZHJpdmVyIGNhbGxiYWNrcy4gIEFzIGEKPiByZXN1
bHQsIG9wLT5kdW1teS5uY3ljbGVzIGlzIGFsd2F5cyAwIGluIGZzbF9xc3BpX3N1cHBvcnRzX29w
KCkgYW5kCj4gZnNsX3FzcGlfcHJlcGFyZV9sdXQoKSwgc28gZHVtbXkgdmFsaWRhdGlvbiBpcyBz
a2lwcGVkIGFuZCBMVVRfRFVNTVkgaXMKPiBuZXZlciBwcm9ncmFtbWVkIGludG8gdGhlIGhhcmR3
YXJlIExVVCBmb3Igb3BlcmF0aW9ucyByZXF1aXJpbmcgZHVtbXkKPiBjeWNsZXMuCgpDb3JyZWN0
LCBuZWVkIC5kdW1teV9jeWNsZXMgPSB0cnVlCgpSZWdhcmRzCkhhaWJvIENoZW4KPiAKPiAtLSAK
PiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAy
NjExMjUtbWFjcm9uaXgtdXBzdHJlYW1pbmctc3BpLW1lbS1jeWNsZXMtdjEtMC1mZDAzNjQwMmZk
MzdAYm9vdGxpbi5jb20/cGFydD04CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
