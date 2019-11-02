Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E7CCA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:46:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F12214AF
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:46:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PNRaNVgQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="RCwqQYKz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68F12214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDcYglO7DnrDiyq6ln29K8en6LyvY6u8GM9v1x2hI8I=; b=PNRaNVgQ214aiT
	mB21QhG3bMNVKtbLi5f0uICcWD6QN924zYvD9XKdsXzV7Nphi0HWOchKxH2eE4jvsZO72c8tD9AVx
	O6MUOCRztwJAIMFQoVHjLGmRwm+FpUI5r9sGNNvbVgBLK/EWtOfahvKmU9AI4KtJSNvaVwLlUMZ4v
	YSUjWZ7FGkb4rVh64P7ceHU8ybgLmAAIIV6xsh0vJvAkYRvZjf3B2hq5LYnxfZmQWj4zuqutneoZK
	nZCcjgjAW+d6LQGYY/MAUVVS9/qJFkmX/DqK+tXvRbgAhYFMTS57YymFLsipY7y5BdEVtXyxC7l7w
	2PPQKxR9LR79r+el6vkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQqve-00072K-72; Sat, 02 Nov 2019 10:46:46 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQqvb-00071z-Er
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:46:44 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 2xM7p/FkHlgkbC+sagWyB9avhMAKAnJCJ1t0YokE36RuG16cVC7TzzQaJyqgo6dzTE5U6YWhI1
 j4qo3CmHyeM+T2Kki2/Q4fgdIsX0ZQC/7FbxLBIwEAMsoJwIWCPa6dwScSMnbCjobh7G5XNHxC
 egw+XgHdmEphCqn3rxYWbGELHOvIatz/Z0xBw12jf2ZhohuHFuCM6PuXjS2QbOLIvqQnhrXl1Z
 14B75tja3Yek/77LLoU4+0WzzqrZC6Y9jtli2qqKM68dXwk+BmUb6n3RLvrV7LYxSaqelbOuMp
 Clw=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53868282"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:46:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:46:43 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 2 Nov 2019 03:46:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dRRuUbgRjhHeU500+iI96GE+OiDnmiYeEeXYocsT54/D3nbmnhbzj/83cjqiDVyyR6n1oWZbKfPu5rOaN2PrRED5pDE+Ss8r2MB0uhTqonC6F1hgZyD83SLa006eEOT+i+mxUB3Y9/rHhpULa6zJjBERqBbjK7U3faixiBB3SGRUKCyUSEA3WdcC2Oc5qCtMFqhYYKK5aBUx/9d6eXGkIcZx3+2P5ssCChNBi6ZnG5l6H+aPbGSiQP3eJ9UcWkE/2ptDycRyBIuGOZ3jjFk9bZuyqoE7K0k/nGv6vfR5MdJhI8dXqNuNNXlRyd3oEcY/tpmkO++EB84pEvn+hIt2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f10L2dtv2k9f/b7xK8ZXkzGSRJq+OEVwm7Ae7ZwysSM=;
 b=naiSOtnp/LJ4OOktiOzsle5mCC3zdCKIJIAIBZOguvHyjipx3JxV2GHnfhwbatfJxG5igeT6mRsqkL5661AOga6B+8/8Vfw5bTY5+yCEeQgnXQqMwTM3VPY28Yemom/RUcwR/KrpA2cPsBHH4mo7y3xxEE6tjcCflK2DBNzByK90GUgZBdEXrco2qpBezpAzpLcrj/+BRGNpWwgpLZQikbxdnUuPxwmLuzG8YnHtx+ht7qTfb0QU8OgJmR/JtXTgdfaQiEw9UQUUvHvieipBiDdcPt2pMc7ra/W1i8JtLtChNuBRXEQjkXnErVwL+HZkLYFK9kmWqhu9kwtRh6WDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f10L2dtv2k9f/b7xK8ZXkzGSRJq+OEVwm7Ae7ZwysSM=;
 b=RCwqQYKzKuyujM3t0hH0w4TeCobx+bJfL96vsgNSy25nP/+bUZAGqISw9iO9kf+nAty2VzJ3RfY4d+8BRqHFMSe9PTlBHNFtvaudFw6ggW/bXBv1lk+lxdOl+6okokrFhICqa380fsM/URBASS1TA1iVj5XVsHyiQMXdiXYQvBA=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3629.namprd11.prod.outlook.com (20.178.252.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Sat, 2 Nov 2019 10:46:40 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:46:40 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 11/32] mtd: spi-nor: Drop redundant error reports in
 Reg Ops callers
Thread-Topic: [PATCH v3 11/32] mtd: spi-nor: Drop redundant error reports in
 Reg Ops callers
Thread-Index: AQHVjkplMcJSJ7ucD0m8Dk/rmpqoY6d3uPmA
Date: Sat, 2 Nov 2019 10:46:40 +0000
Message-ID: <1cfe6a86-65b1-4a0c-ac5d-4c449822c0af@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-12-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-12-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P193CA0010.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::20) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ede7f69-1ff5-4519-5461-08d75f81f120
x-ms-traffictypediagnostic: MN2PR11MB3629:
x-microsoft-antispam-prvs: <MN2PR11MB36292F1C5EAC0742A7419E7CF07D0@MN2PR11MB3629.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(376002)(39850400004)(136003)(189003)(199004)(66946007)(66556008)(316002)(66446008)(52116002)(2201001)(86362001)(76176011)(6512007)(53546011)(386003)(14444005)(14454004)(305945005)(6116002)(229853002)(31696002)(6486002)(446003)(71190400001)(25786009)(36756003)(4326008)(66066001)(6246003)(6506007)(102836004)(2616005)(99286004)(8936002)(478600001)(71200400001)(11346002)(8676002)(81166006)(66476007)(81156014)(2501003)(256004)(3846002)(5660300002)(64756008)(7736002)(31686004)(6436002)(186003)(4744005)(2906002)(26005)(110136005)(54906003)(486006)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3629;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: suPPKRW3reGG4RBqNFoErLgPyxCE6Q1rzWuKdpUgP5dbbIzRax4fSr8mut6SHGNT8nqSTVnfYNG1XG4if456yU6fXonMivfVI3GeW2VL8Gy2FrrslRbB5RoXtNyUa0KZwLJyq5FsPRSpYXEF7q7b4E40kTAVa/6XG3Rf3FfXT9NxxWRjjtqNJ74EDq1sIO+ilQYV+Fcww4aOk8XKS8O5TI2xMzwyKeRjQ/Yh33pGCA9FIReuHpT5j/2dM3TOsdE6/sw0qU2xoXZPzHALJW2dRfAX9Cb0gZ6lerjDOylNOLY+dyQT79vGOvrxhYVlD1tG+OU9dAqg7lv5MV8fPsjYbF4pjjuDvnRdfW1m28tG9lIIpmpENMOSgBrtXYAIZK9Ngtn41YMmwUdjVLWICr3U5iTDO0uWhO8RT82L6bI8vFVRkSBYeAydzfQU0qoXNM/L
x-ms-exchange-transport-forked: True
Content-ID: <D4A7B7A79E8D3D46AF748DC26DC72E43@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ede7f69-1ff5-4519-5461-08d75f81f120
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:46:40.1699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MbgT82BjD+X3Dj0LhNn81n+mi17LxqoJ8bxMPPd7l45N2Ob0dl0EinoR2dPBSThaQXPjDSp7ghDMxqhGtU+JdnyI/hYsxYYc1tyNSYkkBqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_034643_543685_6EFA18B5 
X-CRM114-Status: UNSURE (   8.93  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/29/2019 01:17 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Drop the error messages from the callers, since the callees
> already print an error message in case of failure.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 50 +++++++++----------------------------------
>  1 file changed, 10 insertions(+), 40 deletions(-)

Applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
