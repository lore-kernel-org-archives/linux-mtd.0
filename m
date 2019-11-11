Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 921ECC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 19:26:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DDC321655
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 19:26:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LNdTJSmX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ivge+mjC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DDC321655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0oV5bl8uAQtQyBDMUxoOE3NUaRMHpqdPJM4FlHNm04=; b=LNdTJSmX/LnXH/
	bYLhdbd2qqIfIy6gwai8ERl50weIKuIDefIgtqWahjUDm+hGqsr2y7w+9+qACBhhOQt4/nN2ExPC2
	aB4hsGMFnMVr4L1HXUEnIcj+oFUYV4NsSVX2zB7nGeu7+ar41gUOc3t0a8gsGbgB44XRCFbU6kptz
	UQVYCCSOoh+sdZ47zzf34najzcNtHvLbTq8W/AhQP3ytoRqiVg4NCY1Zs1BiocjD0GNcwVGAQB6Ry
	4OWuhf0Gc1NyvXNk5w/3KomwA0atQtrNx+5qSvEbACcdHzGwR48uWEYscQOw+iLnbShN5t6Wp1LX2
	yS+owVpou+LTU4Y0a/aw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUFKS-0006b5-2o; Mon, 11 Nov 2019 19:26:24 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUFKN-0006aH-W9
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 19:26:22 +0000
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
IronPort-SDR: 8EWy9KoymLLNVzwsaTAtdbSWF5lmsKTAY4vbuwswWbksUIs71FZfOP+xnudc80kiE8krXHoKQJ
 irOTknxjJ7+QBxMC/6suyEamYiLBvvBWk8EwZLsZLz/Nn4vHH3Kg9xe5YbOdg+s5GG/pQT70J3
 29nrec5Ic5A3Jce5GJxmU8Po8GjgMaPYYXOvYVr3PY6BdgNb52+MLgmCXTehqbcDb2s9OdBlHr
 dxC+DoAm4mbc2ZNC6vG963D11LXTvq7XEbCVW0RkJVAd3HDNP3hl+5HOsF9M4C+tYkwpZtjPUc
 5Og=
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="56544654"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Nov 2019 12:26:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Nov 2019 12:26:16 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 11 Nov 2019 12:26:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fm9eOviSplmhYxp+RlyQIA1Bm4EN0rF7UTPX2O7bNRbn5qUm8ZcCXdVOvM6nxiDhs9qd8Jh3030gFWIUDL3LsPnwyC/nzppwfaY8oO1KfBKUpBCP9ZDonax/dApbVZaFDUX9vUBh8ZBHU8eJL0y6LE7gXBOyXMtisdEVsP9XX1TuuEBhkRbaWOWIYiF7/Bv0fk+7MQY7pxYVeGX98Ofe47HN2vV4fTDdNNIO+QPfOAW+jdwVMGwurwhU3jTD4P8WjawrVzZ6iMoLVlKMsuSd6REvKD5vlxX11nvhNsfeCESyhRr3uZFkjqa21SGUiFArR99aesJw/vPTbW7LU0gJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5+H0lxdDpsSTsnmPtFxMGlW+bDdT/vdVt7wekU+384=;
 b=eBoSyuBJDnD82jS4YEaFMPLyzkJDjPsz8bQl2kF439oCeZFy5XeuOK+Wkg5qrq2KaJnz/QaAKKPOHai8+g0LBlgmEBaKs+HVaq84i7tewvk9+l9wx9ByiynSh6gYshadpFydUgqSDFv+CDlD3f2vY1BbWxbcWeui+jzx/+7oe6D6vYnIwP7D96ySd0jr+xA6micI2ST3pr4oD5vaVs4J4HlKsTqyeDZfyqDrD0WUrXrjtPZpeozBAwNocIBY2mxiiBclz4hEZfQe3636zO8zkEWHnLqsmKcEKcHzLxAxzM+0btol76eH33fanbINWsAbvTy1Ckm7HJPOgn5Ai8R4Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5+H0lxdDpsSTsnmPtFxMGlW+bDdT/vdVt7wekU+384=;
 b=ivge+mjCjFbQT4KhJydDvgkIZRQz5Vk9Dx2IWYs21X32IK0ykr5UiAqdQHT43B15jotU2LugUSgFvQ0qHTPhuEIXquLArU2CawKT0xqUBdVt12nkZcETYMSiZ2CA60adq2KgniSWWPSE3N9EHzrZC07TeuETqG35qtPGUf8xDmg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4352.namprd11.prod.outlook.com (52.135.38.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Mon, 11 Nov 2019 19:26:14 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 19:26:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <vigneshr@ti.com>
Subject: Re: [PATCH v5 0/6] mtd: spi-nor: Quad Enable and (un)lock methods
Thread-Topic: [PATCH v5 0/6] mtd: spi-nor: Quad Enable and (un)lock methods
Thread-Index: AQHVlUcxNfurCR7UA0az+I+u2JP03qeGYSqA
Date: Mon, 11 Nov 2019 19:26:14 +0000
Message-ID: <f5b97a15-b75b-cdea-6a7e-bbd67138fe2e@microchip.com>
References: <20191107084135.22122-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191107084135.22122-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR09CA0147.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::31) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.12.60.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4bfaba0-d365-4792-30e5-08d766dd0411
x-ms-traffictypediagnostic: MN2PR11MB4352:
x-microsoft-antispam-prvs: <MN2PR11MB43529766B0A7C8333E51F394F0740@MN2PR11MB4352.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(396003)(39860400002)(366004)(376002)(199004)(189003)(6512007)(446003)(11346002)(26005)(186003)(66066001)(6116002)(3846002)(2906002)(52116002)(102836004)(476003)(486006)(386003)(6506007)(53546011)(71200400001)(66476007)(4326008)(6246003)(31696002)(99286004)(14454004)(71190400001)(478600001)(76176011)(2501003)(86362001)(2616005)(66946007)(110136005)(229853002)(316002)(305945005)(8676002)(31686004)(7736002)(66446008)(36756003)(6436002)(8936002)(54906003)(5660300002)(64756008)(66556008)(6486002)(14444005)(256004)(81166006)(81156014)(25786009)(414714003)(473944003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4352;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VEngF/PehdVBf3A2orfqB2LFbg8qUg1PSAsNZExPzZc24DYVrMp53PL4lUQbD9l2fgvc1p9opJ2/GOynHG/iD37XLJXGU+aMhU6lvrWbXBEwY1U3U8OfkFUFc51upEgfYvWJMmHG5i3bjAv0bWkLrcV0XBeHUlZd+b9+8dq7UQruaCx2BJdgpn+k3wrR6OqWYiwUELN7cC5Gm2Gt1dat09NOTZQU5bMCRI4qTpFG9mubFndG3dbU+uad/0wjM299zsuFejab/Z/0iKcSp5oAQX/2wXIyPSj7t2TKtwI3MLIyP6e1HD5lzlRFP8dEursuHFFtMdnq9TcXBFQqEABnMuljbZSTj22BEOuV7irT4XxQwI/IVGwli+Fw1frnKLyj2Jc1/UUryuNwiEIQxjz1uuITaWEt7lCpGDBjc3UnK/3STQYw4UKXGS+y6irz0Bvb
x-ms-exchange-transport-forked: True
Content-ID: <8F4F086FFDC8FF48BF4AACA022E036FA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a4bfaba0-d365-4792-30e5-08d766dd0411
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 19:26:14.2643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L/WrYG3zyHO1htII8TUE8SMPz2NNlcPdUAUYjNmIcAXyzvQ5ZDJgYBUHEX7w4eKoA4zqUJdnpYpfwhtV7bC1mNOwr8lZUqn17SwCwvVqXj8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4352
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_112620_121298_E3709007 
X-CRM114-Status: GOOD (  18.92  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/07/2019 10:41 AM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Tested on w25q128jvq.
> 
> Fixed the clearing of QE bit on (un)lock() operations. Reworked the
> Quad Enable methods and the disabling of the block write protection
> at power-up.
> 
> v5:
> - Rename all Quad Enable methods in one patch
> - Extend the Read Back test to both SR1 and SR2 in one patch
> - Reorder patches, so that the fixes come one after another
> - Collect R-b tags.
> 
> v4:
> - Use dev_dbg insted of dev_err for low level info
> - replace "&nor->bouncebuf[0]" with "nor->bouncebuf" and "&sr_cr[0]" with
>   "sr_cr". Update across all patches.
> 
> v3: split patches, update retlen handling in sst_write.
> 
> v2:
> - Introduce spi_nor_write_16bit_cr_and_check() as per Vignesh's suggestion. The
>   Configuration Register contains bits that can be updated in future: FREEZE,
>   CMP. Provide a generic method that allows updating all bits of the
>   Configuration Register.
> - Fix SNOR_F_NO_READ_CR case in
>   "mtd: spi-nor: Rework the disabling of block write protection". When the flash
>   doesn't support the CR Read command, we make an assumption about the value of
>   the QE bit. In spi_nor_init(), call spi_nor_quad_enable() first, then
>   spi_nor_unlock_all(), so that at the spi_nor_unlock_all() time we can be sure
>   the QE bit has value one, because of the previous call to spi_nor_quad_enable().
> - Fix if statement in spi_nor_write_sr_and_check():
>   if (nor->flags & SNOR_F_HAS_16BIT_SR)
> - Fix documentation warnings.
> - New patch: "mtd: spi-nor: Check all the bits written, not just the BP ones".
> - Drop Global Unlock patches, will send them in a different patch set.
> 
> The patch set can be tested using mtd-utils:
> 1/ do a read-erase-write-read-back test immediately after boot, to check
> the spi_nor_unlock_all() method. The focus is on the erase/write
> methods, we want to see if the flash is unlocked at power-up.
>         mtd_debug read /dev/mtd-yours offset size read-file
>         hexdump read-file
>         mtd_debug erase /dev/mtd-yours offset size
>         dd if=/dev/urandom of=write-file bs=please-choose count=please-choose
>         mtd_debug write /dev/mtd-yours offset write-file-size write-file
>         mtd_debug read /dev/mtd-yours offset write-file-size read-file
>         sha1sum read-file write-file
> 2/ lock flash then try to erase/write it, to see if the lock works
>         flash_lock /dev/mtd-yours offset block-count
>         Do the read-erase-write-read-back test from 1/. The contents of
>         flash should not change in the erase and write steps.
> 3/ unlock flash and do the read-erase-write-read-back from 1/. The value of the
>    QEE should not change and you should be able to erase and write the flash.
>    Test 1/ should be successful.
> 
> Tudor Ambarus (6):
>   mtd: spi-nor: Fix clearing of QE bit on lock()/unlock()
>   mtd: spi-nor: Rework the disabling of block write protection
>   mtd: spi-nor: Extend the SR Read Back test
>   mtd: spi-nor: Rename CR_QUAD_EN_SPAN to SR2_QUAD_EN_BIT1
>   mtd: spi-nor: Merge spansion Quad Enable methods
>   mtd: spi-nor: Rename Quad Enable methods
> 
>  drivers/mtd/spi-nor/spi-nor.c | 438 ++++++++++++++++++++++++------------------
>  include/linux/mtd/spi-nor.h   |  12 +-
>  2 files changed, 254 insertions(+), 196 deletions(-)
> 

Amend commit description for patch 2/6, s/the the/the.
All applied to spi-nor/next.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
