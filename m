Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21ADCD6E6B
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jun 2026 12:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIQSK/EPfh/jOikhmKg+aTdXEXMnuHxI/zCcyaAMa/8=; b=e8yOGbFcgumuec
	GBi86QL7D8Hbh231jf3u0Hiv7UTt6KjE/q4r/fp+x86ql9bUmL9eiSsGge9tZKkLrR3ZzQcYQMQHq
	meHbH4dk3Sqzm2kw4NQduSPSQtviMH/XptvSbm//kWDbo249nz7zNC2MejxisyZ7zjymdbLVBAJLP
	O1aCRXMYQoHENK8Pvs9MK854DY93Hp8RpA2FIPkqq/1S6ybAXLjN3Qai6l5BUEvdv9OnKXe6VUFUh
	rNJndr/Xli68VkiKcmfnP5DF7kbnluOgVwC6/EsG9hTUAyIZ8yTiB9yM/8pGd2L25pByW1DKgtW7N
	WXvLv0I7GQkwIcqztJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6uH-0000000GhYy-3niz;
	Thu, 04 Jun 2026 12:10:41 +0000
Received: from mail-eastus2azon11010050.outbound.protection.outlook.com ([52.101.56.50] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV6uF-0000000GhY6-2xrB
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jun 2026 12:10:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/MANT1qliroruP1lGE8mRgrNCJUOTmmhHC9zroIpG1itQ2oSU7DIcIZyweBbcxnMC8kFXDVQNawuIYYSyi30rIuehfHV80FQk4Ppou/w7iCzRLKF9zRlSNN8PuXB5aAc3lLImLsmN8elcHvobLoWsXjGOx6YuQYq/nAVAxRrSmedbjx4nCvDivHBj9Jrgq1PoBx3tZz/9t/AYe24offdOz4fJFjeQaoKMdL45nXvjhEwdGeohKvUWZ854n8GDrJKyDRq5ab0TuHulHib+1D3+nbd2l46PBUMi4N6KVNO2m3KsOiEruIcKuBQLRDq5TpR3sYwBNMx/vw748gs2OqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhwwG0O90c7WQanZpT4mOZebDfSvyLZ5d6JTDNy1MnY=;
 b=YO7+5UmHVplfBntLghVRKgdzIJGnmkVX8mg51oRIC3wYMxiWivNn95y+0E3FlC5mYASJ3WVIKoJeQ3wWkkZ0nd1CZdHK+OhOF2VRPy/e9gdqdQHx6B44YNJVPrIL1CTF3eRyzJMgZOw0enGiUf2gKcM5auIKCOmilRY01Lw4FxEjfqGtPTZY9QQBMuwREscWJh1IkylwN9MO+DsA9wCt3PPiOZfCLc8wLCmj3dXry2bpjjXtehPgm0V9+3td9N3pv02/uIf93DvBYabCjPE78dJgw3M8xETVY6wViMe4mXv+iFpWTnkGH4M/HEMe8rwS4yUwrhure5BEDzJG+4lDVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhwwG0O90c7WQanZpT4mOZebDfSvyLZ5d6JTDNy1MnY=;
 b=DbbtuoiDXc7HBWwt20riRkSnh4obKagDW4DFwe8S+SloOZXP3tYWpLPrdqbMbuF6SFm1OQBDdsZA7Q8E6Z4wCzD0/IFlMUeN1qJmD9XGuWWj7uJzK3g2QwQnHbCBh39r4CYz0t6oCWkuio8mICGWP3RtS1saAUI+t2mcHtnl5ys=
Received: from CH2PR19CA0027.namprd19.prod.outlook.com (2603:10b6:610:4d::37)
 by PH8PR10MB6412.namprd10.prod.outlook.com (2603:10b6:510:1c7::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 12:10:35 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::8c) by CH2PR19CA0027.outlook.office365.com
 (2603:10b6:610:4d::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 12:10:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 12:10:34 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 07:10:32 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 07:10:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 4 Jun 2026 07:10:32 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 654CARCp3334378;
	Thu, 4 Jun 2026 07:10:27 -0500
Message-ID: <354e81b1-3070-439b-b404-20a2c30bd774@ti.com>
Date: Thu, 4 Jun 2026 17:40:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] spi: spi-mem: add spi_mem_apply_base_freq_cap()
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <a-dutta@ti.com>, <s-k6@ti.com>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-5-s-k6@ti.com> <87fr3bhqkk.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87fr3bhqkk.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|PH8PR10MB6412:EE_
X-MS-Office365-Filtering-Correlation-Id: fd936aff-9a05-49be-5f6c-08dec23247ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|376014|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: vrMAdnEenYIVVN7PiPDKNIgCN5Q0bGPHI3gBtfz4vz+/rg5KJ0NsLYfQOngujhx6P6Wtwi8xIxngl/ZiRagzrwJO//czZIB1AoZOJlpVpgwP/ercdp+Gp3RmH7JvQVWV4CC/yRtRr5c4OyBkTU+WnYZcnsEXzb7Euvejd9i3lpEGnMs4mqvx3rRpfVCa1qKkFtL+hQua7NlJ5TVWicmH+c/9Fyi+tBVe52dx7TXqG3ltTYbCrLeFM6jRdYO2egmxLSFWMNSP9c3kmCb8ebRvwQ73OQsbWwjCoSjzPPRcDDLEjqAu/Rc6YjpGyqI8DTM1cq5X3muKN6EGbmSLi3dOO08SzDSRMgCKZZD2cFYW+1LK9u2HSPDdIjZkhi3/S7fxEdPydBUzXirFgyNmJrKS1yJkDsHN6CSbMMUdKuapyrVKVgMxgBRUGYuSmmp0brdRCqDWEmB4ttftnxi2nSjLc0X1Dt5PM9Qo70Fl/Tyk0jYGQx6XF2y0btsBftajsrmy8JcMuUwV8efFiuefSiTUHsN+0a/yS35hfNyhPGYSBUZjdMNROy+UNFpnM97TmWGa+ieOh7HOGEyopYXVLKVJTZU9LnIuv5nJFqOxxgRnwTffxWxZy29Gy2FJWFQq3MBN5Nlz4oM3vGOr5xJQ+hOHVDXgs7MmcuKWaf9RUm6fEVXU+YWTSSVa4VCgmdpcK04AYH/R9UIkvONbBTMkrEvf04SsMcmL8fSqff+fIWcsy9E=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(376014)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: J5DOqjoS2lwCYlOWFgH9Re5BAkVNdVXKHakYNtm4yzJjgylpOT9H1ilZDB9rNasrzBZne3RkLggalBtq+yEeJ2vPb8imISi7/9A8emzccJdbyVkgYfCmKLW8SJ/DjuucjmtnXN/ACy/US4pePoo+yrV8NoEPe/jNRwV8o4XANZRI3mbCZrVMNHXMUAukiypSWb7SQsfUeA6Tn1KD9Sg3AExptq0j0GBIpNWhQZKgeiRrVHIBC0QKBStUHWXlbnlOxJQCqpPWKoSTuE8J7p8LCd8IGLCt5zv2jpMC1ZuBbxGz+eRMfmjnLHzufBk5ovUyPykfBR5eIcElkPeNZfhyFd5lTX8sopSw9x52F9Apz71hkkUFEU8H20gbpPiqlJ/pwLH219xYj5o60Q9gjsdgsWm8Arlbw+RgUEU6HdPgwByXHOkChR8ZGp48o5KqVyWt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 12:10:34.2948
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd936aff-9a05-49be-5f6c-08dec23247ea
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6412
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_051039_751278_5AD97CB7 
X-CRM114-Status: GOOD (  12.74  )
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

SGVsbG8gTWlxdWVsLAoKT24gMjgvMDUvMjYgMTQ6MTMsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgU2FudGhvc2gsCj4gCj4+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1tZW0uYwo+PiArKysgYi9k
cml2ZXJzL3NwaS9zcGktbWVtLmMKPj4gQEAgLTM5OCw3ICszOTgsMTEgQEAgaW50IHNwaV9tZW1f
ZXhlY19vcChzdHJ1Y3Qgc3BpX21lbSAqbWVtLCBjb25zdCBzdHJ1Y3Qgc3BpX21lbV9vcCAqb3Ap
Cj4+ICAgCXU4ICp0bXBidWY7Cj4+ICAgCWludCByZXQ7Cj4+ICAgCj4+IC0JLyogTWFrZSBzdXJl
IHRoZSBvcGVyYXRpb24gZnJlcXVlbmN5IGlzIGNvcnJlY3QgYmVmb3JlIGdvaW5nIGZ1dGhlciAq
Lwo+PiArCS8qCj4+ICsJICogT3BzIG5vdCBjb25maWd1cmVkIGZvciBtYXhpbXVtIHNwZWVkIGFy
ZSBsaW1pdGVkIHRvIHRoZSBjb25zZXJ2YXRpdmUKPj4gKwkgKiBiYXNlIHNwZWVkOyBzcGlfbWVt
X2FkanVzdF9vcF9mcmVxKCkgdGhlbiBjYXBzIHRvIHRoZSBkZXZpY2UgbWF4aW11bS4KPj4gKwkg
Ki8KPj4gKwlzcGlfbWVtX2FwcGx5X2Jhc2VfZnJlcV9jYXAobWVtLCAoc3RydWN0IHNwaV9tZW1f
b3AgKilvcCk7Cj4+ICAgCXNwaV9tZW1fYWRqdXN0X29wX2ZyZXEobWVtLCAoc3RydWN0IHNwaV9t
ZW1fb3AgKilvcCk7Cj4gCj4gVGhlcmUgYXJlIG1hbnkgbW9yZSBzcGlfbWVtX2FkanVzdF9vcF9m
cmVxKCkgY2FsbHMgaW4gdGhlIGNvcmUgd2hlcmUgd2Ugd291bGQKPiBub3QgYXBwbHkgdGhlIGJh
c2UgZnJlcXVlbmN5LiBBcmVuJ3Qgd2UgbWlzc2luZyB0aGVzZSBwbGFjZXM/IFdvdWxkbid0IGl0
Cj4gYmUgbW9yZSBhcHByb3ByaWF0ZSB0byBjYWxsIHNwaV9tZW1fYXBwbHlfYmFzZV9mcmVxX2Nh
cCgpIGF0IHRoZSBiZWdpbm5pbmcKPiBvZiBzcGlfbWVtX2FkanVzdF9vcF9mcmVxKCkgPwoKTW92
aW5nIHNwaV9tZW1fYXBwbHlfYmFzZV9mcmVxKCkgaW50byBzcGlfbWVtX2FkanVzdF9vcF9mcmVx
KCkgd291bGQKYWZmZWN0IG9wZXJhdGlvbiBzZWxlY3Rpb24uCgpzcGlfbWVtX2FkanVzdF9vcF9m
cmVxKCkgaXMgdXNlZCBkdXJpbmcgdmFyaWFudCBldmFsdWF0aW9uIHRocm91Z2gKc3BpbmFuZF9z
ZWxlY3Rfb3BfdmFyaWFudCgpIGFuZCBzcGlfbWVtX2NhbGNfb3BfZHVyYXRpb24oKS4gQXBwbHlp
bmcgdGhlCmNhcCB0aGVyZSB3b3VsZCBjYXVzZSBhbGwgY2FuZGlkYXRlcyB0byBiZSBldmFsdWF0
ZWQgYXQgYmFzZV9zcGVlZF9oegpyYXRoZXIgdGhhbiB0aGUgYWN0dWFsIG1heF9zcGVlZF9oei4g
QXMgYSByZXN1bHQsIHZhcmlhbnQgc2VsZWN0aW9uCmNvdWxkIGNvbnZlcmdlIG9uIGEgZGlmZmVy
ZW50IG9wZXJhdGlvbiB0aGFuIHRoZSBvbmUgdGhhdCB3b3VsZCBiZQpvcHRpbWFsLgoKS2VlcGlu
ZyB0aGUgY2FwIGluIHNwaV9tZW1fZXhlY19vcCgpIHJlc3RyaWN0cyBpdCB0byB0aGUgZXhlY3V0
aW9uIHBhdGgsCndoaWxlIGFsbG93aW5nIG9wZXJhdGlvbiBzZWxlY3Rpb24gYW5kIGR1cmF0aW9u
IGNhbGN1bGF0aW9ucyB0byBjb250aW51ZQp1c2luZyB0aGUgbWF4aW11bSBhY2hpZXZhYmxlIGZy
ZXF1ZW5jeS4KClJlZ2FyZHMsClNhbnRob3NoLgoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
