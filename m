Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2832DC77B6C
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Apr 2023 06:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:From:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uYtmraHZCTdpQ4aE5X1qncI/IaFCpvSY1w5L6vY1mk8=; b=3/BgrglwEEej/vLGkOhDBqKboB
	OS+7ij9y4KcUbIGLo8vwuh2Ve53eisnpMLnwGTJ3GoUigmgIr6K0qdYzZHfZt1FTQkXFzU+MnzK2+
	GXjp2LByTGsXQxS4PcYsWGKAuMziKEOuEj1rVWQcG/0XphxSHM3denxU/3IUgURPFPHUqZ55qEmHh
	W8LKUj7bILnTyJL4fhVDeUqubHRQvBi3gQO/6xvfEeogfsfFk1kjEMMufyLY2QT1z4ivEtlhI/Atl
	VNiEHQl9st52aTYJuqTLJLrhbM6W/wy+DcwEKdlTxn+ryrefBCN77Np35D8USivoXhHXM/vgqkaJY
	VzSLGcBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmqBP-0058MT-0O;
	Thu, 13 Apr 2023 06:11:47 +0000
Received: from mail-tyzapc01on20703.outbound.protection.outlook.com ([2a01:111:f403:704b::703] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmqBL-0058LJ-1c;
	Thu, 13 Apr 2023 06:11:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A071mzNBulCeHUbCXmsDbeVyM97cLHkYZUZg4lzVOkKIfdpGhyNl9oD4wF06yAZgb5O2QhC9494Zt+NQdO8lWedpVOPhszETWOJQCvAtaFg4Rlbie6Lv7FH20PasjIKurP3qeqaw9rZUOkyyCYCjlnMLQ300ZWKYAkjdO0JNqE7g+rNNS+LnxWWld+8odg4OnE+G8hekGdZMwDOvWvVCVDOoKQR/tZeRbbiXy8cmM6LSCH7b3X2AMg18rvvnJILxmaVulLWT6jLN8PNPa5TfRy4joJ+10miF+ilXFg7XUx+WKzhslLnCRiUejM5IOtat5wkWvDSwpSJWK1PTjOdN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZGAg9kbqlFqEJF5svibhQ8SGVcPwerORkbR1MExTYk=;
 b=jHdKh2rfuJEczYkUFzzqLRDs4fZ9HtF0g8rwYgz1BdH1RMXqQs8wPhbEEt/M93eOdioNDvzxIybI7DLN741iCNJgeqnc5Uljyt23J9HHAprI7l3BkUZu/UWvXaxi9alk+8dMWiEG23evryKaUxzMIqtk4dhYrImVgdMKd/cAlKC2xnDPHGLo3lwOvrgrqKQorNzgYAUsKcKJZKXfKmcqKp1Cmx0JxFNiX3T7ELx4o6J4O+Y/qJdVBsKfkrzMnqMgWgRkDE/TpmucB2pp7DLEWKkfIpwS8WeHJ4Tt9/uioN4yeQTW3C3xOzt0jUqhL1uvnTJVWThFsDLyjL4dI870ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com (2603:1096:300:7b::17)
 by PSAPR03MB6282.apcprd03.prod.outlook.com (2603:1096:301:9f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Thu, 13 Apr
 2023 06:11:36 +0000
Received: from PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909]) by PS1PR03MB5034.apcprd03.prod.outlook.com
 ([fe80::c56f:c862:ff8e:909%5]) with mapi id 15.20.6277.036; Thu, 13 Apr 2023
 06:11:36 +0000
Message-ID: <fbb8cb2b-0996-3029-b368-f67087d73487@amlogic.com>
Date: Thu, 13 Apr 2023 14:11:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 4/5] mtd: rawnand: meson: clear OOB buffer before read
Content-Language: en-US
From: Liang Yang <liang.yang@amlogic.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, "yonghui.yu" <yonghui.yu@amlogic.com>
References: <20230412061700.1492474-1-AVKrasnov@sberdevices.ru>
 <20230412061700.1492474-5-AVKrasnov@sberdevices.ru>
 <20230412094400.3c82f631@xps-13>
 <ac4b66da-6a76-c2ec-7e21-31632f3448d5@sberdevices.ru>
 <20230412113654.183350d0@xps-13>
 <4eace0a0-f6af-7d99-a52f-7913a2139330@sberdevices.ru>
 <20230412141824.755b2bca@xps-13>
 <eedaaed9-0a41-2c18-9eb2-792613566986@sberdevices.ru>
 <20230412145715.58c2be4a@xps-13>
 <7c996832-258f-001c-56bd-87bbdf23eeaa@amlogic.com>
 <20230412163214.0c764bb3@xps-13>
 <0c61eaae-053e-5768-a533-70b2ff0cc95d@amlogic.com>
In-Reply-To: <0c61eaae-053e-5768-a533-70b2ff0cc95d@amlogic.com>
X-ClientProxiedBy: TY2PR0101CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::26) To PS1PR03MB5034.apcprd03.prod.outlook.com
 (2603:1096:300:7b::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS1PR03MB5034:EE_|PSAPR03MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: bca94fe2-8baf-4b55-619b-08db3be5ef49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dhwuSspzfVOKwip+gw4enDDoRButqpnc4BFc2mTGGg+Ns5PgblBgrMxEy07ZTx37WmfxHNFhQAJ1KC6nBWO+DfUAuRQsEubzBMpnDhPXM7giUjxfeNnOAZAmYm6Ywa1M1nAbtr2sjsXi0Eb6Q3IflOyiuDVxjIHQzs1SAQ3z3/9c5fMTWqHNb1Zt3Uv+LbFe2noeE9HG8w9PCyOsos8qyHp1GKTS0LvADtNP76qcCSYD86uqf+nJWUlK9J3lFPbPxX7hdjst68uCiM7llfK98p91Bg8sUnK9ZTlWhcdlSObbodebg1YH+xzkI03mvdtyNxt7A4xACv4i7Q48ksnGKh/e1wrUE3iw/T/TZbMdjNOQ3bp/GLHLv1Ml+LN/Xm8iN3IS1SWVMuHzyKvq6tFfdYPZa2vYtxOZ59i8Y1pdstIIvNkRVDT/HBv6qjl+6D6sbTAyWJQeobv6AlwsivPp2ihk5uHWdGT6zm23dVfM2OBC2qVRetxdWqFdFvnpeAgJM4CmS3Ionp7fRsjOCyslkVA4LSCC+cinNinqZMel4n0RyaRqVpYL3xm/q2yroyEXyBI6kqvMoCeogiaJ8zZnUXKKlOAiqtKJK6bOLNEQJJOAOSMeOHJt/5Vtud2Abq+6/MMLhlw/1CO2HP7Ec8YGtbZIqvBmsCEf87JrDlLCZrYkDvT/8XoSl4siGqiNSJVIl8ulJk+2I4JHOcnkdKaYN4T7njO15bZV7p0te6xxKlM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PR03MB5034.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(376002)(39850400004)(346002)(366004)(451199021)(31696002)(86362001)(36756003)(2906002)(31686004)(2616005)(6666004)(52116002)(6486002)(66574015)(53546011)(83380400001)(186003)(6512007)(107886003)(26005)(6506007)(66476007)(66556008)(6916009)(7416002)(8936002)(4326008)(478600001)(38350700002)(8676002)(316002)(38100700002)(41300700001)(5660300002)(44832011)(66946007)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?djF0cjdML2lvdlAwUHV2ZkoxK2JwOVpPYm56MXZjOWtLU3ZEWWtSQWw0ZUpD?=
 =?utf-8?B?MkxIR3JxR2VPN1dSbFNtSjdnTzd1L2JybHpzYm9tMUxDYW93K2ZmSmZwTk1T?=
 =?utf-8?B?Y01FTDRBamlSMXVmVTgzZTl3QnF3Z0xqcDJNUXFVQTVFSzg3cmd5SnpNbkU4?=
 =?utf-8?B?eHNma0NuZ2FiRnkvcHYvQUs5a3h3NDFoanBpaEZ4bmhZWjlZZ3BYLzhPV2hl?=
 =?utf-8?B?K3pnMjNyQ3Z3QVd6dmVCUmxSU0ROMHNSVC93d1NPZnROczVBaW5GMHlpZ0xt?=
 =?utf-8?B?dytxc2dsZHpZanBBYTYzOGlLa1RKMjNVOU5XV0ZaeDk0Qk5JaXl1Z0NkMlR4?=
 =?utf-8?B?amlhbFBqdkJzVjU2N0lGcWNjdDBKTGlTaFJqSFVUWGFyV2Z2RW0rS2lVWXpa?=
 =?utf-8?B?ZnZsK2xtRkpDYjNTZG1aVGZ4ZjluYXNBNnJUOEp6eFpkb1h4dU94Q2tocE1E?=
 =?utf-8?B?S096N1FJVVRPenZmWVNEZnNteGJ3SXZMVGlSemR4TWg1WGh3YngzOTd4U2J3?=
 =?utf-8?B?Y1gzeCtaUG1jU0FhOGVQQ1VscHJlejRDZzZpcnNOczJWMFk4clM1aHc3emxz?=
 =?utf-8?B?ZFo2TmFuOTZTUjBzdHE5QVB0R0tLdWVqOEhyWEw3TWtrY1ZzcG16dE03dUpk?=
 =?utf-8?B?cUpJMnh3RkFVTE0xQmU3aTJXemtsZWY1NllkeUlGbkdOa2xEcUhaVDI3VmRj?=
 =?utf-8?B?MFVHbGl0K2t2RjJWcFFabzEwYzBTZ3RUZjEyUUI5TGQwNUViVHNLbE9xR21E?=
 =?utf-8?B?NWdwekxpeHVWSGliRU9kVGNFb3JvTTBBSDZabE8za256dTA5ZzM0dHNHanhv?=
 =?utf-8?B?VVk4ak9hbXRybW4zcnNzeUpKbDQyS2N2THozT2JCNXZuMEo1RTZ4d0lwTHZI?=
 =?utf-8?B?cDN6UWJFY1ovNVlRa2djaHNIdS9Mczgwb05qcmQ0dlVxRDZqeXpqbTE1MUYv?=
 =?utf-8?B?dE4rQTM1MEtxOVpqcWgwc0l2cXp5UFpGNi9QMDBCQVNiR2tlQTliQ25PV2JV?=
 =?utf-8?B?RHA0ZlJXaWNRZlROMi8yVEJvVW92RmdwbU1MNWVSalZ5L2ZuRnVwODNpaUtz?=
 =?utf-8?B?M3NpZTR1UWJJcEdXTjhwUUp0VXo1ZlRPUnRrMmRHN2I5WjVXc2FuU1AyRnln?=
 =?utf-8?B?RDkwMHRTQTVZVGZnb3dhMDYrN1R2RXpEblRXZ1BFcjRiMFI1UW5oZ0loZ0o4?=
 =?utf-8?B?NGR2QkREcWlzNGFFRlhwb2ZTazBicVhFWXpGSXFnbThBaEZtK2JoUmsyODFS?=
 =?utf-8?B?UkFpdkx4THhOWEZsRDNaem9nN3gzUzhwRkVaSGRISEo4UFFHZjZYUEZLaDRv?=
 =?utf-8?B?SWtLVThzNDBPRUE2SjY4VzVGcWRMM2tBaVF5RTYvMDAyVHIzQUUzQ3g1RWxU?=
 =?utf-8?B?VmlVZy9FNzBjNjQwalBNcDUxWlRjUlZYem9hYWRwNFhLeHlWNHF1WXgrQjJB?=
 =?utf-8?B?ZXBRZ3ZjalliUG9PM2k1Q3ZKUWFRSkxVWWM0MHcvcDhEeU9GcjlzcTJ3dFBs?=
 =?utf-8?B?VlhVZmt6K0VLWlluZXFwTDYxMGlBbGhwY0JWakFiYWVqQU0rOXZSOXFTV241?=
 =?utf-8?B?MlpkTTN0RUJzV0ZiNXQ2c2k4UWJLWlRSTld5QUw1NW1GTTNNNkZoR1NETnFt?=
 =?utf-8?B?cUxVV2pJZmc0eUw2OTFpZjJPb1VzVHd4K0RXMGFmb1JudkZFUDVWNzJSdFlX?=
 =?utf-8?B?MldjWmRNUHcvV1ZnVHZpTmpaUmY1K004OWpJM05XNCtIbGRNS0k2Nnk2OFda?=
 =?utf-8?B?dlJ1cjdGR3lrelNCUk5BS05RTEo5K0crd3hVRDRuSjNYQWtVclpMdWNaU09B?=
 =?utf-8?B?VFNBUWpmUlNPSlRNZGROTjMwRWVONmlDcjFGU1kxTmVST3haY2NDTjRYRjhh?=
 =?utf-8?B?N0ZHZnR4aVFvc1VmYlRwWXh6cDdPOFRQaGJrUllOSytUMmY5QU4xWG9jdk92?=
 =?utf-8?B?TVN5WDJLOTlodWFNQi92TUQyV0xsOW90eC91K2g4SE5wa0F3QTliQUMwM2Zp?=
 =?utf-8?B?WmdHNWpkQ2hveGJaQ2I3TzBKM0I4MENjSTR2b3NZVDNTSGd6L1RqVnJ6TFFQ?=
 =?utf-8?B?eW10R0hmL1NpY05iSnZGdW9Ib2dxOUErUUNaNVMwSEtySERlb201UXYrQTQ1?=
 =?utf-8?B?cFFKVXVYcVBVWDhtQ0g2dEZBQWM0RFJBcjhGZGpRMVlFcFJmMjNmRHdRN2Vu?=
 =?utf-8?B?N3c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca94fe2-8baf-4b55-619b-08db3be5ef49
X-MS-Exchange-CrossTenant-AuthSource: PS1PR03MB5034.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 06:11:35.9120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zlc22cOmKWwSoTQ9KfwJDD49XtPWPNZptniaEwTOMaXzqH2wGXuffbx4Jn4KgyKeRKMgmyOY9Qoi5TENVufg+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB6282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_231143_648671_067AFFD2 
X-CRM114-Status: GOOD (  23.97  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjMvNC8xMyAxMzozMiwgTGlhbmcgWWFuZyB3cm90ZToKPiBIaSBNaXF1ZWwsCj4gCj4g
T24gMjAyMy80LzEyIDIyOjMyLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+PiBbIEVYVEVSTkFMIEVN
QUlMIF0KPj4KPj4gSGVsbG8sCj4+Cj4+IGxpYW5nLnlhbmdAYW1sb2dpYy5jb20gd3JvdGUgb24g
V2VkLCAxMiBBcHIgMjAyMyAyMjowNDoyOCArMDgwMDoKPj4KPj4+IEhpIE1pcXVlbCBhbmQgQXJz
ZW5peSwKPj4+Cj4+PiBPbiAyMDIzLzQvMTIgMjA6NTcsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+
Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4KPj4+PiBIaSBBcnNlbml5LAo+Pj4+Cj4+Pj4gYXZr
cmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3RlIG9uIFdlZCwgMTIgQXByIDIwMjMgMTU6MjI6MjYg
KzAzMDA6Cj4+Pj4+IE9uIDEyLjA0LjIwMjMgMTU6MTgsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+
Pj4+PiBIaSBBcnNlbml5LAo+Pj4+Pj4KPj4+Pj4+IGF2a3Jhc25vdkBzYmVyZGV2aWNlcy5ydSB3
cm90ZSBvbiBXZWQsIDEyIEFwciAyMDIzIDEzOjE0OjUyICswMzAwOgo+Pj4+Pj4gwqDCoMKgID4+
Pj4gT24gMTIuMDQuMjAyMyAxMjozNiwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Pj4+Pj4gSGkg
QXJzZW5peSwKPj4+Pj4+Pj4KPj4+Pj4+Pj4gYXZrcmFzbm92QHNiZXJkZXZpY2VzLnJ1IHdyb3Rl
IG9uIFdlZCwgMTIgQXByIDIwMjMgMTI6MjA6NTUgKzAzMDA6Cj4+Pj4+Pj4+IMKgwqDCoMKgwqAg
Pj4+Pj4+IE9uIDEyLjA0LjIwMjMgMTA6NDQsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4+Pj4+
Pj4gSGkgQXJzZW5peSwKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEFWS3Jhc25vdkBzYmVyZGV2aWNl
cy5ydSB3cm90ZSBvbiBXZWQsIDEyIEFwciAyMDIzIDA5OjE2OjU4IAo+Pj4+Pj4+Pj4+ICswMzAw
Ogo+Pj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgID4+Pj4+Pj4+IFRoaXMgTkFORCByZWFkcyBvbmx5
IGZldyB1c2VyJ3MgYnl0ZXMgaW4gRUNDIAo+Pj4+Pj4+Pj4+IG1vZGUgKG5vdCBmdWxsIE9PQiks
IHNvCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiAiVGhpcyBOQU5EIHJlYWRzIiBkb2VzIG5vdCBsb29r
IHJpZ2h0LCBkbyB5b3UgbWVhbiAiU3VicGFnZSAKPj4+Pj4+Pj4+PiByZWFkcyBkbwo+Pj4+Pj4+
Pj4+IG5vdCByZXRyaWV2ZSBhbGwgdGhlIE9PQiBieXRlcywiPwo+Pj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgID4+Pj4+Pj4+IGZpbGwgT09CIGJ1ZmZlciB3aXRoIHplcm9lcyB0byBub3QgcmV0dXJu
IAo+Pj4+Pj4+Pj4+IGdhcmJhZ2UgZnJvbSBwcmV2aW91cyByZWFkcwo+Pj4+Pj4+Pj4+PiB0byB1
c2VyLgo+Pj4+Pj4+Pj4+PiBPdGhlcndpc2UgJ25hbmRkdW1wJyB1dGlsaXR5IHByaW50cyBzb21l
dGhpbmcgbGlrZSB0aGlzIGZvciAKPj4+Pj4+Pj4+Pj4ganVzdCBlcmFzZWQKPj4+Pj4+Pj4+Pj4g
cGFnZToKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gLi4uCj4+Pj4+Pj4+Pj4+IDB4MDAwMDA3ZjA6
IGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmIGZmCj4+Pj4+Pj4+
Pj4+IMKgwqDCoCBPT0IgRGF0YTogZmYgZmYgZmYgZmYgMDAgMDAgZmYgZmYgODAgY2YgMjIgOTkg
Y2IgYWQgZDMgYmUKPj4+Pj4+Pj4+Pj4gwqDCoMKgIE9PQiBEYXRhOiA2MyAyNyBhZSAwNiAxNiAw
YSAyZiBlYiBiYiBkZCA0NiA3NCA0MSA4ZSA4OCA2ZQo+Pj4+Pj4+Pj4+PiDCoMKgwqAgT09CIERh
dGE6IDM4IGExIDJkIGU2IDc3IGQ0IDA1IDA2IGYyIGE1IDdlIDI1IGViIDM0IDdjIGZmCj4+Pj4+
Pj4+Pj4+IMKgwqDCoCBPT0IgRGF0YTogMzggZWEgZGUgMTQgMTAgZGUgOWIgNDAgMzMgMTYgNmEg
Y2MgOWQgYWEgMmYgNWUKPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQXJz
ZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2JlcmRldmljZXMucnU+Cj4+Pj4+Pj4+Pj4+IC0tLQo+
Pj4+Pj4+Pj4+PiDCoMKgIGRyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYyB8IDUgKysr
KysKPj4+Pj4+Pj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNv
bl9uYW5kLmMgCj4+Pj4+Pj4+Pj4+IGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5j
Cj4+Pj4+Pj4+Pj4+IGluZGV4IGY4NGExMDIzOGU0ZC4uZjJmMjQ3MmNiNTExIDEwMDY0NAo+Pj4+
Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9tZXNvbl9uYW5kLmMKPj4+Pj4+Pj4+
Pj4gKysrIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+Pj4+Pj4+IEBA
IC04NTgsOSArODU4LDEyIEBAIHN0YXRpYyBpbnQgCj4+Pj4+Pj4+Pj4+IG1lc29uX25mY19yZWFk
X3BhZ2Vfc3ViKHN0cnVjdCBuYW5kX2NoaXAgKm5hbmQsCj4+Pj4+Pj4+Pj4+IMKgwqAgc3RhdGlj
IGludCBtZXNvbl9uZmNfcmVhZF9wYWdlX3JhdyhzdHJ1Y3QgbmFuZF9jaGlwICpuYW5kLCAKPj4+
Pj4+Pj4+Pj4gdTggKmJ1ZiwKPj4+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGludCBvb2JfcmVxdWlyZWQsIGludCBwYWdlKQo+Pj4+Pj4+Pj4+PiDC
oMKgIHsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IG5hbmRfdG9f
bXRkKG5hbmQpOwo+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgdTggKm9vYl9idWYgPSBuYW5kLT5v
b2JfcG9pOwo+Pj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqAgaW50IHJldDsKPj4+Pj4+Pj4+Pj4gwqDC
oCA+Pj4+Pj4+PiArwqDCoMKgIG1lbXNldChvb2JfYnVmLCAwLCBtdGQtPm9vYnNpemUpOwo+Pj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gSSdtIHN1cnByaXNlZCByYXcgcmVhZHMgZG8gbm90IHJlYWQgdGhl
IGVudGlyZSBPT0I/Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gWWVzISBTZWVtcyBpbiBjYXNlIG9mIHJh
dyBhY2Nlc3MgKHdoYXQgaSBzZWUgaW4gdGhpcyBkcml2ZXIpIAo+Pj4+Pj4+Pj4gbnVtYmVyIG9m
IE9PQiBieXRlcyByZWFkCj4+Pj4+Pj4+PiBzdGlsbCBkZXBlbmRzIG9uIEVDQyBwYXJhbWV0ZXJz
OiBmb3IgZWFjaCBwb3J0aW9uIG9mIGRhdGEgCj4+Pj4+Pj4+PiBjb3ZlcmVkIHdpdGggRUNDIGNv
ZGUgd2UgY2FuCj4+Pj4+Pj4+PiByZWFkIGl0J3MgRUNDIGNvZGUgYW5kICJ1c2VyIGJ5dGVzIiBm
cm9tIE9PQiAtIGl0IGlzIHdoYXQgaSBzZWUgCj4+Pj4+Pj4+PiBieSBkdW1waW5nIERNQSBidWZm
ZXIgYnkKPj4+Pj4+Pj4+IHByaW50aygpLiBGb3IgZXhhbXBsZSBJJ20gd29ya2luZyB3aXRoIDJL
IE5BTkQgcGFnZXMsIGVhY2ggcGFnZSAKPj4+Pj4+Pj4+IGhhcyAyIHggMUsgRUNDIGJsb2Nrcy4K
Pj4+Pj4+Pj4+IEZvciBlYWNoIEVDQyBibG9jayBJIGhhdmUgMTYgT09CIGJ5dGVzIHdoaWNoIEkg
Y2FuIGFjY2VzcyBieSAKPj4+Pj4+Pj4+IHJlYWQvd3JpdGUuIEVhY2ggMTYgYnl0ZXMKPj4+Pj4+
Pj4+IGNvbnRhaW5zIDIgYnl0ZXMgb2YgdXNlcidzIGRhdGEgYW5kIDE0IGJ5dGVzIEVDQyBjb2Rl
cy4gU28gd2hlbiAKPj4+Pj4+Pj4+IEkgcmVhZCBwYWdlIGluIHJhdyBtb2RlCj4+Pj4+Pj4+PiBj
b250cm9sbGVyIHJldHVybnMgMzIgYnl0ZXMgKDIgeCAoMiArIDE0KSkgb2YgT09CLiBXaGlsZSBP
T0IgaXMgCj4+Pj4+Pj4+PiByZXBvcnRlZCBhcyA2NCBieXRlcy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4g
SW4gYWxsIG1vZGVzLCB3aGVuIHlvdSByZWFkIE9PQiwgeW91IHNob3VsZCBnZXQgdGhlIGZ1bGwg
T09CLiAKPj4+Pj4+Pj4gVGhlIGZhY3QKPj4+Pj4+Pj4gdGhhdCBFQ0MgY29ycmVjdGlvbiBpcyBl
bmFibGVkIG9yIGRpc2FibGVkIGRvZXMgbm90IG1hdHRlci4gSWYgCj4+Pj4+Pj4+IHRoZSBOQU5E
Cj4+Pj4+Pj4+IGZlYXR1cmVzIE9PQiBzZWN0aW9ucyBvZiA2NCBieXRlcywgeW91IHNob3VsZCBn
ZXQgdGhlIDY0IGJ5dGVzLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBXaGF0IGhhcHBlbnMgc29tZXRpbWVz
LCBpcyB0aGF0IHNvbWUgb2YgdGhlIGJ5dGVzIGFyZSBub3QgcHJvdGVjdGVkCj4+Pj4+Pj4+IGFn
YWluc3QgYml0ZmxpcHMsIGJ1dCB0aGUgcG9saWN5IGlzIHRvIHJldHVybiB0aGUgZnVsbCBidWZm
ZXIuCj4+Pj4+Pj4KPj4+Pj4+PiBPaywgc28gdG8gY2xhcmlmeSBjYXNlIGZvciB0aGlzIE5BTkQg
Y29udHJvbGxlcjoKPj4+Pj4+PiAxKSBJbiBib3RoIEVDQyBhbmQgcmF3IG1vZGVzIGkgbmVlZCB0
byByZXR1cm4gdGhlIHNhbWUgcmF3IE9PQiAKPj4+Pj4+PiBkYXRhIChlLmcuIHVzZXIgYnl0ZXMK
Pj4+Pj4+PiDCoMKgwqDCoCArIEVDQyBjb2Rlcyk/Cj4+Pj4+Pgo+Pj4+Pj4gV2VsbCwgeW91IG5l
ZWQgdG8gY292ZXIgdGhlIHNhbWUgYW1vdW50IG9mIGRhdGEsIHllcy4gQnV0IGluIHRoZSBFQ0MK
Pj4+Pj4+IGNhc2UgdGhlIGRhdGEgd29uJ3QgYmUgcmF3IChhdCBsZWFzdCBub3QgYWxsIG9mIGl0
KS4KPj4+Pj4KPj4+Pj4gU28gInNhbWUgYW1vdW50IG9mIGRhdGEiLCBpbiBFQ0MgbW9kZSBjdXJy
ZW50IGltcGxlbWVudGF0aW9uIAo+Pj4+PiByZXR1cm5zIG9ubHkgdXNlciBPT0IgYnl0ZXMgKGUu
Zy4KPj4+Pj4gT09CIGRhdGEgZXhjbHVkaW5nIEVDQyBjb2RlcyksIGluIHJhdyBpdCByZXR1cm5z
IHVzZXIgYnl0ZXMgKyBFQ0MgCj4+Pj4+IGNvZGVzLiBJSVVDIGNvcnJlY3QKPj4+Pj4gYmVoYXZp
b3VyIGlzIHRvIGFsd2F5cyByZXR1cm4gdXNlciBieXRlcyArIEVDQyBjb2RlcyBhcyBPT0IgZGF0
YSAKPj4+Pj4gZXZlbiBpbiBFQ0MgbW9kZSA/Cj4+Pj4KPj4+PiBJZiB0aGUgcGFnZSBhcmUgMmsr
NjRCIHlvdSBzaG91bGQgcmVhZCAyays2NEIgd2hlbiBPT0IgYXJlIHJlcXVlc3RlZC4KPj4+Pgo+
Pj4+IElmIHRoZSBjb250cm9sbGVyIG9ubHkgcmV0dXJucyAyayszMkIsIHRoZW4gcGVyZm9ybSBh
IHJhbmRvbSByZWFkIHRvCj4+Pj4ganVzdCBtb3ZlIHRoZSByZWFkIHBvaW50ZXIgdG8gbXRkLT5z
aXplICsgbXRkLT5vb2JzaXplIC0gMzIgYW5kCj4+Pj4gcmV0cmlldmUgdGhlIG1pc3NpbmcgMzIg
Ynl0ZXM/Cj4+Pgo+Pj4gMSkgcmF3IHJlYWQgY2FuIHJlYWQgb3V0IHRoZSB3aG9sZSBwYWdlIGRh
dGEgMmsrNjRCLCBkZWNpZGVkIGJ5IHRoZSAKPj4+IGxlbiBpbiB0aGUgY29udHJvbGxlciByYXcg
cmVhZCBjb21tYW5kOgo+Pj4gwqDCoMKgwqBjbWQgPSAobGVuICYgR0VOTUFTSyg1LCAwKSkgfCBz
Y3JhbWJsZXIgfCBETUFfRElSKGRpcik7Cj4+PiBhZnRlciB0aGF0LCB0aGUgbWlzc2luZyBvb2Ig
Ynl0ZXMobm90IHVzZWQpIGNhbiBiZSBjb3BpZWQgZnJvbSAKPj4+IG1lc29uX2NoaXAtPmRhdGFf
YnVmLiBzbyB0aGUgaW1wbGVtZW50YXRpb24gb2YgCj4+PiBtZXNvbl9uZmNfcmVhZF9wYWdlX3Jh
dygpIGlzIGxpa2UgdGhpcyBpZiBuZWVkLgo+Pj4gwqDCoMKgwqB7Cj4+PiDCoMKgwqDCoMKgwqDC
oCAuLi4uLi4KPj4+IMKgwqDCoMKgwqDCoMKgIG1lc29uX25mY19yZWFkX3BhZ2Vfc3ViKG5hbmQs
IHBhZ2UsIDEpOwo+Pj4gwqDCoMKgwqDCoMKgwqAgbWVzb25fbmZjX2dldF9kYXRhX29vYihuYW5k
LCBidWYsIG9vYl9idWYpOwo+Pj4gwqDCoMKgwqDCoMKgwqAgb29iX2xlbiA9IChuYW5kLT5lY2Mu
Ynl0ZXMgKyAyKSAqIG5hbmQtPmVjYy5zdGVwczsKPj4+IMKgwqDCoMKgwqDCoMKgIG1lbWNweShv
b2JfYnVmICsgb29iX2xlbiwgbWVzb25fY2hpcC0+ZGF0YV9idWYgKyBvb2JfbGVuLCAKPj4+IG10
ZC0+b29ic2l6ZSAtIG9vYl9sZW4pOwo+Pj4KPj4+IMKgwqDCoMKgfQo+Pj4gMikgSW4gRUNDIG1v
ZGUsIHRoZSBjb250cm9sbGVyIGNhbid0IGJyaW5nIGJhY2sgdGhlIG1pc3NpbmcgT09CIAo+Pj4g
Ynl0ZXMuIGl0IGNhbiByZWFkIG91dCB0aGUgdXNlciBieXRlcyBhbmQgZWNjIGJ5dGVzIHBlciAK
Pj4+IG1lc29uX29vYmxheW91dF9vcHMgZGVmaW5lLgo+Pgo+PiBBbmQgdGhlbiAoaWYgb29iX3Jl
cXVpcmVkKSB5b3UgY2FuIGJyaW5nIHRoZSBtaXNzaW5nIGJ5dGVzIHdpdGgKPj4gc29tZXRoaW5n
IGFsb25nOgo+PiBuYW5kX2NoYW5nZV9yZWFkX2NvbHVtbl9vcChjaGlwLCBtdGQtPndyaXRlc2l6
ZSArIG9vYl9sZW4sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgb29iX2J1ZiArIG9v
Yl9sZW4sCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbXRkLT5vb2JzaXplIC0gb29i
X2xlbiwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmYWxzZSk7Cj4+IFNob3VsZCBu
b3QgYmUgYSBodWdlIHBlcmZvcm1hbmNlIGhpdC4KPiAKPiBBZnRlciBmaW5pc2hpbmcgRUNDIG1v
ZGUgcmVhZGluZywgdGhlIGNvbHVtbiBhZGRyZXNzIGludGVybmFsIGluIE5BTkQgCj4gZGV2aWNl
IHNob3VsZCBiZSB0aGUgcmlnaHQgcG9zOyBpdCBkb2Vzbid0IG5lZWQgdG8gY2hhbmdlIHRoZSBj
b2x1bW4gCj4gYWdhaW4uIHNvIGFkZGluZyBjb250cm9sbGVyIHJhdyByZWFkIGZvciB0aGUgbWlz
c2luZyBieXRlcyBhZnRlciBFQ0MgCj4gcmVhZGluZyBtYXkgd29ya3MuCj4gCnVzZSByYXcgcmVh
ZCBmb3IgdGhlIG1pc3NpbmcgYnl0ZXMsIGJ1dCB0aGV5IGFyZSBub3QgcHJvdGVjdGVkIGJ5IGhv
c3QgCkVDQy4gdG8gdGhlIE5BTkQgdHlwZSBvZiBzdG9yYWdlLCBpcyBpdCBvayBvciBtaXNzaW5n
IGJ5dGVzIGJldHRlciB0byBiZSAKZmlsbGVkIHdpdGggMHhmZj8KCj4+Cj4+Pgo+Pj4+Cj4+Pj4g
VGhpcyBhcHBsaWVzIHRvIHRoZSB0d28gbW9kZXMsIHRoZSBvbmx5IGRpZmZlcmVuY2UgaXM6Cj4+
Pj4gLSB3aXRoIGNvcnJlY3Rpb24gKGNvbW1vbmx5IG5hbWVkICJFQ0MgbW9kZSIpOiB0aGUgdXNl
ciBieXRlcyBhbmQgRUNDCj4+Pj4gwqDCoMKgIGJ5dGVzIHNob3VsZCBiZSBmaXhlZCBpZiB0aGVy
ZSBhcmUgYW55IGJpdGZsaXBzCj4+Pj4gLSB3aXRob3V0IGNvcnJlY3Rpb24gKGNvbW1vbmx5IHJl
ZmVycmVkIGFzICJyYXcgbW9kZSIpOiBubyBjb3JyZWN0aW9uCj4+Pj4gwqDCoMKgIGFwcGxpZXMs
IGlmIHRoZXJlIGFyZSBiaXRmbGlwcywgZ2l2ZSB0aGVtCj4+Pj4KPj4+PiBQbGVhc2UgbWluZCB0
aGUgcmF3IG1vZGUgY2FuIGJlIHNsb3csIGl0J3MgbWVhbnQgZm9yIGRlYnVnZ2luZyBhbmQKPj4+
PiB0ZXN0aW5nLCBtYWlubHkuIFBhZ2UgcmVhZHMgaG93ZXZlciBzaG91bGQgYmUgZmFzdCwgc28g
aWYganVzdCBtb3ZpbmcKPj4+PiB0aGUgY29sdW1uIHBvaW50ZXIgd29ya3MsIHRoZW4gZG8gaXQs
IG90aGVyd2lzZSB3ZSdsbCBjb25zaWRlcgo+Pj4+IHJldHVybmluZyBGRnMuCj4+Pj4KPj4+PiBU
aGFua3MsCj4+Pj4gTWlxdcOobAo+Pj4KPj4KPj4KPj4gVGhhbmtzLAo+PiBNaXF1w6hsCj4+Cj4g
CgotLSAKVGhhbmtzLApMaWFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
