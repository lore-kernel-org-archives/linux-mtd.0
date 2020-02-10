Return-Path: <SRS0=fEDX=36=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2015FC352A3
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 11:26:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4EFA2082F
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2020 11:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VpUh8no+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="uKfRRgBx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4EFA2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9oGMl4hns8hpDYGLL/bi0ZwHpD4hFyiMFiUI8QCzxc=; b=VpUh8no+RTHpEU
	jp+nrfwszLWv6oAKz87MGysUJJXErgpr9a5/38gQFnJb0IjESgyfmQwcUasIqKDXT/AN3NS5SSk/4
	6qHWhZxINH3484tPUPw3J2cYxrMrW2d99DtrtUOVopPnZrGhd9P42OlEFmhHlZBGAkE0FLpdPIjPL
	5wxlkxwRnfVf7dpEru9tkLWsxI1iWE0+8kR20bq6jiJ6HQ2pVjOzCUKPvTOiH34Pl9VX0YKhIVvJE
	uRCeVgTDZOaTRk3vs981qmZpbAtZbkvvP4Vf50KzkpNnepsxV47vlludJ/Dm6hlR2GZ1GqiWi6Yt+
	E2WdVor1LhzfJPhfwqow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j17Ck-0006LQ-B9; Mon, 10 Feb 2020 11:26:18 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j17Cg-0006Ku-L1
 for linux-mtd@lists.infradead.org; Mon, 10 Feb 2020 11:26:17 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: v+LHnNa954E6vvheUXLLyvRcJAmY2kB1jBOfmyVThFHTokI5vFISL4mS+h4jYrKLt14ucYOTJ1
 n7Pw3EIMuL4luJakO2Na9zKXal37AAJRP5KDjJ15i/OD8tRGRNDRQphIE1G8NiwP+o0I4c5tJ3
 UmN0sdVMYD0+CNQhspBQjRj4uA2e3XHdWf2+ZbB44bUBdlkS9Bz1ldKVafd8eMVf5rnylMg3BY
 CQUPwJEQEa8i+445sF6B5Zm13KRaZI1oBRYNimXc18NlLv6gej0CPPrfx63h2TqO8yM/lNgJFN
 nF4=
X-IronPort-AV: E=Sophos;i="5.70,424,1574146800"; d="scan'208";a="67870960"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Feb 2020 04:26:10 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 10 Feb 2020 04:26:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 10 Feb 2020 04:26:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFF5khMvdYM3R5G7XFRS+oBnYK3+hNnS7UOCaWNsFXW8BgG5Sw2aDcOdqWFvWAw+KKLkc8o27v/yChsR2FPhHBM+VuVYAU+RhddMg9IDWcLThSPj3GT/dXcnYAv6picm8ltYY81O2kx7J0gcufrsn/HLQ+EPLaIwcyn0ktKMdabla3K5tK/qxfterbGVwG6suqX8RZ9e4rgYbocZH0NFw6uKTWF5hINiNnOru7Y231ZxywwjFMHE6GQYYAynPXHw5Alq5nkRik4vt8Jel9oaL47l8LZ35wwuoIg8wBNYBx+ScK05EQEZpTFY9CRf0zxXrdlz5A76EXLMuplDLyc9Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7cX1VRnzhm6DyEEOvbqYBRU6H6+Ept+0l7WpAYMA8w=;
 b=OSnkPHqji7kTboIE6m11NJw6ret7XYQP30KFpMR8xDmJ9CHpl3zSy+HI3Wo5E/ghLKZEdjFEvWs+Bgdrj8RSiJ7U4Wk4rkBodi9BMyf/EPYqGaWJwKfikFfbKDRSPZnfLa6CiXMszS790T+f9UQJG7bo2lLuheIGtrh1Lj5eJuVbpLjNQ1I9kw7DjuYcXlIFoH5LlSwoynctbgs9ZdtiSsKv2B6hggCg7uxyVSg6/t44MFZVayeNWnc2009twXtk7CcYT7hYxt5MQK1Q8qRIdUZbpHQ7y9/T2pDvSJ4yA88fMvmItSiBDqcnIHDydWSX65Cyfq+HRwYdAvW5oBCQjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7cX1VRnzhm6DyEEOvbqYBRU6H6+Ept+0l7WpAYMA8w=;
 b=uKfRRgBxnKdEy8XPmqWPHwMMBU0w2nMAwEKYRpyuD9y8xmgvhLfBeh6PXuKZH4tBiCPnWOukFQvPeiovug7L4ToFn9BwZ91pGjcGnA/1RpYlpMnmoqeLtO64Q9LSw3uRpX1pOFjyDTOB4UBENYcmQ0SJ/3JuDxk9ijpmUNhkz5Q=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4414.namprd11.prod.outlook.com (52.135.36.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.21; Mon, 10 Feb 2020 11:26:06 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2707.028; Mon, 10 Feb 2020
 11:26:06 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Topic: [PATCH v3 2/3] mtd: spi-nor: add 4bit block protection support
Thread-Index: AQHV3bCHi2pGqMNGHESG9Z9T0h6ocA==
Date: Mon, 10 Feb 2020 11:26:06 +0000
Message-ID: <132665276.5Rxbr4LpEM@localhost.localdomain>
References: <20200113055907.9029-2-js07.lee@samsung.com>
 <4000296.ZurDTCRVlM@localhost.localdomain>
 <23efafdb8c439838338eef421e341f4a@walle.cc>
In-Reply-To: <23efafdb8c439838338eef421e341f4a@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cd65997-1994-4f97-72a3-08d7ae1c053e
x-ms-traffictypediagnostic: MN2PR11MB4414:
x-microsoft-antispam-prvs: <MN2PR11MB441458B63EF5A184549EB335F0190@MN2PR11MB4414.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 03094A4065
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(346002)(366004)(396003)(199004)(189003)(316002)(66946007)(76116006)(91956017)(6486002)(6916009)(64756008)(66556008)(66476007)(66446008)(4744005)(6512007)(9686003)(5660300002)(478600001)(54906003)(4326008)(53546011)(6506007)(8936002)(26005)(186003)(81166006)(81156014)(8676002)(2906002)(86362001)(71200400001)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4414;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yhJxhbypcczwOoGoUjHjkH/e98X0ed+BvaJVnETxaa5g6F/KppqmDa8ABx/TH+KY/QWMTThHt5pYCpiidzm1V42JfrLyws/LMnF+hkA5NGEZWzBEkNqxsExVb7amrFJFkMsPMOEH+3Y005iuNzDut3QnkPNWbxCYyMwjxijH7C6KdStSkuxZYsYIIqiR4wVcLMJhqY1PBb+ITMKuIM+t3WEUvMoe6hY9ZqVvfcE9Dvnko2WwJihZbR/XT8dhtTFs6r5tGijYcSNsIUUUEZpdNjQ76nP3oGgHVCeekTDDllt2hCbDLMLD5u2cJwJ8ieLzeCsc4tA3rgqIX0atU97gqLYlNxw++b/nEfO6sG7HVPHiGQmocqCFiVwsmXiK+ABhylFHy6ZaQ5FXwWC2sVCpMSI5NV/yAiDxTK6dEwRgBSmMFWPci4F/40vZquoycaeiGbcnLvEKnhq4SqcmclbqZRbezFZ6Yil4Ggr8G8hrN/m9QH9RquqA0JrRK0Fl/Oze
x-ms-exchange-antispam-messagedata: VYl1DkE2qcLRjUBncypDRMf94sxeUYuwNs+S0yGDhWSLBYnSyi9KxImgm2f2kU6Vl4FlS5t1ZV9SCbLgzqP2mgO6ZvM1aM5PNMT4mMK8u5m5EgvCyW/m+rLdKsmoM6UyzOjxOVCaFef2UX4h5CpNaw==
x-ms-exchange-transport-forked: True
Content-ID: <43B0FFDCB9689C46AF286709DDA10F2E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd65997-1994-4f97-72a3-08d7ae1c053e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2020 11:26:06.4231 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P9HKyAns2lawG7EjEQpW2NO7yYxOLEtvWlSUPzPWG5BZdLVBeZR2Mc0xdqdUZ784m4qxyBQHJF4gTB/H90CF565HDOEfaBLX0Vj5WevRycM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200210_032614_845918_375B97A3 
X-CRM114-Status: UNSURE (   7.87  )
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
Cc: js07.lee@gmail.com, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, February 10, 2020 12:29:34 PM EET Michael Walle wrote:
> > It's bytes. Take a look at W25Q128JV. The sector size for this flash is
> > 64KByte. The flash has 256 sectors. For this specific case:
> > bp_slots_available = 6;
> > bp_slots_needed = 8;
> > 
> > The if condition is true, so
> > bp_slot_count = 6;
> > bp_min_slot_size = 64k << (8 - 6); //256k
> 
> But nor->info->n_sectors is not 64k, its 256. Do you mean sector_size
> (like in
> my example below? Then we are on the same page 

Indeed, there is a typo in the pseudo code; I'm happy that the example is 
correct at least. I meant sector_size, not sectors. Now we should exercise the 
logic to all the known (corner) cases. Maybe Jungseung will tell us if he 
spots a flaw in the overall logic.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
