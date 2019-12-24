Return-Path: <SRS0=lNmR=2O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56AADC2D0CF
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2019 09:02:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2867B20643
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2019 09:02:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Odd9xTtE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="tgQYA+KV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2867B20643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hg5o0d2RsI/i0a+escwQAolQO+fYvCPHRgtax66NTtw=; b=Odd9xTtE+L9fzK
	DRnflQ/WOdkhXnj6lQeUdQYob7HGCi9jMGQ+98ZTNQloc/XdYNT2i8NO9PXJnLej3nw3OBKSNrUyo
	NHA/naq1bQR+DxrTcKlPoACySNgV3rwesJBioEhz8hbJq839MQ0d7LAowVqYaW5O9fnMRmx74B3EZ
	GID8z7S4UOQ25kFKnVWK5nDy28Wlr1Jid/IShzi61JRqznIxixXSJj5zHIi0aMnyqIHIjaIqkspuN
	dQ+L+9sKI4AeYZ5nI/pvnC8SDthrTPG1AvIEgzGX990zO/cZ0PocjM9nn+55mbx1Q3zFzxPG2UnUa
	eAyjmfbH0X2xFSRMcXbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijg53-0000bs-CZ; Tue, 24 Dec 2019 09:02:17 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijg4n-0000PB-2S
 for linux-mtd@lists.infradead.org; Tue, 24 Dec 2019 09:02:04 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: qxJb/OAdiR1eseeon1RUWbTVe9zML1gPHAf4byi9y+IP1vBWkzuX4KVu7JUWuPsCWyrACyfloQ
 a/l232DbPeYjy5XU5PthasbIa1FWnxaPA4a9VIA0lVKsMi3sAsJyvo5MOTb9y94H4eTs+QtvJD
 y/Q/KglI26ZMN6hzDi1brAf8iuNHGTt+X5fWY2Zcu0Hs4zpElPV1LeiJsOcw16Qa+k51giMUbX
 Ay2bkStf3tFPtPme4oqT9sUhSIgYjL1m2zq76Lj6jFmErN7CMe/qp0cBKxD6fxjpnoSf7pcly0
 FXU=
X-IronPort-AV: E=Sophos;i="5.69,351,1571727600"; d="scan'208";a="58830916"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 24 Dec 2019 02:01:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 24 Dec 2019 02:01:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 24 Dec 2019 02:01:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+PVpumwbbKjSOuTRj4SCn5hCpLu/YoZkt4mxCPLooz3kQreUp+6/iSdYufCTURPMxpj0Pd7yNU9s+otTEt+f2Cb72DdrufIIevXiN4SC++Uc+VJPrdW63qa+YqRfXxwrx9War0GVuIKwrtRyCcDQlXepxjm7nwRUGk97S1cWpZtRCsVV4Z14bDSGir2DaZsUlXtWWOA/2nkK8v3WbTqx21d5xseChtKG/3yqsQ2EMAouFA9Bd8TZF4mpp3qcL5+Li4CPKMlZZay9BYLHISZEtTENzjnc5/W825Y3Of1zbdR/7MDr2vyla22+4yvoukBGoG17/3UuO81boL0KOs1vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA5Nca4LINlal1NSZOkooEBjg0aAxlzIT+rkPGGcwn0=;
 b=nKma+uIKrN1aePw6OCGtRKHzumcdoxmlDslHEYsHYh+YoRun36WTOTDui0X/7OawVexklxRgpjLQU4Gv8a/nShhoO961l5sDDTHwaHsvbFUhM1Qyn1iHiAeKYkzx3EMa5m1qK6UoS7nJrjpod6n+nNa0YdYGvGBV3NwEJsdtHoTXzynhvlg22LLahdvjbrlf7/LqPgQlN8amhYtqNuPLmkrrKagNqt8LqP5xj3+V42HF/FiUDVpLOzfnIlft0vVJFXC9wdXDAuqTcAYFgmTh5TXsXWA7V//cGGcxNb9+ZE7wvlwA2uHKMQlVe4UNs5rRgES8g1Sy2E8KsGw4tPncIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HA5Nca4LINlal1NSZOkooEBjg0aAxlzIT+rkPGGcwn0=;
 b=tgQYA+KVx5DLChAgw8L/ZIbXq5hiUkseSvBNLlZGx6hRCda/JPd6UaGqSrh50bDk0Nob7+EMl7y7BGHNaNMrqUrzykJvyrDPr4MjicOZtI2EJFJJl5uXAcyz78VT4NalvMsElHEmB5zJ7jHyyRrDlEbgPqReCyIv1Ol4czoHfYg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4141.namprd11.prod.outlook.com (20.179.151.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 09:01:56 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 09:01:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <robimarko@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Add 4B_OPCODES flag to w25q256
Thread-Topic: [PATCH] mtd: spi-nor: Add 4B_OPCODES flag to w25q256
Thread-Index: AQHVujjKp5CZAC54iEGscRsOtnR5+w==
Date: Tue, 24 Dec 2019 09:01:55 +0000
Message-ID: <1f7332ed-d439-39ef-e825-c042ed863e1d@microchip.com>
References: <20191116161656.13973-1-robimarko@gmail.com>
In-Reply-To: <20191116161656.13973-1-robimarko@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [86.122.210.80]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8202c1ee-1873-4df0-907a-08d7884fed56
x-ms-traffictypediagnostic: MN2PR11MB4141:
x-microsoft-antispam-prvs: <MN2PR11MB4141E76524126ED68D4C70C4F0290@MN2PR11MB4141.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:843;
x-forefront-prvs: 0261CCEEDF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(376002)(346002)(136003)(396003)(189003)(199004)(316002)(81166006)(81156014)(110136005)(31686004)(8676002)(186003)(2616005)(6506007)(6486002)(26005)(53546011)(66556008)(64756008)(66446008)(66476007)(86362001)(76116006)(91956017)(6512007)(66946007)(36756003)(71200400001)(2906002)(4744005)(31696002)(478600001)(8936002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4141;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Nn3xa2w1Ts0GjXkZr8vlzXk6ZwetICbvX4N73LjNx4ohW76NulUEuItvSC2Vs9I8lHma9w12TKXEyJTH0DdsW30ojgd7rxmexpILBh6C/Rk48gapI5leMSNGfWTzE3RcWfHpMwE4taAuw9IgvsYanbgzmsAzYlD/BQD1Ds59LyMXKUP+ZHD+wvs6qBlvL8WWShUwSDMhyOePkzXOM0mQEcWGxLldoq6yr5aRmLMU/9zuWbsovXZ+hQMqgZhB82HiJUTbDTguZgAW1rr2s4O0YHGudx7KQxm9/xMyTNc3fpOv867/TeB2WD8S78DBMYPmGwERW10+31UPneCbYa6NtBnkU9KvKda17AG0xUEsegCs6DK/aJsVD2I/Yxyp6RsAhEfPl8c6LsmS7pBx47WMW9UBXfKETqEkwqb3gcH6NAd3wfeyp3FH814iHk8N5LpK
x-ms-exchange-transport-forked: True
Content-ID: <7A1241FB791F924185E2F81BA0FE7F14@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8202c1ee-1873-4df0-907a-08d7884fed56
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2019 09:01:56.0312 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EBPF1965MMtMm5DPDBTa4Nt33V52kkuB2mRH49PFYwZxz1EJ6iLreJ92vgkpk2qJdZdXIGSJmKWMuIPks+zr4ktxtiZv2Evq1luAqH9AH00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_010201_289233_C993A426 
X-CRM114-Status: UNSURE (   9.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/16/19 6:16 PM, Robert Marko wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The w25q256 supports 4-byte opcodes so lets add the flag.
> 
> Tested on OpenWrt under 4.19.82 kernel on 8devices Habanero.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Patch applied, thanks.
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
