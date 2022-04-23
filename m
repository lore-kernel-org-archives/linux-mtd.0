Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4592C433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 23 Apr 2022 04:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mpZuZrr45jyFUpFdMEQtiYggPUyLTz4/qTn2t8mFR+g=; b=fweL+ssKwuSA5C
	GPmaJkp3G62UoWDdpKSIGAtZbHsdBSxwy2Tb+0Ws7lATmHiCiYojOwGi/aJUZNx+qCHfSuDBnCQ9c
	ivnDnRW1ik8MdIgQf8vZ2LNwWL5qXo2Fl4YZv5LyVJvuMt/h55n7rdVsIW049gR5ddg5W2jF4Oyke
	0qSQFHzica0wwwzkM3noTz/K4L0QZADu71fzjckVKgx+vM1gGo3pwzOKduBI2RbH/HrufIIadIpp6
	rkyI9t3oSdjKmwxHrJT/xRlCAXAtNxnCEjleXd9VxH9ufZIZ4hptfCyYmful7KsTaWJjFPAxh9ADG
	xCk0blhvHuynD+2Uti0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni6y5-003O4D-PW; Sat, 23 Apr 2022 04:01:57 +0000
Received: from mail-dm6nam10olkn2081d.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::81d]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni6y3-003O35-5i
 for linux-mtd@lists.infradead.org; Sat, 23 Apr 2022 04:01:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhORCvLN9lhpZJvvQHVaOUFJ/G7++hoclB7isnmbHXrP7NSKAnhBCCLh8d0Yj6JwJarFuxwpsBRxTgEKOhsVF9sx/QpYK9oNSkG3C5DNWXHtyTZVFYiTGN++qR3Vn8LX/r+g0i28LXqMn90JK8j0q4Z94t5scmVSlVbycQgVCfPsU0eh7BU0jDkOoo4k5hnqtDdBQxbVovrhyDM0vF2gdojQSLITx7NBBpL+n+ZqXPjwMeR0B+m2lZpK2DIBYlcb23d35Yz0hec95OHKQQYQRdmQvY31iOhmQFCBpdMmLTdtGOyJgsIYQBHkNpK95fZAQwIFBiE5XiyNCrB2UgGAjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcP75b0sIfQb1qUJhu4FHo+cowifBokjGJEEWhB4fmQ=;
 b=UqLA4nUegFmMwY8wD7IR5cZtuY2X6BkdVIgcyGBM1DzPobkNBCkBws7wZM3mFgtSqZkZDW4IoVdSQlReHzlwUUyAGeCbmEYkJu/Dlq8ymLgzArnMWw7AKhjl8wRx2HZe7/Oomn5JPg0QWFx+snyqDzl/3YRd83n5khKvogZRfZJA/pCOQVpJ2Ol+RgtuMaefnbYYLlO9NBOEx4aXEWSbTny6jJn5t714WR80Hfo2IiZwl908/iqcFf4bEBPR29W/OyKn8UvL6Z/8SfQ6lr6esdlC4vIGxKza35nVpYAFfFJYHrcRSH8ZLROzJQC4O0ICgivhjdOMJWAz04BpWP6GFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CY4PR04MB0567.namprd04.prod.outlook.com (2603:10b6:903:b1::20)
 by SN6PR04MB4205.namprd04.prod.outlook.com (2603:10b6:805:30::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Sat, 23 Apr
 2022 03:46:47 +0000
Received: from CY4PR04MB0567.namprd04.prod.outlook.com
 ([fe80::8e:6e22:f98c:29d5]) by CY4PR04MB0567.namprd04.prod.outlook.com
 ([fe80::8e:6e22:f98c:29d5%5]) with mapi id 15.20.5186.015; Sat, 23 Apr 2022
 03:46:47 +0000
From: Jonathan Bakker <xc-racer2@live.ca>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
 Jonathan Bakker <xc-racer2@live.ca>
Subject: [PATCH 4/5] mtd: onenand: samsung: Make sure that bus clock is enabled
Date: Fri, 22 Apr 2022 20:46:21 -0700
Message-ID: <CY4PR04MB056777077970A6935BC6349BCBF69@CY4PR04MB0567.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220423034622.366696-1-xc-racer2@live.ca>
References: <20220423034524.366612-1-xc-racer2@live.ca>
 <20220423034622.366696-1-xc-racer2@live.ca>
X-TMN: [jzISU3lGJgpMSJxoT8XLznq63W7cCwgumnU7uamOx5cgbkFrk0Xx4bEPZF4VEom7]
X-ClientProxiedBy: MW4PR04CA0210.namprd04.prod.outlook.com
 (2603:10b6:303:86::35) To CY4PR04MB0567.namprd04.prod.outlook.com
 (2603:10b6:903:b1::20)
X-Microsoft-Original-Message-ID: <20220423034622.366696-3-xc-racer2@live.ca>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0dc3d1f3-057d-4284-a07e-08da24dbe454
X-MS-TrafficTypeDiagnostic: SN6PR04MB4205:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F7JMQTwKf1gP4G3EdEh40g37+FbTyIuMpi4dPggSK812Pp865EqDbjq7/pZZVczXLMpligvLiO0kZO2egd9qgvF3uZ24l/V3l8MnOI78CLk5DPhYXsvRlhL0mQmG1trm9qHWWRrKCxBWTZ5DgR8Xz35Pp7lqaRciVVrCQ9j5KUvGWGarmktJD5js3wrVEunTr8B1IEPAfq9M4jS4MXwaop5tQ/KmkxeH+I0N/CsE0WzSagACiZmPIC9RZW7Zg4ck/6IVKquwq2ld++/WXESl6lDZUc20GdygvwQQhlrmHxpZzpCrucHUDLBSHoR/3k5JFtM2HGIIYibYhPne/UWwZvPsHK5tX0miT4trXsf7NIikshEzsMqsUn6dKJAlHBD+iI0wG4p+4sFlNOEqtx3ih95aTxMrd0nRpKpuZqrI4bQi0r4LuaZQrVMpx57nc221xPJzj+mx0bG1R64D+b/4PLf/zskGJGgT6ukeQtrx33U9n1cGB3PV+FRylCRyGlEMu7J2VgzOKyWzh8MXL0n9YTfXXb9xsN3JRnlg5ceBOpXjlVfaHeZIjkZ0lWVBgN7FaSczDkmDmv4gmnb/b7OrAw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDF2KzhPclFCaHFGY0M1OW0rclhJT2JwdThCa1lDSktWMXpQSzUvdHQ2ZHAy?=
 =?utf-8?B?aW96Q1VYS0VxZFVwRjFPbjU4b3lSRk5aK3IwM3JvYUo4TXNnbUFDc3BmTFgz?=
 =?utf-8?B?UlNIaWQvdU9MQlN3R3dGdmsrcktkVVk5SmRNNCt3Q0I0WXdhQnRXek5nSHpY?=
 =?utf-8?B?NFFwcmZHdFkwelRlTlp6ODdhUmtjZW1YSXluWWhqM3lOZlpxRUo4WmVnZHZX?=
 =?utf-8?B?bG4zdFBkYlhrMHZtUWZRMnVlRlo2RUVQZ3VrcGI1YUFCZzMzYlgxem9QWHp1?=
 =?utf-8?B?dis1WWtPaUZJMjkyK3Y5VWxGaXE2TkVjdlptbWxpMlcwcFN0Z05OUEFVRkd2?=
 =?utf-8?B?cGpJWkx1ME5CMTM5QXY2Qk5mZmZ5NkdERjFJMjkrUWd3ck5BdndBYWQrd2hK?=
 =?utf-8?B?NGRTNmYzMHRmeVJkSXowUlhuNDBTMnNFSi9JQ0JaaGk3SGk3b2tHaU9Kb3NS?=
 =?utf-8?B?MGJXTm5WR3hCeFl1VW5RSGdIUFh0NFFNanB2STNSTnYzZy9LUC9SZk01UHJZ?=
 =?utf-8?B?ejVycEJpUTZlZkJDUGZCYVAvdVZtQXVxL1NFVW9mQXplZndRK2pXVTJWYzFp?=
 =?utf-8?B?NHF3Skp2cVl5NHZyWmRVWm9BRXI2NkpIOGs3dkcyTExsdDh3QmljVmdoSWxU?=
 =?utf-8?B?TU5SS1dINE5LNnYxQzltNnNmdlRralowbEtwK1NnajRoVTZXUXQvakJUcXVa?=
 =?utf-8?B?eUlraHFJWnhQekM4NmN2UmlCWmVmT3BMK21jRURsSjRyL0NKQUtKWVQvUVBN?=
 =?utf-8?B?UVdrdkFiOGxEVU9VK0dza2RGdmtjTFM5eWJmcXpKbUNGUXBIbEIzM0RuOGdv?=
 =?utf-8?B?Z3BqSzZYRlhJR1VjdlNFczkrVzYxZkxENWp5a09BVzVzY3EzUjNseWlQb25M?=
 =?utf-8?B?cDJGMmlBOEtESEdvOWlNNFhQcFdINW1YcDloNUFIekJHYWw4cklDV1ZOMzYr?=
 =?utf-8?B?eXNrMzVTaWh5OU85VitoQ0ZlVGxqd1dxVlZ3L3JHRWJqbkVFYUYycjNJUHBw?=
 =?utf-8?B?ajZzdTQvMjFEUEhVTGROM1drbmhLbGhTQWgva1hsZjk1eGk1QmZ6UEZMTzM0?=
 =?utf-8?B?bTJORGRiM2FmZTBHQnVTQlRGM0k4S1lhS0FwRmFqcnZ4WDZTOE9KdWduVEZM?=
 =?utf-8?B?R0Y4a21mQmFWTVBSb1Y2MWorRHhoTGhIQVl3clV2VjBzalhBTnpBK2R2RFRC?=
 =?utf-8?B?RDgzNkloUjJvUHNkZ2w0bzM0V2dBRmEraTVYcW9hVHFoWklXUEwvVnZUbW83?=
 =?utf-8?B?RVFlNFBXRCsxdm5CMFhEcEsxbk5sK2I1bmd6aHZNUEJidFl3WFZDckl4NENp?=
 =?utf-8?B?TWpzMWhKTzdYMXJ2WXBzd0lsV2JVUGd2RnF0MG5vMHp1Wmdpei85T2lGSUNZ?=
 =?utf-8?B?a2kvaGttQlhjVEV1SUp3Q1NxM2RralRvSmpXSnN6R2xtQjJldlNndm5veU1W?=
 =?utf-8?B?Y1JUdGN5dHpTUkU5d1VNd0tDbUZ2QmNEREdicUk5NUxnaWEvZUNwSWY4UEVq?=
 =?utf-8?B?OTFrVnZlcmZ2M1F2MjI0ZHlieWpXMHRiR1dEMmRlYzRXUTBabC82RmJ5OE5X?=
 =?utf-8?B?dVJUdmlNRXB6YTQvN0dVZVoxNHQ0b0lIUWZEeUdHcUFFNmd6RWZRUi9SY3hr?=
 =?utf-8?B?cDFrOU4veUxWNU02eDVWNkZuRTluemU3ZGU3czkzYkdLc3ZFY0FIK0VITVJi?=
 =?utf-8?B?RytRTnducGxHcE5pdnI1VkFwRkltT2I5cnovSlI4MHRUNko1cjFXeXJMbU1m?=
 =?utf-8?B?L0hpVjFnZnNLL05wT3M1elZ5MTdYa2w5QjBKMWhTNzhQOGQyU2FFUzFOcHNG?=
 =?utf-8?B?T2NRLzAzd0RQanRMdWh4dHVXcGoxSEJ2RmFzcDJybjZqaHN0akF5M3lhdjF3?=
 =?utf-8?B?Ri9mYjFBU0ZpSWgrcStjdjloTGkzd1ZGUzRCQU0xOXA2Y1hKWm55OTFKS3Er?=
 =?utf-8?B?dldoZ2lpNi9mTG90RHR4a1BBWHE2UEhFdklWTVNPODB5Qk9NQnRGT2dzMlhS?=
 =?utf-8?Q?HkArovMRJUwd1VBU60ETka6sCjXAbY=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-edb50.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc3d1f3-057d-4284-a07e-08da24dbe454
X-MS-Exchange-CrossTenant-AuthSource: CY4PR04MB0567.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2022 03:46:47.6972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_210155_241740_112C843B 
X-CRM114-Status: GOOD (  12.37  )
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
cyBiYXNpYyBoYW5kbGluZyBvZiBjb250cm9sbGVyIGJ1cyBjbG9jayB0byBtYWtlIHN1cmUgdGhh
dAppbiBkZXZpY2UgcHJvYmUgaXQgaXMgZW5hYmxlZCBhbmQgZGV2aWNlIGNhbiBvcGVyYXRlIGNv
cnJlY3RseS4gVGhlCmNsb2NrIGlzIG9wdGlvbmFsIGFuZCBkcml2ZXIgYmVoYXZpb3IgaXMgaWRl
bnRpY2FsIGFzIGJlZm9yZSB0aGlzIHBhdGNoCmlmIG5vdCBwcm92aWRlZC4KClNpZ25lZC1vZmYt
Ynk6IFRvbWFzeiBGaWdhIDx0b21hc3ouZmlnYUBnbWFpbC5jb20+ClNpZ25lZC1vZmYtYnk6IFBh
d2XFgiBDaG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6
IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYtYnk6
IEpvbmF0aGFuIEJha2tlciA8eGMtcmFjZXIyQGxpdmUuY2E+Ci0tLQogZHJpdmVycy9tdGQvbmFu
ZC9vbmVuYW5kL29uZW5hbmRfc2Ftc3VuZy5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9v
bmVuYW5kX3NhbXN1bmcuYyBiL2RyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9vbmVuYW5kX3NhbXN1
bmcuYwppbmRleCBhM2VmNGFkZDg2NWEuLjYyMDE0ZjhkMjdiNiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9tdGQvbmFuZC9vbmVuYW5kL29uZW5hbmRfc2Ftc3VuZy5jCisrKyBiL2RyaXZlcnMvbXRkL25h
bmQvb25lbmFuZC9vbmVuYW5kX3NhbXN1bmcuYwpAQCAtMTEsNiArMTEsNyBAQAogICoJUzVQQzEx
MDogdXNlIERNQQogICovCiAKKyNpbmNsdWRlIDxsaW51eC9jbGsuaD4KICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KICNpbmNsdWRl
IDxsaW51eC9zY2hlZC5oPgpAQCAtMTIyLDYgKzEyMyw3IEBAIGVudW0gc29jX3R5cGUgewogc3Ry
dWN0IHMzY19vbmVuYW5kIHsKIAlzdHJ1Y3QgbXRkX2luZm8JKm10ZDsKIAlzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlCSpwZGV2OworCXN0cnVjdCBjbGsJKmNsa19idXM7CiAJZW51bSBzb2NfdHlwZQl0
eXBlOwogCXZvaWQgX19pb21lbQkqY3RybF9iYXNlOwogCXZvaWQgX19pb21lbQkqY2hpcF9iYXNl
OwpAQCAtOTE0LDYgKzkxNiwxMCBAQCBzdGF0aWMgaW50IHMzY19vbmVuYW5kX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCX0KIAl9CiAKKwlvbmVuYW5kLT5jbGtfYnVzID0g
ZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsICJidXMiKTsKKwlpZiAoIUlTX0VSUihvbmVuYW5kLT5j
bGtfYnVzKSkKKwkJY2xrX3ByZXBhcmVfZW5hYmxlKG9uZW5hbmQtPmNsa19idXMpOworCiAJZXJy
ID0gb25lbmFuZF9zY2FuKG10ZCwgMSk7CiAJaWYgKGVycikKIAkJcmV0dXJuIGVycjsKQEAgLTk0
NSw2ICs5NTEsOCBAQCBzdGF0aWMgaW50IHMzY19vbmVuYW5kX3JlbW92ZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBtdGRfaW5mbyAqbXRkID0gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEocGRldik7CiAKIAlvbmVuYW5kX3JlbGVhc2UobXRkKTsKKwlpZiAoIUlTX0VSUihvbmVu
YW5kLT5jbGtfYnVzKSkKKwkJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKG9uZW5hbmQtPmNsa19idXMp
OwogCiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjMwLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
