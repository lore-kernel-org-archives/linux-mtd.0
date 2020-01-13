Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D0C5C33C9A
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 10:10:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F15ED2084D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 10:10:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jLrH8neV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="c568one4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F15ED2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MeQh7RewsZBxngN2MJRspKx9lN/Ugoqs0EUnB43Xse4=; b=jLrH8neV72oSeN
	s+g8XGP/Sqf8Lpp+PhwFSEQR/1GCSg90el3f4H2vSgZ6K2t52l6vB2Znd7ZBl93GNI378lDhnVAHJ
	5XnAY9dOnbNstb8xBQ8Qr5Aro9eEZcBNl+6t4PYi4JzZNR5FDgMZ7DQ/gaT97XSQu/NYuZO5hBR9v
	vZZv4njKprfMXR5iGfYbPVaco0QWBZJppjd4gkA1cZhQL7G3oYglYMSPes/5a2IIJq4QMboHK9Ebv
	Cqfr9Gn9Dq9FfhGM+zwbJyfF+qlZ3AQp2JkzpJCkNeyTb5+jnIT+ezhgLL2Ztxby7CafrmRojUSy4
	gU8Xd7VeKMwnGvNIRgNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqwg8-00073f-Ap; Mon, 13 Jan 2020 10:10:36 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqwg4-0006zg-As
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 10:10:33 +0000
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
IronPort-SDR: KqN1Cj2pjtDSrXrs5lrLCUL/HVQIl3ikxEpTHQIHAdvJjyPGWSwH8dCWqKZSSJMT0myfpxhb5h
 FTpChnGVMZQ9az4dah/TzMeGy+C208RMyvRmFCmXX+UZpD8mXNRjeImds6D/nygkX1+cxCH2y1
 JsOpIJWSybhtCg+W/hyYQMrg/Y8y2v41LJOq3eb5dtMzDMrS0LtwOSZ43HM4HUMUMwrytgStiG
 ok2+DIjlKL2JZfxrUh5xw+xJFuBpfwo+9wfmlw2S91OKQw/3NvmIUmZwR6snPL7vNfD5Btp8Qi
 oFQ=
X-IronPort-AV: E=Sophos;i="5.69,428,1571727600"; d="scan'208";a="60582878"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 13 Jan 2020 03:10:28 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 13 Jan 2020 03:10:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 13 Jan 2020 03:10:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zbl7VCXmeblTp4hnWqFHz+n6NHpkrQq5g2M/CO7HVIk6nkZSAmLB0yR6aJ0+6pDhwvZuHKoFsNrTDRfXzHm3tAjX8rSYMT6ZBeAJ1tIQXr0xY7Pv1DGbP5tcAIHW19HSnnIbw7WcsICzEGlzYlbQ8RWXJ3pQm9qr15CpWh+dnScqNdEx4l+qB9MK3caJ8OFEKPuizyKQdGMK4MAku3B0woCfEAMLF13WjIgFaC1YMs/qfQ93S9WBM7E/u+lt/Ia1efLDWpN8XtYbKCbAETaD/LvhJEzZ8Dy/VAgg1tnZf3r4ZtIU0FF8bA2v1F/AkL6fAZx9VUkTYBSypOKkckvaog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lr0i2o/BAHBMybjq3kFoqxacZgUeo2lnEFdJ1x3Nkho=;
 b=nQSSFH+f9RNCerhmjpHJiQHzUvBCSYK0jkkuonvBO8S/7i71lMzJAXk2wcN5QFWoJ0JR3KLRsszimw3zsbPU2TWm4+mwT3ELce4SRaHFk2RKCCea60/df6TgictWHOv/b96hzG755UnK8oFVxJ5qwSW3AqkTFpdJ9HnGdNHnFRAEfODUqada2Bj09J3R2iyHSJm0YdtLov9jiMPsqQITgPQ3OtqEP37HFXYiCCxYkOGdAv1PR0al8KdonS+ve/f32ViErLysWnB3BIzvPtj29lSVd6hvDTDk1gbzdWIf+XifZR9bDxmMOQzf6h8Qa8gbqrttZxBq65tyHbLHe7eN3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lr0i2o/BAHBMybjq3kFoqxacZgUeo2lnEFdJ1x3Nkho=;
 b=c568one4FLC24psOO56MC0ivUxanH6qqigLjGB5IANW6rd2+ZOEaFanloqffpIK9Bfu2CdBaN6busXRUeDdD0HFVmCnXPEpa5Ex91oE3vlYOAja/SR7DaYBHZ31fircUvxRQITO3EjvpEU0d5+Qn3MZtitwGyt7COVhFd3m98Gc=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4335.namprd11.prod.outlook.com (52.135.38.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.14; Mon, 13 Jan 2020 10:10:27 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::71cc:a5d4:8e1a:198b%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 10:10:27 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH 2/2] mtd: spi-nor: fix locking argument in
 spi_nor_is_locked()
Thread-Topic: [PATCH 2/2] mtd: spi-nor: fix locking argument in
 spi_nor_is_locked()
Thread-Index: AQHVyfmtB/RTe4VPuUuyKr1XQJxpYg==
Date: Mon, 13 Jan 2020 10:10:27 +0000
Message-ID: <1617765.HVoytVeEL0@localhost.localdomain>
References: <20200107222317.3527-1-michael@walle.cc>
 <20200107222317.3527-2-michael@walle.cc>
In-Reply-To: <20200107222317.3527-2-michael@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0c1ecdd-cdb7-4a20-e443-08d79810d00d
x-ms-traffictypediagnostic: MN2PR11MB4335:
x-microsoft-antispam-prvs: <MN2PR11MB4335F2806F01014A54D62556F0350@MN2PR11MB4335.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(39850400004)(346002)(376002)(396003)(199004)(189003)(4326008)(6486002)(53546011)(6506007)(86362001)(186003)(316002)(26005)(478600001)(54906003)(6916009)(81156014)(66946007)(66446008)(81166006)(8936002)(6512007)(4744005)(9686003)(66556008)(64756008)(8676002)(5660300002)(66476007)(71200400001)(91956017)(2906002)(76116006)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4335;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c9+bTQJUslgqVXZIEebceDjXvvQt55roTbP7TmpU/heP4ZNwIFs3++pIuPNgQFx0G8uA/wPUDy3A3SSlPE597rkX6tgWM8RbzNzlUp0oKN4CVl64NnSs9qWA00uzggvSz/XtrqrJazhGUHTjqScPdSvG82LTflB6h4ZM1Wu5YWbBl5TTUg+hqVB8IDfFzNuta1go5/MOOBrk40dJK+7mdIWzA2mVFIrzl3tqHlBfl/zR4Nl1VwmeCzm6efUEJCuM3r5bXUv4qnqoYuQxbx/EiBWv125yDGc5/MU1Z1s9k8NopeCxAqXautTAFdrVjjsC1L14DB/Ch8FI/ZFwpEdaCyVKOgOIVrLW3Zhbt1s8+zP6U6nc32/zVDG4fUfDVCd23R1qdxfdaRYLNNQbV3yu7U+kv4UAKEOWrzC4zc1I/Beu4CDh6rZF5QvqSY1HETs3L7DBtU9dcKBOq8hbJ3hsvqkCh7IHKaE6q58fP0unfSgjXb2+iVyLWyajzXSPA/Ky
x-ms-exchange-transport-forked: True
Content-ID: <AB3A0BE49DAE9E42AE777CF0B42EE019@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c1ecdd-cdb7-4a20-e443-08d79810d00d
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 10:10:27.2155 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4EyAp0h2Mp9F5VjDwXugWDsDXQISAM1r2OxuzM4eZhv0Dq7HaMSxW9IxbTjVcwouJYe1RViaB6mte3Je1KpyiKGmrjQKHWEerHF3vNiJ2pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4335
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_021032_467235_8ACFB626 
X-CRM114-Status: UNSURE (   7.22  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Michael,

On Wednesday, January 8, 2020 12:23:17 AM EET Michael Walle wrote:
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index b661fd948a25..a8fcb1d70510 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -235,6 +235,7 @@ enum spi_nor_ops {
>         SPI_NOR_OPS_ERASE,
>         SPI_NOR_OPS_LOCK,
>         SPI_NOR_OPS_UNLOCK,
> +       SPI_NOR_OPS_IS_LOCKED,
>  };

There is no NOR controller that uses this enum, can we get rid of it?

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
