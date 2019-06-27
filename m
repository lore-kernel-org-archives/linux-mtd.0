Return-Path: <SRS0=iCcf=U2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69313C48BD7
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 13:41:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AEC620828
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jun 2019 13:41:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VEydXHzF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="19dy+nWe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AEC620828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXeWXu2lKRrYDxpecNxgCWheJlx7dDArCQ70Vc4p174=; b=VEydXHzFgBf02F
	dRczwXVhon09B1F5xYgEm7/1Kkm9s4uIb60jonOEAE7n2JxPqZXe2p8PZWn2zzzz+BaBlYcR4F98e
	Sn9fkxeaLnPa4hdlxx6cpUserSVOlMk4A6ZVdIojrNQhyfetPvD9qVFexqrkg2njpHdC3Da9sF6wx
	pXvN8NzxlTQIqOyt4RwiEwqbcU2jPdC+fTSgYzfYeq92BwxhmgteZInzm3SwOrZ1NxGHW7dJpRw/O
	fzSO2dcI/r0edWCBNT6UtkTvOu2viscX6DICvgGfShZaKTNI2m8o3mSyFtgpadQWtepFTM5U1laks
	EDOTR22YQ7pSsmeiH/RQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgUeW-00016b-04; Thu, 27 Jun 2019 13:41:28 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgUeA-0000qd-SS
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2019 13:41:09 +0000
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
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="40653387"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jun 2019 06:41:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Jun 2019 06:41:02 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 27 Jun 2019 06:41:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=qIZdqJmRNxaaJknMQypuwMCWOAX9O6M4QNnr7vA9l+XR4tuRctuS/516I0PHlo3d/MYQoG2Rg3OjdMiyw+Qmv4eoZ57PrtKQhWJKyZO1qNqotSte15hzJrHqJo/E0gO0oIFR9MZazYWQDBozHfkwiBwO/lor5rGVNlDYkClMA6I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlVTdEYBuaFKBEEF0/2/ypneYwkRTmIFRhdZNiztVDQ=;
 b=DtLqz1nKHbyRCuA0jCsG6tjNNXDhkYBfofmvKsBtsXwe8Xm53BBZ8ijrt7HlOzInRns2NbYF3PJe4jreoaVuFpJIV/kH/8oCqmn6Naxc8NDP1L19SVZ+bi1I73XEXWunDe5TLcrVRcuPpwKYCXBbFKSc+ljW+/te/vU+D7VYrK0=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GlVTdEYBuaFKBEEF0/2/ypneYwkRTmIFRhdZNiztVDQ=;
 b=19dy+nWeu/9MpXLJKmQyThqsQdYGv6bqHGLX/EiJUjtRHJe8exLH1cSwsmWc2tfDiHFJ/dy/WUYJ+S9pDHnm8+3W0jx+uEcxTgx/P7yWMi0CIA1Lt9eXuh2tqwdRTFfve6lm6XE5j8JTmlydQ7iALrfgcfzKlKHFo/evlFqt/P0=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1892.namprd11.prod.outlook.com (10.175.100.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Thu, 27 Jun 2019 13:40:59 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.2008.018; Thu, 27 Jun 2019
 13:40:59 +0000
From: <Tudor.Ambarus@microchip.com>
To: <richard@nod.at>, <boris.brezillon@collabora.com>,
 <miquel.raynal@bootlin.com>, <vigneshr@ti.com>, <marek.vasut@gmail.com>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 5.3
Thread-Topic: [GIT PULL] mtd: spi-nor: Changes for 5.3
Thread-Index: AQHVLMscSMaNalWZYEereGjm/6Sib6avgkkA
Date: Thu, 27 Jun 2019 13:40:59 +0000
Message-ID: <9bc66302-bc83-5a67-693e-8635b4335e67@microchip.com>
References: <31356721-2ff3-13b2-d719-860357871aff@microchip.com>
In-Reply-To: <31356721-2ff3-13b2-d719-860357871aff@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::25) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82df577c-2ace-462c-b140-08d6fb0516b4
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1892; 
x-ms-traffictypediagnostic: BN6PR11MB1892:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN6PR11MB1892996F06662FB97A760393F0FD0@BN6PR11MB1892.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(396003)(136003)(39860400002)(199004)(189003)(305945005)(6306002)(6512007)(14454004)(5660300002)(6246003)(66066001)(478600001)(71190400001)(71200400001)(66946007)(73956011)(229853002)(2201001)(6486002)(81156014)(2501003)(6436002)(81166006)(66556008)(64756008)(86362001)(53936002)(66476007)(66446008)(7736002)(31696002)(3846002)(6116002)(8676002)(36756003)(8936002)(316002)(31686004)(68736007)(186003)(53546011)(6506007)(386003)(25786009)(110136005)(486006)(99286004)(11346002)(446003)(72206003)(966005)(2906002)(476003)(2616005)(256004)(52116002)(76176011)(26005)(14444005)(102836004)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1892;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ns6om5T5aRaQlLYIAyvrhPukRpQLNnzQBfz9cT2S2Dp1GNmiXIz0WOCdQ2ldkM/9JrO2O+NLq/JsomGWVAOucP+c4a0K0+HmPqofPNXe2WhLwbLtw+6cMBn24QJuL67tGh4s0iYpMjE9sKesPtn/GFFnsmNLWZixhNKqPnvl9srjBhVSe05T9WByS4DpEOxE1cMt+THluIw5+YMR+rCbRCeNg7Xq8/oVVNggH08jTSGLmMfxdvbiT7Qn4z1M6OUeVffKGL9j4FstzW9htqqzBbSeQ3cbcS3/O6FQJpJNrFtBIx4MlJrqUmJCFRVg+FiWbKLj7R35WpDnwM5IRuHwa/HmoZJZ7tCU5+9VOfbQT+THZy1muhZjNejVWm5MYHob25NphQLYDTWEd6Iqn9gNEGK7Kqo1xO1Ly6P6iXSVyeg=
Content-ID: <6277229D7AC96141A46D7332EED78519@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 82df577c-2ace-462c-b140-08d6fb0516b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 13:40:59.7515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1892
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_064107_053364_FDC43E8A 
X-CRM114-Status: GOOD (  19.76  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

My email server sometimes eats emails, this was the case with
https://patchwork.ozlabs.org/patch/1121411/ too.

I really want to have this in 5.3, so I'll make a spi-nor/for-5.3-v2 tag and
submit a new pull request soon.

Thanks, Vignesh, for the heads up!
ta


On 06/27/2019 12:31 PM, Tudor.Ambarus@microchip.com wrote:
> External E-Mail
> 
> 
> Hi,
> 
> There are two conflicts related to the SPDX treewide changes. The first conflict is
> in:
> 
> 	drivers/mtd/spi-nor/stm32-quadspi.c
> 
> between commit:
> 
> caab277b1de0 ("treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 234")
> 
> from Linus' tree and commit:
> 
> df6bd6c002a4 mtd: spi-nor: stm32: remove the driver as it was replaced by spi-stm32-qspi.c
> 
> from the spi-nor/next branch.
> 
> The fix is to remove drivers/mtd/spi-nor/stm32-quadspi.c as the driver was replaced
> by spi-stm32-qspi.c
> 
> 
> The second conflict is in:
> 
> 	drivers/mtd/spi-nor/intel-spi-pci.c
> 	drivers/mtd/spi-nor/intel-spi-platform.c
> 	drivers/mtd/spi-nor/intel-spi.c
> 	drivers/mtd/spi-nor/intel-spi.h
> 	include/linux/platform_data/intel-spi.h
> 
> between commit:
> 
> d2912cb15bdd ("treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 500")
> 
> from Linus' tree and commit:
> 
> 62de37da9f38 ("mtd: spi-nor: intel-spi: Convert to use SPDX identifier")
> 
> from the spi-nor/next branch.
> 
> The fix is to keep the SPDX treewide change.
> 
> Cheers,
> ta
> 
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the git repository at:
> 
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/spi-nor/for-5.3
> 
> for you to fetch changes up to 62de37da9f382455b983f2f92b10012109005278:
> 
>   mtd: spi-nor: intel-spi: Convert to use SPDX identifier (2019-06-22 14:59:27 +0300)
> 
> ----------------------------------------------------------------
> SPI-NOR core changes:
> - add support for the mt25ql02g and w25q16jv flashes
> - print error in case of jedec read id fails
> 
> SPI NOR controller drivers changes:
> - intel-spi: Add support for Intel Elkhart Lake SPI serial flash
> - smt32: remove the driver as the driver was replaced by spi-stm32-qspi.c
> 
> ----------------------------------------------------------------
> Andrey Smirnov (1):
>       mtd: spi-nor: Add Micron MT25QL02 support
> 
> Flavio Suligoi (1):
>       mtd: spi-nor: change "error reading JEDEC id" from dbg to err
> 
> Geert Uytterhoeven (1):
>       mtd: spi-nor: Spelling s/Writ/Write/
> 
> Ludovic Barre (1):
>       mtd: spi-nor: stm32: remove the driver as it was replaced by spi-stm32-qspi.c
> 
> Mika Westerberg (2):
>       mtd: spi-nor: intel-spi: Add support for Intel Elkhart Lake SPI serial flash
>       mtd: spi-nor: intel-spi: Convert to use SPDX identifier
> 
> Robert Marko (1):
>       mtd: spi-nor: Add Winbond w25q16jv support
> 
>  Documentation/devicetree/bindings/mtd/stm32-quadspi.txt |  43 ---
>  drivers/mtd/spi-nor/Kconfig                             |   7 -
>  drivers/mtd/spi-nor/Makefile                            |   1 -
>  drivers/mtd/spi-nor/intel-spi-pci.c                     |   6 +-
>  drivers/mtd/spi-nor/intel-spi-platform.c                |   5 +-
>  drivers/mtd/spi-nor/intel-spi.c                         |   5 +-
>  drivers/mtd/spi-nor/intel-spi.h                         |   5 +-
>  drivers/mtd/spi-nor/spi-nor.c                           |  12 +-
>  drivers/mtd/spi-nor/stm32-quadspi.c                     | 720 -----------------------------------------
>  include/linux/platform_data/intel-spi.h                 |   5 +-
>  10 files changed, 16 insertions(+), 793 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mtd/stm32-quadspi.txt
>  delete mode 100644 drivers/mtd/spi-nor/stm32-quadspi.c
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
