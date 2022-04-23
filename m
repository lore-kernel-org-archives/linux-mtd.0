Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB4BC433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Apr 2022 04:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RqBvPK2J3P8rpwOXfFcl3vrHYMjn+2OxJ/uUq22V3YA=; b=IjlT1+8CN5PnWe
	KwnmFHCDUGPW1ZYhjuzKPlGAy1GgF5PUlX6WIupiwA6PLtjpzbi4mokrSzqrsb+31WoqLgsiAZmfo
	w1suYg7IZ/PqNoJwx2R6BTvawJepznn0fFOxOeMjdmZh0kKJy9FJ30FSFxN4IAs6duGfJFwOig0IV
	2dbS6lXW4oIy4gF8tdx3nGegUj1Alws2YWFwKCZiS6C7hk0Pn/l1cg3PBfxJ6/++FWVyE/pUcNveV
	JcRpacDCTyc28ZhNspuvVhGSaEZLFhlIHhNRHpN3KarWRdQckfgjgxzb8uZgUw7Jj6c+lEp0W04vm
	PP4jAuwDljXjM8tTXhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni6yH-003O8S-PJ; Sat, 23 Apr 2022 04:02:09 +0000
Received: from mail-bn7nam10olkn20822.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::822]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni6yF-003O6H-JQ
 for linux-mtd@lists.infradead.org; Sat, 23 Apr 2022 04:02:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFmtbCaZIEnuiPmmNmwGITR1lZMLKCft3uUCaBWw2XVuXWJ0RYvWspUBRGSz2Se2DOW2sGnyYV4kHh3uXwxHIclEt9vnT9ND8hD2BVIR/aMwlObHYEAlyUdH3rmVDGBfVn/E/1DHLnTnmeu58/33D9ZVNBMkxN7AZDbhUFGPzdlGsHNTnUC314FFU/ZL9WjsXPvFQO1X4mmFrIvUW6FyFm0NorGm7dQR24EXOQnGy8Tw+izOHf6TgSOzEh3sLL2GSzfovbVziu7MG5mz6VcgD27llWcCRGSwcoVjsea3F9gen3OJQFjryb0jfczZIn+Gx3H1pTdcvH3XCWaWdAR+Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRz4KJxx36uXke3/M9dDj+fZyMzrPh775UfAXXXdqLs=;
 b=JEIpcY9r0MdREHPGbC45BblBA7dO4DCoBM8EZ4f7xZA5DB/98fqFSWgBR5d2JL7hxNcIdd5nM+sc8ScVFYtSsQAsSiaKBMETvUClbw7YoImx37Q3t7BeMYszHzRcL/yYdJKprv1h96af+tdyCsDFET5RwkAYGreFzBqSEHP8lWWmC+uIePojvIUNrCF0QaOrxOHYbd9GP3zGUgjyJgP3pZgFfV1mh7/dJWNZ84zn+GIz2bIf8y8RZ6R2JAj4qHc+pnA8YCYQXhhDZq6EawtyrhYRAGEQLiLjn7j91PqFhyzIxAq9Pe1+PW33qOXD0KHdS/hsrcausW58jX7gb3GDtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CY4PR04MB0567.namprd04.prod.outlook.com (2603:10b6:903:b1::20)
 by SN6PR04MB4205.namprd04.prod.outlook.com (2603:10b6:805:30::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Sat, 23 Apr
 2022 03:46:48 +0000
Received: from CY4PR04MB0567.namprd04.prod.outlook.com
 ([fe80::8e:6e22:f98c:29d5]) by CY4PR04MB0567.namprd04.prod.outlook.com
 ([fe80::8e:6e22:f98c:29d5%5]) with mapi id 15.20.5186.015; Sat, 23 Apr 2022
 03:46:48 +0000
From: Jonathan Bakker <xc-racer2@live.ca>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
 Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH 5/5] mtd: onenand: samsung: Add device tree support
Date: Fri, 22 Apr 2022 20:46:22 -0700
Message-ID: <CY4PR04MB056716B2AE01D243F6AE3C13CBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220423034622.366696-1-xc-racer2@live.ca>
References: <20220423034524.366612-1-xc-racer2@live.ca>
 <20220423034622.366696-1-xc-racer2@live.ca>
X-TMN: [lSK7iLLjEA4qxR34T9AkrmY8T4I/xv1/GtDCGGhtOGPCqTn2DHcGevU28dsWUlY+]
X-ClientProxiedBy: MW4PR04CA0210.namprd04.prod.outlook.com
 (2603:10b6:303:86::35) To CY4PR04MB0567.namprd04.prod.outlook.com
 (2603:10b6:903:b1::20)
X-Microsoft-Original-Message-ID: <20220423034622.366696-4-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2aa12229-2cfd-4497-1fbd-08da24dbe4f9
X-MS-TrafficTypeDiagnostic: SN6PR04MB4205:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vSjq2cDEbz9929l0WJ5DX2V8SSHhDexGbbVKKH8u9EMklwUiL3xKzXvMeaD5OOXRsG1Ry/cCH1amM/NERgDITpBjiTEioZ9rNh+2+1kVdlyqHmxv9RAFM6Ur0nhUvOsiQ3laqzo2G2PSNrmMM3hzB3nvtMqdqXiL17zIWJPYv8MZVmQSSPLSffLAtlXdupSR2jBiYI4hH9c66wIUE7bGfxo4U0iElFvdPp9j4yCn15i7SeyaDjFcWni7cKE7X48QuzVr814gIwQgvdLvJDORRwRMeIZD1H3OFFgxM3EQ2fYhi2g1+rCEEtclyo7FhQuasg3KzYDzozSrNGiAAHDXN1az1G8zP9xfGWgOyrOvBTvY1+OC3dSG9x9fdU9gj0zZlBaueFY/14or6XztAmibdsTLIpNgxNVOMXuaN31kzXQi4taybi0cEzGHN053IZdNel2Ee+AN0K4CSa1dSxe52H7t30rfynG+t4CvVeRZ1sliemW4MKnF/0qgBHron4+oEsKqOFOL/mOl0Z56+bAYqu1p8h9b6wLsqAO4oywRMUfXrwGRC/Hc9UEJkpHu4i+EW3EzwMNZXN+gbWjma+XsJg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnpLU21FWWNGZDJEVndZbzRQMExWaUZPVWExMUw2eUxVNmJzUnRyTEVpeTNC?=
 =?utf-8?B?QlM1eUptc0dvRXA1WE9YT01uVjllR0JNMEVmR1ZaWXlJUTJZVGF4YWcrd3Iw?=
 =?utf-8?B?MjJ6M3BOWEpsTzgvYzdTTkJ4NmM2Uy9EcERGV0htSEc0N0I1ODQrWTFmcDNw?=
 =?utf-8?B?cVN5TnlJdG5QR01rSm92SHE5VllMT3o3N0FZa29qTGcxQjQ4SW4xYlZGWWpk?=
 =?utf-8?B?WkJBc0MrVFVTRFlxU2ppUmpCMk1ISVl5WkIyNjdqcnM4NHE0MVU1OUVMWG40?=
 =?utf-8?B?bXJQVEtLclhFeVpqeCsyR0NFMHFFaW8xbG50bEllWXhmUmZuQnU4OEU2MTlk?=
 =?utf-8?B?dEIrL0dsQ2c2OTNUek1tQ2tUc1dKQ2hCa0VOb0IwczlPMUNYYW1IK0ZDdFR4?=
 =?utf-8?B?eElsdE1LVDhJWm9WNlFIOTVWT3MwWnZSOGdVRW1zaEZ5NXh6UnBFcnNDdit3?=
 =?utf-8?B?b01KNWkxRlNiZmtDbnJVOCszelVwSld4ZGhIOEthZnpaMFpvVTFoM2gyeHhM?=
 =?utf-8?B?aDRVRy83MXV5TmtyNW0zOTNTd1kwZnlOK1ZiSUtYcDRHRzczaDRzbENmejZ1?=
 =?utf-8?B?WEdBQ1oxSlp3b0g2RVNCVzMzMXAvaDc2OVdsVGdocmpObWxTQ001b3NkVXE1?=
 =?utf-8?B?dWNpdW1pUHVqdE5LcmhGL0Z4cVd3MXAyNisyMk9rcmwzZnB5aUpYK0tDZkZG?=
 =?utf-8?B?WXlyQ1pLaDd1OUVWaU9KRHViaCs5S0VaYloxTDRNbjljNUIrcExjcVlYT0xn?=
 =?utf-8?B?Z2daU3JQK2pEUmsvelFEWmRxZFd6UnQzSUhMYTczcm1MT3RjNWxZYVZOYVkr?=
 =?utf-8?B?U1hRUjhJUVM4TmF5Yk5ob2lVUmV2aVVTcWJJUGJzWXY0LzlMZTJPejNLa2ZW?=
 =?utf-8?B?VmZhTlloZVZramVVdjBWbnljSU9SWnNCcUxMYUZmZmc2cFF6ZUNRdEZmODl0?=
 =?utf-8?B?UkxtRTBWYmdVRnNXZWhubWhzajlYSXQybldaY0FObStMZTY4bHdMendEd0lX?=
 =?utf-8?B?WmhseVR1RXZQOHRIb0hYTzVOamhPTnAycUgwZUw2MUoyVFNvc0VFUlM4bTdj?=
 =?utf-8?B?S3M4RmVwR1pXS3pieEtGMzNFcy9yQnQrUW5uQzd6T2hZTzNTSlVvODRwSU5j?=
 =?utf-8?B?dWtLRXlmdDdhczJ6V0ZSeGRRc2w4SnJOVE11T0RFU2lWL2xJN29QaHpVVUJJ?=
 =?utf-8?B?R1R5UzFyQm9HNThWNk52NWFLMnNKOHdPTTRQeFhmdFplcThibUhLRkVZQkZs?=
 =?utf-8?B?UzNoVFJ0V2s3L2liUzlhU2NwbHRPVDJEUGZZTjhROENFc2JwaDdlNGRXWEtO?=
 =?utf-8?B?Y2FjSWNRWGZmMVM0MFZ4U1pxaUNyaXJnTjBTeGZXTlNIMXVldXZ2RS9KQVVR?=
 =?utf-8?B?eFVGZWlsc2d6VDN3YllOUGFUMTVTcXE3T1VJYmxxaHZ5U2FaZFFwSlpzUzJo?=
 =?utf-8?B?Y0lRTWFoSXpzYWxXR1pmczdkSTdUcVpHaTVTdFBqeFJGL25RUTFFeHA4bStv?=
 =?utf-8?B?WDFBdk1QVXhPTUgrYXpOMlZuUEJpeCs3TjRMaXdHbWhCNXpIbXRvNW9IdGhT?=
 =?utf-8?B?WEkvTDRaNVpJV0NISi9jaDRERnFHWEZSN3BUemJEcFpCSFpmUU13VVdhamd1?=
 =?utf-8?B?YmZ3c2hqRllwcWRyL29xZHVzTE9ER0tWUVJpdnVZYS9UZk9OS1EySGEzdUpB?=
 =?utf-8?B?ZjJObzhhTStQN2ZINk5TWGVFcGozbXhVVjFibitQZFY2bFdnYy9EV3lJMzk0?=
 =?utf-8?B?cFNSSVRPSkZwMjFZL1dLOVd5R1dDOGp2a0kvUjhUNFJWcFJtMXJBc2xxMHBj?=
 =?utf-8?B?U2xGTExKOXVHZnRWaTQ4NGo5VWlSOUx3Q0pCRVhxWDRlSmN6NDgzWlplOTV6?=
 =?utf-8?B?WTdWajlvM2pzaHI3NkNHVUo1ekJjeEZIWDFHeEJoSlBBYmNFcm12bVFzNGF0?=
 =?utf-8?B?Nk9HbW9Fclg3L3JYb2VhZGVTWTVuNkplbmVoRXVGVkF4dnVoMXRHN0ZrOE9I?=
 =?utf-8?Q?qVjnUHKka+W+7hVeFRYHbKVgDF33tU=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-edb50.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa12229-2cfd-4497-1fbd-08da24dbe4f9
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0567.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2022 03:46:48.8065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_210207_677336_C784296E 
X-CRM114-Status: GOOD (  20.38  )
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

RnJvbTogVG9tYXN6IEZpZ2EgPHRvbWFzei5maWdhQGdtYWlsLmNvbT4KClRoaXMgcGF0Y2ggYWRk
cyBzdXBwb3J0IGZvciBpbnN0YW50YXRpb24gdXNpbmcgRGV2aWNlIFRyZWUuCgpTaWduZWQtb2Zm
LWJ5OiBUb21hc3ogRmlnYSA8dG9tYXN6LmZpZ2FAZ21haWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBQ
YXdlxYIgQ2htaWVsIDxwYXdlbC5taWtvbGFqLmNobWllbEBnbWFpbC5jb20+ClNpZ25lZC1vZmYt
Ynk6IEpvbmF0aGFuIEJha2tlciA8eGMtcmFjZXIyQGxpdmUuY2E+CgotLS0KQ2hhbmdlcyBmcm9t
IHByZXZpb3VzIHBhdGNoc2V0Ci0gQWRqdXN0IHRvIGhhdmluZyBhIG5hbmQgY2hpbGQgbm9kZSBh
cyBwZXIgYmluZGluZyBmZWVkYmFjawotLS0KIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVu
YW5kX3NhbXN1bmcuYyB8IDY3ICsrKysrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCA2NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
bXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX3NhbXN1bmcuYyBiL2RyaXZlcnMvbXRkL25hbmQvb25l
bmFuZC9vbmVuYW5kX3NhbXN1bmcuYwppbmRleCA2MjAxNGY4ZDI3YjYuLjAxMDhjOGM3NWQ1YiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfc2Ftc3VuZy5jCisr
KyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX3NhbXN1bmcuYwpAQCAtMjIsNiAr
MjIsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+CiAjaW5jbHVkZSA8bGludXgv
aW50ZXJydXB0Lmg+CiAjaW5jbHVkZSA8bGludXgvaW8uaD4KKyNpbmNsdWRlIDxsaW51eC9vZi5o
PgogCiAjaW5jbHVkZSAic2Ftc3VuZy5oIgogCkBAIC04MzIsOCArODMzLDM2IEBAIHN0YXRpYyB2
b2lkIHMzY19vbmVuYW5kX3NldHVwKHN0cnVjdCBtdGRfaW5mbyAqbXRkKQogCXRoaXMtPndyaXRl
X2J1ZmZlcnJhbSA9IG9uZW5hbmRfd3JpdGVfYnVmZmVycmFtOwogfQogCisjaWZkZWYgQ09ORklH
X09GCitzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBzM2Nfb25lbmFuZF9vZl9tYXRj
aFtdID0geworCXsgLmNvbXBhdGlibGUgPSAic2Ftc3VuZyxzM2M2NDAwLW9uZW5hbmQiLAorCQku
ZGF0YSA9ICh2b2lkICopVFlQRV9TM0M2NDAwIH0sCisJeyAuY29tcGF0aWJsZSA9ICJzYW1zdW5n
LHMzYzY0MTAtb25lbmFuZCIsCisJCS5kYXRhID0gKHZvaWQgKilUWVBFX1MzQzY0MTAgfSwKKwl7
IC5jb21wYXRpYmxlID0gInNhbXN1bmcsczVwdjIxMC1vbmVuYW5kIiwKKwkJLmRhdGEgPSAodm9p
ZCAqKVRZUEVfUzVQQzExMCB9LAorCXt9LAorfTsKK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG9u
ZW5hbmRfczNjX2R0X21hdGNoKTsKKyNlbmRpZgorCitzdGF0aWMgZW51bSBzb2NfdHlwZSBzM2Nf
b25lbmFuZF9nZXRfZGV2aWNlX2lkKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCit7CisJ
c3RydWN0IGRldmljZV9ub2RlICpucCA9IHBkZXYtPmRldi5vZl9ub2RlOworCisJaWYgKElTX0VO
QUJMRUQoQ09ORklHX09GKSAmJiBucCkgeworCQljb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICpt
YXRjaDsKKworCQltYXRjaCA9IG9mX21hdGNoX25vZGUoczNjX29uZW5hbmRfb2ZfbWF0Y2gsIG5w
KTsKKwkJcmV0dXJuIChlbnVtIHNvY190eXBlKW1hdGNoLT5kYXRhOworCX0KKworCXJldHVybiBw
bGF0Zm9ybV9nZXRfZGV2aWNlX2lkKHBkZXYpLT5kcml2ZXJfZGF0YTsKK30KKwogc3RhdGljIGlu
dCBzM2Nfb25lbmFuZF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogeworCXN0
cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBwZGV2LT5kZXYub2Zfbm9kZTsKIAlzdHJ1Y3Qgb25lbmFu
ZF9wbGF0Zm9ybV9kYXRhICpwZGF0YTsKIAlzdHJ1Y3Qgb25lbmFuZF9jaGlwICp0aGlzOwogCXN0
cnVjdCBtdGRfaW5mbyAqbXRkOwpAQCAtODU2LDkgKzg4NSwxMCBAQCBzdGF0aWMgaW50IHMzY19v
bmVuYW5kX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJdGhpcyA9IChzdHJ1
Y3Qgb25lbmFuZF9jaGlwICopICZtdGRbMV07CiAJbXRkLT5uYW1lID0gZGV2X25hbWUoJnBkZXYt
PmRldik7CiAJbXRkLT5wcml2ID0gdGhpczsKKwltdGQtPmRldi5vZl9ub2RlID0gbnA7CiAJbXRk
LT5kZXYucGFyZW50ID0gJnBkZXYtPmRldjsKIAlvbmVuYW5kLT5wZGV2ID0gcGRldjsKLQlvbmVu
YW5kLT50eXBlID0gcGxhdGZvcm1fZ2V0X2RldmljZV9pZChwZGV2KS0+ZHJpdmVyX2RhdGE7CisJ
b25lbmFuZC0+dHlwZSA9IHMzY19vbmVuYW5kX2dldF9kZXZpY2VfaWQocGRldik7CiAKIAlzM2Nf
b25lbmFuZF9zZXR1cChtdGQpOwogCkBAIC04NjcsNyArODk3LDM1IEBAIHN0YXRpYyBpbnQgczNj
X29uZW5hbmRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoSVNfRVJS
KG9uZW5hbmQtPmN0cmxfYmFzZSkpCiAJCXJldHVybiBQVFJfRVJSKG9uZW5hbmQtPmN0cmxfYmFz
ZSk7CiAKLQlyID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAx
KTsKKwlpZiAobnApIHsKKwkJLyogRGV0ZXJtaW5lIHdoaWNoIENTIHRvIHVzZSAtIHRoaXMgZHJp
dmVyIG9ubHkgc3VwcG9ydHMgb25lICovCisJCXUzMiBjcyA9IDA7CisJCXN0cnVjdCBkZXZpY2Vf
bm9kZSAqY2hpbGRfbnA7CisJCXN0cnVjdCBkZXZpY2Vfbm9kZSAqZXh0cmFfY2hpcF9ucDsKKwor
CQljaGlsZF9ucCA9IG9mX2dldF9uZXh0X2F2YWlsYWJsZV9jaGlsZChucCwgTlVMTCk7CisJCWlm
IChjaGlsZF9ucCA9PSBOVUxMKSB7CisJCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8g
Z2V0IGNoaXAgbm9kZVxuIik7CisJCQlyZXR1cm4gLUVJTlZBTDsKKwkJfQorCisJCS8qIFdhcm4g
aWYgbW9yZSB0aGFuIG9uZSBjaGlwIGFzIHRoaXMgdW5zdXBwb3J0ZWQgKi8KKwkJZXh0cmFfY2hp
cF9ucCA9IG9mX2dldF9uZXh0X2F2YWlsYWJsZV9jaGlsZChucCwgY2hpbGRfbnApOworCQlpZiAo
ZXh0cmFfY2hpcF9ucCAhPSBOVUxMKSB7CisJCQlkZXZfd2FybigmcGRldi0+ZGV2LCAibXVsdGlw
bGUgY2hpcCBub2RlcywgdXNpbmcgb25seSBmaXJzdFxuIik7CisJCQlvZl9ub2RlX3B1dChleHRy
YV9jaGlwX25wKTsKKwkJfQorCisJCWVyciA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKGNoaWxkX25w
LCAicmVnIiwgJmNzKTsKKwkJb2Zfbm9kZV9wdXQoY2hpbGRfbnApOworCQlpZiAoZXJyIDwgMCkK
KwkJCXJldHVybiBlcnI7CisKKwkJciA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JF
U09VUkNFX01FTSwgY3MgKyAxKTsKKwl9IGVsc2UgeworCQlyID0gcGxhdGZvcm1fZ2V0X3Jlc291
cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAxKTsKKwl9CisKIAlvbmVuYW5kLT5jaGlwX2Jhc2Ug
PSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcik7CiAJaWYgKElTX0VSUihvbmVu
YW5kLT5jaGlwX2Jhc2UpKQogCQlyZXR1cm4gUFRSX0VSUihvbmVuYW5kLT5jaGlwX2Jhc2UpOwpA
QCAtOTE3LDYgKzk3NSwxMCBAQCBzdGF0aWMgaW50IHMzY19vbmVuYW5kX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJfQogCiAJb25lbmFuZC0+Y2xrX2J1cyA9IGRldm1fY2xr
X2dldCgmcGRldi0+ZGV2LCAiYnVzIik7CisJaWYgKG5wICYmIElTX0VSUihvbmVuYW5kLT5jbGtf
YnVzKSkgeworCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gZ2V0IGJ1cyBjbG9ja1xu
Iik7CisJCXJldHVybiBQVFJfRVJSKG9uZW5hbmQtPmNsa19idXMpOworCX0KIAlpZiAoIUlTX0VS
UihvbmVuYW5kLT5jbGtfYnVzKSkKIAkJY2xrX3ByZXBhcmVfZW5hYmxlKG9uZW5hbmQtPmNsa19i
dXMpOwogCkBAIC05OTgsNiArMTA2MCw3IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVy
IHMzY19vbmVuYW5kX2RyaXZlciA9IHsKIAkuZHJpdmVyICAgICAgICAgPSB7CiAJCS5uYW1lCT0g
InNhbXN1bmctb25lbmFuZCIsCiAJCS5wbQk9ICZzM2NfcG1fb3BzLAorCQkub2ZfbWF0Y2hfdGFi
bGUgPSBvZl9tYXRjaF9wdHIoczNjX29uZW5hbmRfb2ZfbWF0Y2gpLAogCX0sCiAJLmlkX3RhYmxl
CT0gczNjX29uZW5hbmRfZHJpdmVyX2lkcywKIAkucHJvYmUgICAgICAgICAgPSBzM2Nfb25lbmFu
ZF9wcm9iZSwKLS0gCjIuMzAuMgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
