Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0925CC4360C
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 15:50:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D24CE20830
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 15:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VB3zAjzP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ctU5mTfn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D24CE20830
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8YuKyJKziaw0xS9G0MXDLN3RlH850/UfNrHqZuhf+1c=; b=VB3zAjzPC/CSbY
	DjX08xI3tx5s8DL67ZbYTF7laadV1peH3lMRZe+W35/whsBbfFPKKXm3/XPWYZySSk91aWpjyingS
	mN9f/IK/Uks7EE86Qd6Lc7eqZ3Ax+MzjQBd/NnSE/4tLISIXDE53t4FVH6Wnqvi6l3QfBDCHymIIh
	owlpjTom8pBYE0T4wSo7/WqY0w3oSXIhYrm6sF37RhJcTROq1Ii0+6Dawp0PvLjrJLwDRZDgOuYev
	xzXZatel/rXCf4hClICjsGlU1XzYNIPvFR7mPEIS2E67ev47h7rrjUev/QAxx46FzEi0IfX5HW3/U
	fsgGXCLAFOaR0d87AMcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGPqZ-0006fk-Rr; Fri, 04 Oct 2019 15:50:23 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGPqY-0006fO-1N
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 15:50:23 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 9y9NKgb5T7X1JPwM/w5exCVU7U7dB+EptmvbG2CA8w4C2O3wLT7/5dQtWrC7EhblBn3gnkAZmG
 3XAYlDIroldIzn3fIOiuscZxFq97k+pFF4IMT1QGXTYj7bab5/m3nUxtEtWcn2o5d/DYwlexGY
 Qs8gKzv9U93y29yvDYXx+QqfjctTkmsclBC0q8+2txASz700mYCsLMm4JrftdSL0hHTqRHvL02
 /vu2WXGDCgMylquwDAmyIMFVjMu1G0el8czv0U8Dn1o9eOqdvi+YfROHEeWFW7xGYzmxV5kV+W
 w/M=
X-IronPort-AV: E=Sophos;i="5.67,256,1566889200"; d="scan'208";a="51545226"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 04 Oct 2019 08:50:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 4 Oct 2019 08:50:21 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 4 Oct 2019 08:50:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dVnYMngbhG1uy6b2uF2fv1aUMrXscN50iAnFdpAkoqbZfTlzp+DLyce0fIjwQBjJVfjT4rea0sLflN1O5dN5XVLUgcvYVenhs1JpHrkq6c1+7sBUTnLgHLHMHq9gU2gE/aHX/xzrV+jpvpIEkOxUCMq4l0iOx6lr7cer4S55xVn6g8cMMrGPhoGUyfnrwow7J/Gv7YIAIKWn4aI6gISz+96i0N+fgR2yRYPOeZJLkQLpEOj5KPewWu2ap3Mu+JapOr9g7c3sNygQhFEFfURxe4BYn2kVi+3wl0FEZ6yY0MkR69F8yJ+pulrwAnLyIMihIRdPRtNJ/0V2UM7cZf2QdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ctf32R8i9R45yBM+/lt7wyzNrWPsviw2As0RQ+q8EWI=;
 b=YKxiXyi7V+8QiIC9nEDxnahdYTC+/hktMNlfAO+Sey0vg90qMRJxu8ZFBxCl1m3Cf6Cg8pHOsxQaGEY0QfaP1n2AjSSFrTZk8/M1P3CpDR3ootLexELC0BPYPCs+LD64Nmx2ekDb/Ke65TqYXDVCZx5cVB7jbn8R/Y4H3ldb5DGJdIILkYjOuhwIDAuxETqYEyDKnHm+0fCDmH3c3/Fz0U+9SZEsYPKW0I6aO8gAp1F3L0XT71j3M2SH1tJIHqZBVsrQWMG3lpx/cBAu7gy9KXH3zeivSZKZrcRE/6B9RQwwAe4DVXbH6NXHp0gaRiSRplf54KBs9KjbYbIm8uqIug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ctf32R8i9R45yBM+/lt7wyzNrWPsviw2As0RQ+q8EWI=;
 b=ctU5mTfnfasneU8Q7y4zX9xK/LmBZEcdIF4YyoO6Im2jUCrrG6SwZzcstpMYjAohlC0Bgb21wQtnXbA8rNDW80zixyH8SCITQ9CfGaRlORe/NSqVtgYmEkViPdj3+fXfBYyAdC6efBJqjiQ5H+diG5MtxMaE9e2WKwx9PB2NtlU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3549.namprd11.prod.outlook.com (20.178.250.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Fri, 4 Oct 2019 15:50:19 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::340d:5a33:dc79:1184]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::340d:5a33:dc79:1184%5]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 15:50:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <john.garry@huawei.com>, <vigneshr@ti.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix direction of the write_sr() transfer
Thread-Topic: [PATCH] mtd: spi-nor: Fix direction of the write_sr() transfer
Thread-Index: AQHVeqEtwNvmmNlG50ubt70oQPwmWadKTUqAgAAL5YCAAD9FAIAACRiA
Date: Fri, 4 Oct 2019 15:50:19 +0000
Message-ID: <654482e4-f8ff-7f91-dcf3-f2e680519afe@microchip.com>
References: <c703dec2-dd11-5898-83ad-fb06127b6575@huawei.com>
 <20191004104746.23537-1-tudor.ambarus@microchip.com>
 <9156860e-d257-bee6-fac8-a1821e4b5bf2@microchip.com>
 <60f0c52f-1301-57eb-59ba-b2893107d5d6@huawei.com>
 <6eecffe2-539f-f1a1-2008-3877c5f5c3ef@huawei.com>
In-Reply-To: <6eecffe2-539f-f1a1-2008-3877c5f5c3ef@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P190CA0011.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::24) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42644586-395f-4352-7609-08d748e28ec5
x-ms-traffictypediagnostic: MN2PR11MB3549:
x-microsoft-antispam-prvs: <MN2PR11MB354967FDD87A04209A86A125F09E0@MN2PR11MB3549.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 018093A9B5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(366004)(376002)(396003)(189003)(199004)(2201001)(558084003)(229853002)(2616005)(476003)(478600001)(71190400001)(71200400001)(186003)(11346002)(446003)(486006)(31686004)(31696002)(6116002)(386003)(6436002)(6506007)(316002)(6486002)(86362001)(2906002)(53546011)(256004)(102836004)(110136005)(76176011)(25786009)(52116002)(5660300002)(81166006)(81156014)(3846002)(6512007)(64756008)(66556008)(66476007)(2501003)(66446008)(66946007)(8676002)(8936002)(36756003)(7736002)(26005)(99286004)(14454004)(66066001)(305945005)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3549;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xae7rePIDPSIvuLCuJmWrUlgGC6x2HyPRtvZ+2/77sJo2wqsCUbIKWnWQH/dXDnYl4KZ5qlStvJ49zQDKEVGWNGsIPrH+qazcjyq80FyyORkn5swliHroYeOEV007F3lfiJS1Ci65tQoHMKfPldRuhUDa25NVOcqkllmJO15Cl1JjclrxaJR+mpQ8sIJbfsTUJ22qeXADprPS9J00TFdlEbIiT9x1IL2Bmfqaad0sF4YgDQfojTt3q8HbndacuuGYzESgRi4HAj06E4OeAA39cmSr1Yn+NbC8Y+EEOJ4YdNlNmPfBt116KNH98yUTO4YyX2PFcUrodJ4voFVSgXW0AdaP3yKBGvBwQdGAWNmWe8rtm8FWUm/MZ0qbD8l3eu0v4vafS9MUejW02Dk7fzM4/9raVnKaCUQbJ6QLFzgbFY=
x-ms-exchange-transport-forked: True
Content-ID: <625DCDB540F544418A33CDD412E6A53A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 42644586-395f-4352-7609-08d748e28ec5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2019 15:50:19.2887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPdilyENPefsTgVjGRl9ShiJt+c3U1udvwC0D8CpIWTul5kcHr6kgdEU6zfJZ/XP5PU3blcXnJCMDO4bOe6YF2lQ5gNzR/9swc5IKNeNAks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3549
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_085022_112032_D241F489 
X-CRM114-Status: UNSURE (   4.22  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

DQoNCk9uIDEwLzA0LzIwMTkgMDY6MTcgUE0sIEpvaG4gR2Fycnkgd3JvdGU6DQo+IFRlc3RlZC1i
eTrCoEpvaG7CoEdhcnJ5wqA8am9obi5nYXJyeUBodWF3ZWkuY29tPg0KDQpUaGFua3MsIEpvaG4h
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
