Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717B3CC6B30
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 03:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XDSQXoqde/7A97lTVn6fIoqhUjMafCU1FJVeNo0vpKA=; b=AgxxOi+tdwKMKu
	j1VusNdTLW7U+d9F/iweKqSrX4Y5hVogG3G417RBBHFdzBjkTHIMG9kuPVr5VzaS+Tty3R7zTTBsd
	dhSXmlV/IWlQ8vj7BKwHHJyyTcL97+rogQS24LFukldUUKiOYpfdcqPP/v0ODwzmTomHqRO2wjXms
	TdDq9McNmintAFbehyWRYBA/9/7iKSn/DFwK/sbYJmS27WhXtwh8OOby8/W5W0xlYiipSnIWTTTLR
	jVF6I6UsYhxnydW/K9LI74xG/fbrpzqWpDEWYjfKHvSwySPCw6oRI6iKKQ9ZH2OVrsT6j3sBdbmzs
	8L9Yvobm4EKNZpLRLwSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBn7-0000000GiFx-1P6C;
	Thu, 15 Oct 2026 03:06:01 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBn2-0000000GiFV-2xQl
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 03:05:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBBpDLgB2nnHexedHwkNRKx49BhMkthBY4x1dgVG3rGNlAn/dSNlWmHb0VBUYFOjYpQtsOuo1R1QbvazaV1bWUN6N4LcW80QiSFlLEVT4wO5xmLLeKLi8q30SouK3+LhDyPMKUGO44aRd4cvYykPo9QZ12fQ9jwjJ6+2coiC0zs2Fv7azjlS2jBaaLc9t86bN4l3PfWidk7uk7RqhaW03o0+sMy2vacFLWlGdHDpFAp2eKBpuP9Z6k+51LspduAdT2RBot+WGtkI37jxACSPuNazPcizbYp0uxoo81UL+NUrz/ICIcTRg9lhqO6GJEV6AGL/OaGFDAo2+2DhZaqbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cskSQFU2iBL6alZqFV+eIIXKDIhr2Usw+63w3Bq7by4=;
 b=SChaDbMq6TWRcUv47ZRtjc0g9NAgZZdjNhTW4KCGWstk/GhPEGIMt65TLzrfx3viMVJdaoJtNYcHcq31G0E2CKKY3k/FaG3LeL2vTCCoIVOP1ps/t6xF85vMA8QyVzN4MexTKCgPLbW3bBENE1wnMIxxh736lYjpb2O6TvuIu5emucGyM+0pH0O5BcvzkuBNAD4l/tG3TYVurDLXLetccc6zrUp3bdxiiq7PdkItvUXUvBmo1vNUigx3YIP9Ki9EiBN32Rv6Y69VTu2N4SR9lkYSdZ57q18I2Ma91Nyv7u1Gh7xQh8nzkGmn7EnjHhK+dPz3fx2RU8CWHmKItglfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cskSQFU2iBL6alZqFV+eIIXKDIhr2Usw+63w3Bq7by4=;
 b=Cw/pg19wkrbBXgJrJwfzmLrAIloIt//BSgS3jxB3+7gR+gXv0dXcyPI6bNfGvRA5fk7LDVdS1gZnkL8YF0mL2jwBpgTonFi5VuFxpLcN8i9lPArhQqU2PBiIxXVsQgZcQSdolYzM3gWlg5vvieFwx1cTZuroANrW+Yv0goodvPJhFR5zmfjxEoGGSjKT8VnszitBLacoKcdu9Vtpu8zcmiK1bGVjnuzPMIHMV1vNghQZD95dF/9SmEJTrcoDtZ8Bm7GYD/ei0Ubx2b/KZx4Y/72mMDLBgz6NreWPWxrmYNmrL0vlqlyHOdYvpcDhmyuOPC2MXHUeTdSOp//f/nGf4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by MRWPR04MB11519.eurprd04.prod.outlook.com
 (2603:10a6:501:76::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 03:05:48 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 03:05:48 +0000
Date: Thu, 15 Oct 2026 11:10:17 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"michael@walle.cc" <michael@walle.cc>,
	Bough Chen <haibo.chen@nxp.com>,
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
Message-ID: <20261015031017.pdqnv2bp5627bhed@shlinux89>
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
 <87zex05uvn.fsf@bootlin.com>
 <AS8PR04MB8820E136E7257FC5A02F1A3E908C2@AS8PR04MB8820.eurprd04.prod.outlook.com>
Content-Disposition: inline
In-Reply-To: <AS8PR04MB8820E136E7257FC5A02F1A3E908C2@AS8PR04MB8820.eurprd04.prod.outlook.com>
X-ClientProxiedBy: MA5P287CA0170.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::7) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|MRWPR04MB11519:EE_
X-MS-Office365-Filtering-Correlation-Id: b92c975d-37c7-4102-fe5e-08df2a69361c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|6133799003|10067099003|22082099003|18002099003|3023799007|5023799004|261009223027099003|11063799006|4143699003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info: JgROuxPS5i0p2y6c4ZLnSVyE9jQb1kvzO5D/nSezCHys4KOCy3w4VBGbJfj34RBSsuk54/JFOGgkT+PrpDi1G4rrg9Wvo/GUSmerCYIAPPFQalVqH/Fd/wgj6IJwRMUXpJMwvAPcpBvbV36Z74ymGKRys+v5OnEyM1lOakPiwvwJFX1xOXuH6NxfCQIspndZL8pnMacAgpcWyczewYUte7/qIFlkGvcIxo2mxcCCQ9JY40wu+YYwR/4HyssDMStk7NPxjKoRRaNebaeK9i0CuWqJYpbPXmhNZuwlTlCkhLI+Mjo8vZ1q898p2JejqxaBW1EHqxXmXYudjnq/qpHlh6hdvDzCWvvv5IOSbimqJTTgHMkJ3RBoUDRR25+QwAZ6S73GKPeBpw8kZkl5fasa6cQeD6l+2VcnznA8t9hJIirfgHJJgChB+LS6gL//CmRVC/51O5u8bN0o8PBBK5VkrxkDuFIEFV334tjQcwFFtB4MgAcHDnU0FEKhNBvIiaJnoQBnejXMWjV11JtJiuFvVv9sSmjJlLAaMCfynOj9wQc4dZMF+CSefVoBszcS6A1N9QmQ/1BgIaalT+VHu9BeepGNZhzV3j2uxuEcM+kCCU/9VwvKWYvsXiqgo4JOWw9Oj8LI5rLVgWmJ1Np8C7zDAqC3mLAEelhUdoRTt3svf9I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(5023799004)(261009223027099003)(11063799006)(4143699003)(261009221227099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVpTQjl4bDNlZnpLdVAwN1R1WWIvQlJVMkhEdnFxRFRGdElQRGk3T1hBTkVv?=
 =?utf-8?B?UXRDYXJYZFJvOUZJbEkxVGxCS0cwYVhXbFFFR2pKNm5NK3NCNXp0MzQvMk02?=
 =?utf-8?B?cHY5MVhJZ25hZXdhVk4rVVFGcVRxOXVlaXNsSkpweCtQYzhiV25kOVlkdEtH?=
 =?utf-8?B?QVJkc0dvdStnRDVYZXBPbUoxbURVcndiYUszVUFkZ1JTR0Z3ZVljZWRWR2hO?=
 =?utf-8?B?NktHc29PcXdRdzBrczVPNGY4VTUvSDlrcUt1QUgzWTNvVkR4bGJUVFFDUFhm?=
 =?utf-8?B?WnRCaTcweDdmdHB1MWhHM2xYVm85NTVvZldPR2dIbzBvb3A5SW1vWVQreXR4?=
 =?utf-8?B?aktNdFA0U3d6UG9tZ2ZTamhKWmxRT0hHS0ZMeHJXMkp5RldDOHJrbGc5V3JG?=
 =?utf-8?B?L0c2dzN6Vmw1aFZPRTkyem0xdnBLVUpOVEM3czEvc0dQamJJTnBpQWs0RzhZ?=
 =?utf-8?B?VGxzd052ay9QeFdpeEcxNjhQK0lLczc1NnI1MHR6VHJjVVZDRnBNOXd6bENK?=
 =?utf-8?B?UFNNMWtuazBYNVVkOTJoMFFWbk1HQm03MFEwRWtRdlV5SkV2b2Vsem85Z2Mr?=
 =?utf-8?B?VURiUHR4eURXSDNaempuZWo3V3g0dG10WlNORWhlMVZWMjJQT2RoN2xiK1dI?=
 =?utf-8?B?NEwrY0pqL1RKNUszUXhybGVwK0tndXp3L1FzSitsb1RDN0E4WDNSQW56THVC?=
 =?utf-8?B?Ykh1cE11cksvR0dZY2cwMmdtdUZhSkZEcVk1Wk04a1pUYnZwdGdQM3VYc2k5?=
 =?utf-8?B?RVMwV3g4ZHV3WVVldzJ3Mi9mTFdXbHVTamVtUnVWNmRqVUR2MDg2bnlPSU9K?=
 =?utf-8?B?cjBrZXdib1ZwZmFQRUhLMitCbnoxdUE0R3JIZUxLeXFXUTBoaU9BQ0RtdVJ1?=
 =?utf-8?B?Q05PWWhvdytQNkkrald2elpSTEVNM1VRME1lSDVkbnZWVWdRQ1hkaDJFUHBX?=
 =?utf-8?B?VU9kbzV5bFkxVUVHcTRkM21ibnF5L2xqdUoyK1kzekZ0Zm5EWkYxOEk4VHky?=
 =?utf-8?B?UENjRWNlQmg2b1RJSG9wWTJKZ3pZdzlscjBKazMxVjc4eXllMktwZnN6SEdD?=
 =?utf-8?B?bG1La0d4NW5Gb3V3a25iT1R4S1k3RHBObitUNFRtYXJtQ2p5TVNJallkTk1W?=
 =?utf-8?B?cHVwTjBMQVN2S2pGUW04OGMyUnRFVzA1Y1pWcFdqOTN2S2V4NjB1ZHNURUN1?=
 =?utf-8?B?TFgzUHV5b1JhQjMvdXczNXhONXg3SVdCSk1UUVJvOElncGh6elAxdVFBRmxO?=
 =?utf-8?B?NDJFRjYwWmxRTUhyOGYxbzVBZUFnUWVKdTM5TGFXb3g0K0RLanFiWWl5aWt1?=
 =?utf-8?B?RmZDR2VQV3VqYjd4enZJNHhUeHFlWXFIUXV1Vkk2ZlZFQ3g2NGRZUkFSMCtv?=
 =?utf-8?B?OXpNUTBHN210dmxWdmFPV2Z2V1B5NXRBcDNLaVpKQUhTQkMzSzJvUFFBTFp4?=
 =?utf-8?B?WUxQTzhNSC9BZGhVbjN5dUk0K0VPN1c0aGRWQlFSZndZS0pCMHFiVXJkN3NC?=
 =?utf-8?B?Q1JxS1ZUNTVvZFQycDU2SlFDUlVVVkdTVUVnRjVlVkdYVDljb1FiTlY4VzNk?=
 =?utf-8?B?RWxyY0h2Mzk3VSsvdFdHNmJxMjFaaWdvRllVMGRianVDbWdvS2dObkMvUWZO?=
 =?utf-8?B?ZWd6S3VndGhoSjdPajFGcW5URmZJcDlHbS9lbU90WkFSU2Urcnl2Mm5rWmtW?=
 =?utf-8?B?SU5XWjAyWVhSR09kbWpEL1FPdlcvRExMZTk5dGJCcWdwZUN3RDFWak4yM1Qz?=
 =?utf-8?B?eFBxVXQ1MVdvS09zb20wbGh5anBTcDVwQ2MvVm1iU3dvVVZSelNEZ2NoUDZN?=
 =?utf-8?B?dGtuL291ODV0ck8reStnajc1azZYZnEyNzgwcjZFWWpwMEowWFVsSHMzbENz?=
 =?utf-8?B?cE90YXE3RWxtYnc2NUp5M0F2cWlXWGVMVzNCam9aWUc4UUFMRHowVXZTZ2t5?=
 =?utf-8?B?YUlnVWd5ZU5zSXJCVmNCUGIwd05ZYnRoV0ZFZDVKRGpkYytncEc3cGpBYlFX?=
 =?utf-8?B?K1p3OVpDQkR5RjJCbURwelMwcGdWQVI1WWZ2VU5lZDg2d1pKSWJuL1E0U0ZY?=
 =?utf-8?B?N0NabmVSQ01TN3k2bVgvSXB6ZmZxYmNEbGJDcmhZNkFsL0RvMEZZdldDZUVH?=
 =?utf-8?B?bG8xcUNFRjJZYjkzdFBKSndQTU9zbnQ4dW5ONFdXdmFUQSt5ZVMzcUJCRVVB?=
 =?utf-8?B?SDNlSmZSYTFjRkp3VnovdTlQUEt2SSs2Ti9qWWJRaVprQ3BIamxxRWFkTldI?=
 =?utf-8?B?bTRDMTB2MCtDc2pJRTRKZ2FYYXJrQWRYeHlWMVczWXptUndUS3p3NnZHRmMr?=
 =?utf-8?B?NHdPUllSZm1nWjVlRloyTjJDMEdNL3BhbklsVWgrVlFZeS83bStNbTE5ak4r?=
 =?utf-8?Q?Lezrm8yneRJ0h+EeZ9UGzV6B/Ey0tPcSt0QmV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92c975d-37c7-4102-fe5e-08df2a69361c
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 03:05:48.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PYxa3X44MiPotF5y5608/yEGo9t6DndtpfrS7roD9dAtuNJVGbR/0vH/wuTuhpeO9EUg2LNEyVR+jbPE0RXTTKQ/TTh+uyY5c6XkbrJhdrR8wa5uAeHzAS26WLxaOC4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11519
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_200556_917399_7EFBB18D 
X-CRM114-Status: GOOD (  41.38  )
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

T24gVHVlLCBTZXAgMjksIDIwMjYgYXQgMDk6MTA6MzdBTSArMDAwMCwgQm91Z2ggQ2hlbiAoT1NT
KSB3cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBNaXF1ZWwg
UmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4gU2VudDogVHVlc2RheSwgU2Vw
dGVtYmVyIDI5LCAyMDI2IDQ6MjMgUE0KPiA+IFRvOiBCb3VnaCBDaGVuIChPU1MpIDxoYWliby5j
aGVuQG9zcy5ueHAuY29tPgo+ID4gQ2M6IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwu
b3JnPjsgTWljaGFlbCBXYWxsZQo+ID4gPG13YWxsZUBrZXJuZWwub3JnPjsgVGFrYWhpcm8gS3V3
YW5vIDx0YWthaGlyby5rdXdhbm9AaW5maW5lb24uY29tPjsKPiA+IFJpY2hhcmQgV2VpbmJlcmdl
ciA8cmljaGFyZEBub2QuYXQ+OyBWaWduZXNoIFJhZ2hhdmVuZHJhCj4gPiA8dmlnbmVzaHJAdGku
Y29tPjsgbGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQo+ID4ga2VybmVsQHZn
ZXIua2VybmVsLm9yZzsgbWljaGFlbEB3YWxsZS5jYzsgQm91Z2ggQ2hlbgo+ID4gPGhhaWJvLmNo
ZW5AbnhwLmNvbT4KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIG10ZDogc3BpLW5vcjogY2xl
YXIgdGhlIGRlZmF1bHQgUkRDUiBvcGNvZGUgd2hlbgo+ID4gZW50ZXJpbmcgT2N0YWwgRFRSCj4g
PiAKPiA+IE9uIDI5LzA5LzIwMjYgYXQgMTQ6NTM6MDcgKzA4LCBoYWliby5jaGVuQG9zcy5ueHAu
Y29tIHdyb3RlOgo+ID4gCj4gPiA+IEZyb206IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNv
bT4KPiA+ID4KPiA+ID4gVGhlIGNvcmUgZGVmYXVsdHMgb3Bjb2Rlcy5yZWFkX3NyMiB0byB0aGUg
bGVnYWN5IFJEQ1Igb3Bjb2RlICgweDM1KS4KPiA+ID4gSW4gOEQtOEQtOEQgbW9kZSB0aGUgb3Bj
b2RlIGlzIGV4dGVuZGVkIHRvIHR3byBieXRlcyBwZXIgY21kX2V4dF90eXBlLAo+ID4gPiBidXQg
dGhlIHJlc3VsdGluZyBjb21tYW5kIGlzIG5vdCBhIHZhbGlkIFNSMiByZWFkIGZvciB0aGVzZSBm
bGFzaGVzLAo+ID4gPiB3aGljaCBhY2Nlc3MgdGhlaXIgc3RhdHVzL2NvbmZpZyByZWdpc3RlcnMg
dGhyb3VnaCBhIHZlbmRvci1zcGVjaWZpYwo+ID4gPiBpbmRpcmVjdCByZWdpc3RlciBzcGFjZS4g
U2luY2Ugc3BpX25vcl9jYWNoZV9zcl9sb2NrX2JpdHMoKSBub3cgcmVhZHMKPiA+ID4gU1IyIGR1
cmluZyBpbml0LCBpLmUuIGFmdGVyIHRoZSBzd2l0Y2ggdG8gT2N0YWwgRFRSLCB0aGUgZXh0ZW5k
ZWQgUkRDUgo+ID4gPiBnZXRzIG5vIGRhdGEgYmFjayBhbmQgdGhlIHJlYWQgdGltZXMgb3V0IChv
biBpLk1YIEZsZXhTUEk6IC1FVElNRURPVVQKPiA+ID4gYW5kIGEgY29udHJvbGxlcgo+ID4gPiBX
QVJOKCkgZHVyaW5nIHByb2JlIHdpdGggTWljcm9uIE1UMzV4VSBhbmQgTWFjcm9uaXggb2N0YWwg
cGFydHMpLgo+ID4gPgo+ID4gPiBDbGVhciByZWFkX3NyMiB3aGVuIHRoZSBzd2l0Y2ggdG8gT2N0
YWwgRFRSIGFjdHVhbGx5IHN1Y2NlZWRzLCBzbyB0aGUKPiA+ID4gU1IyIHJlYWQgaXMgc2tpcHBl
ZCAoYSBjbGVhcmVkIG9wY29kZSBhbHJlYWR5IG1lYW5zICJ1bnN1cHBvcnRlZCIpLgo+ID4gPiBE
b2luZyBpdCBpbiBzcGlfbm9yX3NldF9vY3RhbF9kdHIoKSBrZXlzIG9mZiB0aGUgcmVhbCBydW50
aW1lCj4gPiA+IHByb3RvY29sOiBhIGZsYXNoIHRoYXQgYWR2ZXJ0aXNlcyBPY3RhbCBEVFIgYnV0
IHJ1bnMgaW4gKHgpU1RSIGJlY2F1c2UKPiA+ID4gdGhlIGhvc3QgbGFja3Mgc3VwcG9ydCBrZWVw
cyBpdHMgdXNhYmxlIFJEQ1IuCj4gPiA+Cj4gPiA+IEFzc2lzdGVkLWJ5OiBMTE0KPiA+ID4gRml4
ZXM6IGI3YjYzNDc1OTAzYyAoIm10ZDogc3BpLW5vcjogQ3JlYXRlIGEgbG9jYWwgU1IgY2FjaGUi
KQo+ID4gPiBGaXhlczogNjM0ODkwMDJkMzk3ICgibXRkOiBzcGktbm9yOiBSZWZhY3RvciBSZWFk
IFN0YXR1cy9Xcml0ZSBTdGF0dXMKPiA+ID4gc3VwcG9ydCIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6
IEhhaWJvIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT4KPiA+ID4gLS0tCj4gPiA+IENoYW5nZXMg
aW4gdjI6Cj4gPiA+IC0gUmV3b3JrIHRoZSBmaXggZm9sbG93aW5nIHJldmlldzogaW5zdGVhZCBv
ZiBndWFyZGluZyB0aGUgcmVhZCBhdCBydW50aW1lCj4gPiA+ICAgaW4gc3BpX25vcl9yZWFkX3Ny
MigpLCBjbGVhciB0aGUgZGVmYXVsdCBSRENSIG9wY29kZS5yZWFkX3NyMiBvbmNlLCBhdCB0aGUK
PiA+ID4gICBwb2ludCB0aGUgc3dpdGNoIHRvIE9jdGFsIERUUiBzdWNjZWVkcyAoc3BpX25vcl9z
ZXRfb2N0YWxfZHRyKCkpLgo+ID4gCj4gPiBJIGRvbid0IGdldCB0aGF0IGNob2ljZS4gV2h5IHN3
aXRjaGluZyB3aGVuIE9jdGFsIERUUiBzdWNjZWVkcyBvbmx5PyBTUjIgaXMKPiA+IGVpdGhlciBz
dXBwb3J0ZWQgb3Igbm90IHN1cHBvcnRlZCwgSSBkb24ndCB0aGluayBpdCBpcyBhbnl3YXkgZGlm
ZmVyZW50IHdoZW4KPiA+IGVudGVyaW5nIG9jdGFsIERUUiBtb2RlLCBpcyBpdD8gU28gSSB3b3Vs
ZCBleHBlY3QgU1IyIHRvIGJlIGNsZWFyZWQgZWFybGllciB0aGFuCj4gPiB0aGF0LCBvbmNlIHdl
IGtub3cgdGhlIGNoaXAgaXMgb2N0YWwgRFRSIGNhcGFibGUuIEFuZCB0aGlzIG11c3QgYmUgZWFy
bHkKPiA+IGVub3VnaCBzbyB0aGF0IG1hbnVmYWN0dXJlciBkcml2ZXJzIGNhbiBzdGlsbCBzZXQg
dGhlaXIgb3duIHZhbHVlLgo+ID4gCj4gPiBJIGFtIHdvbmRlcmluZyB3aGV0aGVyIHdlIHNob3Vs
ZCBzaW1wbHkgZHJvcCBzcjIgb3Bjb2RlIGluIHRoZSBRRVIgU0ZEUAo+ID4gcGFyc2luZyBlbnRp
cmVseSBmb3Igb2N0YWwgRFRSIGRldmljZXMgKE1pY2hhZWw/KS4KPiAKPiBUaGUgcmVhc29uIEkg
Y2xlYXIgaXQgYXQgdGhlIHBvaW50IE9jdGFsIERUUiBhY3R1YWxseSBzdWNjZWVkcyByYXRoZXIg
dGhhbgo+ICAib25jZSB0aGUgY2hpcCBpcyBvY3RhbC1EVFItY2FwYWJsZSIgaXMgdGhhdCBjYXBh
YmlsaXR5ICE9IHJ1bm5pbmcgbW9kZTogCj4gYSBjaGlwIGNhbiBhZHZlcnRpc2UgT2N0YWwgRFRS
IHdoaWxlIHN0aWxsIHJ1bm5pbmcgaW4gKHgpU1RSIGJlY2F1c2UgdGhlIGhvc3QgCj4gY29udHJv
bGxlciBkb2VzIG5vdCBzdXBwb3J0IDhEIChzZWUgcmVwbHkgYmVsb3cpLiBJbiB0aGF0ICh4KVNU
UiBjYXNlIFJEQ1IgaXMKPiAgdmFsaWQgYW5kIG5lZWRlZCwgc28ga2V5aW5nIG9mZiBjYXBhYmls
aXR5IGFsb25lIHdvdWxkIHdyb25nbHkgZHJvcCBhIHVzYWJsZQo+ICBTUjIgcmVhZC4KPiAKPiBU
aGF0IHNhaWQsIEkgYWdyZWUgdGhlIGN1cnJlbnQgc3BvdCBpcyBhd2t3YXJkIGFuZCBkb2VzIG5v
dCBsZXQgbWFudWZhY3R1cmVyIAo+IGRyaXZlcnMgb3ZlcnJpZGUgdGhlIHZhbHVlLiBJJ20gaGFw
cHkgdG8gbW92ZSBpdCBlYXJsaWVyLiBUd28gb3B0aW9uczoKPiAxLCBDbGVhciBpdCBkdXJpbmcg
U0ZEUCBRRVIgcGFyc2luZyAoYXMgeW91IHN1Z2dlc3QpIGZvciBvY3RhbC1EVFItY2FwYWJsZSBk
ZXZpY2VzLgo+ICAgICAgVGhpcyBpcyB0aGUgbmF0dXJhbCBwbGFjZSBuZXh0IHRvIHRoZSBleGlz
dGluZyByZWFkX3NyMiA9IDAgUUVSIGNhc2VzLCBhbmQgaXQgcnVucyAKPiAgICAgICBiZWZvcmUg
dGhlIG1hbnVmYWN0dXJlciBsYXRlX2luaXQvZml4dXBzLCBzbyBhIGRyaXZlciBjYW4gc3RpbGwg
aW5zdGFsbCBpdHMgb3duIFNSMgo+ICAgICAgIG9wY29kZSBhZnRlcndhcmRzLiAKPiAgICAgIE15
IG9ubHkgY29uY2VybiBpcyB0aGUgY2FwYWJpbGl0eS12cy1ydW5uaW5nLW1vZGUgcG9pbnQgYWJv
dmUg4oCUIHdlJ2QgYmUgCj4gICAgICBjbGVhcmluZyBiYXNlZCBvbiBhZHZlcnRpc2VkIDhEIGNh
cGFiaWxpdHksIG5vdCBvbiB3aGV0aGVyIDhEIGlzIGFjdHVhbGx5IGVudGVyZWQuCj4gCj4gMiwg
Q2xlYXIgaXQgaW4gc3BpX25vcl9sYXRlX2luaXRfcGFyYW1zKCkgYWZ0ZXIgdGhlIG1hbnVmYWN0
dXJlciBob29rcywgZ2F0ZWQgb24gCj4gICAgICBvY3RhbC1EVFIgY2FwYWJpbGl0eSwgc28gdmVu
ZG9yIHZhbHVlcyBzZXQgaW4gdGhlaXIgbGF0ZV9pbml0IGFyZSBwcmVzZXJ2ZWQuCj4gCj4gSWYg
dGhlIGNhcGFiaWxpdHktYmFzZWQgYXBwcm9hY2ggaXMgYWNjZXB0YWJsZSAoaS5lLiB3ZSBhY2Nl
cHQgdGhhdCBhIGNoaXAgYWR2ZXJ0aXNpbmcKPiAgOEQgYnV0IGZvcmNlZCB0byBTVFIgYnkgdGhl
IGhvc3QgbG9zZXMgaXRzIFJEQ1IpLCBJJ2xsIGdvIHdpdGggZHJvcHBpbmcgaXQgaW4gdGhlIFFF
UiBTRkRQCj4gIHBhcnNpbmcuIE1pY2hhZWwsIGRvIHlvdSBoYXZlIGEgcHJlZmVyZW5jZT8KCkhp
IE1pcXVlbCwKCkFueSBzdWdnZXN0aW9uPwoKUmVnYXJkcwpIYWlibyBDaGVuCgo+ID4gCj4gPiAK
PiA+ID4gLSBLZXkgdGhlIGNsZWFyIG9mZiB0aGUgcmVhbCBydW50aW1lIHByb3RvY29sIHNvIGEg
Zmxhc2ggdGhhdCBhZHZlcnRpc2VzCj4gPiA+ICAgT2N0YWwgRFRSIGJ1dCBydW5zIGluICh4KVNU
UiAoaG9zdCB3aXRob3V0IDhEIHN1cHBvcnQpIGtlZXBzIGl0cwo+ID4gPiAgIFJEQ1IuCj4gPiAK
PiA+IEFyZSB5b3Ugc3VyZSB0aGlzIGlzIGEgdmFsaWQgY2FzZT8KPiAKPiBZZXMuIHNwaV9ub3Jf
c2V0dXAoKSBjb21wdXRlcyBzaGFyZWRfbWFzayA9IGh3Y2Fwcy0+bWFzayAmIHBhcmFtcy0+aHdj
YXBzLm1hc2ssIAo+IGkuZS4gdGhlIGludGVyc2VjdGlvbiBvZiBmbGFzaCBhbmQgY29udHJvbGxl
ciBjYXBhYmlsaXRpZXMuIElmIHRoZSBob3N0IGRvZXMgbm90IHN1cHBvcnQgOEQsIAo+IFNOT1Jf
SFdDQVBTX1JFQURfOF84XzhfRFRSIGlzIG5vdCBpbiBzaGFyZWRfbWFzaywgc3BpX25vcl9zZWxl
Y3RfcmVhZCgpIHBpY2tzIGEgCj4gbm9uLThEIHJlYWRfcHJvdG8vd3JpdGVfcHJvdG8sIGFuZCBz
cGlfbm9yX3NldF9vY3RhbF9kdHIoKSBiYWlscyBvdXQgZWFybHkgYXQ6Cj4gCj4gaWYgKCEobm9y
LT5yZWFkX3Byb3RvID09IFNOT1JfUFJPVE9fOF84XzhfRFRSICYmCj4gICAgICAgbm9yLT53cml0
ZV9wcm90byA9PSBTTk9SX1BST1RPXzhfOF84X0RUUikpCj4gCXJldHVybiAwOwo+IAo+IFNvIHRo
ZSBjaGlwIHN0YXlzIGluICh4KVNUUiB3aXRoIHJlZ19wcm90byA9PSBTTk9SX1BST1RPXzFfMV8x
LCBhbmQgUkRDUiBpcyBzdGlsbCBhIHZhbGlkIAo+IHNpbmdsZS1ieXRlIFNSMiByZWFkIHRoZXJl
LiBUaGF0IGlzIHRoZSBjYXNlIEkgd2FudGVkIHRvIGF2b2lkIGJyZWFraW5nIGJ5IGtleWluZyB0
aGUgY2xlYXIKPiAgb2ZmIHRoZSBuZWdvdGlhdGVkIHJ1bnRpbWUgcHJvdG9jb2wgcmF0aGVyIHRo
YW4gdGhlIGFkdmVydGlzZWQgY2FwYWJpbGl0eS4gSWYgd2UgbW92ZSB0aGUgCj4gY2xlYXIgdG8g
Y2FwYWJpbGl0eS1iYXNlZCBTRkRQL2xhdGVfaW5pdCBhcyBkaXNjdXNzZWQsIHRoaXMgaXMgZXhh
Y3RseSB0aGUgc2NlbmFyaW8gd2UgbmVlZCB0byAKPiBiZSBjb21mb3J0YWJsZSByZWdyZXNzaW5n
IChhbiA4RC1jYXBhYmxlIHBhcnQgb24gYSBub24tOEQgaG9zdCB3b3VsZCBsb3NlIGl0cyBSRENS
IHJlYWQgb2YgU1IyKS4KPiAKPiBSZWdhcmRzCj4gSGFpYm8gQ2hlbgo+IAo+ID4gCj4gPiBUaGFu
a3MsCj4gPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
