Return-Path: <SRS0=z1Oh=HZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644D6C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:37:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE85364E3F
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Feb 2021 16:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE85364E3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=windriver.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RZfq4Lw6xMbE5KVFbILrCF0ta/bilHntA5eyp8h/N0o=; b=NkIypaYYjJ4qQz2ULeub2Pyey
	MIcFE3tusOglGd/I+lwSpcpKUIn7Dq30NAtClFCYpkFa2UGX0DCGwrhjMxlhMXdYHF8lRSBdDNvFG
	UdPFTx/ILJ+UUM/1vurHDzaQt3DFDA1g3gqMk+cjcKnVBFRDbwurRpYIof2Od5wiEKaH1l/pV3VaJ
	z/Xfacn37lL7Q150udUWy8FGDMfFxB1r5yUJVnotzauceaFx26pAyYivF6o97e/civ8eX/vFcBGbX
	oB9m8K3aLfZu2VtYyFEnpdTw1sVRcc6EP+KK7fQUg8fzmbbNeAvldG+cwh+3rlZ+dQcBY4tmKpio7
	JIZLoa7WQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEafg-0002vT-00; Tue, 23 Feb 2021 16:36:24 +0000
Received: from mail-mw2nam12on2085.outbound.protection.outlook.com
 ([40.107.244.85] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEafc-0002uK-JN
 for linux-mtd@lists.infradead.org; Tue, 23 Feb 2021 16:36:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzr8yqppy2I8ZSCBNcXfXlAwT5SlmWMOu3vDRPGUxWxrlVGoZUfdkRtLwqEhSRR2rw/vkbCVVXaONkFicdCSILnJ8wO07gCuJT2PN7JSsFzIZi1+RA8QcHMn6hFU+SM5PUuP/fP2shkyivD7hwiZVpH9ELJLGrS3m2q43cPomHBlU/V/CCCgvEv/GvwVfJH47+aOimh8IgNrOgXd/KiUCCmZ/RMQc6LmiZh97TeAX3CHl/8OJkcD4abuf8vCcjcR/7Fv4pLGswqsFYdk28VPhdDL8TP4QpYXEFMJu4hLJWYrZIhUWt1mcNA9cnYytMQyXxPIEFzLOFp2xQCuz6FFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGwxB0hY18Zs4loivU1cSxbkG3tDf0a5SOtWpjCGeyo=;
 b=lUS1JxTTsThzLhlIgVj0h350qpvgCiceanTu6kWd0cf9RYlghprQvJKyyvFW+HLUgVjBJtM+OUTxEH47aW/O/tnyrC1YYwTicFzoyhSgPlphu8yYBueONgREbjFlKaHYymQjauGS2pouUvgPWzQkdDl7FnvGDbJ6Dto1PAION5zeS1HfFuoqiZ5he8ARRqo+7qHVTsyy+VWvX3xTv2DXqaqcYIsgpJ7nQoM5d+WWnVy6wK+jq1UCSZcWoxZJopLu194+n7kaCSRBJ3Z0quJMz57SGnOFDhb3yQVtqxizZxCxeXzYqJRkOJkspeSTVeDLho9BXf2VsXWT+F88RyzfCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGwxB0hY18Zs4loivU1cSxbkG3tDf0a5SOtWpjCGeyo=;
 b=Sr64auIWG85oAMSIqBpXF+ufZHV4W/vIaZPEgEBhPRtHemEQdkU5OkKQGDFzMQWDWro8EvOEqF0b/YsvOza3VvqpNjVuTnJHqxnB4MXGYQT15nCEgTqu9I3EUQAYZFfQ7sxLThh1AZxMtil7EUPN+m9pFKANRoPXtjtupoaOF/A=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16)
 by MN2PR11MB4462.namprd11.prod.outlook.com (2603:10b6:208:18f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Tue, 23 Feb
 2021 16:36:15 +0000
Received: from MN2PR11MB4758.namprd11.prod.outlook.com
 ([fe80::a95f:98e0:7502:a999]) by MN2PR11MB4758.namprd11.prod.outlook.com
 ([fe80::a95f:98e0:7502:a999%3]) with mapi id 15.20.3868.033; Tue, 23 Feb 2021
 16:36:14 +0000
Subject: Re: [PATCH] mtd: spi-nor: Use CLSR command for FL-L chips
To: Tudor.Ambarus@microchip.com, vigneshr@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at
References: <20201116153956.588098-1-yaliang.wang@windriver.com>
 <f2fe7e4e-a651-491c-f894-8cc264c64744@microchip.com>
 <d2a66253-e755-280f-8f79-d141b3169c56@ti.com>
 <2c578dcb-b9da-a56a-593c-b654cef6e67a@windriver.com>
 <6f868908-ee07-690b-98ea-47d81acf009d@microchip.com>
From: "Yaliang.Wang" <Yaliang.Wang@windriver.com>
Message-ID: <d80d6cd2-87c3-c336-7add-b91ff4e0b177@windriver.com>
Date: Wed, 24 Feb 2021 00:36:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <6f868908-ee07-690b-98ea-47d81acf009d@microchip.com>
Content-Language: en-US
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0144.apcprd02.prod.outlook.com
 (2603:1096:202:16::28) To MN2PR11MB4758.namprd11.prod.outlook.com
 (2603:10b6:208:260::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.176.190] (60.247.85.82) by
 HK2PR02CA0144.apcprd02.prod.outlook.com (2603:1096:202:16::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.28 via Frontend Transport; Tue, 23 Feb 2021 16:36:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbc57200-a6cb-41e2-b347-08d8d81922b8
X-MS-TrafficTypeDiagnostic: MN2PR11MB4462:
X-Microsoft-Antispam-PRVS: <MN2PR11MB44629A9FFB93424DC4D5E9DA9F809@MN2PR11MB4462.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aQwzAin9HwnKhkkg1lnSwEaJCLf4SIKmVLNfYrgIHPhN44RaxOsBbQP3eFKsp7rYKOMgnOwgbLB2xyQxtXDicEi6F49EqUpr9RBg2RcWpyrV9Q7FtAMgj9OQs2Y/FTZi+7ggayVEsXuaopL3m9WESM2XHQEOoaioR98SKnGfRQ4XGch18F/B6zAGnhwJ461zTWzJDj8KV9qaPZs3AORqIIPz4zFc5dER1zgdQiLzAce95Wz54RgaLRnVgHJnmBB7XiexMfRA9iDA/uQ9nHxnjjWuk+JHndYMLAd0YIWyI5rSlDGoWG0gESLmoArHxrWkeLkHWKkAIlnzVD1pLd5DD57MUqXqdGgqwhol36Vx4yecRgzItytsaXX6jHGHCCZ6KV/Cf90xxnADG0uOfdhoeuPzXaU+QO8eHeKaUYzZROt2g+RWGpCvoWVu/Rn47Wvz/iRBMoWoCA0INTuHzSRpzQEfZHSnHSuc5cnUIqbTwcIA/Xmb4DoDJkryPGZHRjwO/GcoS+FluRWybOpKXc29DMRGqBPTVWmgqlFZv3IyIFLVe75TzYRtVxyBHzJ1Ab8ivSe0XIgSbEsPKdJOgj2T9rqf1EbkEEpDGMPsLta3S/Lezj+oCxakYZu75gAdZXLcGAVUL3mqGr5o/mmjP8KQ1fXuAZRjumK69EUkkmQJgTAwG6kmQa2Prh6192xNYYS3N01ezEK4lB6XQPMqcUyhHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4758.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39850400004)(396003)(366004)(346002)(376002)(956004)(2906002)(8936002)(6486002)(86362001)(53546011)(966005)(5660300002)(31686004)(8676002)(36756003)(66556008)(316002)(66476007)(66946007)(83380400001)(186003)(6706004)(16576012)(478600001)(4326008)(31696002)(2616005)(52116002)(26005)(16526019)(6666004)(78286007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QTFzNUVsNFVzMWtFVmtHcWhEbUlVZEozZE4yQVp1WmgvUUUyaE1pT3l4Qmhw?=
 =?utf-8?B?Y2FLVzJ4Z2pSamluNE1RZFhEM1NKTGlkc0YrMWxRNjM1Zlo0U3VMNnhNODlQ?=
 =?utf-8?B?eDBuVFpZbFZZK3NlYnp0ZkptMERqcDZkTzFuZ3hGd2YzQzRyc3g2djJwRGNq?=
 =?utf-8?B?VW11VFV1VTJqVkpIQVBMMDc4MytlMk5HZXNXb3FWekFRdU1TZlpOTUhCZjM2?=
 =?utf-8?B?MUc5Mm1wN01iRmtwM21raXFTdjdXSTR0dHRHVFlHQkd1UnFiS0RaaUR4RnBy?=
 =?utf-8?B?dmhadktmM1M4aXAvVmJCSFV5NDRTVjdWc2w5OXd3eGdaU24vRTFrKzdNVHYy?=
 =?utf-8?B?VC9oY0dDMFVZdUR2RzRmRC9ibXdSR2hNNmg4NGJGLzd2RThPNHo5UDdxemNx?=
 =?utf-8?B?UEdXc3RXank5OWxmZFJPR2Y0VXQvc2g3K2I2aU5NZUhNWDcxUWxqTlVST0ZQ?=
 =?utf-8?B?QVVFb1RLSEw1N3NCR2V5UGgzaWpQVFBzR1dwZCszVHdXeHljbldmSndzNzZN?=
 =?utf-8?B?YVA4cXNOVkRlYTMrc2JsOFhkaE0xY1dWRjFSSzlZblBsNEpUeWNJcU1zVVlP?=
 =?utf-8?B?T25DWDZhMTFWN1YrVjQvbkZGR2Z1ZFNQcW53cFFTSzV0bWpUa2gwcDJRa2pY?=
 =?utf-8?B?NzVEaTVscU1wTW4yTXdnTWE3czM3cDIweVZrVzNqMGZDVVRXcjFzQTFpUEt2?=
 =?utf-8?B?QnduTmxiRXc0Rm9QRnpyaHZDcTlyNG5LTXYydVhjNmdWYmI4bTdkbU1YMjlJ?=
 =?utf-8?B?Y0t1OWFjb1lSdlFjQzBQRVhwZnN4VjQzT2J1VnRKUmxva2RYc1RCWlBSZE4r?=
 =?utf-8?B?U3lHM1VPUmRmeFZQMnEvK20rd0MzNStZUmd4MU1CdEc5dVNXTS9UbjVnd1Vy?=
 =?utf-8?B?UUJ5Sm43MklHNlJITEI0amEwTUNwZDdoQ2FjU21FK1RBMXFWMmFKMkEveFNO?=
 =?utf-8?B?TXhwVjZiellnQzAzNHJUbVNpMkFETDUyN01nSDFZWXg5VGpySXBoMkRxYk1O?=
 =?utf-8?B?SzNRYW5tR1NoMXRTeVdJWFRJNExtTjRYUFUzOHhUSVVvYVY4bllQV3YzRnd1?=
 =?utf-8?B?ZGxML2thRDk0Tm9GcTllYmtnZ1VEekRVNkYxaFlGcC9PMlBiMTZndWFlWUhU?=
 =?utf-8?B?NEFxa3czWXhTam9qNTBaY21nMlRPNDd2QlRCQnVFQ1ZIN2hXYU14RDEzV0N4?=
 =?utf-8?B?MHl2V1hMbmRBMzdCQ1FlM0szSXpIc29jMjRIN2k5ZC9zbTByTGZkdGI5RGFP?=
 =?utf-8?B?d0I3QWlkU0Z1cHJNMVNYTFdkUGU2cDNxeXdya1UyV01kQkZiOWtsWTZUNjFq?=
 =?utf-8?B?R0N6bnBJL1YrdnY1WFZ5am5Fd1BxZTg1ZEhFeGlYNHdVVytTQlhMTHJMcFN4?=
 =?utf-8?B?Y2NMRkc4K21QY1prckVMV3NsUXM5aytvck9zVkx4L2Jza0dPb3FBaEhPTVFZ?=
 =?utf-8?B?N0UzaGx4eG9pK0ZnNnNTUVQyRDdpaGU0Ty9FNGpyRlkzYlppOERqOFVPMU1N?=
 =?utf-8?B?QmN2YUFlVE02U1FUZFV6NDV3TTMvMTd2WGF2VmJEVXJ5K2VseVZ3eWxPRW1i?=
 =?utf-8?B?SjQxb3NjWm96eWNYTjh1eWtTR0g5NGhDY1J0SkE5a1NQaHhBNTl2L2tiQ2pk?=
 =?utf-8?B?MlgySzc2YVVxU1BGVlh5VnFWNm43UVA3S3dlL1J2ejlHYlBqVmRxN0pTcXdu?=
 =?utf-8?B?dVI1YkZ0Vk1RL1dXcVVYU2o3TTZaZ3FUa2R3L2pUTVJHc2JUUmY3cHhDT1JX?=
 =?utf-8?Q?yxObkNZIkj3JvHlwTXM6I1RQr3Rn1LtTvxSVmjs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc57200-a6cb-41e2-b347-08d8d81922b8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4758.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 16:36:14.5936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NzZQXxstZBMjdEE4M0RKypdPEfZbnnXczFyLsc7en7HPQwvEraYwJnkyNH96liCS0X3j92sPU0diO/5E/bCPeuQCORI7g0ZSjXRV3Sj68Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4462
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_113620_830672_DD01F17D 
X-CRM114-Status: GOOD (  25.12  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksIFR1ZG9yCgpTbyBzb3JyeSB0byByZXBseSBzbyBsYXRlLCBub3cgSSdtIGNvbW1pdHRlZCB0
byBzb2x2aW5nIHRoaXMgcHJvYmxlbS4KQWZ0ZXIgY2hlY2tpbmcgb3ZlciBzaXh0eSBkYXRhc2hl
ZXRzIGFuZCBhbG1vc3QgYXQgbGVhc3Qgb25lIGRhdGFzaGVldCAKZm9yIGVhY2ggZmFtaWx5IG9m
IHRoZSBtYW51ZmFjdHVyZXJzLCBJIGNhbiBmaW5hbGx5IGRldmlsZXIgc29tZSAKY29uY2x1c2lv
bnMuCgoxLiBSRFNSMigwN0gpIGluc3RydWN0aW9uIGlzIGp1c3QgdXNlZCBieSBTcGFuc2lvbiBt
YW51ZmFjdHVyZXIuCkFzIGZvciBhbGwgb3RoZXIgbWFudWZhY3R1cmVycywgbW9zdCBjb21tb24g
aW5zdHJ1Y3Rpb25zIGZvciByZWFkaW5nIFNSMiAKaXMgIjM1SCIswqAgYW5kICIxNUgiIGlzIGZv
ciByZWFkaW5nIFNSMy4gU29tZSBtYW51ZmFjdHVyZXMgaGF2ZSBzcGVjaWZpYyAKcmVnaXN0ZXJz
IHRoYXQgYXJlIHNpbWlsYXIgdG8gc3RhdHVzIHJlZ2lzdGVyLCBzdWNoIGFzICJJbmZvcm1hdGlv
biAKUmVnaXN0ZXIiLCAiU3VzcGVuZCBTdGF0dXMgUmVnaXN0ZXIiLCAiRXh0ZW5kZWQgUmVhZCBS
ZWdpc3RlciIsIAoiU2VjdXJpdHkgUmVnaXN0ZXIiLCAiRmxhZyBTdGF0dXMgUmVnaXN0ZXIiIGFu
ZCBhbHNvIGhhdmUgc3BlY2lmaWMgCmluc3RydWN0aW9ucyBmb3IgcmVhZGluZyB0aGVtLCBzdWNo
IGFzIjJCSC8wOUgvODFILzJCSC83MEgiLgoKMi4gUkRTUjIoMDdIKSBpbnN0cnVjdGlvbiBpcyBu
b3QganVzdCBleGlzdGVkIGluIFNwYW5zaW9uICJTMjVGTC1MIiAKZmFtaWx5LCBhbHNvIGV4aXN0
ZWQgaW4gU3BhbnNpb24iUzc5RkwtUywgUzcwRlMtUywgUzI1RkwtUywgUzI1RlMtUywgCkNZUlMs
IENZMTVCL1YtU04iIGZhbWlsaWVzLiBXZSBqdXN0IGhhdmVuJ3QgdXNlIGl0IGJlZm9yZSwgaXQg
aGFzIGJlZW4gCnRoZXJlIGZvciBhIGxvbmcgdGltZS4KCjMuIE1hbnkgbWFudWZhY3R1cmVycyBh
cmUgdXNpbmcgQ0xTUigzMEgpIGluc3RydWN0aW9uLCBidXQgdGhlIGZ1bmN0aW9ucyAKYXJlIGRp
ZmZlcmVudC4KVGhlIG1vc3QgY29tbW9uIGZ1bmN0aW9uIG9mICIzMEgiIGluc3RydWN0aW9uIGlz
wqAgdG8gcmVzdW1lIHRoZSAKc3VzcGVuZGVkIGJpdHMsIGJ1dCBpbiBtYW55IFNwYW5zaW9uJ3Mg
cHJvZHVjdHMgLCB0aGUgZnVuY3Rpb24gaXMgdG8gCmNsZWFyIFBfRVJSIGFuZCBFX0VSUiBiaXRz
LiBJbiBzb21lIG90aGVyIFNwYW5zaW9uJ3MgcHJvZHVjdHMoc3VjaCBhcyAKUzI1RlMtUyksIFNw
YW5zaW9uIHByb3ZpZGVkIGEgY29uZmlndXJlIHJlZ2lzdGVyLCB3aGljaCBjYW4gbWFrZSAiMzBI
IiAKaW5zdHJ1Y3Rpb24gZXhlY3V0ZSB0aGUgYWx0ZXJuYXRpdmUgcmVzdW1pbmcgc3VzcGVuZGVk
IGJpdHMgZnVuY3Rpb24gCmxpa2Ugb3RoZXIgbWFudWZhY3R1cmVycy4KCjQuIFBfRVJSIGFuZCBF
X0VSUiBiaXRzIGFyZSBleGlzdGVkIGluIG1hbnkgbWFudWZhY3R1cmVycywgcmVzaWRlIGluIApz
cGVjaWZpYyByZWdpc3Rlciwgc3VjaCBhcyAiSW5mb3JtYXRpb24gUmVnaXN0ZXIiIkZsYWcgU3Rh
dHVzIFJlZ2lzdGVyIiAKYW5kIHNvIG9uLCBhbmQgdGhlIGluc3RydWN0aW9ucyBmb3IgcmVhZGlu
ZyB0aG9zZSByZWdpc3RlciBhbmQgY2xlYXJpbmcgCnRoZSBFUlIgYml0cyB2YXJpZXMgYWNjb3Jk
aW5nIHRvIHRoZSBkaWZmZXJlbnQgbWFudWZhY3R1cmVyLgoKQmFzZWQgb24gdGhlIGZhY3RzIGFi
b3ZlLCBhbmQgdG8gcmVzb2x2ZSB0aGUgb3JpZ2luYWwgInNyX3JlYWR5IiBwcm9ibGVtIAp3aXRo
aW4gIlMyNUZMLUwiIGZhbWlseSBvZiBTcGFuc2lvbiwgSSB0aGluayB0aGUgc29sdXRpb24gaXMg
bm90IG11Y2ggCmRpZmZlcmVudC4gV2UgbmVlZCBhICJzcl9yZWFkeSIgZnVuY3Rpb24gcG9pbnRl
ciBhbmQgbWF5YmUgYSBuZXcgZmxhZyB0byAKbWFyayB0aGUgdHdpc3RlZCBzdGF0dXPCoCByZWdp
c3Rlci7CoCBBY3R1YWxseSBJIGhhdmUgbWFkZSBhIHJvdWdoIGZpeCAKYmFzZWQgb24gdGhhdChu
b3QgaW5jbHVkZSBmaXhpbmcgc3BpX25vcl94cmVhZF9zciBhbmQgCnNwaV9ub3JfZnNyX3JlYWR5
KS4gV291bGQgbGlrZSB0byBsZWFybiB5b3VyIHN1Z2dlc3Rpb25zIGJlZm9yZSBnb2luZyAKZnVy
dGhlci4KClRoZSBjaGVja2VkIGRhdGFzaGVldHMgYW5kIHJlbGF0ZWQgbWFya3MgYXJlIHRvbyBt
YW55LCBpdCBtYXkgbm90IGJlIAphcHByb3ByaWF0ZSB0byBwb3N0IHRoZW0gaGVyZSwgYnV0IEkn
ZCBsaWtlIHRvIHNoYXJlLCBvbmNlIG5lZWRlZC4KCkJlc3QgUmVnYXJkcywKWWFsaWFuZwoKT24g
MS8yNi8yMSA0OjUxIFBNLCBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4gSGks
IFlhbGlhbmcsCj4KPiBPbiAxLzI2LzIxIDQ6MDYgQU0sIFdhbmcsIFlhbGlhbmcgd3JvdGU6Cj4+
IG9yIHh4aChFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNo
bWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPj4KPj4gSGksIFZpZ25l
c2ggYW5kIFR1ZG9yCj4+Cj4+IEl0J3MgcmVhbGx5IGluc3BpcmluZyByZWNlaXZpbmcgZnJvbSB5
b3UsIGFuZAo+Pgo+PiBPbiAxLzI0LzIwMjEgMjoxMiBQTSwgVmlnbmVzaCBSYWdoYXZlbmRyYSB3
cm90ZToKPj4+ICDCoCBIaSwgWWFsaWFuZwo+Pj4KPj4+IE9uIDEvMjMvMjEgMTE6MTUgUE0sIFR1
ZG9yLkFtYmFydXNAbWljcm9jaGlwLmNvbSB3cm90ZToKPj4+PiBIaSwgWWFsaWFuZywKPj4+Pgo+
Pj4gWy4uLl0KPj4+Pj4gK3N0YXRpYyBpbnQgc3BpX25vcl9zMjVmbF9sX3NyX3JlYWR5KHN0cnVj
dCBzcGlfbm9yICpub3IpCj4+Pj4+ICt7Cj4+Pj4+ICvCoMKgIHU4ICpzciA9IG5vci0+Ym91bmNl
YnVmOwo+Pj4+PiArwqDCoCBpbnQgcmV0Owo+Pj4+PiArCj4+Pj4+ICvCoMKgIHJldCA9IHNwaV9u
b3JfcmVhZF9zcihub3IsIHNyKTsKPj4+Pj4gK8KgwqAgaWYgKHJldCkKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqAgLyoqCj4+Pj4+ICvC
oMKgwqAgKiBQX0VSUiBhbmQgRV9FUlIgYml0cyBhcmUgbG9jYXRlZCBpbiB0aGUgU3RhdHVzIFJl
Z2lzdGVyIDIKPj4+Pj4gK8KgwqDCoCAqIG9mIEN5cHJlc3MgRkwtTCBzZXJpZXMgY2hpcHMuCj4+
Pj4+ICvCoMKgwqAgKi8KPj4+Pj4gK8KgwqAgcmV0ID0gc3BpX25vcl9zMjVmbF9sX3JlYWRfc3Iy
KG5vciwgJnNyWzFdKTsKPj4+Pj4gK8KgwqAgaWYgKHJldCkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiByZXQ7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqAgaWYgKG5vci0+ZmxhZ3MgJiBT
Tk9SX0ZfVVNFX0NMU1IgJiYgc3JbMV0gJiAoU1JfRV9FUlIgfCBTUl9QX0VSUikpIHsKPj4+PiBJ
ZiBjaGVja2luZyBvdGhlciBtYW51ZmFjdHVyZXIgZGF0YXNoZWV0cywgd291bGQgeW91IHBsZWFz
ZSBjaGVjayBpZgo+Pj4+IENMU1IgaXMgdXNlZCBieSBhbnkgb3RoZXIgbWFudWZhY3R1cmVyPwo+
Pj4+Cj4+PiBUaGlzIGlzIGxpbWl0ZWQgdG8gY2VydGFpbiBzdWJzZXRzIG9mIEN5cHJlc3MvU3Bh
bnNpb24gZmxhc2hlcy4KPj4+Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoc3JbMV0g
JiBTUl9FX0VSUikKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBk
ZXZfZXJyKG5vci0+ZGV2LCAiRXJhc2UgRXJyb3Igb2NjdXJyZWRcbiIpOwo+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZWxzZQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGRldl9lcnIobm9yLT5kZXYsICJQcm9ncmFtbWluZyBFcnJvciBvY2N1cnJlZFxuIik7
Cj4+Pj4+ICsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIHNwaV9ub3JfY2xlYXJfc3Iobm9y
KTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKiBXRUwgYml0IHJlbWFpbnMgc2V0IHRvIG9uZSB3aGVuIGFuIGVyYXNl
IG9yIHBhZ2UgcHJvZ3JhbQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGVycm9yIG9j
Y3Vycy4gSXNzdWUgYSBXcml0ZSBEaXNhYmxlIGNvbW1hbmQgdG8gcHJvdGVjdAo+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIGFnYWluc3QgaW5hZHZlcnRlbnQgd3JpdGVzIHRoYXQgY2Fu
IHBvc3NpYmx5IGNvcnJ1cHQgdGhlCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogY29u
dGVudHMgb2YgdGhlIG1lbW9yeS4KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IHNwaV9ub3Jfd3JpdGVfZGlzYWJsZShub3Ip
Owo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+Pj4+PiArCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTzsKPj4+Pj4gK8KgwqAgfQo+Pj4+PiArCj4+Pj4+
ICvCoMKgIHJldHVybiAhKHNyWzBdICYgU1JfV0lQKTsKPj4+Pj4gK30KPj4+Pj4gKwo+Pj4+PiAg
wqAgLyoqCj4+Pj4+ICDCoMKgICogc3BpX25vcl9zcl9yZWFkeSgpIC0gUXVlcnkgdGhlIFN0YXR1
cyBSZWdpc3RlciB0byBzZWUgaWYgdGhlIGZsYXNoIGlzIHJlYWR5Cj4+Pj4+ICDCoMKgICogZm9y
IG5ldyBjb21tYW5kcy4KPj4+Pj4gQEAgLTU0Niw3ICs2MjgsMTkgQEAgc3RhdGljIHZvaWQgc3Bp
X25vcl9jbGVhcl9zcihzdHJ1Y3Qgc3BpX25vciAqbm9yKQo+Pj4+PiAgwqDCoCAqLwo+Pj4+PiAg
wqAgc3RhdGljIGludCBzcGlfbm9yX3NyX3JlYWR5KHN0cnVjdCBzcGlfbm9yICpub3IpCj4+Pj4+
ICDCoCB7Cj4+Pj4+IC3CoMKgIGludCByZXQgPSBzcGlfbm9yX3JlYWRfc3Iobm9yLCBub3ItPmJv
dW5jZWJ1Zik7Cj4+Pj4+ICvCoMKgIGludCByZXQ7Cj4+Pj4+ICvCoMKgIGNvbnN0IHN0cnVjdCBm
bGFzaF9pbmZvICp0bXBpbmZvID0gbm9yLT5pbmZvID8gbm9yLT5pbmZvIDogc3BpX25vcl9yZWFk
X2lkKG5vcik7Cj4+Pj4+ICsKPj4+Pj4gK8KgwqAgaWYgKElTX0VSUl9PUl9OVUxMKHRtcGluZm8p
KQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9FTlQ7Cj4+Pj4+ICsKPj4+
Pj4gK8KgwqAgaWYgKCFzdHJjbXAodG1waW5mby0+bmFtZSwgInMyNWZsMDY0bCIpCj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfHwgIXN0cmNtcCh0bXBpbmZvLT5u
YW1lLCAiczI1ZmwxMjhsIikKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8fCAhc3RyY21wKHRtcGluZm8tPm5hbWUsICJzMjVmbDI1NmwiKSkgewo+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHNwaV9ub3JfczI1ZmxfbF9zcl9yZWFkeShub3IpOwo+
Pj4+PiArwqDCoCB9Cj4+Pj4gTm8sIHdlIGNhbid0IGFjY2VwdCBmbGFzaCBuYW1lIGNvbXBhcmlz
b25zIGluIHRoZSBTUEkgTk9SIGNvcmUuCj4+Pj4gSWYgQ0xTUiBhbmQgUkRTUjIgYXJlIGp1c3Qg
c3BhbnNpb24gc3BlY2lmaWMsIHdlIGNhbiBwcm92aWRlIGEgc3JfcmVhZHkKPj4+PiBmdW5jdGlv
biBwb2ludGVyIHRoYXQgY2FuIGJlIGZpbGxlZCBieSBzcGFuc2lvbiBmbGFzaGVzLiBPciBzb21l
IG90aGVyCj4+Pj4gbWV0aG9kIGRlcGVuZGluZyBvbiB0aGUgQ0xTUiBhbmQgUkRTUjIgZXhwb3N1
cmUgdGhyb3VnaCBvdGhlcgo+Pj4+IG1hbnVmYWN0dXJlcnMuCj4+Pj4KPj4+PiBJZGVhbGx5IG9u
ZSB3b3VsZCBza2ltIHRocm91Z2ggYXQgbGVhc3QgMiAtIDMgZGF0YXNoZWV0cyBmcm9tIGVhY2gK
Pj4+PiBtYW51ZmFjdHVyZXIgYXZhaWxhYmxlIGluIFNQSSBOT1IuIFByZWZlcmFibGUgZWFjaCBk
YXRhc2hlZXQgZnJvbQo+Pj4+IGEgZGlmZmVyZW50IG1hbnVmYWN0dXJlciBmYW1pbHkuIFVuZm9y
dHVuYXRlbHkgSSdtIG5vdCBhd2FyZSBvZiBhbnkKPj4+PiBzdGFuZGFyZCB0aGF0IGRlc2NyaWJl
cyBhbGwgdGhlIHN1cHBvcnRlZCBTUEkgTk9SIGNvbW1hbmRzLgo+Pj4+IElmIHlvdSBmaW5kIHRo
aXMgb3ZlcndoZWxtaW5nLCBJIGNhbiBzaGFyZSB0aGUgd29ya2xvYWQgd2l0aCB5b3UsCj4+Pj4g
YnV0IGF0IGJlc3QgZWZmb3J0LiBJZiB5b3UgZ28gdGhyb3VnaCB0aGlzIGJ5IHlvdXJzZWxmLCBw
bGVhc2UKPj4+PiBzYXZlIHRoZSBuYW1lIG9mIHRoZSBkYXRhc2hlZXQgZmxhc2hlcyB0aGF0IHlv
dSBnbyB0aHJvdWdoLgo+Pj4+Cj4+PiBBZ3JlZSB3aXRoIFR1ZG9yLiBUaGVyZSBpcyBxdWl0ZSBh
IGJpdCBvZiB2YXJpYXRpb24gZXZlbiB3aXRoaW4KPj4+IEN5cHJlc3MvU3BhbnNpb24gZGV2aWNl
cy4gUzI4IHNlcmllcyBvZiBmbGFzaGVzIGhhdmUgdGhlc2UgZXJyb3IgYml0cwo+Pj4gd2l0aGlu
IFNSMSByZWdpc3Rlci4gU2VlOiBodHRwczovL3d3dy5jeXByZXNzLmNvbS9maWxlLzUxMzk5Ni9k
b3dubG9hZAo+Pj4KPj4+IFNvLCB0aGlzIGNhbm5vdCBiZSBpbiBTUEkgTk9SIGNvcmUuCj4+Pgo+
Pj4gc3BpX25vcl94cmVhZF9zcigpLCBzcGlfbm9yX2Zzcl9yZWFkeSgpIGFuZCBzcGlfbm9yX2Ns
ZWFyX3NyKCkgYXJlIGFsbAo+Pj4gdmVuZG9yL2ZhbWlseSBzcGVjaWZpYyBhbmQgc2hvdWxkIGJl
IG1vdmVkIHRvIGFwcHJvcHJpYXRlIHZlbmRvcgo+Pj4gc3BlY2lmaWMgZHJpdmVycy4KPj4gSGF2
ZSB0byBhZG1pdCB0aGUgY29tcGFyaXNvbnMgYW5kIHRoZSBmdW5jdGlvbiBoZXJlIGFyZSBpbmFw
cHJvcHJpYXRlLAo+PiB0aG91Z2ggaXQncyB0aGUgZmFzdGVzdCB3YXkgdG8gZml4IHRoaXMgcHJv
YmxlbS4KPj4KPj4gSSdkIGxpa2UgdG8gbW92ZSBzcGFuc2lvbiBzcGVjaWZpYyBvcGVyYXRpb25z
IG91dCBvZiB0aGUgY29yZS5jIGZpcnN0LAo+PiBiYXNpbmcgb24gc3JfcmVhZHkgZnVuY3Rpb24g
cG9pbnRlciBvciBvdGhlciBtZWNoYW5pc21zIG1lbnRpb25lZCBieQo+PiBUdWRvciwgYW5kIGFm
dGVyIHRoYXQgSSdsbCBzZWUgaWYgSSdtIGNhcGFibGUgdG8gY29wZSB3aXRoIHRoZSBvdGhlcgo+
PiBzZXZlcmFsIHZlbmRvci9mYW1pbHkgc3BlY2lmaWMgZnVuY3Rpb25zLgo+Pgo+IFRoZSBkaWZm
aWN1bHR5IGlzIG5vdCBpbiBtb3ZpbmcgdGhlIGNvZGUgaW4gc3BhbnNpb24uYywgYnV0IHJhdGhl
cgo+IHRoZSBkb2N1bWVudGF0aW9uIGVmZm9ydCwgdG8gc2tpbSB0aHJvdWdoIGFsbCB0aGUgZGF0
YXNoZWV0cy4gU28gaWYKPiB5b3UncmUgZ29pbmcgdGhyb3VnaCBhbGwgdGhlIGRhdGFzaGVldHMg
dG8gY2hlY2sgd2hldGhlciBSRFNSMiBpcyB1c2VkCj4gYnkgb3RoZXIgdmVuZG9yIG9yIG5vdCwg
cGxlYXNlIGFsc28gY2hlY2sgdGhlIG90aGVyIG9wcyB0aGF0IG1lIGFuZAo+IFZpZ25lc2ggaW5k
aWNhdGVkLCBzbyB0aGF0IHdlIGRvbid0IGR1cGxpY2F0ZSB0aGUgZWZmb3J0Lgo+Cj4gQ2hlZXJz
LAo+IHRhCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
