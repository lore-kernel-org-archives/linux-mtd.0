Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309ED1061B20
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Mar 2026 19:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3GXzmLmPk7RP8M9qUQ/DCrXdIGdi090UkQWZC6SN6OM=; b=TM91XdxxDKnwf5
	V29Vh5SyM0yZrd6FjmWN9YlPl95kI9TyAkIW63ypO9VDD6EfodG0ZsHymlMhr2Ff+vvYk902URuUY
	YRgaEWBFt+sUaCvow85UbaUnkf0/HIF/ocGtYDwE+0eBWDFNzXO4XRGwx2GrbFgg9PBd3hz13ajkA
	usji+MiAm4TOumTy0ZnB24CsfRLNGOnDwJVfVCw1GD5mpu7BNwkIOpVlLNwAFbu8G8HXgCs0XLTrE
	0+Lp0HDIgRFtxLBP5aFhzPeN+GgyzpjUouSmhzGubEjBXkXICGp2awYd+zyoRLsL3Yn+e1Czjbm/b
	H6RMay0LkZiq+lFKZRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ij1-0000000BoD8-3061;
	Mon, 30 Mar 2026 19:56:39 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Iiy-0000000BoCW-436B
	for linux-mtd@lists.infradead.org;
	Mon, 30 Mar 2026 19:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DxKodlfE/qy50wTTIoFh0/JtUWuugnMax5IT0ygLaV7xdsctGwa7+arUYGoBkaVtNqU1069VvSxptuuOUkNJf9nsZCMQW6pTVHAN+GrpKzujdNpkf9euYd1nDp9bNtWZ+EvpzDRtCUtlTvSHVn+m7m8Q2UlxgxwH/ti6eZdkRoADrCgS20Q5zPtu1+wxVPZmrbqmj3p9j4cFz0i2lPx8CQ2oAeuPTVfcJXn52JZQ1kcN66QlTgvTpwix9v1ruU8EWgkJly4GU4shA+oIimQc+/FyezSM4F1k+419BHRUWgBeSpLh0QMUVX85K3nvQpiZ46t7LOptbdFYkjEQeJIqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4gGIeXbl4uwDSno0tUZnrWynXik5m7JE34TEF/1Rbs=;
 b=lBMniq/qkJu38i6cUwBxVFg0Odi15lUlnDJLARwSczmYaJSCijkWGY26zVwOTNnekD1UzDS+8mhkDHIxjpyiGPqvguf402U4Ko7TgwxTXnTUyPRCaWOjGnZrejOyRKc4VoqmRR09rj5YQjfzggcnXXaJyDP54Z4Tl3SkLtG7TXfWfmh9XaJRBg9iTMBkD3mxn7YPRH+EhP+lwKyUQ9XHa9kfX7Nd0KsXIDZQcQN7u5EZITwEU6wCmxx7rQeAVfKGjMFEpD+0E6AAOZ/vh37NDkATtAgxXE15el0wLLiA84540pLK8HiZBq6BSrB1NZKkngSHaaLDXKWCV1TbzrG85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kontron.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4gGIeXbl4uwDSno0tUZnrWynXik5m7JE34TEF/1Rbs=;
 b=mRLzK7v9mv/b6HCsQ45Ykpd8nDbM8gTIkworI5cxKGoxoIqQGK9nSfTtZHxw0cC2lMJpDRATKIC/67mbfPxk0gwcB2MPfSzaU4U6UGbTCPJJYnGg4gGZzbNq01LtqeD7TggKJgfgXJJEhUPnODX5ibbtjas38juEMx6h7eRSXAw=
Received: from BN1PR13CA0024.namprd13.prod.outlook.com (2603:10b6:408:e2::29)
 by SJ2PR10MB7825.namprd10.prod.outlook.com (2603:10b6:a03:56e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 19:56:16 +0000
Received: from BN2PEPF000044A7.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::1d) by BN1PR13CA0024.outlook.office365.com
 (2603:10b6:408:e2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 19:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A7.mail.protection.outlook.com (10.167.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 19:56:13 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 14:56:08 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 30 Mar
 2026 14:56:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 30 Mar 2026 14:56:07 -0500
Received: from [172.24.233.254] (santhoshkumark.dhcp.ti.com [172.24.233.254])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62UJu2mC1373390;
	Mon, 30 Mar 2026 14:56:02 -0500
Message-ID: <92997069-cbc6-4f45-8b33-b0b5ab1cd356@ti.com>
Date: Tue, 31 Mar 2026 01:26:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 11/12] spi: cadence-quadspi: restrict PHY frequency
 to tuned operations
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
	<tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<praneeth@ti.com>, <u-kumar1@ti.com>, <p-mantena@ti.com>, <a-dutta@ti.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Eberhard Stoll
	<eberhard.stoll@kontron.de>, <s-k6@ti.com>
References: <20260113141617.1905039-1-s-k6@ti.com>
 <20260113141617.1905039-12-s-k6@ti.com> <87zf5nf5g1.fsf@bootlin.com>
 <fdcb19ff-c949-4538-8819-88720e514f04@ti.com> <874inlxde0.fsf@bootlin.com>
 <87zf46cwp9.fsf@bootlin.com>
Content-Language: en-US
From: Santhosh Kumar K <s-k6@ti.com>
In-Reply-To: <87zf46cwp9.fsf@bootlin.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A7:EE_|SJ2PR10MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: ea27fd61-44b8-410a-4b38-08de8e966600
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|376014|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: YUGb24hebC+utm0tT+chdPCp3jMYEaFsC/lkoZG3oYS3OV8sFxQyCT5TXocceDkRdhJYxN2WlXKUNphsb7DlfLIvncqur5TY6xKkkLF8kgXMRieQO2VWskOpWlsrfJoRGjGrpmPf0uuMiyMepXwjkH4eUBqobn+v1ulX+JSIFCPP0dWf3MCsgA+sfqX4FgGJq1TGtoPabEILWeRaqOa5RXPzBcthJVY4zS0VGlrFzthY2jInAkr2ocxnasdWP4h5KIXp0O1I8vxWDjCAT+CdaoFX/ttTwFiCJsrqbilidba0tX2oQ/kgWrNuhK4nnih1OOJG8u2hXcsUajvR+FFgoZlrYTZ6jAxqltppX0vi8A0B8+xN7mTEDRhKqVymZBPTNf+p4kuwRgIUzgPI4FgBETN3D/HmYe/W3Q1CyKfxAIWODWHj0Mepa5yFNDdizzNT9MV7Lc7RMS9Hy2N7gzQKc5YkAAeZGfLvnpsZc1K/AOhPlHhG8+PQshJ+Wm7EF2hYzn/YUq+7q01rE27dmmufm+rcQ3vUvR9WBBhd4txbPwZr5X///BfHt6OaybKRlxSWV+/0TOBBqKqXNp76Qn2nuHmjATL4Z7cl+df5H8RiRQG+1MqujX1i205uLMqi/q+2SJmtNnJtYAKvCJioUk+Q3utDDVffBXTmy7ZUh0lWd/VEvbOQOmCbmYDvsvO4LZYzehDbTuso/Z6UTKNsTMYD8JZLbvkUoYOEkRTbYVNcNmdlAnxGi9FvLyrYlNV8FBuQLygqmr8zWxIXHQqFfG0hog==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xyB1npeEQMeqbsyggglDzy9T3TmiAos/RkMaXdoSNAsGyOnjibtcUY/M819AJxNWIy/aVBDytobGdvlYTU2TGp7RxsgyBJp59KLQi9nCkpAy9jAjKMuN70x2EkmYpGlSvS5hwVKBF/9/1N9xQiDmAEXTwC4bbphKjQNw8DPQUF9pqY+Zb7AbwkanmF6JXWFmvw6F5Cn3hjbG2+x3OgLiDHTOQz5CWC481/0uhlPfCJ0QeMJqpTnb4ain8pPv2Hp1ecALg+vIObd/E7BkmQZd0c91PxKZtee/F78FsgykS1ZkEz/DQyclOsXyVafZ/t2rT9dsy/vl3y7x7HdmthT+DhWcKZaiMtvt3cVmej8dGNUFwT8eiT3WPgfXlxrSukqQpavITdZXXAr8vyllFnTplRfQHJJ/86vrox0QdHHHYf7VH06/gigU5+2zrRVB9R4l
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 19:56:13.9599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea27fd61-44b8-410a-4b38-08de8e966600
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7825
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_125637_118661_CE2FED0C 
X-CRM114-Status: GOOD (  27.00  )
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

SGVsbG8gTWlxdWVsLAoKT24gMTcvMDMvMjYgMjA6NDcsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4g
SGkgU2FudGhvc2gsCj4gCj4gKyBGcmllZGVyIGFuZCBFYmVyaGFyZAo+IAo+IE9uIDEzLzAyLzIw
MjYgYXQgMDk6MjE6MTEgKzAxLCBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPiB3cm90ZToKPiAKPj4gT24gMDcvMDIvMjAyNiBhdCAwMDo1NzowNCArMDUzMCwgU2FudGhv
c2ggS3VtYXIgSyA8cy1rNkB0aS5jb20+IHdyb3RlOgo+Pgo+Pj4gT24gMDUvMDIvMjYgMjM6MTcs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4+Pj4gSGkgU2FudGhvc2gsCj4+Pj4KPj4+Pj4gKwkvKgo+
Pj4+PiArCSAqIFBIWSB0dW5pbmcgYWxsb3dzIGhpZ2gtZnJlcXVlbmN5IG9wZXJhdGlvbiBvbmx5
IGZvciBjYWxpYnJhdGVkCj4+Pj4+ICsJICogY29tbWFuZHMuIFVuY2FsaWJyYXRlZCBvcGVyYXRp
b25zIHVzZSBzYWZlIG5vbi1QSFkgZnJlcXVlbmN5IHRvCj4+Pj4+ICsJICogYXZvaWQgdGltaW5n
IHZpb2xhdGlvbnMuCj4+Pj4+ICsJICovCj4+Pj4+ICsJaWYgKGNxc3BpLT5kZGF0YS0+ZXhlY3V0
ZV90dW5pbmcgJiYgZl9wZGF0YS0+dXNlX3BoeSAmJgo+Pj4+PiArCSAgICAoY3FzcGlfb3BfbWF0
Y2hlc190dW5lZChvcCwgJmZfcGRhdGEtPnBoeV9yZWFkX29wKSB8fAo+Pj4+PiArCSAgICAgY3Fz
cGlfb3BfbWF0Y2hlc190dW5lZChvcCwgJmZfcGRhdGEtPnBoeV93cml0ZV9vcCkpKSB7Cj4+Pj4+
ICsJCWNxc3BpX2NvbmZpZ3VyZShmX3BkYXRhLCBvcC0+bWF4X2ZyZXEpOwo+Pj4+PiArCX0gZWxz
ZSBpZiAoY3FzcGktPmRkYXRhLT5leGVjdXRlX3R1bmluZykgewo+Pj4+PiArCQkvKiBVc2Ugc2Fm
ZSBmcmVxdWVuY3kgZm9yIHVudHVuZWQgb3BlcmF0aW9ucyAqLwo+Pj4+PiArCQljcXNwaV9jb25m
aWd1cmUoZl9wZGF0YSwgZl9wZGF0YS0+bm9uX3BoeV9jbGtfcmF0ZSk7Cj4+Pj4+ICsJfSBlbHNl
IHsKPj4+Pj4gKwkJLyogTm8gdHVuaW5nIHN1cHBvcnQsIGFsd2F5cyB1c2UgcmVxdWVzdGVkIGZy
ZXF1ZW5jeSAqLwo+Pj4+PiArCQljcXNwaV9jb25maWd1cmUoZl9wZGF0YSwgb3AtPm1heF9mcmVx
KTsKPj4+Pj4gKwl9Cj4+Pj4gU2hvdWxkbid0IHdlIGhhbmRsZSB0aGlzIGF0IHRoZSBjb3JlIGxl
dmVsPyBXZSBrbm93IHdoYXQga2luZCBvZgo+Pj4+IG9wZXJhdGlvbiBwYXR0ZXJuIHdlIHByb3Zp
ZGVkLCBzbyBpdCBpcyBlYXN5IHRvIHNldCB0aGUgY29ycmVjdAo+Pj4+IGZyZXF1ZW5jeSBpbiB0
aGUgb3BlcmF0aW9uIHN0cnVjdHVyZS4KPj4+PiBDYW4geW91IHBsZWFzZSBtYWtlIHRoaXMgaGFw
cGVuPyBQZXJoYXBzIHlvdSBjYW4gcmV0dXJuIHRoZSBvcGVyYXRpb24KPj4+PiBmcmVxdWVuY3kg
b25jZSB0aGUgY2FsaWJyYXRpb24gaXMgc3VjY2Vzc2Z1bCAoaW4gdGhlIHJlYWQgYW5kIHdyaXRl
IG9wCj4+Pj4gdGVtcGxhdGVzIG1heWJlPykgc28gdGhpcyBjYW4gYmUgcGlja2VkIHVwIGJ5IHRo
ZSBjb3JlIGFuZCB1c2VkIGZvciB0aGUKPj4+PiBmb2xsb3dpbmcgb3BlcmF0aW9ucy4gVGhpcyB3
YXkgdGhlIGNvbnRyb2xsZXIgZHJpdmVyIG5vIGxvbmdlciBuZWVkcyB0bwo+Pj4+IGNoZWNrIGlm
IHRoZSBvcGVyYXRpb24gaGFzIGJlZW4gdHVuZWQgb3Igbm90LCBpdCBjYW4ganVzdCBsb29rIGF0
IHRoZQo+Pj4+IGZyZXF1ZW5jeS4gV2hlbiB1c2luZyB0aGUgaGlnaGVzdCBmcmVxdWVuY3ksIFBI
WSB0dW5pbmcgbXVzdCBiZQo+Pj4+IHVzZWQvZW5hYmxlZCwgb3RoZXJ3aXNlIG5vdC4KPj4+Cj4+
PiBObywgTWlxdWVsLCB0aGlzIG1heSBub3QgYmUgY29ycmVjdC4gVGhlcmUgY2FuIGJlIGNhc2Vz
IHdoZXJlIGFuCj4+PiBvcGVyYXRpb24gZG9lcyBub3QgcmVxdWlyZSB0dW5pbmcgYnV0IHN0aWxs
IGNhbiBydW4gYXQgbWF4aW11bQo+Pj4gZnJlcXVlbmN5ICgxNjYgTUh6LCBmb3IgaW5zdGFuY2Up
Lgo+Pgo+PiBUaGlzIGlzIGN1cnJlbnRseSBub3QgdGhlIGNhc2UuIEN1cnJlbnRseSB5b3UgdHVu
ZSBmb3Igb25lIG9yIHR3byBvcHMKPj4gKHJlYWQvd3JpdGUpIGFuZCB5b3UgZW5hYmxlIFBIWSB0
dW5pbmcgb25seSBvbiB0aGVzZS4gRG8geW91IHBsYW4gb24KPj4gYWRkaW5nIHN1Y2ggYSBmZWF0
dXJlPyBJZiBub3QsIEkgd291bGQgbm90IGJvdGhlciB3aXRoIHRoaXMgbm93Lgo+Pgo+Pj4gSW4g
c3VjaCBzY2VuYXJpb3MsIHNpbXBseSBzZXR0aW5nCj4+PiBvcC0+bWF4X2ZyZXEgdG8gdGhlIG1h
eGltdW0gZnJlcXVlbmN5IHZhbHVlIGFuZCBkZWNpZGluZyB3aGV0aGVyIHRvCj4+PiBlbmFibGUg
dHVuaW5nIGJhc2VkIG9uIGFuIG9wLT5tYXhfZnJlcSBjb21wYXJpc29uIHdvdWxkIG5vdCBiZQo+
Pj4gc3VmZmljaWVudC4KPj4KPj4gSWYgdGhlcmUgYXJlIHN1Y2ggY2FzZXMsIGNhbiB0aGV5IGJl
IGxpc3RlZD8gSSBhbSBzb3JyeSBidXQgSSBmYWlsIHRvCj4+IHNlZSB3aGVyZSB0aGlzIHdvdWxk
IG5vdCB3b3JrLiBBbnkgZXhhbXBsZXMgdG8gc2hhcmU/Cj4gCj4gSSBkb24ndCBrbm93IGlmIHlv
dSBnb3QgbXkgZmVlZGJhY2sKClNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSAtIEkgZGlkIHNlZSB5
b3VyIGZlZWRiYWNrLCBqdXN0IGdvdCBjYXVnaHQgdXAKd2l0aCBzb21lIGNyaXRpY2FsIHdvcmsu
CgosIGJ1dCBJIHdvdWxkIGxpa2UgdG8gaGF2ZSBhbGwgY2FzZXMKPiBpbiBtaW5kIHRvIGRlY2lk
ZSBpbiB3aGljaCBkaXJlY3Rpb24gd2UgbXVzdCBnby4gRXNwZWNpYWxseSwgSSB3b3VsZAo+IGxp
a2UgdG8gbWFrZSB0aGUgYnJpZGdlIHdpdGggRnJpZWRlcidzIHdvcmsgd2hvIGlzIGFsc28gInBs
YXlpbmciIHdpdGgKPiB0aGUgbWF4aW11bSBmcmVxdWVuY3kuCgpZZXMsIEkndmUgZ29uZSB0aHJv
dWdoIHRoZSBzZXJpZXMuCgo+IAo+IFdlIG5lZWQgdG8gY2xhcmlmeSBvdXIgbWVudGFsIHBpY3R1
cmUgb2YgdGhlIG1heF9mcmVxIGhhbmRsaW5nLiBIb3cgaXQKPiBzaG91bGQgYmUgZGVyaXZlZCwg
aG93IGF1dG9ub21vdXMgc2hhbGwgdGhlIFNQSSBjb250cm9sbGVycyBiZSB3cnQgdGhpcwo+IHZh
bHVlLCBzaGFsbCB3ZSBmbGFnIG9wZXJhdGlvbnMgdGhhdCBjYW4gZ28gZmFzdGVyIGFuZCBpZiB5
ZXMsIGNhbiB3ZQo+IGF0dGFjaCBhIG1lYW5pbmdmdWwgdmFsdWUgdG8gdGhlc2Ugb3BlcmF0aW9u
cywgZXRjIGV0Yy4KPiAKPiBJIGZlZWwgbGlrZSB0aGlzIGlzIHRoZSBwYXJ0IHRoYXQgbmVlZHMg
ZXh0cmEgdGhpbmtpbmcuIFRoZSByZXN0IG9mIHRoZQo+IHNlcmllcyBpcyBwcm9taXNpbmcuIEkg
d291bGQgbGlrZSB1cyB0byBjbGFyaWZ5IHRoZSBuZWVkcywgbWF5YmUgcHJvcG9zZQo+IHNvbWUg
a2luZCBvZiBkcmF3aW5nL3NsaWRlcyBvciBldmVuIHRha2UgaGFsZiBhbiBob3VyIHRvIGRpc2N1
c3MgaW4gYQo+IGNhbGwgb25jZSB3ZSBoYXZlIGFsbCBjYXNlcyBpbiBtaW5kLgoKSSdsbCBuZWVk
IGEgYml0IG1vcmUgdGltZSB0byBnYXRoZXIgc29tZSBpZGVhcyBhbmQgaW5wdXRzLCBzaW5jZSBJ
J20Kc3dpdGNoaW5nIGJhY2sgdG8gdGhpcyBhZnRlciBhIHdoaWxlLiBUaGF0IHNhaWQsIHdlIGNh
biBzdGlsbCBwbGFuIGZvciBhCmNhbGwgaWYgdGhlcmUncyBhbHJlYWR5IGEgcHJvcG9zYWwgdG8g
ZGlzY3Vzcy4KClJlZ2FyZHMsClNhbnRob3NoLgoKPiAKPiBUaGFua3MsCj4gTWlxdcOobAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
