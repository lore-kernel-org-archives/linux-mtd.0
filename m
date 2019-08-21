Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9D7C3A5A1
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 08:23:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E75A522DA7
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 08:23:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GiAKVRAO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="k7pdeqBG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E75A522DA7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=INa26iLHQe9ExUQyVIp3l8C6xVC0i1eEIrEaUTZqgXk=; b=GiAKVRAO16TUVI
	RePpPhX4W6/zenruAJhhGas8nve0wtlgeOB7P1KwDSmuXsUjckV+oVn8335spjbOvDtCHlfy5bgLB
	aAR1pID84dlvbHRFhzEkgZoIfXP6O8Lktf+I2oBsFzvJST4HyayOhKMPxB3z4KKzyGj61oEi+a1YB
	iNXs1NeQBuOfUYMEfYjJPwW2r5bkgeg+kC1ZoEl+/X+oCyhKRU2xRXttUUgzFOmRyEcesnv4ngC1Y
	l3bn4ywSMtSMGmLIXrWU7T+A/2YQc5ekCt7wxuqCTOqYfzP2SeRoaUjRTbvANvTEd3ALtaCgqt2Cn
	o2GQU2TxrxshxeAKqnmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0LtV-0002zp-JQ; Wed, 21 Aug 2019 08:23:01 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Lsf-0002Ib-7q
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 08:22:12 +0000
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
IronPort-SDR: vECwdq1aDFTAwmkGku2QYZNw90USW7OybrjgKsE3xWAgPCK1Hu7aR5u3zCbXRMEfes3LTJlcti
 VphSAtBDmXVJYl8KlF0SUazJ5+sp3YCZ54BRFj3fKIXNkhw9De09kdt+PZldedkc5Y9/5OcW/J
 KeZKy4GjnRHhUItDwrUWcPjqpQOtsFCsLHLfE/KINkAmuWChGHkbjdqytNInbIUi4t8Z8fsMIQ
 Bzi1X/BLG0nDRlvBoYhUOylNmCf/LwVYBD8Y/c3NknkAxxBZ/01vuA1+w9A/H1yMvhHIMZ5MSv
 gCc=
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="46037443"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Aug 2019 01:21:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 21 Aug 2019 01:21:51 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 21 Aug 2019 01:21:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4/dBTQAIG5O4Q19OCEUvcmqbqmmSXOcFdWudPOrAP/Pcd75IEqktHL9G78F8J3+Jx583LX3jjVlvF/QM1SrLblC96slYu69XGPvgbBQz77b9ewpn00QaLwI/SpRh7LcxdWRtUqAUseIEnnawhmiJIxeCRUGzTJDdcL/Si3fQIEwc0Z2StXBipPrPZj8YJ5pgobFunqrk5pr3pvgfJvBloZEWe4xAb2QHfjglU834ZqIVrHeIc7zn9uGnrLXY62qwdgRKZ4WiqbMSNifDJdPFTkkeAjzcaMB7tnSK7cmNw+oVRqDESZY2upuNvqqR2ub8mtKDyRRbUMvaI4c11hL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn0N/PNy3qjEYy+OSAgZO1XPi4CuK1rUyiF/ritMVUY=;
 b=TXVvMaAYnpkUvIYVNmr13fGR4FiZRLz40qPJpVlReLirim72SDdoMkpENkZuFqRjgn6FqAr4cIaICvPDl1rRsGzxu25QwP68mMdK2oZuLXfT5llpiMtFTwMrogdmrghwJfjtjGFj19j9DqEuFjE5srv627C3STsu+LAtqVWimSDHtn7IHUxC1BRCo/1XBiGEnxpEKqw7AkMrpDlpaW5pZ6x/2hETD/L0A9ZzfJQ0b24pYv6v+6+ZSOge9fNXXM0vna87gcvw1dV8cCUZeciOAxDHW6wDOuVQPetJeiDk9+kmunPtMhywWeJ8o0jW75p21MfhkQsg+8F9xfgA2eSVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn0N/PNy3qjEYy+OSAgZO1XPi4CuK1rUyiF/ritMVUY=;
 b=k7pdeqBGSWq8Rp/tOdrwqbh79wlLeEyL0tgoOUEBMFjLVAw3mLh/IKAfkZUqHyNpC++stfRHJedoZzTrmmky6V/8V+xc/+wAdkZSMIgSg0wF89HHyyJw1ycjHlKflT05y+/I6mJYYZJNRZnWDBjURtRxwlI3eh51YOy2G0yRKV8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3918.namprd11.prod.outlook.com (10.255.180.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Wed, 21 Aug 2019 08:21:45 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 08:21:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dan.carpenter@oracle.com>, <marek.vasut@gmail.com>,
 <Cyrille.Pitchen@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
Thread-Topic: [PATCH] mtd: spi-nor: Fix an error code in spi_nor_read_raw()
Thread-Index: AQHVU0QrPPnbSj0lTEeIojqRI3TmEqcFTFmA
Date: Wed, 21 Aug 2019 08:21:45 +0000
Message-ID: <dd7530d3-33e9-7d7c-e29b-fe786b159394@microchip.com>
References: <20190815083252.GD27238@mwanda>
In-Reply-To: <20190815083252.GD27238@mwanda>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0197.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::27) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 236e7b12-c06d-4191-b923-08d726109a76
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3918; 
x-ms-traffictypediagnostic: MN2PR11MB3918:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB3918DB36B951EDD4A640B2BBF0AA0@MN2PR11MB3918.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39860400002)(396003)(346002)(376002)(199004)(189003)(66446008)(66476007)(64756008)(102836004)(486006)(52116002)(8936002)(36756003)(110136005)(446003)(2616005)(81156014)(316002)(81166006)(8676002)(6116002)(3846002)(31686004)(2906002)(26005)(966005)(11346002)(54906003)(76176011)(186003)(478600001)(71200400001)(71190400001)(14454004)(25786009)(66946007)(6306002)(53936002)(6246003)(229853002)(99286004)(4326008)(476003)(5660300002)(6506007)(6486002)(386003)(53546011)(6636002)(256004)(66066001)(86362001)(6436002)(305945005)(7736002)(14444005)(4744005)(6512007)(66556008)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3918;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fXTC84tduy87B7tzvRA+BxfBRvXsEGKi4HfbEmliF83geseElnokVLJhzFlar+jbMsK1j+/d+x3okYzXbCCC+1qJPr/5Iq0qME58u4uPEMmULG6DVQ5OgMEEmrz508uGGXgwmvO5YfHgXI+idYjE5w7FWTFIA0wgdgT6cxNn3GACLmDs2Mq24xWum8NLOYM+uI9Txx36mo9U44XoagMoKmU97uhf5JPvFr91TDMCxSyKDO1VlLPXXFOmDKUIb8aS2i5Sy9mooMgCQ7Cv/WmLNt6EVtgf6jvUAyMYMLolyoKXYpWHmAKOdJZmHU6Q7CDu77MSjixlTQx8/8sUHb2vbCaxkHkAWOpE2/2HfSQTa0CFSsK4xZZbvwDlmddqteJOqRxDbC9iS7AkKZcp+OQu8YC1s/RjX+P3eXNAoJPLrK4=
Content-ID: <8B3EF980CAA6DB418A75105AD54D5212@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 236e7b12-c06d-4191-b923-08d726109a76
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 08:21:45.2226 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qL7xu1IMqRBP+V3LxlPh3njkPrH5kPgUbAbseD8NYtiFIvX0+c509WG4IzgC6nowMyIq5NICvBShGAbVm8ritzn1k3kM25ivEfqwpetoR64=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3918
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_012209_814899_60B8D5E9 
X-CRM114-Status: GOOD (  12.23  )
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
Cc: vigneshr@ti.com, richard@nod.at, kernel-janitors@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/15/2019 11:32 AM, Dan Carpenter wrote:
> External E-Mail
> 
> 
> The problem is that if "ret" is negative then when we check if
> "ret > len", that condition is going to be true because of type
> promotion.  So this patch re-orders the code to check for negatives
> first and preserve those error codes.
> 
> Fixes: f384b352cbf0 ("mtd: spi-nor: parse Serial Flash Discoverable Parameters (SFDP) tables")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Since the bug was not introduced in the previous release and we are quite late
for mtd/fixes,

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
