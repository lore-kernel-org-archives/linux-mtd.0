Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1DFC33C9E
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 20:46:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49FED24656
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 20:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dxVQEuXV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cumminsallison.com header.i=@cumminsallison.com header.b="VyEOvLF2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cumminsallison.com header.i=@cumminsallison.com header.b="VyEOvLF2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49FED24656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cumminsallison.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/wDn5pdx0qhgUEqU+27fZykhpUSBIQUy3ns4ai3VuAU=; b=dxVQEuXV6Kl2I8
	h1Ko0vcpSmxAN8yutIp7mTXCnjzT5zAmX2msi5qRTOgXnrL7Z+loyogcr+aczi1q8fqKQCQhF+MgX
	h7lkze16BaRe81hRK8+nsahpVoeeY0sWk9MsLbOrV92kgrwrSmd7Vk3bc52MOXheoavJiqYbmSmtk
	46gtIWhqHMWt814TC/muQsLvDip2MfFqb9gQMW2ciSGenxLv3mwvONSmOhXQu+IVDOhWzGp/JQqmg
	f3SCa/sJF47HCsP6H8M/lx+32YevotvHFPXOASOkN+YWcwhY/5U6Aktc/1EAfGkwK/b8rhyL0drW/
	md46WVntTQDbuQTGaGQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irT51-0007yI-Tv; Tue, 14 Jan 2020 20:46:27 +0000
Received: from mail-bn7nam10on2042.outbound.protection.outlook.com
 ([40.107.92.42] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irT4z-0007xl-BB
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 20:46:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cumminsallison.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNb7hlx7R3mnc2T+o3Oxo6TQ/KBEtwozncrFz93TUjk=;
 b=VyEOvLF2fJitNwumomukIa0Rpz35uDYk6hBGGqsQ/ecFD/zHgKUl87ckvHA5TkFqKCMefGctQEpig9ADquOnK/UfkXYqw6oGP6OXeLwAa0jFFtiCBxJdr12Z0u6pwwPXDCi/GcTYs96NHImTNA83EaSJ1JYYXF4YKRtVEnyCdfk=
Received: from SN6PR08CA0036.namprd08.prod.outlook.com (2603:10b6:805:66::49)
 by MWHPR08MB2798.namprd08.prod.outlook.com (2603:10b6:300:cc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9; Tue, 14 Jan
 2020 20:46:21 +0000
Received: from CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::206) by SN6PR08CA0036.outlook.office365.com
 (2603:10b6:805:66::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.12 via Frontend
 Transport; Tue, 14 Jan 2020 20:46:21 +0000
Authentication-Results: spf=pass (sender IP is 208.73.132.200)
 smtp.mailfrom=cumminsallison.com; micron.com; dkim=pass (signature was
 verified) header.d=cumminsallison.com;micron.com; dmarc=pass action=none
 header.from=cumminsallison.com;
Received-SPF: Pass (protection.outlook.com: domain of cumminsallison.com
 designates 208.73.132.200 as permitted sender)
 receiver=protection.outlook.com; client-ip=208.73.132.200;
 helo=mail.cumminsallison.com;
Received: from mail.cumminsallison.com (208.73.132.200) by
 CY1NAM02FT040.mail.protection.outlook.com (10.152.75.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2623.9 via Frontend Transport; Tue, 14 Jan 2020 20:46:21 +0000
Received: from v852ex01.Cumminslocal.com (10.3.22.161) by
 v852ex01.Cumminslocal.com (10.3.22.161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 14 Jan 2020 14:46:20 -0600
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by v852ex01.Cumminslocal.com (10.3.22.161) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1779.2
 via Frontend Transport; Tue, 14 Jan 2020 14:46:19 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJPnJx9fbYNbETZMxFOk5pG7A2ONpHMHEs8k0LBqwGLisFhUrtQIhbRppJMYjS0Jg4zrP6fn0JWnjktIcYpUJO7HHRVy+V76/Uyk8VrJ/TNbmScftXxNfxIzdexu67LlLeTUf+uqo0VbUDtIRywf8r09vnI3wm8/avGb4QVRGpT3TMV5GGdEOwCFpbene+I0ZEydp2Vww81NIC7EiLDmsOTO/PBrxuyHscIaorFFSVsYCRzx+zxfQrKMBy1pUD9JGKKyr1gLJ7MAndCW1Va0IhjKYXh09tLnIQuYbl+/j8dDix25PNx/zOTOb4Ah74DasAHuLWxAnHtaZUbKv4T3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNb7hlx7R3mnc2T+o3Oxo6TQ/KBEtwozncrFz93TUjk=;
 b=lBuor6XFPztNjilDMKsdMzGMMHPL/N8QvMKtkikznmLasxC3JdlyxyN329jhtonQP4PJsW/gnjszq5kyQYeNrXbF0zBgOTadAJOuB4sz8vx2wv5Q1C3tdHyBHGdhTKpTMYJcjoF4lGV7hs2wSJBc8QjF6OfHwMWf3+uzeyxvUbwLX1Rd2qvyD/Gv5ZRde1EMrm6wvMs8AeIgxSPDHJa1MsrjF6jY4Zg4drDUu63gDOS5tHTisEBLZLAKCo2GsgWT/fz9m5N3d9LQ2O409GLre8PMeL5hj0gkkw/J5y5pUFvrIFhxBggEPKA3A7tyVvoYHPgvouZxia/yCzh5CI/cSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cumminsallison.com; dmarc=pass action=none
 header.from=cumminsallison.com; dkim=pass header.d=cumminsallison.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cumminsallison.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNb7hlx7R3mnc2T+o3Oxo6TQ/KBEtwozncrFz93TUjk=;
 b=VyEOvLF2fJitNwumomukIa0Rpz35uDYk6hBGGqsQ/ecFD/zHgKUl87ckvHA5TkFqKCMefGctQEpig9ADquOnK/UfkXYqw6oGP6OXeLwAa0jFFtiCBxJdr12Z0u6pwwPXDCi/GcTYs96NHImTNA83EaSJ1JYYXF4YKRtVEnyCdfk=
Received: from DM5PR08MB2859.namprd08.prod.outlook.com (10.175.220.18) by
 DM5PR08MB2379.namprd08.prod.outlook.com (10.168.238.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.14; Tue, 14 Jan 2020 20:46:18 +0000
Received: from DM5PR08MB2859.namprd08.prod.outlook.com
 ([fe80::f569:6578:cf8d:5657]) by DM5PR08MB2859.namprd08.prod.outlook.com
 ([fe80::f569:6578:cf8d:5657%7]) with mapi id 15.20.2602.016; Tue, 14 Jan 2020
 20:46:18 +0000
Received: from [192.168.126.134] (208.73.132.253) by
 CH2PR20CA0013.namprd20.prod.outlook.com (2603:10b6:610:58::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9 via Frontend Transport; Tue, 14 Jan 2020 20:46:16 +0000
From: "Wojtaszczyk, Piotr" <WojtaszczykP@cumminsallison.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Florian Fainelli
 <f.fainelli@gmail.com>
Subject: Re: [RFC PATCH 0/3] Fix proposal for the Micron shallow erase issue
Thread-Topic: [RFC PATCH 0/3] Fix proposal for the Micron shallow erase issue
Thread-Index: AQHVwBBTjeR29oTnnUyOoq5SiTOxz6fXuEsAgBI9BYCAAMHigA==
Date: Tue, 14 Jan 2020 20:46:17 +0000
Message-ID: <8fac8e86-3455-271d-2fcb-c2a6070e8127@cumminsallison.com>
References: <20191231192656.16376-1-miquel.raynal@bootlin.com>
 <a2199251-882a-5067-fe4c-47f1c8a252fe@gmail.com>
 <20200114101219.4b951dfe@xps13>
In-Reply-To: <20200114101219.4b951dfe@xps13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [208.73.132.253]
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-clientproxiedby: CH2PR20CA0013.namprd20.prod.outlook.com
 (2603:10b6:610:58::23) To DM5PR08MB2859.namprd08.prod.outlook.com
 (2603:10b6:3:144::18)
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=WojtaszczykP@cumminsallison.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f10ce748-cc1b-497b-0b2d-08d79932d003
X-MS-TrafficTypeDiagnostic: DM5PR08MB2379:|MWHPR08MB2798:
X-Microsoft-Antispam-PRVS: <MWHPR08MB2798447D83F529BB33D8C5A3B8340@MWHPR08MB2798.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;OLM:7691;
x-forefront-prvs: 028256169F
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39850400004)(366004)(189003)(199004)(66556008)(64756008)(66946007)(52116002)(66476007)(54906003)(31686004)(6486002)(2616005)(16576012)(110136005)(316002)(956004)(71200400001)(5660300002)(478600001)(26005)(31696002)(16526019)(86362001)(8676002)(4326008)(2906002)(186003)(53546011)(66446008)(66574012)(7416002)(8936002)(81166006)(36756003)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR08MB2379;
 H:DM5PR08MB2859.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cumminsallison.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Qy1xFRs7+Aph/djHR/42NSCImlOPbO+F6c6Upnj/A0IepMYjVAFwtVjAMXs/zZEW2ekFTx8ItPIwUgVrUWLu+sQmVFGVbLyEL3mjoirkR8ah0FSa8ueX8wv9NBV2m2mdPQ21FXuh8aj2f8tFiEmlMW48a8i/RuJOwtSiCq/G8s19K2wjdjZktjZDe3Sp8x1KvUAkbAX6WmJeX4oE0NuNcKnOIlEPZSB9zZeDOMYLKe2B7I0FUcIL772FX+x6hvPFROM3X4eB3BbaZFAhNcS6OJiE4qOB/SpZ2YSm61hePuTaKZ9lpHmCZgAe4yeLDoapm17Tlv8M5yW4/6hJFmQ7h+qH595XID5q5i9QdxTiyBTOoR695h1S3ErKf42bpLYMh1PZi4vxwREL+/cf/MWO7K80ul+wNZnYJ7pdDjHrvjgj1ZE7MXzLjpX4y00uIExB
x-ms-exchange-transport-forked: True
Content-ID: <4D51C204E0C3174CAA8F611C52B84EC2@namprd08.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB2379
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CY1NAM02FT040.eop-nam02.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:208.73.132.200; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39850400004)(396003)(136003)(376002)(346002)(199004)(189003)(26005)(6486002)(336012)(186003)(16526019)(54906003)(4326008)(31696002)(81166006)(478600001)(86362001)(8676002)(81156014)(110136005)(36906005)(8936002)(53546011)(16576012)(70586007)(70206006)(956004)(66574012)(316002)(31686004)(7416002)(2616005)(36756003)(356004)(5660300002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR08MB2798; H:mail.cumminsallison.com; FPR:;
 SPF:Pass; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9f5571e7-9401-479b-9705-08d79932cdde
X-Forefront-PRVS: 028256169F
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jO6V6nRMJWs19o2T5ssTys7edrIZ+0sk2rviHdqBVvo8m1L4A81CprsJ4gPXdol43j0JyyOX2O2/r4aNg+1xtp/awNJsof5fCnruBrWdbuK9OIF63bFvw94u/CVcFUa85ZDd4wgDYhS/GT36ZYyS8BBqKPnGQy/JuZcCBdnUOpgImfSvdAbzUAEXWgq32lq3wG9qO9W+WX3/DbG1itI9XdRy0n7cvoagaF0IJZSllfsQp5EGMw8VCnMtH16G52UWifp8HuFAvB2qNg0L6XTdw6QEKjhrcNHBmlBV+PasynQK5CC0sDizxbUIsq9X3uB8U35ndZiyvGhmGxTDMY4IVz1oqAlqn6FmEL5AW3t1NywDDs0KWvitPXduXPeKeWc2He1is4do64vExSepX5brCO08P7Mquo4XalIQODynBZYbBCG61hq98Ge5HZhYMqcD
X-OriginatorOrg: cumminsallison.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2020 20:46:21.2778 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f10ce748-cc1b-497b-0b2d-08d79932d003
X-MS-Exchange-CrossTenant-Id: 4985d88e-7a3c-4305-9716-481d38864f3d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=4985d88e-7a3c-4305-9716-481d38864f3d; Ip=[208.73.132.200];
 Helo=[mail.cumminsallison.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR08MB2798
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_124625_537307_F02DA004 
X-CRM114-Status: GOOD (  11.56  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Zoltan
 Szubbocsev <zszubbocsev@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMS8xNC8yMCAzOjEyIEFNLCBNaXF1ZWwgUmF5bmFsIHdyb3RlOg0KPiBDcmFwLiBJJ2xsIG5v
dCByZXNlbmQgaW1tZWRpYXRlbHkgYXMgdGhpcyBpcyBhbiBSRkMsIEkgZXhwZWN0DQo+IGZlZWRi
YWNrIG9uIHRoaXMgcHJvcG9zYWwgYmVmb3JlIHNlbmRpbmcgYW4gYWN0dWFsIHBhdGNoLg0KPiAN
Cj4gDQo+IFRoYW5rcywNCj4gTWlxdcOobA0KPiANCg0KSGkgTWlxdcOobCwgaGVyZSBhcmUgc29t
ZSBteSBjb21tZW50czoNCg0KK3N0YXRpYyBpbnQgbWljcm9uX25hbmRfYXZvaWRfc2hhbGxvd19l
cmFzZShzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLA0KKwkJCQkJICAgdW5zaWduZWQgaW50IGViKQ0K
K3sNCisJc3RydWN0IG1pY3Jvbl9uYW5kICptaWNyb24gPSBuYW5kX2dldF9tYW51ZmFjdHVyZXJf
ZGF0YShjaGlwKTsNCisJdW5zaWduZWQgaW50IHBhZ2UgPSBlYiAqIG5hbmRkZXZfcGFnZXNfcGVy
X2VyYXNlYmxvY2soJmNoaXAtPmJhc2UpOw0KKwl1OCAqZGF0YWJ1ZiA9IG5hbmRfZ2V0X2RhdGFf
YnVmKGNoaXApOw0KKwlpbnQgcmV0LCBpOw0KKw0KKwltZW1zZXQoZGF0YWJ1ZiwgMHhGRiwgbmFu
ZGRldl9wYWdlX3NpemUoJmNoaXAtPmJhc2UpKTsNCisNCisJLyogTWljcm9uIGFkdmlzZXMgdG8g
b25seSB3cml0ZSBvZGQgcGFnZXMgKi8NCisJZm9yIChpID0gMDsgaSA8IE1JQ1JPTl9TSEFMTE9X
X0VSQVNFX01JTl9QQUdFOyBpICs9IDIsIHBhZ2UgKz0gMikgew0KKwkJaWYgKCEobWljcm9uLT53
cml0dGVucFtlYl0gJiBCSVQoaSkpKSB7DQorCQkJcmV0ID0gbmFuZF93cml0ZV9wYWdlX3Jhdyhj
aGlwLCBkYXRhYnVmLCBmYWxzZSwgcGFnZSk7DQorCQkJaWYgKHJldCkNCisJCQkJcmV0dXJuIHJl
dDsNCisJCX0NCisJfQ0KKw0KKwlyZXR1cm4gMDsNCit9DQoNClNob3VsZG4ndCB3ZSBwcm9ncmFt
IG9ubHkgdGhlIE9PQiBhcmVhIG9mIHRoZSBwYWdlcyB0byAwJ2VzPyBQcm9ncmFtbWluZyBwYWdl
cyB0byAweEZGIA0Kd2hpY2ggYXJlIGFscmVhZHkgMHhGRiB0YWtlcyBtb3JlIHRpbWUgYW5kIGRv
ZXNuJ3QgbWFrZSBhbnkgZGlmZmVyZW5jZS4NCg0KQWxzbyBhZnRlciBwb3dlciBsb3NzIGFsbCBm
bGFncyBpbiBtaWNyb24tPndyaXR0ZW5wIGFyZSBnb25lIHNvIHRoZSANCm1pY3Jvbl9uYW5kX2F2
b2lkX3NoYWxsb3dfZXJhc2Ugd2lsbCBwZXJmb3JtIG9uIGFsbCBQRUJzIGNhdXNpbmcgcGVyZm9y
bWFuY2UgbG9zcy4NCg0KSW5zdGVhZCB3ZSBjb3VsZCBjaGVjayBhIGZsYWcgaW4gT09CIGFyZWEg
b2YgZmlyc3QgcGFnZSBvZiB0aGUgUEVCIHdlIGFyZSBhYm91dCB0byBlcmFzZSANCmFuZCBjbGVh
ciB0aGUgZmxhZyBiaXQvYml0cyB3aGVuIDE2dGggcGFnZSBvZiB0aGUgUEVCIGdldHMgcHJvZ3Jh
bW1lZC4gU2ltbWlsYXIgdG8gYmFkIA0KYmxvY2sgbWFyay4NCg0KLS0NClBldGVyIFcuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
