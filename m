Return-Path: <SRS0=FYfc=VZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7173C7618B
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 06:22:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AE03214C6
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 06:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MVdFKQep";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="a+9SqLeF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AE03214C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEpeA7WX7C63HnVY3nyrkxu7vM/S26lD/AKTyXtKh5U=; b=MVdFKQephkqfIV
	+DDGcphIHZ+sjilSdDCvyZoVrD/eXkgIjdSQLWO+wPCcMjJTO7sYf1QO0u4QOMmlAW4n+9ZAevEmL
	2n/x09PySwH87pFZJOpeiQJ/ycgfWhYRxIs2Q+NiTfk1AtrcJyG4b2e032/zF5yCrHiwll9/N1Hk+
	NFoQ9I6ZCsDQFSqMEMHU+7d78yD/WxLTc+8J6pEJSYDdsGHw0Q7HnmXznQfJClNh2gQTUkQyCy4AS
	tc2mGPD9vw6hkGS7CMXzixvIdrgxKx8mapD94WPAv+9GCtTQQd/MtmKIXbfwhBpp1szywnGJUSHRV
	2HDrUX/wU75NKjpD1Nrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrcZM-0004oA-FN; Sun, 28 Jul 2019 06:22:08 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrcZJ-0004nl-4F
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2019 06:22:07 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: BhrH6hNQjyLVledD7KRmnd/6FyjHh65LTCur6CxBDRXx9qP1x7vHXjzmb4t0C10z2mNcRHhe+L
 y/423Z32JyG+Ntk20qOHgYJMUBYTcG9jBxSewjEwI3NFDJYUmgCno8Yng5QgnR+scXi1BWawsm
 j83R3AFWe+cWdxbBZxZT8OmbkW4+8114vE8Ji4+1rt8iZF/wqBVirc8HrBiBn6Z/2DXBGu+B+o
 ihDmzg6P8D4BzWhlvQQ5coUJQXy4M9F7Pqvj/Zo6cznWfwAX/agFLsfUeexoFrZPyzo8lEjNEj
 EEk=
X-IronPort-AV: E=Sophos;i="5.64,317,1559545200"; d="scan'208";a="43039163"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jul 2019 23:21:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 27 Jul 2019 23:21:40 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 27 Jul 2019 23:21:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXk68K5z8z9ropGUBz8EG2oiM9f8Sub1Snyxg21OTubFnII+I0cnYSWKbkPTR1nXYiR/gQIIFq9f7p5BauZ9BzNPZ8A0QEg3A0wMej5f7dgoOtVMynWaCDbj88mljcCENnKvflXQ25zsi58MeiU1xKG1LWmVpelwliSic1Q9n8oB3LbD3cpZv8CpoAXw6tCFT98a7/keDltbMag/XSFE+Vaw04DNsHnX4BpSviKq4L/5487p/O9n/BMc652E+w7qKiAt+a2OS72E2AodWrkMr8PliW9et0YE1VekhnUxzvKkuuog+UFx7lVJ2CfUZLgwI4JfiTxNlLcNlRtvawq0mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lB+XPJTeJKFWX7ktRgFhzKI1sI2ptHhgiht4T+7jsmc=;
 b=UV1zqyG6/O7uLd9npFT1xP64h7dGJWYESGPs08wTKzVDavDwG8WUcJR4nanqGwC/vNiHK/uwNcupJW4reZ+3ys+7ARId0Lj66k8j85caVplkMkfbGeLvloT1U6YCQMFcX8IflbWW8vNJAUplsrNZrYBM+/7CDcbhrNvU2oB65PN4jG4tVCnK+lm8G3SI9g1nLshG2TXo7LPl8iZtxwg+EdqWvTBL1eNDZqp1vr/gtJgHsgFAl7vL+sWUp7fhzQKT2vMZX10B89Q4lS+cAoVsjK4bt/SpD2WFckHxlLy67ibQtnFrtaQs28d8lsj26gp5yJHS5OvNIBIMO3ziuIOxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lB+XPJTeJKFWX7ktRgFhzKI1sI2ptHhgiht4T+7jsmc=;
 b=a+9SqLeFuyhYWg64ITc46cjOc+8H0Ig1v3Y1t5oFAM1/SDrdJY4oJMG+LMKiKz+YE6DnRHFZduJRAxD6gDulvK6VMY659PXK5olJ5OZaLzCu575NV4unawQkjRk9W7GvBH5roGw/KBbuABWX49PqVuHIu28w/zwR4i2RAb0FbjQ=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3968.namprd11.prod.outlook.com (10.255.180.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Sun, 28 Jul 2019 06:21:38 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5%2]) with mapi id 15.20.2115.005; Sun, 28 Jul 2019
 06:21:38 +0000
From: <Tudor.Ambarus@microchip.com>
To: <roman@advem.lv>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: fix GigaDevice quad_enable
Thread-Topic: [PATCH 1/2] mtd: spi-nor: fix GigaDevice quad_enable
Thread-Index: AQHVQ/Zj/YTQYrM+LkKRVxGsjoLerabfiDQAgAAJQYA=
Date: Sun, 28 Jul 2019 06:21:37 +0000
Message-ID: <c80dc6d3-d9de-7e95-f1e0-62dea07ef923@microchip.com>
References: <20190726210830.1932-1-roman@advem.lv>
 <11718527-0145-a99d-83fe-19885c9609f0@microchip.com>
In-Reply-To: <11718527-0145-a99d-83fe-19885c9609f0@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::27) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.106.210]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f78d49d5-25e9-4173-1f15-08d71323d8a2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3968; 
x-ms-traffictypediagnostic: MN2PR11MB3968:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB3968AFE773DBCAC49577B5F9F0C20@MN2PR11MB3968.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01128BA907
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39850400004)(396003)(376002)(346002)(189003)(199004)(486006)(64756008)(66446008)(66946007)(476003)(11346002)(99286004)(8936002)(2616005)(81156014)(256004)(14444005)(66066001)(66476007)(53936002)(66556008)(316002)(446003)(6486002)(71200400001)(71190400001)(6512007)(6306002)(86362001)(102836004)(36756003)(53546011)(386003)(6506007)(8676002)(5660300002)(81166006)(6436002)(76176011)(229853002)(52116002)(6116002)(68736007)(3846002)(478600001)(31686004)(2501003)(2906002)(31696002)(305945005)(7736002)(25786009)(110136005)(6246003)(4326008)(186003)(26005)(14454004)(966005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3968;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ukJLAZBL7DvuVok4bvnMoi1Lm1italntwzQzlBkSTyUvjusRwbhWCZlICfZtpMBsIsHJUsxNHgU6Y91IuBiHk1XG/YZvwimgQnKX7QTepBJzP3dX0EtvHphH+59mDFeLFg1OktSfZgyJCQKUSgQxynTb73TJkAcE3UPvd3svoDm2wDwZdOmhIzsaPLFOBCeizPHTV5PD0MV6MN6EnX5zZkwvmFi8/5fJilYfcSyyWQcWy66u9kk4KWFa+UU8q3mDPXiii4Ipy4CIM2f35cDB0VHCYr94ASBWI/aBVqnRJiU0Z0SIvpARnzAcF2+Zlk5pVR2SV1eKHUx6KtxcDm1xshiKGB8SN+DGo/ieJFjnTA0fU6t1juVclKPk0jVq6Qeo0jTSv/NYmHuiTrSoI8GWHza+OTK7KjaMpXvww1UOS7k=
Content-ID: <063E7296FB231B4FB1DE64941BA884F0@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f78d49d5-25e9-4173-1f15-08d71323d8a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2019 06:21:37.8453 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_232205_284947_37CA1E9D 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: marek.vasut@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 07/28/2019 08:48 AM, Tudor.Ambarus@microchip.com wrote:
> External E-Mail
> 
> 
> Hi, Roman,
> 
> On 07/27/2019 12:08 AM, Roman Yeryomin wrote:
>> External E-Mail
>>
>>
>> According to datasheets all GD devices are capable of quad mode, which
> 
> Does any of these flashes implement the Basic Flash Parameter Table? Can't we
> determine the QE Requirements by parsing BFPT?

GD25Q256D can retrieve the QE requirements from BFPT dword 15. No need to set
the quad_enable pointer when declaring this flash, it will be overwritten when
parsing BFPT.

GD25Q256C implements JESD216A - just the first 9 dwords of BFPT, and it can't
determine the QE Requirements by parsing the BFPT. That's way we explicitly set
the quad_enable function pointer at flash declaration.

> 
>> is enabled via Status Register-2, bit 1 (S9). This corresponds to
>> Spansion SR/CR operations. Unfortunately only gd25q256 datasheet is
>> clear about Quad Enable Requirements (QER), others have no such
>> information in datasheets.
>> So define quad_enable for all GD devices to be sure.
> 
> Which flash did you test?

What you can do is to check which of these flashes can't determine the QE
requirements by parsing BFPT and set the quad_enable just for those who can't.
And it would be preferable to do this just for the flashes that you can test.

> 
> Cheers,
> ta
> 
>> Also gd25q256 is an exception. There are two versions: C and D.
>> First one uses S6 bit (like described in e27072851bf7d) but the latter
>> uses S9 bit like others. To add support for D this should be handled
>> differently, so, to retain compatibility, leave gd25q256 quad_enable
>> callback intact.
>>
>> Signed-off-by: Roman Yeryomin <roman@advem.lv>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
