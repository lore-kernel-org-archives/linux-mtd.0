Return-Path: <SRS0=boQ/=4Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20175C3F2D0
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 06:47:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E79762469C
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Feb 2020 06:47:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ejiPYD+2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nokia.onmicrosoft.com header.i=@nokia.onmicrosoft.com header.b="tKEdVUpf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E79762469C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nokia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1i8AMdONqj3CGCJn5lbXUXxF5ZIFQPwCNTfpv0ic9g=; b=ejiPYD+2g+3d4u
	CgVDrKW/OSsBGRjmWnXo+at5r6p3GiwKwN6Ji0Pd4+QMdf6kHKxswK8eD5DFvgkjC/GbWqbLZySeN
	lREiXi44/zAvpmshvC3BWvymSBKjSFXaVZ2dl6rs63IQBBmfXymXQILQ/oQLa00gVWl5eYPJi9Qf6
	f5Epmkap/b5WMmMOXLbx83y2yMRID1AuyxZtkVW5O1uix7i+nbk3iZw9lWq2sC2x3wiFB248WrnUW
	X/AW71zP/xBxbLBmDGg6qSEOaHQitVvribGbprm/HWBelHTo+I7TCvGs/zfNDuAfKE8wJ/YU0NHGM
	E40Cs8wAO+Zw7PcRKHOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7ZQ9-00055g-Eu; Fri, 28 Feb 2020 06:46:49 +0000
Received: from mail-eopbgr80122.outbound.protection.outlook.com
 ([40.107.8.122] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7ZPd-0004bP-9w
 for linux-mtd@lists.infradead.org; Fri, 28 Feb 2020 06:46:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D5f4b38SKBV1KU6ucy/E4h6FQKd61IuTAlaAeD/CJE20Jimoqgne4soVEP71Y2WNlo5gSFBJ69egXknJhG5xbflakN+GB1cpE1KrSF0P2SmhQ1VfZqEtzKas++mg/jMMSElnilwlvctqMJX2imwK9NL9+Ylhv1zwx4Kex6yiScdzlaHqjSgbtwNjiIK7+tf+NC39xRNr5rOZanaUTEFzQzwV8FT90+lcCCbVYe+9KWrNKWaODvvLfhGvqSsCRa1YTt8EkvBZSCs1J0JOsb73QDFfrL3ZZcOCVGndTeZSDmDoxTKJfQXqaxaWSZfVEWMt6hyXptwvkabktU5rKw9XLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EV9Axk5gqWSfJp/klgutHTSYhdHwZnK5WYbv0YHcanc=;
 b=gEoL8mCepyydbmyGV39m2cYTdqB38+O6HBrUsZGzUIwe2/EIje7SdN7WgAbbW1LTZWy/jyL07O6BQfsB9ndViP4rrudOt8sz3VM12TRtcyR2qRgtqCff5Mn9CZpdV0MRA9oc6zDbzl7987D8aMiF7X5/QiIwYAmvPf/LO0N5vXZV1R+3D8rakuFplORNIjorQSfvIPR6mXR09ONtAUyKHKDZCjxKSzEiStfgI/cqFXHXDUqDrEyWepRplos4aHa2TBH10I2JZAAYdrBqsByjodgg1oSFz7E9t/bvzlyI55wZwjm9HTAxSrBouVD33pmAujgySc1LaJgVZLARUs1ilQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
 s=selector1-nokia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EV9Axk5gqWSfJp/klgutHTSYhdHwZnK5WYbv0YHcanc=;
 b=tKEdVUpfvJynLiml0KHepRFMw+6Y7crR/3brslAU5CToDL6zV1Z32gEbpG0T6kABtQX5zM1zvnCl8x++Q+QvATF0p+kYVRkf3jpoADcjN2u/CWEY82+RSgql21+Y/KPkvK2XUQ5PEq4tTlLxOvdUZEp1K1XZJtXJyyPKz/rPxt4=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=alexander.sverdlin@nokia.com; 
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com (20.177.203.20) by
 VI1PR07MB4912.eurprd07.prod.outlook.com (20.177.200.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.9; Fri, 28 Feb 2020 06:46:14 +0000
Received: from VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd]) by VI1PR07MB5040.eurprd07.prod.outlook.com
 ([fe80::f5f9:e89:3fef:2ffd%7]) with mapi id 15.20.2772.012; Fri, 28 Feb 2020
 06:46:14 +0000
Subject: Re: [PATCH] mtd: spi-nor: Fixup page size and map selection for
 S25FS-S
To: "chenxiang (M)" <chenxiang66@hisilicon.com>, linux-mtd@lists.infradead.org
References: <20200227123657.26030-1-alexander.sverdlin@nokia.com>
 <18cdef63-75e3-97c3-2a22-4969d4997af9@hisilicon.com>
From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Message-ID: <60b272c1-ab6a-7a7a-6f56-03d7c7daf8bc@nokia.com>
Date: Fri, 28 Feb 2020 07:45:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
In-Reply-To: <18cdef63-75e3-97c3-2a22-4969d4997af9@hisilicon.com>
Content-Language: en-US
X-ClientProxiedBy: HE1PR09CA0046.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::14) To VI1PR07MB5040.eurprd07.prod.outlook.com
 (2603:10a6:803:9c::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ulegcpsvhp1.emea.nsn-net.net (131.228.32.167) by
 HE1PR09CA0046.eurprd09.prod.outlook.com (2603:10a6:7:3c::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14 via Frontend Transport; Fri, 28 Feb 2020 06:46:09 +0000
X-Originating-IP: [131.228.32.167]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7aefbff8-cc4a-491f-66b7-08d7bc19e7cd
X-MS-TrafficTypeDiagnostic: VI1PR07MB4912:
X-Microsoft-Antispam-PRVS: <VI1PR07MB49120E1FD34453C4C1D24DE288E80@VI1PR07MB4912.eurprd07.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 0327618309
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(346002)(396003)(39860400002)(136003)(189003)(199004)(6486002)(8676002)(81166006)(8936002)(52116002)(966005)(956004)(6666004)(26005)(44832011)(81156014)(5660300002)(6512007)(53546011)(36756003)(2616005)(7416002)(16526019)(6506007)(66476007)(66556008)(66946007)(54906003)(31696002)(2906002)(478600001)(186003)(86362001)(4326008)(316002)(31686004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR07MB4912;
 H:VI1PR07MB5040.eurprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: nokia.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SmXJA+P715+++PuEjnPUEEwpzB3dWrlr6RuCdDHT/nBiPBewGc7IH3o3rO58YFvWE1PClLkPUUSpAwPxpJHjrMCE/AEwlj8iz++qvnc6BMez1c7ymRjcdHq5kzds+LD/CuOzzoswdcxtYQkCP+ZPdQx2numR4sCMXY8EM9ItJOLEGtCclL/vSp3r52Rz+K18QS9nqnhXT7mk7nka/EqEKeedsRin2swyI9N+aUNaEeKlUQ9eZ5J957RtJwSBmZWHQSPHZegaum3u51xy9xw+yarLDVDP3MCPBpUNaFNG+8wJwhshZKSNS96TyVWMHS2G6ilGY4SYFGL5LlDVXR5P6yAehgfX70XnKIRQZL9So9HTQ98+PFpKN6dzlD07dfYxAzWmH/QgKfQD7CIS/J3orn+97584hOo5l5k6hs/WRpeuw/G7zelcSSei8R1AB46u8FUk3vfZd+dDfoSqaHukXFtVuil0QPD4ivWkxK2b8WLlw+GsufRc351gDgG8+0gZn2EwsDGEHchvGgm/7JOGvw==
X-MS-Exchange-AntiSpam-MessageData: 0O57UeFA3OCtjRo/0xGYZTfVrB97KQdfg/SM8CvY5ADMQY+zTIUR71uzgGD2fD1LrbcGXl5hnGfdb5B3o0wVU8myvBMWFszgnh2V+PM9YBg88Mwek/VuCFfy17nYeLGjL4UekTRQkE/YOJkyLIrufg==
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aefbff8-cc4a-491f-66b7-08d7bc19e7cd
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2020 06:46:14.6716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /QSE5EJynjEsHOUKZvOJh7F5m1HA8pL461JujW1CozU7sxUEsEmWIgDpUbUs3qXkF3dUjBrfFv6y947UaH0xU4q8x2jAA9RwcIe3Qs53EAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB4912
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_224617_430771_33322A58 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, John Garry <john.garry@huawei.com>,
 stable@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkhCgpPbiAyOC8wMi8yMDIwIDA0OjAxLCBjaGVueGlhbmcgKE0pIHdyb3RlOgo+PiBKRVNEMjE2
wqBhbGxvd3PCoCJ2YXJpYWJsZcKgYWRkcmVzc8KgbGVuZ3RoIsKgYW5kwqAidmFyaWFibGXCoGxh
dGVuY3kiwqBpbgo+PiBDb25maWd1cmF0aW9uwqBEZXRlY3Rpb27CoENvbW1hbmTCoERlc2NyaXB0
b3JzLMKgaW7CoG90aGVywqB3b3Jkc8KgImFzLWlzIi4KPj4gQW5kwqB0aGV5wqBhcmXCoHN0aWxs
wqB1bnNldMKgZHVyaW5nwqBTZWN0b3LCoE1hcMKgUGFyYW1ldGVywqBUYWJsZcKgcGFyc2luZywK
Pj4gd2hpY2jCoGxlZMKgdG/CoCJtYXBfaWQiwqBkZXRlcm1pbmVkwqBlcnJvbmVvdXNsecKgYXPC
oDDCoGZvcizCoGUuZy7CoFMyNUZTMTI4Uy4KClsuLi5dCgo+PiBAQMKgLTI1NzAsN8KgKzI2ODcs
OMKgQEDCoHN0YXRpY8KgY29uc3TCoHN0cnVjdMKgZmxhc2hfaW5mb8Kgc3BpX25vcl9pZHNbXcKg
PcKgewo+PiDCoMKgwqDCoMKgwqB7wqAiczI1c2wxMjgwMCIswqBJTkZPKDB4MDEyMDE4LMKgMHgw
MzAwLMKgMjU2wqAqwqAxMDI0LMKgwqA2NCzCoDApwqB9LAo+PiDCoMKgwqDCoMKgwqB7wqAiczI1
c2wxMjgwMSIswqBJTkZPKDB4MDEyMDE4LMKgMHgwMzAxLMKgwqA2NMKgKsKgMTAyNCzCoDI1NizC
oDApwqB9LAo+PiDCoMKgwqDCoMKgwqB7wqAiczI1ZmwxMjlwMCIswqBJTkZPKDB4MDEyMDE4LMKg
MHg0ZDAwLMKgMjU2wqAqwqAxMDI0LMKgwqA2NCzCoFNQSV9OT1JfRFVBTF9SRUFEwqB8wqBTUElf
Tk9SX1FVQURfUkVBRMKgfMKgVVNFX0NMU1IpwqB9LAo+PiAtwqDCoMKgwqB7wqAiczI1ZmwxMjlw
MSIswqBJTkZPKDB4MDEyMDE4LMKgMHg0ZDAxLMKgwqA2NMKgKsKgMTAyNCzCoDI1NizCoFNQSV9O
T1JfRFVBTF9SRUFEwqB8wqBTUElfTk9SX1FVQURfUkVBRMKgfMKgVVNFX0NMU1IpwqB9LAo+PiAr
wqDCoMKgwqB7wqAiczI1ZmwxMjlwMSIswqBJTkZPKDB4MDEyMDE4LMKgMHg0ZDAxLMKgwqA2NMKg
KsKgMTAyNCzCoDI1NizCoFNQSV9OT1JfRFVBTF9SRUFEwqB8wqBTUElfTk9SX1FVQURfUkVBRMKg
fMKgVVNFX0NMU1IpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAuZml4dXBzwqA9wqAmczI1
ZnNfc19maXh1cHMswqB9LAo+IAo+IEl0IHNlZW1zIFNGRFAgaXMgbm90IHN1cHBvcnRlZCBvbiBz
MjVmbDEyOXAgKHlvdSBjYW4gY2hlY2sgaXQgb24gaHR0cHM6Ly93d3cuY3lwcmVzcy5jb20vZmls
ZS80MDA1ODYvZG93bmxvYWQpLCBzbyBpcyBpdCBuZWNlc3NhcnkgdG8gYWRkIHRoaXPCoGZvcsKg
dGhpc8KgdHlwZcKgZmxhc2g/CgpZZXMsIGFsbCBvZiB0aGUgYWJvdmUgaXMgbmVjZXNzYXJ5IHRv
IHJlcGFpciBTMjVGUzEyOFMsIHdoaWNoIHN1cHBvcnRzIFNGRFAgYW5kIGxhbmRzCmluIHRoZSBh
Ym92ZSB0YWJsZSBlbnRyeS4KCi0tIApCZXN0IHJlZ2FyZHMsCkFsZXhhbmRlciBTdmVyZGxpbi4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
