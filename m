Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A2CAC432BE
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 09:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDCB36101C
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 09:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDCB36101C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SdyJz/rio2xtrJHEsUtp16i7lbR0fd9/1sjb03jk9yQ=; b=TOTPErkehMcSQtxhGCK1x7cRPr
	zzIcrFBkAxOvxUbtNAzVmW0v8uvyzLy+Tn/JoT40BCkqVuq8K0ycR+Tree+28UsWGZJBkP++ZBJz3
	n1AN4Sesg06J4WRQa0c1pxYV+Q/yufQuC8Ia1jgcm7qV8THoE7by61ycdspqDwO849iGrKyIa4YEG
	07kYWLDFjOmLWhXn/eWEMEHsjcEqMUPBwqPTQFSYct6yznbQIw3x6/aMXTq0joUv3g/7dDBW8PJo5
	XgL+vmvED1rm2Jz6FkQkPz82/PI7hd8KOlsRsY4s4hA0PSlzxOObjyCbMrcx1bNm259uEUzUT66rZ
	avBiVkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKdRU-00GqL3-Oi; Mon, 30 Aug 2021 09:19:00 +0000
Received: from mail-am6eur05on2114.outbound.protection.outlook.com
 ([40.107.22.114] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKdRR-00GqK0-CP
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 09:18:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hVToKsii9XoctuemjbYNCT2G7c9JK6vTSrv9x+iq2OhO5jOIwXEmAVRVbsg+LDIp1GuSrEH0TZ2cIURMy4wE0rzCmWunwKFi3IuZVUhVhi/1Ttpx44MmVL6VRD0CbCDokfID5kzMJpfWrT5iVK93VquVidS+ot0unwxaF+Qm+rQpB3AA4hDfMFGhW/GWogNdIbM/q/wgZ6+f9eWKLpYYQTdrt5UQ/xL/pyHJP0BBZ/ogSvHDk/yMp49b0u9MuiLM4Q/A9jMY0cAN5uWwMPfCpXuCMMoloFuVMM7p/y//9PZ+OGlEV648DyA+w9rP3vMWIAQnFMksiaku+aIyaMjHpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/Q1lquckZwWjCsDJGAavPtnhQ31G9Ab8GOEqq2vf0Y=;
 b=LNeSPqKosHqZN1fmuG5YzY1YK+85J5uuKJC93x/BqQb+l0TRGid0R5A4tTRM524Apjdnzxr5QVMMS0WAJCiqebfMBd7vBGEM8tnBX97QySaYDQ848zlLWvoqDuCPxxJdqndi/cvGCIckVxhemiX8l9liRRpObGfT5XkSENQ/H8u+DLAB9+3Z6syfsfjlLirAJ+iuaeMChtNP3oZYvbckKuyOUzbxb1OwJONzE+lloDTewqh4iYJE8P6UVmIzEiSVtFl1Bau/rJig5BcdXqIBVQqFgMJZLll4p5+3p1lmfezc/vsoAyY8MAEiqGbKls/4vxRY2GT43n1yBrMQem91+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/Q1lquckZwWjCsDJGAavPtnhQ31G9Ab8GOEqq2vf0Y=;
 b=YAcgfSy18BynM0YiGmHBaxNkfxQZvp72yrz4tnttbcFUnWTkqb6fi9+3IF3sK7RHvMwymrkiuitds/wE7SuasNh/mto+iitObi9BVlaF7rntDGLFn1k+hpfmRYCD6JAfCNujVPO6O2ekHWQ3lK9nhhr86MkcBDodtat39rdNPnA=
Authentication-Results: mxic.com.tw; dkim=none (message not signed)
 header.d=none;mxic.com.tw; dmarc=none action=none header.from=kontron.de;
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:157::14)
 by AM0PR10MB2724.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:12f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Mon, 30 Aug
 2021 09:18:52 +0000
Received: from AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a468:e307:d46:63a]) by AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a468:e307:d46:63a%4]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 09:18:51 +0000
Subject: Re: [RESEND PATCH 5.10.x] mtd: spinand: Fix incorrect parameters for
 on-die ECC
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Frieder Schrempf <frieder@fris.de>
Cc: stable@vger.kernel.org,
 voice INTER connect GmbH <developer@voiceinterconnect.de>,
 Alexander Lobakin <alobakin@pm.me>, Felix Fietkau <nbd@nbd.name>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, YouChing Lin <ycllin@mxic.com.tw>
References: <20210830072108.13770-1-frieder@fris.de>
 <20210830104122.58f9cdaf@xps13>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
Message-ID: <35e30f69-c6f8-ac9c-2314-f566190ac2cb@kontron.de>
Date: Mon, 30 Aug 2021 11:18:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210830104122.58f9cdaf@xps13>
Content-Language: en-US
X-ClientProxiedBy: AM3PR07CA0072.eurprd07.prod.outlook.com
 (2603:10a6:207:4::30) To AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:157::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.30.113] (80.147.118.32) by
 AM3PR07CA0072.eurprd07.prod.outlook.com (2603:10a6:207:4::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.6 via Frontend Transport; Mon, 30 Aug 2021 09:18:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a95a9ce-9309-4f74-f559-08d96b972eaa
X-MS-TrafficTypeDiagnostic: AM0PR10MB2724:
X-Microsoft-Antispam-PRVS: <AM0PR10MB2724975C05AA36FB81F421D5E9CB9@AM0PR10MB2724.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uF7E/ZCxRROWdwEStKDyblNoLQbqeHsnwtJdl9cL536ZrH7hDbdBBj6ugKySdGIY2DvTpWtUIdOV0Yu7kzqinwcF52oPz1XR7JLYjb/20zSRC8Np2PrtOWQm9uIEeBTzF7vTfTLOrqaADUKX9DXS65A9VqiKeCJarCOrNhHQYhJbRfbe3CakuIfcNcPbifYy+I6mDYSAhyb7DUvku/Jfoze7XVJnqw4uJm2R8v6RHIz21pzqQBJuqdFdSIcVBOKkLyvN/S6B4uNtj7Mb0TrMJuA/1PYICPSOysZLmK/x59Dd/RbEGLuQPNRoS+TwFFbkf9/LEJmjF0jx3PGGDjHVdW65X0LpRmfrTFv+FPoY0Rd+ktHZ6eNpOB01OZ9RCKhp5qnFWyKD4V/j1DAiJUf/XbDptHBa4BbgtT4BnEwsteNSMZiGPERZWmmUfT0wNNuNWrehtXt+GoaWkrhNZiG60y4aeBxwEbYNbuNnmeoacsZR1XAl5+eHT7pbNj7M9FZo8R9Pb1GGLOAsWgt6DlPE4130L7CJ86+vDXCFa1D4TademqoiW1Xsy/Y0/AIjrPOFV52B/8JvqvwgYp7e4o+ecBz6tICMlNJJrbT/vBRSYtb57bekb0c9LBegiVsgyKrDoimS9v6E+Ep/QoxTQYGlsJrwYNF5Xrdb9f7Dub+Kp7rr87K6TpX/EYUh66XsnGM+fCduPYRc0r5KNK9bCstUJxbjnY7G5Re08h3yFQj6V0g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(8936002)(7416002)(110136005)(83380400001)(66476007)(31686004)(66946007)(66556008)(53546011)(956004)(5660300002)(86362001)(36756003)(478600001)(16576012)(66574015)(8676002)(2616005)(44832011)(38100700002)(31696002)(2906002)(4326008)(186003)(316002)(26005)(6486002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnpVc1REeExUbTZvajdkOGRpa0VWOUxVaUxHamVuV3pwNFV2TzBvYzlzcTJn?=
 =?utf-8?B?SlYrWUFET2NaN1lZM0VVSU9lSUUyMFB6TW1CZnhWdTYrVFF6cjJrcHIzTVNJ?=
 =?utf-8?B?VngyeEt4MHp6NW9HdDRXd1EvNzVMdHM1WWU5ZTZDaUF1N1JDWTgrU1BIVEUw?=
 =?utf-8?B?eExNVFNROFE4a2l0b2ErK3NCWHRwbWhENnB5RHJXM1lrRGJHNHJROEhqWDc3?=
 =?utf-8?B?ZFNVejBkRUgrRDJ5UXlnYkRINzM2Vm1uZmFDZXRJQkxONnpRNnhWYTdBOHJt?=
 =?utf-8?B?ODhBRDBIZTBQUXErRjhXT1REbGFwWDl5T3ZUOTN6eGY3dkh6SXJzb0JucjNM?=
 =?utf-8?B?YXZGcVdaT3d3SldnQ2d3dDVubk52ZXBFL3A2RXRFV3Y2RUJhd3dGREhZYzYr?=
 =?utf-8?B?dVUyUFFFTTBDMDdja2poSTl2ZFlKRkp3QlFyQ0ZzMUtzRElmdFRzdnNoOWpz?=
 =?utf-8?B?b1BKbWU0UHpZRzcySVArRVczYk9uYlRxRmJ1bFRHSDlZVjJZeDFJT0VQVXNT?=
 =?utf-8?B?T3U1MGdkRVlOZkFXalBMa1NUOW5vbkt2T3ZhL0pmanFlRUxsUlRBd0F1Ym0v?=
 =?utf-8?B?ZDgxYmYxVkV1TThjN0FOb1lRamM4MEhwUzV1U29DazNQZVNhdUF2dzFRaC83?=
 =?utf-8?B?c3BxQ1V2WElhTkg3SWprRDVuTHYwOCtnU050cFpVZG1zREROYk5iY3pRMWdR?=
 =?utf-8?B?ekFZb0hPakQ1ZFNESjd3cGQ4MDNkMWYwMVRWbklrRUpuQUxFYllNK3R0MEFr?=
 =?utf-8?B?djNpdmtxOWFXSDhLQVpnVDVER3JFZkllMkR0Wm9NSDNKOVkyYVJ2Qm9IY0cw?=
 =?utf-8?B?RDE0Tk9SekJXSHBVWDNpM3hnOVNLWUYvWjlhV3JBN1lPZ3B4dWV5TEtIN0tp?=
 =?utf-8?B?MDNwcmVQS09kUkl4Y0JVK3pFMTEzc29CcC96UTh5MHp4R0w0cjV0ekJsRDZv?=
 =?utf-8?B?RnViUU9qeGRxSHZDdFJPS0w3T0RXcnA0STRiMHhFdEs2V2ZsUnQzbmpNdkMv?=
 =?utf-8?B?eDh5aHlrYjBMaFpSOU5wMGdMeEV0Ulk0Wm5QUHlieXhPdEVrblMyVnRMWWkz?=
 =?utf-8?B?c0FNaFhsd2pyNTljREE2ZVppNFdseCtyTXRwODAzOUs4bmV5RlV5TmZ5R21r?=
 =?utf-8?B?UzRybHlxVTJLUFJ2MmFEUjRrMThlQXB2WUcxc09LQmRzWit2aUJRaHJ1WTZu?=
 =?utf-8?B?VndiRmRJcFBzNWNrL1dpNHhuSHRoQVJWYWIzNER0OXpmY3A1NjZ0amRkaHkw?=
 =?utf-8?B?WjFadGh5VGdBSFJBdmFTYzZyWVUvTjdOaThQUFVaRmNXME9PVGxuQ0JhVkdI?=
 =?utf-8?B?cXJVYXYwa2owQjhMU0N6M0I3dWoyNW44am5qeUV1aWFjeDRzdGx0NHY3UFpR?=
 =?utf-8?B?ZDdUdkZjQVowb2p6Qy8zS2ZNaTdJL09SRU9ObXBRU2FiUjlWQ1NLd3lWS2x2?=
 =?utf-8?B?dTRxUUF4aVNGbkVXWWlmWkx5RllPQVJteFFoMXZXYWNGV05jRncwYWlHYTdC?=
 =?utf-8?B?a2JFZnhZRmlZbktnMWljVlZpVTlENDJCVGoxc1BGc0l0YXd3UEZMcjBMckd6?=
 =?utf-8?B?Zlh4cXRLSTlLamZwcFh0OHpLeTZ3RUllcktoekh4K2o5WnBLYmhqbkdudmlK?=
 =?utf-8?B?eXVKMEVjNjQxcWJ1UzJMRndzYWE4K3JnL2lQYUVTMHY3TVJ2VlFpaiszdThW?=
 =?utf-8?B?ZE93aCtjZTZrLzRjTjJYam9mVmNIbk5MSVhzNlNOV3NUekVXL2Y2Y3llaHNN?=
 =?utf-8?Q?EgQM39NbuxtlVRmCCuOEqv5Ogv8DVx49BR3JkRh?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a95a9ce-9309-4f74-f559-08d96b972eaa
X-MS-Exchange-CrossTenant-AuthSource: AM0PR10MB2963.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 09:18:51.7854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfoA9cTpXZM/fw0022MbSCziLE+NJZ3psgY6djxRxKqRtiOS4KGQ3Uf3xWQX+MKNOePzr6nPM6mem9R9HqY7bUzBrIfSiiAMiWKVq7D+4q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB2724
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_021857_520408_9544E40E 
X-CRM114-Status: GOOD (  18.58  )
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

T24gMzAuMDguMjEgMTA6NDEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGkgRnJpZWRlciwKPiAK
PiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyQGZyaXMuZGU+IHdyb3RlIG9uIE1vbiwgMzAgQXVn
IDIwMjEgMDk6MjE6MDcKPiArMDIwMDoKPiAKPj4gRnJvbTogRnJpZWRlciBTY2hyZW1wZiA8ZnJp
ZWRlci5zY2hyZW1wZkBrb250cm9uLmRlPgo+Pgo+PiBUaGUgbmV3IGdlbmVyaWMgTkFORCBFQ0Mg
ZnJhbWV3b3JrIHN0b3JlcyB0aGUgY29uZmlndXJhdGlvbiBhbmQgcmVxdWlyZW1lbnRzCj4+IGlu
IHNlcGFyYXRlIHBsYWNlcyBzaW5jZSBjb21taXQgOTNlZjkyZjZmNDIyICgiIG10ZDogbmFuZDog
VXNlIHRoZSBuZXcgZ2VuZXJpYyBFQ0Mgb2JqZWN0ICIpLgo+PiBJbiA1LjEwLnggVGhlIFNQSSBO
QU5EIGxheWVyIHN0aWxsIHVzZXMgb25seSB0aGUgcmVxdWlyZW1lbnRzIHRvIHRyYWNrIHRoZSBF
Q0MKPj4gcHJvcGVydGllcy4gVGhpcyBtaXNtYXRjaCBsZWFkcyB0byB2YWx1ZXMgb2YgemVybyBi
ZWluZyB1c2VkIGZvciBFQ0Mgc3RyZW5ndGgKPj4gYW5kIHN0ZXBfc2l6ZSBpbiB0aGUgU1BJIE5B
TkQgbGF5ZXIgd2hlcmV2ZXIgbmFuZGRldl9nZXRfZWNjX2NvbmYoKSBpcyB1c2VkIGFuZAo+PiB0
aGVyZWZvcmUgYnJlYWtzIHRoZSBTUEkgTkFORCBvbi1kaWUgRUNDIHN1cHBvcnQgaW4gNS4xMC54
Lgo+Pgo+PiBCeSB1c2luZyBuYW5kZGV2X2dldF9lY2NfcmVxdWlyZW1lbnRzKCkgaW5zdGVhZCBv
ZiBuYW5kZGV2X2dldF9lY2NfY29uZigpIGZvcgo+PiBTUEkgTkFORCwgd2UgbWFrZSBzdXJlIHRo
YXQgdGhlIGNvcnJlY3QgcGFyYW1ldGVycyBmb3IgdGhlIGRldGVjdGVkIGNoaXAgYXJlCj4+IHVz
ZWQuIEluIGxhdGVyIHZlcnNpb25zICg1LjExLngpIHRoaXMgaXMgZml4ZWQgYW55d2F5IHdpdGgg
dGhlIGltcGxlbWVudGF0aW9uCj4+IG9mIHRoZSBTUEkgTkFORCBvbi1kaWUgRUNDIGVuZ2luZS4K
Pj4KPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyA1LjEwLngKPj4gUmVwb3J0ZWQtYnk6
IHZvaWNlIElOVEVSIGNvbm5lY3QgR21iSCA8ZGV2ZWxvcGVyQHZvaWNlaW50ZXJjb25uZWN0LmRl
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGcmllZGVyIFNjaHJlbXBmIDxmcmllZGVyLnNjaHJlbXBmQGtv
bnRyb24uZGU+Cj4gCj4gV2h5IG5vdCBqdXN0IHJldmVydGluZyA5YTMzM2E3MmMxZDAgKCJtdGQ6
IHNwaW5hbmQ6IFVzZQo+IG5hbmRkZXZfZ2V0X2VjY19jb25mKCkgd2hlbiByZWxldmFudCIpPyBJ
IHRoaW5rIHVzaW5nIHRoaXMgIm5ldyIKPiBuYW5kZGV2X2dldF9lY2NfcmVxdWlyZW1lbnRzKCkg
aGVscGVyIGJlY2F1c2UgaXQgZml0cyB0aGUgcHVycG9zZSBldmVuCj4gaWYgaXQgaXMgd3Jvbmcg
WzFdIGRvZXNuJ3QgYnJpbmcgdGhlIHJpZ2h0IGluZm9ybWF0aW9uLiBJIGtub3cgaXQgaXMKPiBz
dHJpY3RseSBlcXVpdmFsZW50IGJ1dCBJIHdvdWxkIHBlcnNvbmFsbHkgcHJlZmVyIGtlZXBpbmcg
dGhlIG9sZAo+IHdyaXRpbmcgIm5hbmQtPmVjY3JlcS54eHh4Ii4KCkkgdGhpbmsgcmV2ZXJ0aW5n
IDlhMzMzYTcyYzFkMCB0byB1c2UgbmFuZC0+ZWNjcmVxLnh4eHggZG9lc24ndCB3b3JrIGFzIHRo
ZSBlY2NyZXEgbWVtYmVyIGhhcyBhbHJlYWR5IGJlZW4gcmVtb3ZlZCBpbiA5M2VmOTJmNmY0MjIg
KCJtdGQ6IG5hbmQ6IFVzZSB0aGUgbmV3IGdlbmVyaWMgRUNDIG9iamVjdCIpLiBTbyB3ZSB3b3Vs
ZCBuZWVkIHRvIHJldmVydCB0aGlzIGNvbW1pdCwgdG9vLiBUaGF0IHdvdWxkIHdvcmsgZm9yIHRo
ZSBTUEkgTkFORCBsYXllciwgYnV0IG1pZ2h0IGhhdmUgaW1wbGljYXRpb25zIG9uIFJBVyBOQU5E
IGFzIGl0IGFscmVhZHkgdXNlcyB0aGUgbmV3IGdlbmVyaWMgRUNDIG9iamVjdCB3aXRoICdjdHgu
Y29uZicgYW5kICdyZXF1aXJlbWVudHMnLiBBdCBsZWFzdCBJIGNhbid0IHRlbGwgaG93IHRoaXMg
d291bGQgYWZmZWN0IHRoZSBSQVcgTkFORCBsYXllci4KCj4gCj4gWzFdIFdlIGRvbid0IHdhbnQg
dGhlIHJlcXVpcmVtZW50cyBidXQgdGhlIGFjdHVhbCBjdXJyZW50IGNvbmZpZ3VyYXRpb24KPiBo
ZXJlLCB3aGljaCB3YXMgdGhlIHByaW1hcnkgcHVycG9zZSBvZiB0aGUgaW5pdGlhbCBwYXRjaCB3
aGljaCBlbmRlZAo+IGJlaW5nIGEgbWlzdGFrZSBhdCB0aGF0IHBvaW50IGluIHRpbWUgYmVjYXVz
ZSB0aGUgU1BJLU5BTkQgY29yZSB3YXMgbm90Cj4gcmVhZHkgeWV0Lgo+IAo+IFRoYW5rcywKPiBN
aXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
