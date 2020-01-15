Return-Path: <SRS0=8YuD=3E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C62C33CB2
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 16:52:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 795C0214AF
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jan 2020 16:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ia9K9W/o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cumminsallison.com header.i=@cumminsallison.com header.b="dh4Q0SUA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cumminsallison.com header.i=@cumminsallison.com header.b="dh4Q0SUA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 795C0214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cumminsallison.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWdlxrxfBZzEs6RrPpMbO3opPyoV4VxU6zY0KlABJTU=; b=Ia9K9W/oqZxYhT
	jdRu1d+++XX8bxb3DMK6wFhYMIbhYJxLYOSIESs3a+hxXeZHT22GCt2hyWkL3yDsPBjvOYjuEtteS
	llSN26tBMqur6JPdVCpU7vSfzvASYH9d3yEJm3m+PXbTRUtjzFxKG0AW7c9VEPJevodt55Nss7tbz
	BHdz/pbouA+MLRNIlvgs0zD7F6KdvI7u2kyWz0UVbpsdcafJ5SlNB+lynnr7TAPUAbzRV8AkzX4KX
	4xWlQWgKfGzG7ylBy0lnvEksZ65vVOUSZH6sE5KI/UIPQUCZ1cVSF2KrfTsJ7cD5+Qvu9x6esH9jj
	x75Wzk2OliDe9Lns5eAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irlti-0007Uw-P3; Wed, 15 Jan 2020 16:52:02 +0000
Received: from mail-mw2nam12on2065.outbound.protection.outlook.com
 ([40.107.244.65] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irltc-0007UG-1l
 for linux-mtd@lists.infradead.org; Wed, 15 Jan 2020 16:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cumminsallison.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXxSZmVWOBt5Vni1F0bS1pUOEKad87bxBigO5iWPVL0=;
 b=dh4Q0SUACNokwyyDzDk3k8zsKZmj27XAAcselLRxOSDd6m9fT1CwfpNzQTrXG5FBFIhVIq3JBIzFtCLBjKcBhzfR+CnQTApDa49gq1PrRY4C0RiNDQ9fopQBFaajr9corhQC0Yi+1JH0BMO00U4CmxTnXflDcI5W/Kul5WCxRus=
Received: from DM3PR08CA0017.namprd08.prod.outlook.com (2603:10b6:0:52::27) by
 MN2PR08MB6256.namprd08.prod.outlook.com (2603:10b6:208:1a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.19; Wed, 15 Jan
 2020 16:51:53 +0000
Received: from BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e46::206) by DM3PR08CA0017.outlook.office365.com
 (2603:10b6:0:52::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend
 Transport; Wed, 15 Jan 2020 16:51:52 +0000
Authentication-Results: spf=pass (sender IP is 208.73.132.200)
 smtp.mailfrom=cumminsallison.com; micron.com; dkim=pass (signature was
 verified) header.d=cumminsallison.com;micron.com; dmarc=pass action=none
 header.from=cumminsallison.com;
Received-SPF: Pass (protection.outlook.com: domain of cumminsallison.com
 designates 208.73.132.200 as permitted sender)
 receiver=protection.outlook.com; client-ip=208.73.132.200;
 helo=mail.cumminsallison.com;
Received: from mail.cumminsallison.com (208.73.132.200) by
 BL2NAM02FT046.mail.protection.outlook.com (10.152.76.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2644.19 via Frontend Transport; Wed, 15 Jan 2020 16:51:52 +0000
Received: from v852ex01.Cumminslocal.com (10.3.22.161) by
 v852ex01.Cumminslocal.com (10.3.22.161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Wed, 15 Jan 2020 10:51:51 -0600
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by v852ex01.Cumminslocal.com (10.3.22.161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2
 via Frontend Transport; Wed, 15 Jan 2020 10:51:51 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hn/wBIr54QJiSwT1Qc6/aXFbiWV0li1ZsP/XVeJHZIQFRDCDyhjFyBiHDrUtPfHkMM4LQx7PHIi1VNqJIY5rrLw61G+Zj6rJPYvRSAsDF4olMIF9rbTAez/ZDTW0H2BLAtybmvFKkUYGFfowkMMSNYuBTIJguGqjak+1Jbx8LBqHQFPjVBxumzzJ5I9G5yqqXVm6VWKmih+I+We6zO/sDiMoU57FJ/ChgTj/eC42hZFnPHuAZ1rC8ZDjXoTsQ2YuAFUkb4z2Qaxk2cH04V7rVm83v5CByYl1ND0XkjwthPWfjU8cVGH8VcC4jZuQrzOm4s+wXRv+F7jj/v3xpUwuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXxSZmVWOBt5Vni1F0bS1pUOEKad87bxBigO5iWPVL0=;
 b=Va605lGhL5MvRXTi+gDqWc7kTDVGznLqJ2xQE0D+P0JwAAfW2tJeTkiRJYt0Zg1ko+O5x17UdI0TY2aKpCWTwXIbvn/7r4fhGOowix8J7IUp8175UDlDGmsgu6rpUozKgJikaCTl6WjKL2ZcqEbvMW+0nWVv4to+3OIxjgriEBsgm250Y+z90XYXFDkBeG5g7vv1QibEiBZW1T0pEL6B7CH2RAM3MjdBg6N6F30KZQHzPRmojIh0Ifa1qKhJn7NdrKqmcMY+L20hRabBCNJBs/ozlp6yLAgJ6baD/iTAi71TiPsZDQ/RonvVCSyNN4aNnddnqjc7yPqYVbb9F9nusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cumminsallison.com; dmarc=pass action=none
 header.from=cumminsallison.com; dkim=pass header.d=cumminsallison.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cumminsallison.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lXxSZmVWOBt5Vni1F0bS1pUOEKad87bxBigO5iWPVL0=;
 b=dh4Q0SUACNokwyyDzDk3k8zsKZmj27XAAcselLRxOSDd6m9fT1CwfpNzQTrXG5FBFIhVIq3JBIzFtCLBjKcBhzfR+CnQTApDa49gq1PrRY4C0RiNDQ9fopQBFaajr9corhQC0Yi+1JH0BMO00U4CmxTnXflDcI5W/Kul5WCxRus=
Received: from DM5PR08MB2859.namprd08.prod.outlook.com (10.175.220.18) by
 DM5PR08MB2538.namprd08.prod.outlook.com (10.173.224.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Wed, 15 Jan 2020 16:51:49 +0000
Received: from DM5PR08MB2859.namprd08.prod.outlook.com
 ([fe80::f569:6578:cf8d:5657]) by DM5PR08MB2859.namprd08.prod.outlook.com
 ([fe80::f569:6578:cf8d:5657%7]) with mapi id 15.20.2602.022; Wed, 15 Jan 2020
 16:51:49 +0000
Received: from [192.168.126.134] (208.73.132.253) by
 DM5PR04CA0035.namprd04.prod.outlook.com (2603:10b6:3:12b::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18 via Frontend Transport; Wed, 15 Jan 2020 16:51:48 +0000
From: "Wojtaszczyk, Piotr" <WojtaszczykP@cumminsallison.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: Re: [RFC PATCH 0/3] Fix proposal for the Micron shallow erase issue
Thread-Topic: [RFC PATCH 0/3] Fix proposal for the Micron shallow erase issue
Thread-Index: AQHVwBBTjeR29oTnnUyOoq5SiTOxz6fXuEsAgBI9BYCAAMHigIAAu7cAgAAER4CAAJDUAA==
Date: Wed, 15 Jan 2020 16:51:49 +0000
Message-ID: <c2bf2161-7122-4d59-3e51-57db27654685@cumminsallison.com>
References: <20191231192656.16376-1-miquel.raynal@bootlin.com>
 <a2199251-882a-5067-fe4c-47f1c8a252fe@gmail.com>
 <20200114101219.4b951dfe@xps13>
 <8fac8e86-3455-271d-2fcb-c2a6070e8127@cumminsallison.com>
 <20200115085806.218b6b32@collabora.com> <20200115091325.667c06a8@xps13>
In-Reply-To: <20200115091325.667c06a8@xps13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.73.132.253]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: DM5PR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:3:12b::21) To DM5PR08MB2859.namprd08.prod.outlook.com
 (2603:10b6:3:144::18)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=WojtaszczykP@cumminsallison.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 108f18ce-317d-4d20-6fa5-08d799db38aa
X-MS-TrafficTypeDiagnostic: DM5PR08MB2538:|MN2PR08MB6256:
X-Microsoft-Antispam-PRVS: <MN2PR08MB6256C584F35AE24D219C4111B8370@MN2PR08MB6256.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
x-forefront-prvs: 02830F0362
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(199004)(189003)(16576012)(8676002)(86362001)(54906003)(71200400001)(53546011)(2906002)(81166006)(66574012)(7416002)(110136005)(66446008)(52116002)(81156014)(8936002)(36756003)(5660300002)(26005)(6486002)(16526019)(186003)(64756008)(66946007)(31696002)(66476007)(2616005)(956004)(4326008)(498600001)(66556008)(31686004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR08MB2538;
 H:DM5PR08MB2859.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cumminsallison.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: FCHsy6FV4Zm6uUTTkVFwQEI3zjtfBfXaZER/icmB3nTgh+XNCOev+s1XsM27jZoX0bn4ptvWqigIWT/TWWZIIBiQfMG3O4wcIFVOqdBuJ9OKgWjhCBVhBxixbZbuDADpmLdZQmR4cT11sGZeLY2ebkSoRP9Jssj6E/8gAtwgY0pAJ4yWeOzy1Pi9TxNMc3wSzAc7ZYsYQkoxH8QLwnQ2ohRJbNiEWqTN7V9XYO7uTSFjcyjHKOB7sYFAxIrTwXTplAUsQ41XJhcHLtNv6iPd0cXzlDdh/ADcyY+CuOHNemV0VZhPQR3HiJbCCmvJXRsgqfBAyz7ApBbncqZlgimyEzI5AAsN1V6IyTjYhR3IKHXeJnXXh8ZhyO/fhOLWE+yJRF+iEPfN+mgGISsincYZ3mhH51JsfF98gAG7Doe8pfmUF9E0vdBh5bw/x6n8heWw
x-ms-exchange-transport-forked: True
Content-ID: <11E73F6CDD22E745B066163100C209F9@namprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2538
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:208.73.132.200; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(346002)(376002)(39850400004)(396003)(189003)(199004)(6486002)(31686004)(7416002)(70206006)(336012)(54906003)(110136005)(31696002)(16576012)(86362001)(2906002)(8936002)(478600001)(16526019)(356004)(26005)(8676002)(36756003)(81156014)(81166006)(5660300002)(66574012)(4326008)(956004)(70586007)(186003)(316002)(2616005)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB6256; H:mail.cumminsallison.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f7fe997-fc9b-43b1-16af-08d799db36cc
X-Forefront-PRVS: 02830F0362
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3CmSollViTpCzA9sntl351RuUz6YMsiPv7bcFr9vnq9XZl1f3Iajq0VJWszLEq8gUyaORrjTkanOIOnshavDScGpcJLEu3a2lUTm/OdD8gjxToz2UcurkWF/qGE2vioGuJZAkkSBTikIGOVoXn1vCoBjBkwPU9+AIITRRqR8M7iY2TF+5R4kJz92HNMU7e/nrflzFuGgpH0LBTzHF4MI+E4bno9WTOb087a++PfLpe3X04qVU4UeCsSE+jO/8s8j0JESm/zIY20SaHtOQGEQ13MT8XMVLG+tzJBVLiDnbM5QqpTdS9yCUniC3YeGZ2YxiULvWigx5NfWf8UgGxmIYQ8moOmFk0710yMf14cWwvs7qaHJoX2MQSj3Oux1446EirWffRbMgo2/pI/TIX5Xfj2m+vteBzfOCCLVrhd4UqMkXB2wbF4OcCK8INpLMIu
X-OriginatorOrg: cumminsallison.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2020 16:51:52.3265 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 108f18ce-317d-4d20-6fa5-08d799db38aa
X-MS-Exchange-CrossTenant-Id: 4985d88e-7a3c-4305-9716-481d38864f3d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=4985d88e-7a3c-4305-9716-481d38864f3d; Ip=[208.73.132.200];
 Helo=[mail.cumminsallison.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_085156_930871_76D77598 
X-CRM114-Status: GOOD (  15.82  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Zoltan Szubbocsev <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

DQoNCk9uIDEvMTUvMjAgMjoxMyBBTSwgTWlxdWVsIFJheW5hbCB3cm90ZToNCj4gSGkgQm9yaXMs
DQo+IA0KPiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPiB3
cm90ZSBvbiBXZWQsIDE1IEphbg0KPiAyMDIwIDA4OjU4OjA2ICswMTAwOg0KPiANCj4+IE9uIFR1
ZSwgMTQgSmFuIDIwMjAgMjA6NDY6MTcgKzAwMDANCj4+ICJXb2p0YXN6Y3p5aywgUGlvdHIiIDxX
b2p0YXN6Y3p5a1BAY3VtbWluc2FsbGlzb24uY29tPiB3cm90ZToNCj4+DQo+Pj4gT24gMS8xNC8y
MCAzOjEyIEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOg0KPj4+PiBDcmFwLiBJJ2xsIG5vdCByZXNl
bmQgaW1tZWRpYXRlbHkgYXMgdGhpcyBpcyBhbiBSRkMsIEkgZXhwZWN0DQo+Pj4+IGZlZWRiYWNr
IG9uIHRoaXMgcHJvcG9zYWwgYmVmb3JlIHNlbmRpbmcgYW4gYWN0dWFsIHBhdGNoLg0KPj4+Pg0K
Pj4+Pg0KPj4+PiBUaGFua3MsDQo+Pj4+IE1pcXXDqGwNCj4+Pj4gICAgICANCj4+Pg0KPj4+IEhp
IE1pcXXDqGwsIGhlcmUgYXJlIHNvbWUgbXkgY29tbWVudHM6DQo+Pj4NCj4+PiArc3RhdGljIGlu
dCBtaWNyb25fbmFuZF9hdm9pZF9zaGFsbG93X2VyYXNlKHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAs
DQo+Pj4gKwkJCQkJICAgdW5zaWduZWQgaW50IGViKQ0KPj4+ICt7DQo+Pj4gKwlzdHJ1Y3QgbWlj
cm9uX25hbmQgKm1pY3JvbiA9IG5hbmRfZ2V0X21hbnVmYWN0dXJlcl9kYXRhKGNoaXApOw0KPj4+
ICsJdW5zaWduZWQgaW50IHBhZ2UgPSBlYiAqIG5hbmRkZXZfcGFnZXNfcGVyX2VyYXNlYmxvY2so
JmNoaXAtPmJhc2UpOw0KPj4+ICsJdTggKmRhdGFidWYgPSBuYW5kX2dldF9kYXRhX2J1ZihjaGlw
KTsNCj4+PiArCWludCByZXQsIGk7DQo+Pj4gKw0KPj4+ICsJbWVtc2V0KGRhdGFidWYsIDB4RkYs
IG5hbmRkZXZfcGFnZV9zaXplKCZjaGlwLT5iYXNlKSk7DQo+Pj4gKw0KPj4+ICsJLyogTWljcm9u
IGFkdmlzZXMgdG8gb25seSB3cml0ZSBvZGQgcGFnZXMgKi8NCj4+PiArCWZvciAoaSA9IDA7IGkg
PCBNSUNST05fU0hBTExPV19FUkFTRV9NSU5fUEFHRTsgaSArPSAyLCBwYWdlICs9IDIpIHsNCj4+
PiArCQlpZiAoIShtaWNyb24tPndyaXR0ZW5wW2ViXSAmIEJJVChpKSkpIHsNCj4+PiArCQkJcmV0
ID0gbmFuZF93cml0ZV9wYWdlX3JhdyhjaGlwLCBkYXRhYnVmLCBmYWxzZSwgcGFnZSk7DQo+Pj4g
KwkJCWlmIChyZXQpDQo+Pj4gKwkJCQlyZXR1cm4gcmV0Ow0KPj4+ICsJCX0NCj4+PiArCX0NCj4+
PiArDQo+Pj4gKwlyZXR1cm4gMDsNCj4+PiArfQ0KPj4+DQo+Pj4gU2hvdWxkbid0IHdlIHByb2dy
YW0gb25seSB0aGUgT09CIGFyZWEgb2YgdGhlIHBhZ2VzIHRvIDAnZXM/IFByb2dyYW1taW5nIHBh
Z2VzIHRvIDB4RkYNCj4+PiB3aGljaCBhcmUgYWxyZWFkeSAweEZGIHRha2VzIG1vcmUgdGltZSBh
bmQgZG9lc24ndCBtYWtlIGFueSBkaWZmZXJlbmNlLg0KPj4NCj4+IEhtLCBJJ20gcHJldHR5IHN1
cmUgd2Ugc2hvdWxkIHNldCBpbi1iYW5kIGRhdGEgdG8gMCwgbm90IDB4ZmYuDQo+PiBQcm9ncmFt
bWluZyBvbmx5IHRoZSBPT0IgcG9ydGlvbiBtaWdodCBub3QgYmUgZW5vdWdoIGZvciB0aGUgaW50
ZXJuYWwNCj4+ICJpcyBwYWdlIHdyaXR0ZW4/IiBsb2dpYyB0byByZXR1cm4gdHJ1ZS4NCj4gDQo+
IEFic29sdXRlbHksIHRoaXMgaXMgYSBtaXN0YWtlLCB0aGUgaWRlYSBpcyB0byBwcm9ncmFtIGFs
bCBjZWxscyAodG8gMCkuDQo+IA0KPj4+IEFsc28gYWZ0ZXIgcG93ZXIgbG9zcyBhbGwgZmxhZ3Mg
aW4gbWljcm9uLT53cml0dGVucCBhcmUgZ29uZSBzbyB0aGUNCj4+PiBtaWNyb25fbmFuZF9hdm9p
ZF9zaGFsbG93X2VyYXNlIHdpbGwgcGVyZm9ybSBvbiBhbGwgUEVCcyBjYXVzaW5nIHBlcmZvcm1h
bmNlIGxvc3MuDQo+Pg0KPj4gWWVzLCB0aGF0J3MgYSBwZXJmb3JtYW5jZSBoaXQgd2UnbGwgaGF2
ZSB0byBhY2NlcHQgZm9yIG5vdy4NCj4+DQo+IA0KPiBUaGlzIGlzIHF1aXRlIHNldmVyZSBpc3N1
ZSwgdGhpcyBpcyB0aGUgYmVzdCBpZGVhIHdlIGNhbWUgd2l0aCB0bw0KPiBsaW1pdCBwZXJmb3Jt
YW5jZSBoaXRzLg0KDQpUaGlzIHdpbGwgYmUgYW4gaXNzdWUgb24gZGV2aWNlcyB3aGljaCByZXN0
YXJ0cyBxdWl0ZSBvZnRlbiwgd2hhdCBpZiB3ZSByZWFkIE9PQiBvZiBtaWRkbGUgDQpwYWdlIG9m
IHRoZSBibG9jayB3ZSBhcmUgYWJvdXQgdG8gZXJhc2UgYW5kIGlmIGl0IGhhcyBhbGwgMHhmZiB0
aGUgaXQgbWVhbnMgaXQgaXMgDQpwYXJ0aWFsbHkgcHJvZ3JhbW1lZCBhbmQgbmVlZHMgdGhlIHF1
aXJrLiBJdCdzIHJlYWRpbmcgNjQvMTI4IGJ5dGVzIChkZXBlbmRpbmcgb24gTkFORCANCnNpemUp
IGJlZm9yZSBldmVyeSBlcmFzZSB2ZXJzdXMgcHJvZ3JhbW1pbmcgOCBwYWdlcyBvbiBlYWNoIFBF
QiBlcmFzZSBvbmNlIHBlciBkZXZpY2UgcmVzdGFydC4NCg0KQWxzbyBJIGtub3cgYnkgc3BlYWtp
bmcgd2l0aCBNaWNyb24gdGhhdCBwcm9ncmFtbWluZyAwIGluIHNwYXJlIGFyZWEgaXMgZW5vdWdo
IGFuZCANCmFjdHVhbGx5IHdlIHNob3VsZCBwcm9ncmFtIDggZXZlbi9vZGQgcGFnZXMgc3RhcnRp
bmcgZnJvbSBtaWRkbGUgb2YgUEVCLiBJbiBjYXNlIFBFQiBoYXMgDQo2NCBwYWdlcyB3ZSBzaG91
bGQgcHJvZ3JhbSBPT0Igb2YgcGFnZSAzMSwzMywzNSwzNywzOSw0MSw0Myw0NSBvciAzMiwzNCwz
NiwzOCw0MCw0Miw0NCw0Ng0KQ2FuIHNvbWVib2R5IGZyb20gTWljcm9uIGNvbmZpcm0gdGhhdD8N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
