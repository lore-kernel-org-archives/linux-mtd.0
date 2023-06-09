Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A4FC7EE29
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jun 2023 08:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:References:Cc:To:
	Subject:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLyhy54LF7aB56y3ciDMmMyXgYZj+bMoLmGnmxNJjkc=; b=MV2Iw8WfF5CSmvZro+Urg04zr1
	OgY6MOZTblPatInqjQ5c03wrpsae3KKmBAnSaaACigz8vwRM7dHxfo+vo6VibhAcGcTKWYrVt2irN
	P6XWcRvYX1kofO0Q9xClOjv2dH+wuW/XeTXPjCxFXVltSoTKR2qCq1gv6IYbNqMtVkmmYfC65bb4I
	iAShi5iJffWeohb213mYYL9Hcb1beHKb+GN9ALRF6D9EYxN0ZXZ1z5taTFTS4moLtuvFqiqBqfDOz
	YBTtHTDfjFluEeFZC62mblOdvlkLEeCI/HzoTKTPGUZO3k/ePQPBcclUedib5JB4LYJSfq2WoR3nn
	njLgjmAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7X2h-00C9jk-0k;
	Fri, 09 Jun 2023 08:00:19 +0000
Received: from mail-sgaapc01on20711.outbound.protection.outlook.com ([2a01:111:f400:feab::711] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7X2d-00C9hI-2V;
	Fri, 09 Jun 2023 08:00:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A4Hpw5av8kFTjC1YdChEFfCeZtPlVvL6q8rlPa0hiQf6vMgZ8m1K9u5G3xDjqYzKGSWWdGhVdg//c3/MtPHuFHjm4uYoUoqHjjGp5faW9m4mFs4BleTE1v8M9lS2Kl0gZQEjkVwz8l/8njcpFYMSHy3ds/LTuGTVqvWabCt2YFwXTmXV4tCCTHvHH4N1i3QJeoMn5MKyzuOkYgBtxV6GTUfkWnSDFw2Rlp49+u1I8RLLFggSK8YZ/Bn1tOjvhHF/B/a999Ge7YkR+wyNhMdzHQONO6/XK5qDNFqXT3oMNgX4HhCBIXtrEsq669MWDwuSyYX/BghJbu/lwv8Y7by/5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXIhlwnh1Kj1AiJrFPrM2nYo3nJa53jqQwZLVlGvO4Y=;
 b=L64eOgvDMbfiYmJHaYruAH0Jwuro9V54CUcnsKVxMq/qtbkxQw2hzIE7MFegPLlu39IsXNkPOvwu8vXxwqMJvrzjfgP1ce1ET9ECblIvlWIiAarvw1NF8oGKvPSQ2+pS0T9x1q/+B3UUcpDXg892n5BKMEsovH35lGADXzmYt8J92jgKZ2rfVnfscoSuVIFVSiB8++bJBrKmOCVGN8mf1/KDYqOpX/sy7HyI/lmwkoTzJJMSLjTiUd1JO35xu/vimhIJK357TN25XcHX/9psHd3Z0vPDktXc73/LaflpMpT2OqdxMeb+K1fbKrumQELWgBFLTQ4nyK7tJudcsV9eZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXIhlwnh1Kj1AiJrFPrM2nYo3nJa53jqQwZLVlGvO4Y=;
 b=UAIjCVUo+1asTCmkhIq0BSIEZDfzb7uZR3oS+3apP/7PZVk62zChkpC8JyfbG0NNbqWmGg/5Fv+HESq6sPzwFpoiz9U6mAA0hMcnbB91S66omGSnHL12W9ZIQx/GM9x3l321FPbEHH+OLvs3+fR5JaM1UhxvbuziwvKkk2UqrMEFxMhHc5XhjvkA+V2umhCPyA12pu2CG9JWxoWsYrin71ortIfZOaon9LTYFMmVSkmPJlJuiZThSL0i+pz02YRJD+/2eO1hbFBR01huis8b/T/BosNJuI0/I7ulYQvLSNPZAinSepO0Vi4C35w25BK2AUrMHHZIWlVA2h2DbV/puA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from JH0PR03MB7495.apcprd03.prod.outlook.com (2603:1096:990:9::6) by
 SEZPR03MB6514.apcprd03.prod.outlook.com (2603:1096:101:44::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19; Fri, 9 Jun 2023 07:59:59 +0000
Received: from JH0PR03MB7495.apcprd03.prod.outlook.com
 ([fe80::5e9e:bcd4:e9d8:548a]) by JH0PR03MB7495.apcprd03.prod.outlook.com
 ([fe80::5e9e:bcd4:e9d8:548a%6]) with mapi id 15.20.6455.028; Fri, 9 Jun 2023
 07:59:59 +0000
Message-ID: <3cc9765c-f32a-fe8a-f7af-fb884ee63b48@amlogic.com>
Date: Fri, 9 Jun 2023 15:59:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] mtd: rawnand: meson: check buffer length
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Arseniy Krasnov <avkrasnov@sberdevices.ru>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 oxffffaa@gmail.com, kernel@sberdevices.ru, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230606101644.3297859-1-AVKrasnov@sberdevices.ru>
 <9adef6da-5930-dcaa-f148-e4a398d39f2d@sberdevices.ru>
 <3a9470ed-d7ad-6cae-0d58-732399590272@sberdevices.ru>
 <7903580d-685c-14e6-5572-81a4cb31cced@amlogic.com>
 <20230608085458.449a24c0@xps-13>
 <4e6cd8a8-f618-4bc3-5fa9-eab2b501dd89@amlogic.com>
 <a6a20b50-02b0-53c0-1e65-75035bc59c87@amlogic.com>
 <20230608152114.3a1d82ac@xps-13>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20230608152114.3a1d82ac@xps-13>
X-ClientProxiedBy: TYCPR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:1::26) To JH0PR03MB7495.apcprd03.prod.outlook.com
 (2603:1096:990:9::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: JH0PR03MB7495:EE_|SEZPR03MB6514:EE_
X-MS-Office365-Filtering-Correlation-Id: 331946da-f834-4549-8f36-08db68bf8524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E3zOBcIqUelVWRbIyEleDeK/eZQsOBOEmvtppirTuR9QIuHKOzcyZO4g/3ur1Cz4hzklzp8htvSpME6qB9Sx2aKYITiMmkFD8m+gYFHX1Xw4M1fpwy8CEa+4RbvJvx/T/K/Lc/VaY7iD6w3okJn3u4AtvLC7EHb0NM4RURglzngnBgPiYnwerX7s72pCSNsDCy8BZdFvyqLXIFPvOigL+d6RC6i1EqFbxq5jt2HO/Fd/oflKpXIa5K72uVe+ost3tZrO/KvAgbCX9+LAKRW5yYwhy+F2eStbFAhQtXUswCL8dkgfsHO72H890kO4KDrb/uiRfCRjee17rDv81FLMpsB4CRX0LWe7yKbjOS+dlNHyT1aQZsdZS/jeS136tZGFiBmMN8WBhEXK3wvHxLsUokR4M4MSQbYcIaxMNCYvbO07YKhle7xLTYOlPwrP6m+HWHDKbaEoUM7pjBhCmFeMWbro5i3B+KXef5fX7ovLD1XFjG8Ms3Uu6qJSsY42x9PM7jslo96Ahz1H1akwbo+8CuxEV+KXi/4EbPtqJYCOosCVcmagTWmANGFOJEINqj1TRexorBldKM75TMxHYosHJm0xxbwlCFDu8e/Sc1ZTyQdlhZ7Z75kVmxkMNjo/S5AwHx8fkQja5/+b4o+XYTd+8S3c1+iRmF7bQ4Kl+Wxw4B5Y1L5zTHA5aPSJiNrD751rIbWs01LogEM8ig/CuknLOwHIxz5xWwDL1yzH+sXuOrA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR03MB7495.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(366004)(39850400004)(396003)(451199021)(83380400001)(7416002)(54906003)(316002)(5660300002)(8676002)(44832011)(8936002)(86362001)(4326008)(41300700001)(66946007)(66476007)(66556008)(6916009)(38350700002)(38100700002)(31696002)(66574015)(36756003)(6486002)(6666004)(2906002)(52116002)(478600001)(6512007)(53546011)(26005)(6506007)(2616005)(31686004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTdKYVdZd0s0a3pBczVuT0R0ZHVDenl5ems5VDZLWnlJK1RsWkZwR1NKTUxi?=
 =?utf-8?B?NWdGMElhWDBGRzRpSWdCWk1xZTBCMlNITG4xZ1AwTythY2lXaEhkVnNFcDBM?=
 =?utf-8?B?WW9RZDZyTVJqRGJrdUJ0SnZaWVBjVjJ1b3BhKzhtdnNKTkhUbUhSNzRKSzYr?=
 =?utf-8?B?Zkk2eWJ5ZkVlODZ4aHVZb2xZTFZ4TnVocWhGU3FxejZjMmlTYW5Eams4L0Vq?=
 =?utf-8?B?QXZTcUxkTHdSajFYaTBpR1RCSEpsMTJ1Nzc3NkxIL29OVjhtTXFpUisxLzlN?=
 =?utf-8?B?a0FnYTUxbmN3czZIZDJPZG1jSEY4S0oyVEErSnRITkxNb1dTbVg1aXdTS2hm?=
 =?utf-8?B?SVB6Mlo2dTBrbThnV3Z4cG16Y3FnWTRIcTBzNGUrQm1ib1FWVnZzOXVvajJJ?=
 =?utf-8?B?UmhDZUl4bGJlVFdlamRNOWFjaWM4TjE5YUIvbUtRcm5aQ0h4WFdXd1NLL1h4?=
 =?utf-8?B?LzF3SXgyc09EMFR2REFGUFVNZDE1QmFKaDRsZTMyR0gxUGpMcDlOZWFNZDdl?=
 =?utf-8?B?ZVFCRVdLSkY5K0pHVDdGN1NDRmtDRnB0Rm9Bd1lFQkUwZXZOdGk2UnJ2N3h0?=
 =?utf-8?B?a2x3OEd1Q1ZuRDRpK2lMZFVBSTAvaVdpK0xsbTVwdVRsN2EvS3p2cjJvdVFE?=
 =?utf-8?B?YkdLL3RGdzhSeEwwSVd0NDVFU3I0SzRjWUhSMEROeTkwclErZzJSV2FQczJ0?=
 =?utf-8?B?OVJaZXdvdUgvTmxiK1Q4SXNud1F4TG9CY1VNUVZGcXhVMWs0dWh2S2dJNk1T?=
 =?utf-8?B?S3pRQkRNU21yUG5sMlR1Qzlud3E5aWJNN3ZwcW9TVG81MU9GQmo5QUlIQWV2?=
 =?utf-8?B?eHh0bUpNVlpkc2l1YVE4cTliaytaR3dLemZ6YjVrQkxCM1RIWFlRN3dhYmY0?=
 =?utf-8?B?aVpMb2hJa1F6dktsUlVVV2N3L1J2TDBreHljVUNzVzAvekVpRy90eTlxMllF?=
 =?utf-8?B?Zk9KN2p2RXJEQ2tHYUNnUjVtTFFicUlhSDVwNlI2bEI3NmtuN2w2REtTUzUx?=
 =?utf-8?B?UlEyamJwVUo1MWRYS1dEWU5ndi9KZ2JvNkszMzBaRHRvU0NqTmw5U0lSaU42?=
 =?utf-8?B?RTZWSEZxYUJIZkkzUXEvTE1SQXNRRmxPN2VVejF0NnZTSHdodmo1NHRJc0RZ?=
 =?utf-8?B?TTFYa29jNmhxbEkzVmNxZTk2NHNGbzFXaDZ2aFAvUWpCa1FtbXlTOXNlTnlV?=
 =?utf-8?B?dkd3V3MxcGFCZVgrbWYxRTJ5cGMvbmhBNlQ5U1k5NmQ0cGU2WC9lbU9Tc3or?=
 =?utf-8?B?RmxnU0hmWTV3QnQzbHFkdlZyRFBxWlJDOTlmN2E5MGllL1QwNlBxeXMxQTZj?=
 =?utf-8?B?MEJLSDlHMUtVSVVvdUlZcUEreDZWdW5zYitIcVFTS2FOOTU4Q3JFSEtIMWpw?=
 =?utf-8?B?bm5LeFNOZjJLNmpNREZnektEaEhvbzQya3NmRHJoUDdoaWtBVXNYWkZPWjkv?=
 =?utf-8?B?bnk0WFV0b0FuMi9lRzNITklRWEduM2tUNVlBdnlzZDJVcXlHbXdSazdsSVBJ?=
 =?utf-8?B?V2xOUGl2ZExBVnZqODdQbG1OSm5LcHMvRmJwcnlFVlhnS0RieURaRnpiZ1FV?=
 =?utf-8?B?bm1pT2RGNm52YjdGVjNVZlFDbkF1NkdTMlVpU1BndHl5OXNWSUtEcElnNSt4?=
 =?utf-8?B?cTVQZU1nMEF2a0NZR2phLzlPdWxjVFl6d3g5ZHdjRnRlVUkveXJzQ2o4Qmgv?=
 =?utf-8?B?OFlLbGJ6Y0lKOUhwcEpvOEl2Q3NSLzJqYUN0RWNzeWFuTndvaHMxaXAwbVZo?=
 =?utf-8?B?T0ZDN3Q3djdZanhRNEVVbDIvQUNybityaWdaY2RSUFc0ZG1nalNsQldLdzNt?=
 =?utf-8?B?eWdmRXlxRGhLSE40ZlJhM1VKWXdUSzFhY1FNdWRPSXJuaXpiODd1MHFBZXR4?=
 =?utf-8?B?OEdtYmR2b2ZFaU9lcVVsL2R0ZFZDdXh4Qno0U01sWUdlb2JqYk9EUVl3NGJB?=
 =?utf-8?B?cDF1dGs1N2MrNVVYcjI1V2NWRWpoVXY0MHFhdFUwSlJMZ3greGZ0SUFTOGVj?=
 =?utf-8?B?eFIySmswUERqclZrd2NsbFlJR2dvYi9xOHYvaGhuS3ZSUGZ2bWNQSy9KMGY0?=
 =?utf-8?B?TG9KYWhvL0w5YVU5Qkg2L1ZycWhNY2FEZDFEQnUvRUxkRWlOQS9rQTFJdlJi?=
 =?utf-8?Q?mifbSAqSjBaF8/bqQunJZVfzR?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331946da-f834-4549-8f36-08db68bf8524
X-MS-Exchange-CrossTenant-AuthSource: JH0PR03MB7495.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 07:59:58.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQKo0v7d+Im847rbWaeusBRQQHdbqe2ikgsIMzow6jmcx90RYoJ8701T8K/6fAF4ktGbzO/3dDkThR/ZpWrn0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB6514
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_010016_051880_5FB19CBA 
X-CRM114-Status: GOOD (  27.42  )
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

SGkgTWlxdWVsLAoKT24gMjAyMy82LzggMjE6MjEsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gWyBF
WFRFUk5BTCBFTUFJTCBdCj4gCj4gSGkgTGlhbmcsCj4gCj4gbGlhbmcueWFuZ0BhbWxvZ2ljLmNv
bSB3cm90ZSBvbiBUaHUsIDggSnVuIDIwMjMgMjA6Mzc6MTQgKzA4MDA6Cj4gCj4+IEhpIEFyc2Vu
aXkgYW5kIE1pcXVlbCwKPj4KPj4gT24gMjAyMy82LzggMTU6MTIsIExpYW5nIFlhbmcgd3JvdGU6
Cj4+PiBIaSBNaXF1ZWwsCj4+Pgo+Pj4gT24gMjAyMy82LzggMTQ6NTQsIE1pcXVlbCBSYXluYWwg
d3JvdGU6Cj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Pj4KPj4+PiBIaSBMaWFuZywKPj4+Pgo+
Pj4+IGxpYW5nLnlhbmdAYW1sb2dpYy5jb20gd3JvdGUgb24gVGh1LCA4IEp1biAyMDIzIDE0OjQy
OjUzICswODAwOgo+Pj4+Cj4+Pj4+IEhpIEFyc2VuaXksCj4+Pj4+Cj4+Pj4+IE9uIDIwMjMvNi84
IDU6MTcsIEFyc2VuaXkgS3Jhc25vdiB3cm90ZToKPj4+Pj4+IFsgRVhURVJOQUwgRU1BSUwgXQo+
Pj4+Pj4KPj4+Pj4+IEhpIGFnYWluIE1pcXVlbCwgTGlhbmchCj4+Pj4+Pgo+Pj4+Pj4gV2hhdCBk
byBZb3UgdGhpbmsgYWJvdXQgdGhpcyBwYXRjaD8KPj4+Pj4+Cj4+Pj4+PiBUaGFua3MsIEFyc2Vu
aXkKPj4+Pj4+Cj4+Pj4+PiBPbiAwNi4wNi4yMDIzIDE5OjI5LCBBcnNlbml5IEtyYXNub3Ygd3Jv
dGU6Cj4+Pj4+Pj4gU29ycnksIGhlcmUgaXMgY2hhbmdlbG9nOgo+Pj4+Pj4+IHYxIC0+IHYyOgo+
Pj4+Pj4+ICogTW92ZSBjaGVja3MgZnJvbSAnc3dpdGNoL2Nhc2UnIHdoaWNoIGV4ZWN1dGVzIGNv
bW1hbmRzIGluID4+Pj4+ICdtZXNvbl9uZmNfZXhlY19vcCgpJyB0byBhIHNwZWNpYWwKPj4+Pj4+
PiAgICAgIHNlcGFyYXRlZCBmdW5jdGlvbiAnbWVzb25fbmZjX2NoZWNrX29wKCknIHdoaWNoIGlz
IGNhbGxlZCA+Pj4+PiBiZWZvcmUgY29tbWFuZHMgcHJvY2Vzc2luZy4KPj4+Pj4+Pgo+Pj4+Pj4+
IE9uIDA2LjA2LjIwMjMgMTM6MTYsIEFyc2VuaXkgS3Jhc25vdiB3cm90ZToKPj4+Pj4+Pj4gTWVz
b24gTkFORCBjb250cm9sbGVyIGhhcyBsaW1pdGVkIGJ1ZmZlciBsZW5ndGgsIHNvIGNoZWNrIGl0
IGJlZm9yZQo+Pj4+Pj4+PiBjb21tYW5kIGV4ZWN1dGlvbiB0byBhdm9pZCBsZW5ndGggdHJpbS4g
QWxzbyBjaGVjayBNVEQgd3JpdGUgc2l6ZSBvbgo+Pj4+Pj4+PiBjaGlwIGF0dGFjaC4KPj4+Pj4+
Pj4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQXJzZW5peSBLcmFzbm92IDxBVktyYXNub3ZAc2Jl
cmRldmljZXMucnU+Cj4+Pj4+Pj4+IC0tLQo+Pj4+Pj4+PiAgICAgZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jIHwgNDcgPj4+Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0t
LS0KPj4+Pj4+Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCA1IGRlbGV0
aW9ucygtKQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9y
YXcvbWVzb25fbmFuZC5jID4+Pj4+PiBiL2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQu
Ywo+Pj4+Pj4+PiBpbmRleCAyM2E3MzI2ODQyMWIuLmRiNmIxODc1MzA3MSAxMDA2NDQKPj4+Pj4+
Pj4gLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvbWVzb25fbmFuZC5jCj4+Pj4+Pj4+ICsrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L21lc29uX25hbmQuYwo+Pj4+Pj4+PiBAQCAtMTExLDYgKzEx
MSw4IEBACj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgICAjZGVmaW5lIFBFUl9JTkZPX0JZVEUgICAgICAg
ICAgICAgICA4Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICsjZGVmaW5lIE5GQ19DTURfUkFXX0xFTiAgICAg
R0VOTUFTSygxMywgMCkKPj4+Pj4+Pj4gKwo+Pj4+Pj4+PiAgICAgc3RydWN0IG1lc29uX25mY19u
YW5kX2NoaXAgewo+Pj4+Pj4+PiAgICAgICAgIHN0cnVjdCBsaXN0X2hlYWQgbm9kZTsKPj4+Pj4+
Pj4gICAgICAgICBzdHJ1Y3QgbmFuZF9jaGlwIG5hbmQ7Cj4+Pj4+Pj4+IEBAIC0yODQsNyArMjg2
LDcgQEAgc3RhdGljIHZvaWQgbWVzb25fbmZjX2NtZF9hY2Nlc3Moc3RydWN0ID4+Pj4+PiBuYW5k
X2NoaXAgKm5hbmQsIGludCByYXcsIGJvb2wgZGlyLAo+Pj4+Pj4+Pgo+Pj4+Pj4+PiAgICAgICAg
IGlmIChyYXcpIHsKPj4+Pj4+Pj4gICAgICAgICAgICAgICAgIGxlbiA9IG10ZC0+d3JpdGVzaXpl
ICsgbXRkLT5vb2JzaXplOwo+Pj4+Pj4+PiAtICAgICAgICAgICAgY21kID0gKGxlbiAmIEdFTk1B
U0soMTMsIDApKSB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsKPj4+Pj4+Pj4gKyAgICAgICAg
ICAgIGNtZCA9IGxlbiB8IHNjcmFtYmxlciB8IERNQV9ESVIoZGlyKTsKPj4+Pj4+Pj4gICAgICAg
ICAgICAgICAgIHdyaXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4+Pj4+
Cj4+Pj4+IEkgdGhpbmsgd2UgY291bGQga2VlcCAiJiBHRU5NQVNLKDEzLCAwKSIuIGl0IGlzIGJl
dHRlciBoZXJlIHRvID4+PiBpbmRpY2F0ZSBob3cgbWFueSBiaXRzIG9mIGxlbmd0aCBpbiB0aGlz
IGNvbW1hbmQgYW5kIGRvbid0IGRlc3RvcnkgPj4+IHRoZSBjb21tYW5kIG9uY2Ugd2UgZG9uJ3Qg
Y2hlY2sgdGhlICJsZW4iIG91dHNpZGUgb2YgdGhpcyBmdW5jdGlvbi4gPj4+IG9yIHRoZSBjb2Rl
ICJpZiAobGVuID7CoCBORkNfQ01EX1JBV19MRU4pIiBpcyBiZXR0ZXIgdG8gcHV0IGluc2lkZSA+
Pj4gdGhpcyBmdW5jdGlvbiBuZWFybHkuIFRoYW5rcy4KPj4+Pgo+Pj4+IEl0IGRlcGVuZHMgd2hv
IGNhbGxzIHRoaXMgaGVscGVyLiBJZiBvbmx5IHVzZWQgaW5zaWRlID4+IGV4ZWNfb3Asd3JpdGVf
cGFnZV9yYXcoKSBhbmQgcmVhZF9wYWdlX3JhdygpIGFsc28gY2FsbCA+PiBtZXNvbl9uZmNfY21k
X2FjY2VzcygpLCA+IGJ1dCBpIGRvbid0IGZpbmQgd2hlcmUgY29uc3RyYWluIHRoZSAibGVuIi4K
Pj4KPj4gSXMgdGhlIGhlbHBlciAibWVzb25fbmZjX2NoZWNrX29wKCkiIG5lZWRlZCBieSBleGVj
X29wKCkgYWZ0ZXIgdGhlIGNvbnN0cmFpbnQgaW4gYXR0YWNoX2NoaXAoKT8gdGhlIGxlbmd0aCBw
YXNzZWQgaW4gZXhlY19vcCgpIHNlZW1zIHNtYWxsZXIgdGhhbiAibXRkLT53cml0ZXNpemUgKyBt
dGQtPm9vYnNpemUiIG5vdy4KPiAKPiBleGVjX29wKCkgaXMgcHJpbWFyaWx5IGRlZGljYXRlZCB0
byBwZXJmb3JtaW5nIHNpZGUgY29tbWFuZHMgdGhhbiBwYWdlCj4gYWNjZXNzZXMsIHR5cGljYWxs
eSB0aGUgcGFyYW1ldGVyIHBhZ2UgaXMgWCBieXRlcywgeW91IG1pZ2h0IHdhbnQgdG8KPiByZWFk
IGl0IDMgdGltZXMsIGRlcGVuZGluZyBvbiB0aGUgY2FwYWJpbGl0aWVzIG9mIHRoZSBjb250cm9s
bGVyLCB5b3UKPiBtaWdodCBuZWVkIHRvIHNwbGl0IHRoZSBvcGVyYXRpb24gb3Igbm90LCBzbyB0
aGUgY29yZSBjaGVja3Mgd2hhdCBhcmUKPiB0aGUgY29udHJvbGxlciBjYXBhYmlsaXRpZXMgYmVm
b3JlIGRvaW5nIHRoZSBvcGVyYXRpb24uIFNvIHllcywgdGhlCj4gY2hlY2tfb3AoKSB0aGluZyBp
cyBuZWNlc3NhcnkuCgpvaywgaSBnZXQgaXQuIHRoYW5rcwoKQEFyc2VuaXkgSSBoYXZlIG5vIG90
aGVyIHF1ZXN0aW9ucyBhYm91dCB0aGlzIHBhdGNoLgo+IAo+Pgo+PiBAQXJzZW5peSBpZiBpdCBk
b2VzIG5lZWQsIEkgdGhpbmsgdGhlIHNhbWUgY29uc3RyYWludCBpcyBuZWVkZWQgYnkKPj4gIm1l
c29uX25mY19jbWRfYWNjZXNzKCkiCj4+Cj4+Pgo+Pj4+IGl0J3Mgbm90IHVzZWZ1bC4gSWYgdXNl
ZCBvdXRzaWRlLCB0aGVuIGlmIHlvdSB3YW50IHRvIGNsYXJpZnkKPj4+PiB0aGluZ3MgeW91IG1h
eSB3YW50IHRvIHVzZToKPj4+Pgo+Pj4+ICNkZWZpbmUgTkZDX0NNRF9PUF9MRU4oY21kKSBGSUVM
RF9QUkVQKEdFTk1BU0soMTMsIDApLCAoY21kKSkKPj4+Pgo+Pj4+IFRoaXMgaXMgYnkgZmFyIG15
IGZhdm9yaXRlIGNvbnN0cnVjdGlvbi4gQ291bGQgYXBwbHkgdG8gbWFueSBvdGhlcgo+Pj4+IGZp
ZWxkcywgbGlrZSBETUFfRElSLCBzY3JhbWJsZXIsIGV0Yy4KPj4KPj4gQE1pcXVlbCwgRklFTERf
UFJFUCgpIGlzIGJldHRlciwgYnV0IGkgaGF2ZSBubyBpZGVhIHdoZXRoZXIgd2Ugc2hvdWxkIGFk
ZCBGSUVMRF9QUkVQKCkgaW4gdGhpcyBwYXRjaCwgb3Iga2VlcCB0aGUgcHJldmlvdXMgY29kZS4K
Pj4KPj4+Pgo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Pj4+Pj4+PiAgICAgICAg
IH0KPj4+Pj4+Pj4gQEAgLTU3Myw3ICs1NzUsNyBAQCBzdGF0aWMgaW50IG1lc29uX25mY19yZWFk
X2J1ZihzdHJ1Y3QgbmFuZF9jaGlwID4+Pj4+PiAqbmFuZCwgdTggKmJ1ZiwgaW50IGxlbikKPj4+
Pj4+Pj4gICAgICAgICBpZiAocmV0KQo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgZ290byBvdXQ7
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC0gICAgY21kID0gTkZDX0NNRF9OMk0gfCAobGVuICYgR0VOTUFT
SygxMywgMCkpOwo+Pj4+Pj4+PiArICAgIGNtZCA9IE5GQ19DTURfTjJNIHwgbGVuOwo+Pj4+Pj4+
PiAgICAgICAgIHdyaXRlbChjbWQsIG5mYy0+cmVnX2Jhc2UgKyBORkNfUkVHX0NNRCk7Cj4+Pj4+
Pj4+Cj4+Pj4+Pj4+ICAgICAgICAgbWVzb25fbmZjX2RyYWluX2NtZChuZmMpOwo+Pj4+Pj4+PiBA
QCAtNTk3LDcgKzU5OSw3IEBAIHN0YXRpYyBpbnQgbWVzb25fbmZjX3dyaXRlX2J1ZihzdHJ1Y3Qg
Pj4+Pj4+IG5hbmRfY2hpcCAqbmFuZCwgdTggKmJ1ZiwgaW50IGxlbikKPj4+Pj4+Pj4gICAgICAg
ICBpZiAocmV0KQo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPj4+Pj4+Pj4K
Pj4+Pj4+Pj4gLSAgICBjbWQgPSBORkNfQ01EX00yTiB8IChsZW4gJiBHRU5NQVNLKDEzLCAwKSk7
Cj4+Pj4+Pj4+ICsgICAgY21kID0gTkZDX0NNRF9NMk4gfCBsZW47Cj4+Pj4+Pj4+ICAgICAgICAg
d3JpdGVsKGNtZCwgbmZjLT5yZWdfYmFzZSArIE5GQ19SRUdfQ01EKTsKPj4+Pj4+Pj4KPj4+Pj4+
Pj4gICAgICAgICBtZXNvbl9uZmNfZHJhaW5fY21kKG5mYyk7Cj4+Pj4+Pj4+IEBAIC0xMDA3LDYg
KzEwMDksMzEgQEAgbWVzb25fbmFuZF9vcF9wdXRfZG1hX3NhZmVfb3V0cHV0X2J1Zihjb25zdCA+
Pj4+Pj4gc3RydWN0IG5hbmRfb3BfaW5zdHIgKmluc3RyLAo+Pj4+Pj4+PiAgICAgICAgICAgICAg
ICAga2ZyZWUoYnVmKTsKPj4+Pj4+Pj4gICAgIH0KPj4+Pj4+Pj4KPj4+Pj4+Pj4gK3N0YXRpYyBp
bnQgbWVzb25fbmZjX2NoZWNrX29wKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCj4+Pj4+Pj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX29wZXJhdGlvbiAqb3Ap
Cj4+Pj4+Pj4+ICt7Cj4+Pj4+Pj4+ICsgICAgaW50IG9wX2lkOwo+Pj4+Pj4+PiArCj4+Pj4+Pj4+
ICsgICAgZm9yIChvcF9pZCA9IDA7IG9wX2lkIDwgb3AtPm5pbnN0cnM7IG9wX2lkKyspIHsKPj4+
Pj4+Pj4gKyAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBuYW5kX29wX2luc3RyICppbnN0cjsKPj4+
Pj4+Pj4gKwo+Pj4+Pj4+PiArICAgICAgICAgICAgaW5zdHIgPSAmb3AtPmluc3Ryc1tvcF9pZF07
Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gKyAgICAgICAgICAgIHN3aXRjaCAoaW5zdHItPnR5cGUpIHsK
Pj4+Pj4+Pj4gKyAgICAgICAgICAgIGNhc2UgTkFORF9PUF9EQVRBX0lOX0lOU1RSOgo+Pj4+Pj4+
PiArICAgICAgICAgICAgY2FzZSBOQU5EX09QX0RBVEFfT1VUX0lOU1RSOgo+Pj4+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICBpZiAoaW5zdHItPmN0eC5kYXRhLmxlbiA+IE5GQ19DTURfUkFXX0xF
TikKPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT1RTVVBQ
Owo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+Pj4+Pj4+
PiArICAgICAgICAgICAgZGVmYXVsdDoKPj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgYnJl
YWs7Cj4+Pj4+Pj4+ICsgICAgICAgICAgICB9Cj4+Pj4+Pj4+ICsgICAgfQo+Pj4+Pj4+PiArCj4+
Pj4+Pj4+ICsgICAgcmV0dXJuIDA7Cj4+Pj4+Pj4+ICt9Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gICAg
IHN0YXRpYyBpbnQgbWVzb25fbmZjX2V4ZWNfb3Aoc3RydWN0IG5hbmRfY2hpcCAqbmFuZCwKPj4+
Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgbmFuZF9vcGVy
YXRpb24gKm9wLCBib29sID4+Pj4+PiBjaGVja19vbmx5KQo+Pj4+Pj4+PiAgICAgewo+Pj4+Pj4+
PiBAQCAtMTAxNSwxMCArMTA0MiwxMiBAQCBzdGF0aWMgaW50IG1lc29uX25mY19leGVjX29wKHN0
cnVjdCA+Pj4+Pj4gbmFuZF9jaGlwICpuYW5kLAo+Pj4+Pj4+PiAgICAgICAgIGNvbnN0IHN0cnVj
dCBuYW5kX29wX2luc3RyICppbnN0ciA9IE5VTEw7Cj4+Pj4+Pj4+ICAgICAgICAgdm9pZCAqYnVm
Owo+Pj4+Pj4+PiAgICAgICAgIHUzMiBvcF9pZCwgZGVsYXlfaWRsZSwgY21kOwo+Pj4+Pj4+PiAr
ICAgIGludCBlcnI7Cj4+Pj4+Pj4+ICAgICAgICAgaW50IGk7Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IC0g
ICAgaWYgKGNoZWNrX29ubHkpCj4+Pj4+Pj4+IC0gICAgICAgICAgICByZXR1cm4gMDsKPj4+Pj4+
Pj4gKyAgICBlcnIgPSBtZXNvbl9uZmNfY2hlY2tfb3AobmFuZCwgb3ApOwo+Pj4+Pj4+PiArICAg
IGlmIChlcnIgfHwgY2hlY2tfb25seSkKPj4+Pj4+Pj4gKyAgICAgICAgICAgIHJldHVybiBlcnI7
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICAgICAgICAgbWVzb25fbmZjX3NlbGVjdF9jaGlwKG5hbmQsIG9w
LT5jcyk7Cj4+Pj4+Pj4+ICAgICAgICAgZm9yIChvcF9pZCA9IDA7IG9wX2lkIDwgb3AtPm5pbnN0
cnM7IG9wX2lkKyspIHsKPj4+Pj4+Pj4gQEAgLTEyOTMsNiArMTMyMiw3IEBAIHN0YXRpYyBpbnQg
bWVzb25fbmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgPj4+Pj4+IG5hbmRfY2hpcCAqbmFuZCkKPj4+
Pj4+Pj4gICAgICAgICBzdHJ1Y3QgbWVzb25fbmZjX25hbmRfY2hpcCAqbWVzb25fY2hpcCA9IHRv
X21lc29uX25hbmQobmFuZCk7Cj4+Pj4+Pj4+ICAgICAgICAgc3RydWN0IG10ZF9pbmZvICptdGQg
PSBuYW5kX3RvX210ZChuYW5kKTsKPj4+Pj4+Pj4gICAgICAgICBpbnQgbnNlY3RvcnMgPSBtdGQt
PndyaXRlc2l6ZSAvIDEwMjQ7Cj4+Pj4+Pj4+ICsgICAgaW50IHJhd193cml0ZXNpemU7Cj4+Pj4+
Pj4+ICAgICAgICAgaW50IHJldDsKPj4+Pj4+Pj4KPj4+Pj4+Pj4gICAgICAgICBpZiAoIW10ZC0+
bmFtZSkgewo+Pj4+Pj4+PiBAQCAtMTMwNCw2ICsxMzM0LDEzIEBAIHN0YXRpYyBpbnQgbWVzb25f
bmFuZF9hdHRhY2hfY2hpcChzdHJ1Y3QgPj4+Pj4+IG5hbmRfY2hpcCAqbmFuZCkKPj4+Pj4+Pj4g
ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4+Pj4+Pj4+ICAgICAgICAg
fQo+Pj4+Pj4+Pgo+Pj4+Pj4+PiArICAgIHJhd193cml0ZXNpemUgPSBtdGQtPndyaXRlc2l6ZSAr
IG10ZC0+b29ic2l6ZTsKPj4+Pj4+Pj4gKyAgICBpZiAocmF3X3dyaXRlc2l6ZSA+IE5GQ19DTURf
UkFXX0xFTikgewo+Pj4+Pj4+PiArICAgICAgICAgICAgZGV2X2VycihuZmMtPmRldiwgInRvbyBi
aWcgd3JpdGUgc2l6ZSBpbiByYXcgbW9kZTogJWQgPj4+Pj4+ID4gJWxkXG4iLAo+Pj4+Pj4+PiAr
ICAgICAgICAgICAgICAgICAgICByYXdfd3JpdGVzaXplLCBORkNfQ01EX1JBV19MRU4pOwo+Pj4+
Pj4+PiArICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+Pj4+ICsgICAgfQo+Pj4+Pj4+
PiArCj4+Pj4+Pj4+ICAgICAgICAgaWYgKG5hbmQtPmJidF9vcHRpb25zICYgTkFORF9CQlRfVVNF
X0ZMQVNIKQo+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgbmFuZC0+YmJ0X29wdGlvbnMgfD0gTkFO
RF9CQlRfTk9fT09COwo+Pj4+Pj4+Pgo+Pj4+Cj4+Pj4KPj4+PiBUaGFua3MsCj4+Pj4gTWlxdcOo
bAo+IAo+IAo+IFRoYW5rcywKPiBNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
