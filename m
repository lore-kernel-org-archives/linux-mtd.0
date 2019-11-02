Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03724CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:36:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C468B20679
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:36:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cBuLRXOp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Wcd9zEIN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C468B20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaXyEt7gY6x7GLGzFD1dUNPSlJmbEVzNfpt2r3Y3neU=; b=cBuLRXOpJBPafI
	+ee02c2u2/OePRgYjSgNC/CCiY5iuDYdp6rze44Po2j2/TFnJnnqcUnt9mqJD/lreReWoTL5SM3vN
	Ro1NyPWgwdRbrrHB4vUhXjUSIDuX67brCfc8k8lEZ3xtXsQppLwkuqmo6h8CMQWHZxKsWGTdvE/YS
	I+7x0g/iBt/Gyz/M6NjUecO63FS13PlK+pBzDFYXguAbUKr+GHWY2IqRYccdX1fi6P03M9tws9YrM
	RXubsuUJF787rqOCBVjAUvXPEYIVBG3hj4K4FRXyE0V/A3/OTFLmoR2kysqm2QcnxDPZqgTe4rHUp
	uSKszJfxTC4W9nmiIMZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQql7-0001qu-Pm; Sat, 02 Nov 2019 10:35:53 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQql5-0001pw-4l
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:35:52 +0000
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
IronPort-SDR: famNltsAGy4qAwUcjcoU2SAG8DjRfMpVYyZJdqKV8E85M0Cjwq+SKTI1FBPNi0H25/uU3sS6WY
 ia+Bj8eJ3njSLQapJyPWy4T311UUVWV2GYSD9cRX6rVvTPqUklIzWcvk4rCumgk6nbF0zM9RaY
 7sZNZ1Yti8hNE97eFUxchwXTFT/WesP3QVS05yUq8Y4nG14XqZ6+LxaNxNN3rv0mzHab+g2nd3
 0F/vB3boFSs2JHq1iybKpc8jfN1upkFe2oPNYUMjIXZd54VQfWQ7iQBBYZfrEWOZxEvBAMM8zM
 zos=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="55427296"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:35:46 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:35:28 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 2 Nov 2019 03:35:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxuE8R01SjOyr+oTQ/olP24pSM6p/3+Kt/S6BxrNCF4F5/p/9yPgJeZ+AX9rVsbk+artYNyBWnrMSVCBkMBVf7sz2oLt5mGZkJ0f7Yk57WzsKBniTHPxiQk4Mwg4gPnW5foo/l2dcg8evpjSMpYRwwkbg7VOJXh97YWPeLyg7IaCoHxdV59vReL7vG1LEGXH674AWFgKBiWEO4+cRnRHCsTRruA1vJkhPPVPJmEu51jNszM15Hd3Peg3R8b7SzsKOygvqBFXKhc5BBwMDnHOjej3HKeQRSs6yTR2kAXc3SMfKNKXDjD3noqgKLVllEBRe3fQvJ+HWt7U/ElFoXAqdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBe5OIWBO5GriXW0pY5q1pZCyemnhZnfBBV1mE+PaA8=;
 b=kH3Rf/18mBeowaKqmxpEk4UGa+cvUX5T7/Ek0CLciborSY+wKKr4Nb35sPmL/syDFFeegLR2OhbSC/PA017epy55oNWMlcl5jXrKYj4aDJ1FqKNe7dRrTkRhvMtwOJmp0NOS8G+1Ux7tvnL22T9ScHG/1bS9ZFNy6+XKCB89lEdhHW7S2yeZWmZJWtowWt4I6Ch/Q6Lmpik22OfUpkpI5PKf6VBB+w8njmx2AGJnNfIIs4Pe/dskbuXUWEMe4bbOjtWAkgJ+OSYZS6jj22YwjgA5APrzGZeV/jGBRsv2xNukNh87utukBwLeF3y5Rau0hSb8Ohr0qc8XEkOtqwF5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBe5OIWBO5GriXW0pY5q1pZCyemnhZnfBBV1mE+PaA8=;
 b=Wcd9zEIN6wcX8EnE0mjyCIvv7FkQ1MSpUMYPjs7UiC/jgw1Ht0gIIDi9bTjk0Toenr69pXFwsUHzscNrNzTKxLyQgrHa1kcz21gLbt+ex7NOcdYxNBNY/y3wgcWwR0NRL48V+vYaNu8xGmWkyNvgGJEjrElag4lWeP+nkK1uxGM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4223.namprd11.prod.outlook.com (52.135.37.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Sat, 2 Nov 2019 10:35:26 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:35:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 03/32] mtd: spi-nor: Group all Reg Ops to avoid forward
 declarations
Thread-Topic: [PATCH v3 03/32] mtd: spi-nor: Group all Reg Ops to avoid
 forward declarations
Thread-Index: AQHVjkpdkNtd6IPjcUKd2iRAW4iR8ad3tdWA
Date: Sat, 2 Nov 2019 10:35:26 +0000
Message-ID: <cec20bef-cf29-6da5-b287-c18f1963d64f@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-4-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-4-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0059.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::48) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52055203-5997-437b-c8ad-08d75f805fcd
x-ms-traffictypediagnostic: MN2PR11MB4223:
x-microsoft-antispam-prvs: <MN2PR11MB42233F60145F58DDAC150955F07D0@MN2PR11MB4223.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(366004)(376002)(396003)(346002)(199004)(189003)(8676002)(6436002)(5660300002)(52116002)(36756003)(81166006)(4744005)(81156014)(486006)(71200400001)(256004)(7736002)(229853002)(71190400001)(25786009)(476003)(99286004)(6486002)(2616005)(54906003)(31686004)(478600001)(3846002)(6116002)(2501003)(11346002)(305945005)(2906002)(26005)(446003)(14454004)(186003)(64756008)(4326008)(6246003)(66066001)(6512007)(31696002)(110136005)(53546011)(6506007)(76176011)(66446008)(86362001)(8936002)(386003)(2201001)(66946007)(66476007)(66556008)(102836004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4223;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 90KOokCs3tMJrpR6yLBO1O+PrkS/raTuUp/VflIu7+AT/Crc1sVbqIG9szNZ5OuIHDffa2U65/Z1E6mBx4s+tMsArnJk4R8X+Q3b7x7cW8dla51H2R0wYv6yeuy3ALnd84reGV9icJIeHxnxZ4WIe2vGQLlPqriwumbWIi579Hki2MxXzACdAXd0Ovj2gI6MPU6kImi5ttof8xee1OT/xFLOfY6oqJSBsnuPjhxbnt5PyR54zd5v1DTGL5lY8B2yBJ36IbDWjt7fWTxJy08OMMZsJNnLCWSFTCURyWUFONPRUhBx0rafx4+KZraQJewY3P8aEF/KDEPaRWIZq58xO+oUcMLOnG+tN8VykGhK/eYl0W4ccZh4fymqRoAXiM2gEjWYgCnUh0utpqIttW4pgDO6KwhN2n63ZdVXhMCRmGGxaklSHUz6N8t9buHc496G
x-ms-exchange-transport-forked: True
Content-ID: <7146FAA50AEC664DA7AE5D44E85FA180@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 52055203-5997-437b-c8ad-08d75f805fcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:35:26.6257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w1qw+wNGWNGecyJ/uSwjFvjYnGEyqM5yW1kxUYex+PHGOT8HsCN6sGQUGJNjo94HIP12raV242UO7iey4VyEOsCkwkZsZH+6TgWg0mQFkXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_033551_198490_FEA3B0DE 
X-CRM114-Status: UNSURE (   7.44  )
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



On 10/29/2019 01:16 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Group all register methods up in the file, to avoid forward
> declarations.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 426 +++++++++++++++++++++---------------------
>  1 file changed, 213 insertions(+), 213 deletions(-)

Applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
