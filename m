Return-Path: <SRS0=phPz=3A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEB0CC282DD
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jan 2020 14:19:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8024C2072E
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Jan 2020 14:19:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BY/FSlWU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="LVKjmJZM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8024C2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24jTSfg6QBmBj6bPcqbOLEzoqMlDKOvPopnYBy5bw34=; b=BY/FSlWUZ1S40Y
	OTrImEYy1HvJ62i1zkGY3jiPz//31TDaB/B4WKCCUWS8IXLjcvbfDqSOVOr69l1OZPwXl/XVmpao+
	3H/fVe3el754kVK12Cb/xi+5c1X/Zo6QzQFdmrejmbtPuu2fdpGe0ea6dF0h7pLlZEpWV3eH0Mbr2
	L/9C+S+EOlR20E4LkqVigMur8zE0bD4wlUYmBOodcknQiZxnlhTZqKaTzE29764krTxpcGdE9cRfw
	oeRGuXB09hzScjtLUzxciVzSpkAveDAlVC4LNqevKm87+AZCklljacId+wwynFcW82NNGRVWK8sji
	JmWLkiA2Zu55SktPN46Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqHbp-0002Z8-72; Sat, 11 Jan 2020 14:19:25 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqHbm-0002Yd-G3
 for linux-mtd@lists.infradead.org; Sat, 11 Jan 2020 14:19:23 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
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
IronPort-SDR: CEGxfmxTUI1unqQop0GG2gmvMt7iSzwvqMhgKsBgC8b/gHYtdvXK5usq0dyK19ikDsBuEX2buV
 xv0IBEmVuWAjXIFn7aJrUbJfX0biaXgpDN/oQt1kGqPadPP5PLRiVquoJ1eM8rnGWmJ8IJJqU/
 5j48HdVlueiQtNVJdULmC48+jCTzsfxzR4FgfsDKNu6AYWb+mdLxJh+SkqdiRWGkEzk+FojbIJ
 rScmLzFIAkySHWQf5zl0ImD4TVokRbDNy2xjhv7PE93A8p9ehHd//jbivrgBI70EUjLflGtQBv
 XBo=
X-IronPort-AV: E=Sophos;i="5.69,421,1571727600"; d="scan'208";a="62327813"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Jan 2020 07:19:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 11 Jan 2020 07:19:21 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 11 Jan 2020 07:19:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0MEJ8xTVnAFIrr7JA2DBG0cOLfoWUKD9YXd1noCAAnEtCVBDEvLCvv4pFBxjENH8ASNSb/EIO2LwDz7Y9PT5oc5dKTdd9YJHlBxaYBVM72S5GtK8lcRP9oRXorpeLEBRtd865qZrxn+EFwEWDUxMw7QvLyGaCeN2Uq2GNJ71IOjG9Wb8nlPNvpWQoINu1s8i+FzPCLIwXAUURIjedWk/nKBbxKhJ7rtVPgzvPX9Twqw1C9snWES/6NA2Z4sWZUtZWBqqYUW4zowKa/ez4tP0C0wuSWahvAAck+uIDAr2q2xdHpwyChk8gex3i5/1i7zKKbqXRBMO/NTre6iYb10aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBOG5T6wKidGVY/Jsz7TjxgLJylwjRBmYTGYZywlMlw=;
 b=kETQpp4PjvlEsNxoAb7K1poAiBLZ3XH6ts/yUQs5rs0NnxDIzg1wpUddiSvB34EGBqSCiibLTDzB+ShgtoLWOT+6sp1c2ps43m9WvG+B9G3YBhIBmKStWXLnBJyQFa7q2aV4/I5PkVeZkS4rGU6zdGdTPq5AlSf6S5sOB+354EPvxMXgzBJYK4uDqR2wJAndTryNg1wj1tqPOYL/0LluMmj0gd5bLYKAxQmzge3bnxQP+apbaUW3VLdd9BJEUa+VY54ythj2jwbFMiCUIf893WLNchvCQA/nor9EECO43/t1I3UIJBSODJs+yq2df8T2vnTjUBdjkGRM+ItSpvyDDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wBOG5T6wKidGVY/Jsz7TjxgLJylwjRBmYTGYZywlMlw=;
 b=LVKjmJZML4GcjhqqhCk1Myf5+4K2pu2+6dD5fmREd18y8hXHU1CRtsyhaVQvACuTAs50h6NdvFAqVcuIW2KIptCG5f2YCloNgVC2hCxRXATTCGaNH+4LVikrCUWxnA0uJuvu5xMhk8YuaSljjqFtlKesaQshEP1JpvUi7E8EpqE=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4511.namprd11.prod.outlook.com (52.135.37.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Sat, 11 Jan 2020 14:19:20 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2623.013; Sat, 11 Jan 2020
 14:19:19 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for w25qNNjwim
Thread-Topic: [PATCH] mtd: spi-nor: Add support for w25qNNjwim
Thread-Index: AQHVyIod2dqEzZAPf0S4HyMwJjELNQ==
Date: Sat, 11 Jan 2020 14:19:19 +0000
Message-ID: <12341010.b9DRC5f9X7@192.168.0.113>
References: <20200103223423.14025-1-michael@walle.cc>
In-Reply-To: <20200103223423.14025-1-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4343f1c3-14c5-4e6d-9888-08d796a13fab
x-ms-traffictypediagnostic: MN2PR11MB4511:
x-microsoft-antispam-prvs: <MN2PR11MB451102E8E3D135E1F2107351F03B0@MN2PR11MB4511.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0279B3DD0D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(366004)(396003)(376002)(39860400002)(136003)(189003)(199004)(71200400001)(53546011)(14286002)(6916009)(81156014)(8676002)(81166006)(478600001)(6512007)(9686003)(6506007)(26005)(186003)(6486002)(2906002)(86362001)(316002)(54906003)(4326008)(5660300002)(76116006)(91956017)(66446008)(64756008)(66946007)(66556008)(66476007)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4511;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G8EhQlVL0BxNk4Zehq+g7KwpYyu+gnNel53A7WPPdRc/dFKTiW54YDF9q7PVEFIWz15C7Mm+sO/CEbljp5Gp+biB/q+kXmPONFQyA+I8nXqXNKObLwewUjNDiQd5r3EZppBFvZmtTidWioETmb2liUNaiOVp11cMvp7mOD1zJyQB7H6dHKrLp2Hl3Lub15TTG/0rEnOSqVJswk7rACWmvRrOp9tML4ruOjIK2s8TDntlVLCk0s1GrvuodK6tUzmuM++pb2lm/nK05Q39ybw7KWzQw3/4/DYbBXssdZQqcw1j7wOCgevt+Ax5sCSytESH/6OJxqU3c1ivLXP+E70uU3bq9drrupqfu4KqgcmoCea5ntZiBB5W9pW3ASJVL4kIi7qtq7oJLp7v/XGAmsZlOdR7m2QWFFijp2A4kQfSTbrqIn0R6mhcneOsl2d1AxYT
x-ms-exchange-transport-forked: True
Content-ID: <BE661A240CD5324A8EC9ADAB5084AAC9@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4343f1c3-14c5-4e6d-9888-08d796a13fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2020 14:19:19.6456 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hAfsJPkEMLTmWzNrMJuneJpTHm0Mz6TOnPYIGvitLP3RyiMccqU7pgI4qFnK10cNazGPuKjZL4u4vsswLbUNEt3hRyHoVsRthzlGRkLuVTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4511
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200111_061922_575497_ABB72069 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: richard@nod.at, michael@walle.cc, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Michael,

On Saturday, January 4, 2020 12:34:23 AM EET Michael Walle wrote:
> Add support for the Winbond W25QnnJW-IM flashes. These have a
> programmable QE bit. There are also the W25QnnJW-IQ variant which shares
> the ID with the W25QnnFW parts. These have the QE bit hard strapped to
> 1, thus don't support hardware write protection.

There are few flavors of hw write protection supported by this flash, the Q 
version does not disable them all. How about saying just that the /HOLD 
function is disabled?

When we receive new flash id patches, we ask the contributors to specify if 
they test the flash, in which modes (single, quad), and with which controller. 
Ideally all the flash's flags should be tested, but there are cases in which 
the controllers do not support quad read for example, and we accept the 
patches even if tested in single read mode. SPI_NOR_HAS_LOCK and 
SPI_NOR_HAS_TB must be tested as well.

Even if the patches are rather simple, we ask for this to be sure that we 
don't add a flash that is broken from day one. So, would you please tell us 
what flashes did you test, what flags, and with which controller?

> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index addb6319fcbb..3fa8a81bdab0 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2627,6 +2627,11 @@ static const struct flash_info spi_nor_ids[] = {
>  			SECT_4K | SPI_NOR_DUAL_READ | 
SPI_NOR_QUAD_READ |
>  			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>  	},
> +	{
> +		"w25q16jwim", INFO(0xef8015, 0, 64 * 1024,  32,

"i" is for the temperature range, which is not a fixed characteristic. Usually 
there are flashes with the same jedec-id, but with different temperature 
ranges. Let's drop the "i" and rename it to "w25q16jwm"

Cheers,
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
