Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B84CA6012
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Oct 2026 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vLZrrBo+7tVQNQKgKreQAoY+a7/Ip9pig7TDLV5Yc0s=; b=z3zrSPwKfJS0Kk
	Y8s+vnTNetvlgTZQqYScbhDMUeBTSmLj+jrSifkegqa+qyjfT9R2rqU+rTe1eXJVgxJfWM+tVy+2D
	OfbhJQxpgIciPDCtsmMDZAFlaYNJTFyJTdC4gMDdyhjcazx+GWkj5WNs7u1wnl6lvCkrdqmdeaaM2
	tOJotPmEK8SMz1Uo5zFf2fGHdO2VN5AaOsqUZElvM+owwX83X8lXjEuwDoz52wy8SWRMTWDbYRQdo
	Rio6zHqnOeKP9ZGdtz3LCDiokCN+nBirHgnrlNu0coRoC1rYxHSycI1RKF3DuUc1+LizaJi1nQEJ1
	Wmaa1c2HE2gMvXPVXGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF59L-00000005kIq-2C2S;
	Fri, 09 Oct 2026 07:36:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF59K-00000005kId-19Yj
	for linux-mtd@bombadil.infradead.org;
	Fri, 09 Oct 2026 07:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=NkiWqnpToSRkUkylTDICW/AjsKTEAS1gM2GlTHjJdFk=; b=dyg827IF639E8pQFu+Cf0jNpi7
	CynTWVsNH8ZIVP9irxu2t6gGuGHcDWm9MiJDsiGtNm6xGVqS2HBgserc9BPrITCGh+P4ILbAWPLkn
	4EzbUP7HAagQYroreyaktfaK4HAO7mYhEiL7Zs78X70ghAbuZP0a04qKYS8L4fdvng8nBaTs8Y8ms
	rSxM23b7+V3/m2YwatWRLv3M3a9LGi3FiDT1O2zyMP8iKJiwVODRMaUrHKOqCmSZfrPQMiMyRzc9C
	EVFyzoGEvufYe+kyFWRMla2o9TYm6sKW23RiIEp36cquBDh235LjE0XEqhgVqCWxyIGX7HlvRsrAg
	mftUtl2A==;
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xF59H-0000000AzLi-16kv
	for linux-mtd@lists.infradead.org;
	Fri, 09 Oct 2026 07:36:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9PzcjvZUBHFpqynrPXJedPyFzQYg9ljRs5iDbdjJEV7tM0JCmDxZKbq4OKHyWo1/3W+gOiVgZPcnX1qOrddzi96bzSYESakTg5LwoVRMOHFRr9rwRYEeUmCSTmJAToUcu6TOCay3c6KmESK+LAoNrxN7o0loWONIadex8YqUK5gNUnzVY2iV61dktp3Yzsg35HTmEmqaKbbt0dUyr37pc96IcfureD4+Oj8Bbd7oq0hPbSrV+QzjR3D8sV7mW2aEy+M3V+sfakoSt64fZiFt0UrTdXq1ndlCXTc1CW0/KGi5IZfecujRjzEMHQUoCpKNbOQNBnag37Yo5rNHVeMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkiWqnpToSRkUkylTDICW/AjsKTEAS1gM2GlTHjJdFk=;
 b=rA9kso7DUfTLUqU4P5cNfwsyKPjmyXGktXTMUgA/GJDAOQioy324yetfyN6hfbxPNXJk3d0knqo+GmBadGH32EZzp0nAixNx1hYswPwE6Y/J7sLjoDqY7lsDX3imHrUPyoGD0ixtTOrtWxIwPewPeZ4cVZHkVVmhazxh7XHtSFb1hCrWEbMwfhBgcMfujgulfwPus8YjrD2Yz8+TlqvpQZsbkMOZQJ/wd8UMsFbyzfiFjlgaUWl+y7v5xnTbD0DF+nTOg2S9ZTlKW57S9gHTxOexxlYZJfCcuRpAb9+FKjD12J4NwvA59VVO2CdNLIh+00GEMXCltOLXFqrrP5sTIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NkiWqnpToSRkUkylTDICW/AjsKTEAS1gM2GlTHjJdFk=;
 b=wVeAb54UrJ4tMuk4RKSC+Le0BAWphJKlL0P3Q7pSaLX7FpVymJowTcErNmI5PkRRKhHRXux5FNqzIOb2hVk08abp7IxO0ymcHXR0ApxKIXVh5pTqg/79WF3BwhRIMK7B51GL9LfSrZw4dEG0r2/rYrCVAMlDHsjVaPuLYevt8usiznBcYZtE7phetZyooitvG20HDD2lITLaf6RzW6uVOx2w4PAMppZrIgM7YKdifg9wFcYo46VQsZrTNWCnlrTmKAc4NCMjGvC8NZGnwmvh4usfLmuz67Qz5pLyYfypYKLzbrbx7BoQUO9HZtSev+c7VXk88g82n2avKHiGBAmmyQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by EAYPR03MB989279.namprd03.prod.outlook.com (2603:10b6:303:2cf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 07:36:03 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0472.016; Fri, 9 Oct 2026
 07:36:03 +0000
From: tze.yee.ng@altera.com
To: linux-kernel@vger.kernel.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH v2 1/2] mtd: core: add release hook and removed flag for unbind with open handles
Date: Fri,  9 Oct 2026 15:35:54 +0800
Message-ID: <e4312228d241860b3e3238864d12aae47b721db1.1791512623.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1791512623.git.tze.yee.ng@altera.com>
References: <cover.1791512623.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: SJ0PR05CA0086.namprd05.prod.outlook.com
 (2603:10b6:a03:332::31) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|EAYPR03MB989279:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f39857d-06f5-44a5-f723-08df25d7f88f
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|55112099003|22082099003|10067099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: gNRI0sfcgvqdgN5o5srO08QXvn0L5RT7DPoxNlXPl5jP5GZwAsxN4RM9lgO9+7XmF1HUyZGsq3fEMwhvG0H0gFM6diZmgHgVK/8+cJFgELlIIekQ2t1LZwL1ds0ZulRwVJ0fdN7SrcAWBrVOKkpMEtDE8jDaWJ8CygpgqYrBGQTyCoPuAjdAcOS+ZaEsyEIuTb1YpgW3+hXQgpHWH3PwogZ7Lu4AQYeEGD5T7HbJ3ek+li8jQUSKGoPFnDwR/vXphosusXgTzdXviUARMWCnskLpHJQAeqFm6QJYOjxN45cXKdCV5tbZaooQQm4fpEjCypicouoPEIXpkT1+Z7OTjMYD7w/C66jRV18mJ1n++8n5X2VgQC/FJoCriUu7r0BEtNmBDqcI7bEo5yQjlOwDbHcFqj0F0+tlfB1ebEzabkcgbY6YI9hj6I1dqWR3QYSitYkNc8UZ/LdaMIAbUyoxcnrTK4hYvgnwVZ4fTLqRj8XCVxgJ1q2PEMlfVx/xKDMbM+tW8ftRoHNW98D137pD8ImJc2CGSf7Nq5+Xosa4GmEjmwTGYGjwe+j11DUBnns/7ZJGcy+UBteiMp9lafJj+cM9ZeYXcUK4+P6HlGrlykLjMLLhfRjNaIASeGX6hkbIHLDkZvj2TeLSobzUmuV/lJoKrsauG1+b6z1bahVLO8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(55112099003)(22082099003)(10067099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWxQMnlvOVA0UU1sWVNiTTBmUis1dXlLZTFlcFBpc0NqdlJPS1hiN2E1d1ZL?=
 =?utf-8?B?ckcrbDJaUHJMTXo5OE55S0JSZmtPdXBuM05XVlozVzZWYy9MLys5SUttRmNy?=
 =?utf-8?B?MTM1aytURlkyQWtWTGdZa1JwWUNoQ1pnVzkyVFlZZFFWVkllMW9pa043L0RZ?=
 =?utf-8?B?N3lGdVgwQnpPakhFc3lQWWtlZzhPVjRZQ2ovQ05kYmtEeFRLZmtMU1lEVmo5?=
 =?utf-8?B?eDJsVWJTTXZqTHBCSFRiRXpra3FFbHRDZTFnd0RZUzZHaHQrZ1h5UmlzMFVN?=
 =?utf-8?B?bVdwV016djE5UTVaVitTZjJYM0RWU0pidTY3MzZaV1VobnM1WEVOYU56ZTE3?=
 =?utf-8?B?NCs0MW9EWkd6OVBGYjA0eHN2NTdINk03ZjNSTnhPcUszSHBJQjQ1dUpiYk1X?=
 =?utf-8?B?Z0dlb3RCSXQwOGE4bTJxazRDMkN0WXE0V3REdXZqZWM1bDVzMGdyUlVLMlJ1?=
 =?utf-8?B?NzI2d2FzQmJlSzZBakNkODBLT0ZZSVNGb2dxaTVLTzVoak05L010cFUwMThE?=
 =?utf-8?B?VmNBRVZ5RGQ2QjI4dEtRSnYrdmVuRUtSUStzUkVzTlo1RDR5SUFhV3Y0VUpU?=
 =?utf-8?B?TzdOZmFZaXBZbWhtWnZGNnJ5Z1ozM0Q4ejhWd3RPdnhLZERPNEQ0eU9Obzl6?=
 =?utf-8?B?YTV6cG9XSm1PTm1RME10V0RWSE9uUFM1TXZFSEY4b29SSzl5MElUQTRYN1Q1?=
 =?utf-8?B?eW4wT1BJV0MwTkxVRFBTOTdvdEJoRjdYZEg1bUJqVGNIRFo1MllCVmUxLzVW?=
 =?utf-8?B?bkQ4WFRPS2RTTTF4NlVrUFpZWGlvdWZsWnI2a2UwSWs2ZythbjFCWFZpNXhF?=
 =?utf-8?B?OG83eXcvbDBRMnJleS9BVHZTRld3ck9id2wzcjQrMGVHTFJpZkRubGxXcVFv?=
 =?utf-8?B?UnkzYXBnZFZma280L2VtYjNtblhjTWlCK0lKT3czVmFxbERzQ2pab2VWcGli?=
 =?utf-8?B?TzY5Z2FzcS9pQVBEOUxvZFlFQ1BwSitQZDBUZFdleGY0VFpuWXpTRWJNOHNy?=
 =?utf-8?B?MGhBOGNuWlFURThCTDRNWGRhcFBWY0RKTGpkVnhCRk9qeU14ZWJBMER6QXpG?=
 =?utf-8?B?MW81WWNCYm9aR2tQMG40RVlkTzB4SFZIZkJ1aUdNajgxenJHNEhSdmUrNlZw?=
 =?utf-8?B?RjdUNzVYcUgwemt2TTZOVEo3VDVnbUVOazBDTVNZVERmWEFodVlDZnFKbHlX?=
 =?utf-8?B?VnlzbVkvem00d1NBaEg1cDhaUGhzSitZTlduUTJIY3pWbWZjMXRDMXBUeExj?=
 =?utf-8?B?MGNPVjZjL2hXNEI2UjZ0VHJPME90RFV0UW41NHlVOVROViswT0ltbVNPY1BP?=
 =?utf-8?B?dndvRXpCMkQ4dFJmUXJXaU0yVVlZQml3NUVDODdaWHFzT3VjNDJUUzZjV3Z3?=
 =?utf-8?B?aDU4R0t4a0ppWXlGeEdjODZsL1ZIOHUxaDUyRmNkbzRLckczTmxwMjFNRzBj?=
 =?utf-8?B?eGM4VjZjVGVFWkdaSlB5SGdSUkZENE9GU3Eza3RaS0ZVajZFbGZlWURIMTY0?=
 =?utf-8?B?RmN3MWpYOUtRQUlzSnhtRmIzaDV3VmJLWG4wSTJ0YWFxbEhmamo3ZGtNY0Rt?=
 =?utf-8?B?MitsbmhkWDBHb3hXZ0FoVmZqTTZNVzdUNWJnMHdXanUzUHIvb2VEMks1SFVi?=
 =?utf-8?B?M3FTMllWUTI5aGVDQ3orWjdOeWhScHdWdzQ0VzFHWFd5eDFjN1pCdFZFMW4w?=
 =?utf-8?B?RE1FSU90UkFheVRFYVl3SXVML3RJNG1jTVBVYkhtV05YRS9UWlhXbFRIOFZw?=
 =?utf-8?B?RUxUVzBjc0RaQlpMNnVXTTRhbDlIcThpcVhQbVBQdit4SzJBTWRCNVFGTTlK?=
 =?utf-8?B?N0xrbEoyRXRzMEJBY1VZTTdsR1FOcCtNV0FuczcvQmhWV3hmck83d3BES3lX?=
 =?utf-8?B?dDc0bzNRV0VxWkhYaFNUWkNGYzNSVTY2YkFhdW4zYXluZFpKQUQ1bWorU3hz?=
 =?utf-8?B?U3JpS0JUNXYyWDB6SzU3OFhUNk9IQkhwL2tYcDZWRklpc1lpNG9HQ09GNEdi?=
 =?utf-8?B?bjJ2RGVYWDdSMXZmaUpXMGgvc25nalhHVERDV3F5eFQ3QWNaS2FlaUNnU0Zp?=
 =?utf-8?B?QXJwWWVrV1JLcEp4WnMzK2x5b09yeFF0YWo3MGdrb0M5bFRZZlljSER0REZE?=
 =?utf-8?B?SjUrVG8xc1c5NEUrSmkvbCtkOW01SUUwclJ4WDd0Y1NQZTJSRUV5UVFkS1l6?=
 =?utf-8?B?WnpqSXJaR2pGSVFpWmtlWFpBSUo0NnZpN0lhZFhna1g1UktUL2xwaHlkcGgz?=
 =?utf-8?B?S1F1UVhaOTRTMkxsZjBJWnA2TWN0WUpGZ2RvUXl3NXlpa1RJZDdJT29heWg5?=
 =?utf-8?B?bXpkUWxvcUUrOGl5UDU5czZDdFJyMG53MWt6UDN2bXpxdmtCYU5qQT09?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f39857d-06f5-44a5-f723-08df25d7f88f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 07:36:03.5888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tofgw2iLjiP4K5WEc2AvhDG72kw3diUIl4f+LQ6HKsryRiztjnpF++lDC5cJ4OO/TgBQ1C1pISdBRPdJUO8enw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR03MB989279
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_083611_570792_A090B39E 
X-CRM114-Status: GOOD (  20.62  )
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

RnJvbTogVHplIFllZSBOZyA8dHplLnllZS5uZ0BhbHRlcmEuY29tPgoKQW4gb3BlbiAvZGV2L210
ZFggY2FuIG91dGxpdmUgdW5iaW5kLiByZWZjbnQgZGVmZXJzIGRldmljZSB0ZWFyZG93biwgYnV0
CnRoZSBkcml2ZXItb3duZWQgb2JqZWN0IGVtYmVkZGluZyBtdGRfaW5mbyAoYW5kIGl0cyBidXMg
cmVzb3VyY2VzKSBtYXkKYWxyZWFkeSBiZSBnb25lIHdoZW4gcmVtb3ZlKCkgcmV0dXJucyDigJQg
VUFGIGZvciBwYXJlbnQtZGV2bSBhbGxvY2F0aW9ucy4KCkFkZCBvcHRpb25hbCBjb3JlIGhvb2tz
OgoKLSBtdGQtPl9mcmVlKCk6IGNhbGxlZCBmcm9tIGtyZWYgcmVsZWFzZSBzbyB0aGUgYmFja2lu
ZyBvYmplY3QgbGl2ZXMgdW50aWwKICB0aGUgbGFzdCByZWZlcmVuY2UgZHJvcHMKLSBtdGQtPnJl
bW92ZWQ6IHNldCBhZnRlciBkcmFpbmluZyBvcHM7IGNvcmUgcmV0dXJucyAtRU5PREVWIGZvciBo
dyBvcHMsCiAgbmV3IG9wZW5lcnMsIGFuZCBzdXNwZW5kL3Jlc3VtZQoKU2lnbmVkLW9mZi1ieTog
VHplIFllZSBOZyA8dHplLnllZS5uZ0BhbHRlcmEuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBO
ZXcuCi0gRHJvcCB0aGUgc3BpLW5vci1sb2NhbCBrcmVmIGFuZCBub3ItPnJlbW92ZWQuCi0gQWRk
IG10ZC0+X2ZyZWUgYW5kIG10ZC0+cmVtb3ZlZCBpbiB0aGUgY29yZSBzbyB0aGUgYmFja2luZwog
IG9iamVjdCBvdXRsaXZlcyB1bmJpbmQgYW5kIGxhdGVyIG9wcyByZXR1cm4gLUVOT0RFVi4KLS0t
CiBkcml2ZXJzL210ZC9tdGRjb3JlLmMgICB8IDIwICsrKysrKysrKysrKysrKysrKysrCiBpbmNs
dWRlL2xpbnV4L210ZC9tdGQuaCB8IDEzICsrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
MzMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL210ZGNvcmUuYyBiL2Ry
aXZlcnMvbXRkL210ZGNvcmUuYwppbmRleCA0OTFhMjdkMDMxNWYuLjU5MTMzODk0YjVlNSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9tdGQvbXRkY29yZS5jCisrKyBiL2RyaXZlcnMvbXRkL210ZGNvcmUu
YwpAQCAtMTE4LDYgKzExOCw3IEBAIHN0YXRpYyB2b2lkIG10ZF9kZXZpY2VfcmVsZWFzZShzdHJ1
Y3Qga3JlZiAqa3JlZikKIHsKIAlzdHJ1Y3QgbXRkX2luZm8gKm10ZCA9IGNvbnRhaW5lcl9vZihr
cmVmLCBzdHJ1Y3QgbXRkX2luZm8sIHJlZmNudCk7CiAJYm9vbCBpc19wYXJ0aXRpb24gPSBtdGRf
aXNfcGFydGl0aW9uKG10ZCk7CisJdm9pZCAoKm10ZF9mcmVlKShzdHJ1Y3QgbXRkX2luZm8gKm10
ZCkgPSBtdGQtPl9mcmVlOwogCiAJZGVidWdmc19yZW1vdmVfcmVjdXJzaXZlKG10ZC0+ZGJnLmRm
c19kaXIpOwogCkBAIC0xMzUsNiArMTM2LDkgQEAgc3RhdGljIHZvaWQgbXRkX2RldmljZV9yZWxl
YXNlKHN0cnVjdCBrcmVmICprcmVmKQogCQltZW1zZXQoJm10ZC0+ZGV2LCAwLCBzaXplb2YobXRk
LT5kZXYpKTsKIAogCW1vZHVsZV9wdXQoVEhJU19NT0RVTEUpOworCisJaWYgKG10ZF9mcmVlKQor
CQltdGRfZnJlZShtdGQpOwogfQogCiAjZGVmaW5lIE1URF9ERVZJQ0VfQVRUUl9STyhuYW1lKSBc
CkBAIC0xMzMyLDYgKzEzMzYsOSBAQCBpbnQgX19nZXRfbXRkX2RldmljZShzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCkKIAlzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciA9IG10ZF9nZXRfbWFzdGVyKG10ZCk7
CiAJaW50IGVycjsKIAorCWlmIChtYXN0ZXItPnJlbW92ZWQpCisJCXJldHVybiAtRU5PREVWOwor
CiAJaWYgKG1hc3Rlci0+X2dldF9kZXZpY2UpIHsKIAkJZXJyID0gbWFzdGVyLT5fZ2V0X2Rldmlj
ZShtYXN0ZXIpOwogCQlpZiAoZXJyKQpAQCAtMTQ3MSw2ICsxNDc4LDkgQEAgaW50IG10ZF9lcmFz
ZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IGVyYXNlX2luZm8gKmluc3RyKQogCWluc3Ry
LT5mYWlsX2FkZHIgPSBNVERfRkFJTF9BRERSX1VOS05PV047CiAJYWRqaW5zdHIgPSAqaW5zdHI7
CiAKKwlpZiAobWFzdGVyLT5yZW1vdmVkKQorCQlyZXR1cm4gLUVOT0RFVjsKKwogCWlmICghbXRk
LT5lcmFzZXNpemUgfHwgIW1hc3Rlci0+X2VyYXNlKQogCQlyZXR1cm4gLUVOT1RTVVBQOwogCkBA
IC0xNzkyLDYgKzE4MDIsOSBAQCBpbnQgbXRkX3JlYWRfb29iKHN0cnVjdCBtdGRfaW5mbyAqbXRk
LCBsb2ZmX3QgZnJvbSwgc3RydWN0IG10ZF9vb2Jfb3BzICpvcHMpCiAKIAlvcHMtPnJldGxlbiA9
IG9wcy0+b29icmV0bGVuID0gMDsKIAorCWlmIChtYXN0ZXItPnJlbW92ZWQpCisJCXJldHVybiAt
RU5PREVWOworCiAJcmV0X2NvZGUgPSBtdGRfY2hlY2tfb29iX29wcyhtdGQsIGZyb20sIG9wcyk7
CiAJaWYgKHJldF9jb2RlKQogCQlyZXR1cm4gcmV0X2NvZGU7CkBAIC0xODM2LDYgKzE4NDksOSBA
QCBpbnQgbXRkX3dyaXRlX29vYihzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IHRvLAogCiAJ
b3BzLT5yZXRsZW4gPSBvcHMtPm9vYnJldGxlbiA9IDA7CiAKKwlpZiAobWFzdGVyLT5yZW1vdmVk
KQorCQlyZXR1cm4gLUVOT0RFVjsKKwogCWlmICghKG10ZC0+ZmxhZ3MgJiBNVERfV1JJVEVBQkxF
KSkKIAkJcmV0dXJuIC1FUk9GUzsKIApAQCAtMjMzMSw2ICsyMzQ3LDggQEAgaW50IG10ZF9sb2Nr
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2ZzLCB1aW50NjRfdCBsZW4pCiB7CiAJc3Ry
dWN0IG10ZF9pbmZvICptYXN0ZXIgPSBtdGRfZ2V0X21hc3RlcihtdGQpOwogCisJaWYgKG1hc3Rl
ci0+cmVtb3ZlZCkKKwkJcmV0dXJuIC1FTk9ERVY7CiAJaWYgKCFtYXN0ZXItPl9sb2NrKQogCQly
ZXR1cm4gLUVPUE5PVFNVUFA7CiAJaWYgKG9mcyA8IDAgfHwgb2ZzID49IG10ZC0+c2l6ZSB8fCBs
ZW4gPiBtdGQtPnNpemUgLSBvZnMpCkBAIC0yMzUxLDYgKzIzNjksOCBAQCBpbnQgbXRkX3VubG9j
ayhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IG9mcywgdWludDY0X3QgbGVuKQogewogCXN0
cnVjdCBtdGRfaW5mbyAqbWFzdGVyID0gbXRkX2dldF9tYXN0ZXIobXRkKTsKIAorCWlmIChtYXN0
ZXItPnJlbW92ZWQpCisJCXJldHVybiAtRU5PREVWOwogCWlmICghbWFzdGVyLT5fdW5sb2NrKQog
CQlyZXR1cm4gLUVPUE5PVFNVUFA7CiAJaWYgKG9mcyA8IDAgfHwgb2ZzID49IG10ZC0+c2l6ZSB8
fCBsZW4gPiBtdGQtPnNpemUgLSBvZnMpCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9t
dGQuaCBiL2luY2x1ZGUvbGludXgvbXRkL210ZC5oCmluZGV4IDhkMTBkOWQyZTgzMC4uMjhmZDk4
YzQxOTNjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9tdGQuaAorKysgYi9pbmNsdWRl
L2xpbnV4L210ZC9tdGQuaApAQCAtMzYyLDYgKzM2Miw5IEBAIHN0cnVjdCBtdGRfaW5mbyB7CiAJ
aW50ICgqX2dldF9kZXZpY2UpIChzdHJ1Y3QgbXRkX2luZm8gKm10ZCk7CiAJdm9pZCAoKl9wdXRf
ZGV2aWNlKSAoc3RydWN0IG10ZF9pbmZvICptdGQpOwogCisJLyogT3B0aW9uYWwgZnJlZSBvZiB0
aGUgZW1iZWRkaW5nIG9iamVjdDsgY2FsbGVkIGZyb20ga3JlZiByZWxlYXNlLiAqLworCXZvaWQg
KCpfZnJlZSkgKHN0cnVjdCBtdGRfaW5mbyAqbXRkKTsKKwogCS8qCiAJICogZmxhZyBpbmRpY2F0
ZXMgYSBwYW5pYyB3cml0ZSwgbG93IGxldmVsIGRyaXZlcnMgY2FuIHRha2UgYXBwcm9wcmlhdGUK
IAkgKiBhY3Rpb24gaWYgcmVxdWlyZWQgdG8gZW5zdXJlIHdyaXRlcyBnbyB0aHJvdWdoCkBAIC0z
ODAsNiArMzgzLDEwIEBAIHN0cnVjdCBtdGRfaW5mbyB7CiAJc3RydWN0IG1vZHVsZSAqb3duZXI7
CiAJc3RydWN0IGRldmljZSBkZXY7CiAJc3RydWN0IGtyZWYgcmVmY250OworCisJLyogU2V0IG9u
IHVuYmluZCB3aGlsZSByZWZzIGhlbGQ7IGNvcmUgcmV0dXJucyAtRU5PREVWIGZvciBodyBvcHMu
ICovCisJYm9vbCByZW1vdmVkOworCiAJc3RydWN0IG10ZF9kZWJ1Z19pbmZvIGRiZzsKIAlzdHJ1
Y3QgbnZtZW1fZGV2aWNlICpudm1lbTsKIAlzdHJ1Y3QgbnZtZW1fZGV2aWNlICpvdHBfdXNlcl9u
dm1lbTsKQEAgLTU0OCw2ICs1NTUsOSBAQCBzdGF0aWMgaW5saW5lIGludCBtdGRfc3VzcGVuZChz
dHJ1Y3QgbXRkX2luZm8gKm10ZCkKIAlzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciA9IG10ZF9nZXRf
bWFzdGVyKG10ZCk7CiAJaW50IHJldDsKIAorCWlmIChtYXN0ZXItPnJlbW92ZWQpCisJCXJldHVy
biAwOworCiAJaWYgKG1hc3Rlci0+bWFzdGVyLnN1c3BlbmRlZCkKIAkJcmV0dXJuIDA7CiAKQEAg
LTU2Myw2ICs1NzMsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbXRkX3Jlc3VtZShzdHJ1Y3QgbXRk
X2luZm8gKm10ZCkKIHsKIAlzdHJ1Y3QgbXRkX2luZm8gKm1hc3RlciA9IG10ZF9nZXRfbWFzdGVy
KG10ZCk7CiAKKwlpZiAobWFzdGVyLT5yZW1vdmVkKQorCQlyZXR1cm47CisKIAlpZiAoIW1hc3Rl
ci0+bWFzdGVyLnN1c3BlbmRlZCkKIAkJcmV0dXJuOwogCi0tIAoyLjQzLjcKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
