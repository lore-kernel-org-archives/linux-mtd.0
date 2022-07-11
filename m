Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F106BC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jul 2022 09:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7GwPOGigUwZF61dpPcZa7/nAseED8/7vjNFbMUiwMc=; b=XnT3VW9PnLaWOm
	YLhKZOaKaglLzQ5lSxTTWjC1bflc3M53P1A6exkQkw3J3c52ZLe0COj/Me1Y6Zu3UlCRDWwree303
	YBl8sjsJ6ec4m0sjvgF0+kZy72UeS0OX/AvVqgQb62a/hMit7kVpBgXUV20+u2VGcE93axPTK8OOu
	NISduxewOEQK7cG1CYzPNNI9iifb48G2AKSnscfYhBrvzgK4EBeDhFe8LxAqIMmcdqlHacJymMOEj
	rZJhplF7vwVQPpdCqTnCioKFBUiG1eBlpHqv45Ff5tEQxK5hoSYNFvHMLq10MWPHl6SDEufkhATLg
	kwSTozfKdzoYI2+D3JXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApTz-00HXwE-J2; Mon, 11 Jul 2022 09:13:35 +0000
Received: from eu-smtp-delivery-197.mimecast.com ([185.58.85.197])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oApTv-00HXnv-92
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2022 09:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=camlingroup.com;
	s=mimecast20210310; t=1657530791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RulkO0mVldtubCvhxwBFbSRQB302WzG7TbJFwVeWKPk=;
	b=J4XdPW1dxpcKoWlN+2MLQhdt8NttO7Dn2wTkNm+fe/EoTRdofnJPlh80bBMdG//DpvwU8o
	8Fh9ZZ2K+A/Vp7CZYWF/TMwlJK0T76IiNFXxPodVDxfS7qPB75Aadbee5URvzdkNnzJsIb
	wQjzH53aEOsbUPYe2nc2YkosZGQG904=
Received: from GBR01-CWL-obe.outbound.protection.outlook.com
 (mail-cwlgbr01lp2054.outbound.protection.outlook.com [104.47.20.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 uk-mta-28-0LQW5gFiO5WTp0PjArz7RQ-1; Mon, 11 Jul 2022 10:13:09 +0100
X-MC-Unique: 0LQW5gFiO5WTp0PjArz7RQ-1
Received: from CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1ba::12)
 by LOYP123MB3295.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15; Mon, 11 Jul
 2022 09:13:07 +0000
Received: from CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f56f:d3d:9a1a:5e4]) by CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM
 ([fe80::f56f:d3d:9a1a:5e4%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 09:13:07 +0000
Message-ID: <c2d545d1f5478e66c0dac47f4bc4c04256ff44aa.camel@camlingroup.com>
Subject: Re: [PATCH] mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on
 program/erase times
From: Tomasz =?UTF-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
CC: Han Xu <han.xu@nxp.com>, kernel@pengutronix.de, stable@vger.kernel.org, 
	k.drobinski@camlintechnologies.com
Date: Mon, 11 Jul 2022 11:12:26 +0200
In-Reply-To: <20220701110341.3094023-1-s.hauer@pengutronix.de>
References: <20220701110341.3094023-1-s.hauer@pengutronix.de>
User-Agent: Evolution 3.36.5-0ubuntu1
X-ClientProxiedBy: LO4P265CA0224.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:315::8) To CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:1ba::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 106cca6b-7daa-4a7a-0c4c-08da631d915d
X-MS-TrafficTypeDiagnostic: LOYP123MB3295:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: tg+hXuPj2xMEfZ5H3H0U9gMpjyWFrC/7vKDN9yrHtvCdGWyZArqcq4PHR6xzUdUIxQ/QcXAePR3na3wSlpAGLrBNCnr+4Pb3oprEaxkQ105gSlf3LkFCLKiSk3EJ/2yzq36ZZiD1BvNQJ0g9cBncT1lZjE4ysY/ID2Bv56ESs8gNVa/74YEkM4Ox2EXQ6+NEZhpMsVUK8dXfiH21sU6EXXUB8mvmKyhlCCB0ImCTZuTTpaIdu8yytH6Ud/0VbkcvddkRlZq3GhB8OfLB68cHPmeEvGJEmSoNoZVLY4PUiTEQM1VY396Tap8ulrJh8yI1wOR7q109ANejPpsKxq5QeccT+cJMiSwQtEirQb6PtTCNNjuSdYAHkM/dfXruAiTAS1D/gqGLQstQxYqA+f8+6aytyAp6HXR8G0CIp/LydQQYWMUgzQzS+OJHOW8iCwOoeY7lXqtIm3JiQdJBCllzG8CdGvuZDuixsYG7cMklpoGWd4U70G2g7/0AU/daEfiySrsFCOF9kvUC7FM9pKUmOLfndTv4NpRUC3a1liQp/6w9khNTNWSn9XKLyynSLzq/Z9b1MNg3+iNtjzu/4eDzzrp0siDznXZszbiVdPGAviri7dUlq2jVkE3v7XMLJqCbxUWuvY3ACU5wt9R2IbzNBtC8wus1KYd4g0pPK8sCKiF8IDZPB0e9YGo+sDLA6nejiDWoBZvMHmOdH6MFu7AZLvIpGJtPjCoiHjKOF5PxQVaC8RojPex0yCL6EkGnRbvwUfXda8kmnTkNrSydIwCCtmEayToTalB8uDm5U9pqNEp2w8cC0hptshcp3OZZqsR9NrmYW4lMghsQ1+oDIAU8CQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(39850400004)(376002)(346002)(396003)(5660300002)(110136005)(8936002)(86362001)(316002)(478600001)(66476007)(66946007)(4326008)(8676002)(66556008)(6486002)(966005)(2616005)(107886003)(52116002)(26005)(6512007)(83380400001)(186003)(6666004)(41300700001)(38100700002)(38350700002)(6506007)(2906002)(36756003);DIR:OUT;SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ouup6duelShQ4Q2OlTnksfaYj9Si2zKWq4SAJDFXQDhOrTxy6hrununiX/iG?=
 =?us-ascii?Q?r3LDcV5ol9Pabn1ofEp/nYcigQPVzJPatrqXmODgWw4jsVFP1j4rV/Vt8kRE?=
 =?us-ascii?Q?mTmkxGnlt65yj+PBYXbssoSrrWvNSyIsCskRZw3+L8UD1oGKTntCcdKG16ho?=
 =?us-ascii?Q?2VbjA3jTVC3DlkxJdh3S2c2ue5/A5X9izSSD1ztYuiMOenDzUTzwDJc1o/Ca?=
 =?us-ascii?Q?pwoJZBwa0yOJCoz9Z2pZnA542XHhfV3vNXUn3Bz+6EMWcJRFqWJfryPdfTWf?=
 =?us-ascii?Q?Pzv5H8HyV6PbhMfaZkeDlrejgMzqHHFdE/4RVwL71ORVn8+uGaTNkkK6vXlP?=
 =?us-ascii?Q?LUt1VdE8NpG3uuQRND6ON0QlYFcg94Hwv2Fd+amEqjsgo0duohfJvFBCInwY?=
 =?us-ascii?Q?8Xm2YZXv1ACmhrt0tv1Kp0cJtBzJCoflFZzWNUX3vuX0WE8bXpmtJMralPyc?=
 =?us-ascii?Q?0QvFbxWf1XtWoQKUEjj+NE9zUWvGjcLVQFlP6qzaZNRwn0brq+EO7Xx2r3r4?=
 =?us-ascii?Q?nMwoKL1mbkvyH30xX5DlJBlkxG/416/6LMcaF+KqYEa0A0MuBeonflnbRnQX?=
 =?us-ascii?Q?rK/rMVPUW2sL0oHvQCiAI9r4mkM6HXu8AC+T6A6w43ZUwrwlNWPyNHosGfmk?=
 =?us-ascii?Q?5B6ai/n30Rh7bFNwanpbRutOqmT1tceOdQap2bpppTMAqXZzNcVfU5byJl+l?=
 =?us-ascii?Q?pK5rT14kvQheE2ywNwrR9p+OKOBQX7T3MqGt3XoeT2U2JG3Q96HlcfwsrO4C?=
 =?us-ascii?Q?shLuCa5uhCfY5FuzYBD1sjqXez8OA81ZL3EKSxOu9w3r74IqwXtvKYPGrb40?=
 =?us-ascii?Q?yLiZd2NbNorLy8QKR3MJawA0EfDVAwHPkcsLp2cSHsaVanf9rNJmG/FFLVyQ?=
 =?us-ascii?Q?+Ba8GMkxM3d2di605eR4iZKETiVyIw0ZjdlEZ2/L/uT9jyidmw06N664yxWh?=
 =?us-ascii?Q?1zZSaJVaFsnrXeRBZwK8y6R7GlHspnm7WLdUNKF9T0HBC+s8jfqgJw3Hk2RB?=
 =?us-ascii?Q?ACCobOWKx1A6viE+Y55CfhhITreft4Zop2Hs3HrUcYHYRC9ZjCKErFzmZPN3?=
 =?us-ascii?Q?XvEzQQCEMI3a0BzVVleGuWDxu1HDVBIVeuUmzN4NSHAWzepcUh/zjIAg9QJu?=
 =?us-ascii?Q?abB1LVaqMzfks2q3M1DqBpwGZpFjtHKfEb58Mtu5mZSX+HohNu+0ksuZ/Yq+?=
 =?us-ascii?Q?FEkWBxBmZg2UkUhjoK7nR4qh+JzmvBm/Z601imw6Bx8zJ8LuwYpRtPQhrpXT?=
 =?us-ascii?Q?+U/rANaSde3tl0PNycAHsu+4/7RUKCa6ihacI3JIzlDwvxhx0hCH+rNfMGLd?=
 =?us-ascii?Q?LY/EBiTAlxNJHVRgVyDPiLVzujr0M8E5kWwUgjQOKLjAz2yg6sDt2q7Z1D+g?=
 =?us-ascii?Q?izSNBqRoT2Ya+VF8FS/t815HSWApr8ULlZYQ+2rTRwE+BenLz59rT6IBD7iK?=
 =?us-ascii?Q?7iqG2VOnueqdw7r5C9HXQY1YGmOF46EvLrE4yS6GBj9Z4ttqxdZLrxEZHweX?=
 =?us-ascii?Q?P1HDVYCYc1a4FNaClWBr+3Rfnud6ESTkc9ylF6o4BTvEw8zzXDT/V2VvIILK?=
 =?us-ascii?Q?dH9mFknQbxbeCW82uo1Suz5vSkpcITE/HQIelySAWdIrv8TNFeyW3y8g0XBh?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: camlingroup.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 106cca6b-7daa-4a7a-0c4c-08da631d915d
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB5747.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 09:13:07.1904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fd4b1729-b18d-46d2-9ba0-2717b852b252
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgIFV4wVBOUZ+s4uADzSDggunkuOW2JxpopBkYO8GFPaTWwo4adcSXRg3PtVPmO2QwMiCLV9/pYOOvh28ze7E0DAMOWP1rzgK8I2EfKhu28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP123MB3295
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUK97A341 smtp.mailfrom=tomasz.mon@camlingroup.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: camlingroup.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_021331_504767_0EAF7FA5 
X-CRM114-Status: GOOD (  13.03  )
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

T24gRnJpLCAyMDIyLTA3LTAxIGF0IDEzOjAzICswMjAwLCBTYXNjaGEgSGF1ZXIgd3JvdGU6Cj4g
MDY3ODFhNTAyNjM1MCBGaXhlcyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIERFVklDRV9CVVNZX1RJ
TUVPVVQgcmVnaXN0ZXIKPiB2YWx1ZSBmcm9tIGJ1c3lfdGltZW91dF9jeWNsZXMuIGJ1c3lfdGlt
ZW91dF9jeWNsZXMgaXMgY2FsY3VsYXRlZCB3cm9uZwo+IHRob3VnaDogSXQgaXMgY2FsY3VsYXRl
ZCBiYXNlZCBvbiB0aGUgbWF4aW11bSBwYWdlIHJlYWQgdGltZSwgYnV0IHRoZQo+IHRpbWVvdXQg
aXMgYWxzbyB1c2VkIGZvciBwYWdlIHdyaXRlIGFuZCBibG9jayBlcmFzZSBvcGVyYXRpb25zIHdo
aWNoCj4gcmVxdWlyZSBvcmRlcnMgb2YgbWFnbml0dWRlIGJpZ2dlciB0aW1lb3V0cy4KPiAKPiBG
aXggdGhpcyBieSBjYWxjdWxhdGluZyBidXN5X3RpbWVvdXRfY3ljbGVzIGZyb20gdGhlIG1heGlt
dW0gb2YKPiB0QkVSU19tYXggYW5kIHRQUk9HX21heC4KCjA2NzgxYTUwMjYzNTAgd2FzIG1lcmdl
ZCBpbiB2NS4xOS1yYzQgYW5kIHRoZW4gd2FzIHBpY2tlZCB1cCBieSBzZXZlcmFsCnN0YWJsZSBr
ZXJuZWxzLCBpbmNsdWRpbmcgdjUuMTUuNTEuIEFmdGVyIHdlIGhhdmUgdXBncmFkZWQgdG8gdjUu
MTUuNTEKd2UgaGF2ZSBvYnNlcnZlZCB0aGUgaXNzdWUgdGhhdCBTYXNjaGEgbWVudGlvbmVkIGlu
IGhpcyBlbWFpbCBbMV0uCgpBcyB0aGUgdjUuMTktcmM2IHdhcyByZWxlYXNlZCB5ZXN0ZXJkYXkg
YW5kIHRoaXMgZml4IGlzIHN0aWxsIG5vdAphcHBsaWVkLCB0aGUgdjUuMTktcmM2IChhbmQgYWxs
IHN0YWJsZSBrZXJuZWxzIHRoYXQgcGlja2VkIHVwIHRoZQpiYWNrcG9ydCkgY2F1c2VzIE5BTkQg
Zmxhc2ggZGF0YSBsb3NzIG9uIGlteCB0YXJnZXRzLgoKSSBoYXZlIGJhY2twb3J0ZWQgdGhpcyBw
YXRjaCB0byBvdXIgaW50ZXJuYWwgdjUuMTUuNTEgYmFzZWQga2VybmVsIG9uCjR0aCBKdWx5IDIw
MjIgYW5kIEkgY2FuIGNvbmZpcm0gdGhhdCBpdCBkb2VzIGluZGVlZCBzb2x2ZSB0aGUgTkFORCBk
YXRhCmxvc3Mgb24gaW14IHRhcmdldHMuCgpJcyBpdCBwb3NzaWJsZSBmb3IgdGhpcyBwYXRjaCB0
byBtYWtlIGl0IHRvIHRoZSB2NS4xOS1yYzc/Cgo+IEZpeGVzOiAwNjc4MWE1MDI2MzUwICgibXRk
OiByYXduYW5kOiBncG1pOiBGaXggc2V0dGluZyBidXN5IHRpbWVvdXQgc2V0dGluZyIpCj4gRml4
ZXM6IGIxMjA2MTIyMDY5YWEgKCJtdGQ6IHJhd25pYW5kOiBncG1pOiB1c2UgY29yZSB0aW1pbmdz
IGluc3RlYWQgb2YgYW4gZW1waXJpY2FsIGRlcml2YXRpb24iKQo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJv
bml4LmRlPgoKVGVzdGVkLWJ5OiBUb21hc3ogTW/FhCA8dG9tYXN6Lm1vbkBjYW1saW5ncm91cC5j
b20+CgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzIwMjIwNzAxMDkxOTA5
LkdFMjM4N0BwZW5ndXRyb25peC5kZS8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
