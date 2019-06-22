Return-Path: <SRS0=H4dZ=UV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40CC9C43613
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jun 2019 10:22:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13AAA20665
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jun 2019 10:21:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYLmgju0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="qgov9Ks7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13AAA20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k4f6h3UrR/s7nbQ3Lq8ymgpL5auWK5AHGm9WxbEzMWY=; b=LYLmgju0SNn0YG
	1w3FcsSljNRKqk1QsinZiG9F9BCDDpd0H+kyuzxJR3haxX/FYEHPKGwdRyPEcsIcjabOko3QB4PID
	LBywdBwJ2JUup7+yGpu3y7hv4lqFdCBS81ZZm0T0FmFgluGHDYr7qWGLYYAoBVwXz5kZea4iyisLf
	k2FZ8dWmXJSTgDXzWpyacwkCw3R3AmcmYfff69AR1+9ryKk4SYy6EMVDk1L4Hjc0vfD00zwehfv4d
	DaU5gTs2q81c6RXsTwLaeUIJuuJnnLFT6V5ZkJ50oz9fl9MG8iF3w04Kzm6fTRZGcOlT20m0WBaHy
	lywwMz1gRc7Sx8Uz6joQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hed9Y-0003v0-9l; Sat, 22 Jun 2019 10:21:48 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hed9W-0003uU-1D
 for linux-mtd@lists.infradead.org; Sat, 22 Jun 2019 10:21:47 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,404,1557212400"; d="scan'208";a="40026521"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jun 2019 03:21:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 22 Jun 2019 03:21:46 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 22 Jun 2019 03:21:42 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BqQrbkWQZcZCXZMqKKTKSZUnlNi00dn9nuTS7YkGrXc=;
 b=qgov9Ks7VQh59+gwgLjuwvNG96Q0XNg2Vuv9l5LHJHnTRD42Igh8B3E8ra/e+7HnXxlTbLceu6lNMl6S7ASyjAixtgZC1i8JK21whDAMzkwBUsw2TGzWRTMPv0yZjbNJewzDka/v4E6bZOPppk8rlpS0toKbFouqqSdSZDCm9Xw=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1651.namprd11.prod.outlook.com (10.172.23.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.13; Sat, 22 Jun 2019 10:21:41 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1987.017; Sat, 22 Jun 2019
 10:21:41 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dinguyen@kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCHv6 2/2] mtd: spi-nor: cadence-quadspi: add reset control
Thread-Topic: [PATCHv6 2/2] mtd: spi-nor: cadence-quadspi: add reset control
Thread-Index: AQHVIdur3cT5P1lXJ0SybjCFjOpNoKanhNEA
Date: Sat, 22 Jun 2019 10:21:41 +0000
Message-ID: <08cde9f6-6687-94df-b4fb-7fde2d9a1478@microchip.com>
References: <20190613113138.8280-1-dinguyen@kernel.org>
 <20190613113138.8280-2-dinguyen@kernel.org>
In-Reply-To: <20190613113138.8280-2-dinguyen@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR10CA0088.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::17) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.138.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42d248cc-92a7-4b97-678b-08d6f6fb6b19
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1651; 
x-ms-traffictypediagnostic: BN6PR11MB1651:
x-microsoft-antispam-prvs: <BN6PR11MB1651104E1FC6B9248B23F6F4F0E60@BN6PR11MB1651.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 0076F48C8A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(39860400002)(346002)(366004)(396003)(199004)(189003)(110136005)(31696002)(99286004)(31686004)(8936002)(54906003)(6436002)(2501003)(229853002)(186003)(256004)(36756003)(68736007)(81166006)(86362001)(316002)(102836004)(4326008)(76176011)(6512007)(52116002)(81156014)(8676002)(71190400001)(6486002)(71200400001)(386003)(6506007)(53546011)(25786009)(305945005)(486006)(7736002)(446003)(53936002)(6246003)(14454004)(11346002)(5660300002)(2906002)(478600001)(72206003)(73956011)(66446008)(64756008)(66556008)(66946007)(66476007)(3846002)(6116002)(476003)(2616005)(558084003)(66066001)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1651;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YGd2czd2nYGwyaDCfb8NsZ/1F4bDUEB6wGAhBhC2NLgBtuY4g3bexNrRJKvM13H1lYK/wXpT065+O6Wl/Ph+vOUKeYDvxKpiNVMKzqk8Cv5l/z1doVAvDOt5EY/++kPQIKmNORGe2Gp/+rTF+Qjd2XsblefKvDUrJBSnkUQ5HdBYre+chgQ5L1Qd3gpZWYFw68YMnMymsAsh0PGIW7QlW2fDlD9cbsV/DiIibQRFlVWTTRF+U82qtSYPDKPDLGezTVTPTOr+SJX6L/Xr0TRq4OopujaYhd6s9vNb3cOX1+Ms8Imzs3dIKirsgGdRAB42Ux3BMV2nFghizFfh1+KWbKej8RNCeTV0QZ+Icg8imREygMYLKh1+s+M26/eayuPSQnvekKirSsw5bumUj+8WOrcX9AS9hT+tfI/ChaoeeEw=
Content-ID: <1C32387A3F293140B057ED18583EAEA8@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 42d248cc-92a7-4b97-678b-08d6f6fb6b19
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2019 10:21:41.7238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1651
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_032146_190004_FCABC1B9 
X-CRM114-Status: UNSURE (   4.89  )
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
Cc: marex@denx.de, tien.fong.chee@intel.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Dinh,

On 06/13/2019 02:31 PM, Dinh Nguyen wrote:
> +	struct reset_control *rstc;
> +	struct reset_control *rstc_ocp;

I'll add these on a single line when applying. The patch is good, I'm waiting
for Rob to review the bindings.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
