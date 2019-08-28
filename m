Return-Path: <SRS0=Lrxn=WY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD27C3A5A1
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 10:18:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF09D217F5
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 10:18:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VZ9ug0l4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="KkUYv3qE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF09D217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKRYFocNJG2Z4xyT4B5KgCMp5Jz0uF6wGt/7x01BmTM=; b=VZ9ug0l4LYKXtH
	IQ96gQT3oV6xzVEqybGtSJuCrJRVp6VUyeJqfgch1y2SzGBQ6BJUhkHdL6cRXh2wPm6jZ5uX0I7ec
	BaEAFxtvJKfkQ03iwC4Q8fTAt3Geh4PPnzYCcRLNMHEK5L7Klxq/qYchaRfm52EqrUkNuTwKIYs0m
	ZHhdAlkyTPHTdUBiq5aMSHWj/VZkmwJlMnTNtMkm19ovNZInrMp2RIUU0bBVVRwHcARfN5l1lxlrZ
	38oxTMOBT6LqLhnu8YEp2qXWorPDdovzbHZ1NYua9MI840Y50I1YOmA2beGQLdpk1/FaxmYSalZU3
	rPuuAEGh28FQ6K1K6w8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2v2P-0007cN-3L; Wed, 28 Aug 2019 10:18:49 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2v2J-0007aO-Hk
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2019 10:18:47 +0000
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
IronPort-SDR: Hne+sonuOIuUTYQYmdBaSu7N+tSKmViNqadsTj1QabcCfymnHNL7AYJ5uT4OCq5W+mIkF0Avnh
 PZ1jORtGtUvBUVem4eSVYjcr8BjXOzLJQ9mROiZMpaMx8Wu8nqv8zCD1EXGCTA8oXDaon897nD
 1avqA3adFQlfen1joycC8BIUdr+gVY2C+DtH9smuvtReCANYE4JiO2CwdvTHoALzgk5V1D/Cfo
 dllfOGlyYMjXz+jAratLEpbnknjlSMAl8L9Wc3kPByRECmGOjpcIVSbEwTbHbaogMVE/Y57+2K
 tR0=
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="48305702"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Aug 2019 03:18:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Aug 2019 03:18:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Aug 2019 03:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzbxZesxY2INSF1ZsC+nKBuAMrglH9wpgrSmZY6zu6FC4xeOhQ3BcKgBh1ct/08/2Y3bA8Rt/SlZ0MOEJ/CqmMjxd/2B6U2KXLu5xRpfxhOJPdHfcI5qzFsSwLi+PtTS4gHHfYRfod1KuXsWAO/P82k6nIC3cFOUuPXJA/FhmYbE2M/VNGfEw8om1/Hudk28cxKYastBqvkb88/qKWpWqkQ2mKLsSqMlU426ApZualSIqjOyuJDHjpx/XXPBIjxAY2uPUgN3i1L0mL8Dz4OcfGH4cpRQ8Hc4L9y3n60oS14iNpC1jvWrR/AgR+Ja+dS1WXnBWkIkjq3Y7QWzqwobGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AzZwaGPlieZfa9qWIFaQ6Bbb22POZhg1ABVFgDTEFA=;
 b=OyuSBkw5+ApnRZfj+/AG3/Wv5w1n+axfnM3BUrjXns1+NsHgF2rvsZlzk+grw78CBC9WrPENcL7a2sSxsXds/7l5VAFD2zuS7wJcMwKAOni/JszJaas5Ggc2QoT8y66blOFAUTb0Y+PsNQA+lFB/nw5zkHos7gKZiXN/Cj3v7VQLyVe5SFHW3A/qEuoPuL6xNxzXRK8TtfuahE9i3zHdCMEx79r16v1SpjsSQ0YfyoSk1JsPK4b+y+4ar55wlJrzy2hUkDpCsHni0YUEsdr0U+IDZst4XzL6G985G+MNMmIJmDWjGX+cXUxQA4X8R7b3Qtf2WuYEFoLs/BPiZS0AOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AzZwaGPlieZfa9qWIFaQ6Bbb22POZhg1ABVFgDTEFA=;
 b=KkUYv3qE2TwTCNaO1a8AnaPdYSUS2U1yyEukEYtCFkVZFjAA5ubmBSOxguWvPpmp0KcsGA0BgIKqrfHJ7pBbdFYD61CTBHJS0T/HriGxnDGWkgh/PQGUPEkPB4ra+OUsdBRJeF4KKcAtmaq48iPqlhIeey5i7tk4qFu1G6momqY=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3727.namprd11.prod.outlook.com (20.178.252.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 10:18:34 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 10:18:34 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH v3 00/20] mtd: spi-nor: move manuf out of the core
Thread-Topic: [RESEND PATCH v3 00/20] mtd: spi-nor: move manuf out of the core
Thread-Index: AQHVXAb5BskU+i2FLEuxBjAKiOchAqcQW80A
Date: Wed, 28 Aug 2019 10:18:33 +0000
Message-ID: <8fced5c4-4a22-8445-8838-ea61c416698c@microchip.com>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190826120821.16351-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0044.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::21) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79be0cd8-d143-41a6-4181-08d72ba114d2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3727; 
x-ms-traffictypediagnostic: MN2PR11MB3727:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB372788364116A63E26D6E8DBF0A30@MN2PR11MB3727.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(446003)(6246003)(11346002)(76176011)(2616005)(6436002)(2201001)(6306002)(25786009)(5660300002)(36756003)(99286004)(6506007)(6486002)(316002)(6512007)(14444005)(256004)(2501003)(486006)(53936002)(2906002)(476003)(52116002)(66066001)(71190400001)(229853002)(102836004)(186003)(478600001)(81156014)(81166006)(110136005)(8676002)(966005)(86362001)(26005)(66446008)(64756008)(66556008)(66476007)(305945005)(6116002)(14454004)(3846002)(31696002)(7736002)(8936002)(66946007)(71200400001)(31686004)(53546011)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3727;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CJwVI2e92fWcobikBCdukMU8WybP2kIaB7JFsIm78NvHNssmChGQDnRbPFrEStmEGf/LvrPoiNHeazCWmGNVI70E1W2YBuUMB3acLwRmF0VfaYLLLX/vxaWzOyOvMVNUJxPVcIEAO5mZbAZti3n0JIXdqP57QLUuVujSLLMCieZucqnS2+ak25/fPk/e53IXJa3M1Bpqe6Z3nqUbJacCM64QuxrNnvRYUkDFzzjUKASypzadHfUX7OnCxPM2kY3pIp1P8YEKmmBMzc5/eFzmaJzcwmIAj3hIC+BCqQhZzswrH7exxbfoGcFYja4AKLAPGTTV1YwHyZGzcNQ++EyWUOW7hSgRlSd9H4MaJ5B51n+hKlSdX8C4itSOzu+PiKRgF2XJaZQmMEuy8rtCXUvInK65f7M3r7Xt0wvMezEKmcQ=
x-ms-exchange-transport-forked: True
Content-ID: <2EFD104D4F35294C82AE6C2A3383335A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 79be0cd8-d143-41a6-4181-08d72ba114d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 10:18:33.8975 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 203ycDiBm9s6prCPTR3XiNtQv+U3wj2KcFc1VjpQlaBFEiPbu6r22EjR6CHXFJrKDjaIcrevFlepCoaPmPtjaeOk6dAEEtg7AI2aGYTog40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_031843_706375_3CD80558 
X-CRM114-Status: GOOD (  19.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/26/2019 03:08 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> v3:
> - Drop patches:
>   "mtd: spi-nor: Move clear_sr_bp() to 'struct spi_nor_flash_parameter'"
>   "mtd: spi-nor: Rework the disabling of block write protection"
> and replace them with the RFC patch:
>   "mtd: spi-nor: Rework the disabling of block write protection"
> - rename spi_nor_legacy_init_params() to spi_nor_info_init_params()
> - rebase patches and send them all in a single patch set.
> 
> v2:
> - addressed all the comments
> - all flash parameters and settings are now set in 'struct
>   spi_nor_flash_parameter', for a clearer separation between the SPI NOR
>   layer and the flash params.
> 
> In order to test this, you'll have to merge v5.3-rc5 in spi-nor/next.
> This patch set depends on
> 'commit 834de5c1aa76 ("mtd: spi-nor: Fix the disabling of write protection at init")
> 
> The scope of the "mtd: spi-nor: move manuf out of the core" batches,
> is to move all manufacturer specific code out of the spi-nor core.
> 
> In the quest of removing the manufacturer specific code from the spi-nor
> core, we want to impose a timeline/priority on how the flash parameters
> are updated. As of now. the flash parameters initialization logic is as
> following:
> 
>     a/ default flash parameters init in spi_nor_init_params()
>     b/ manufacturer specific flash parameters updates, split across entire
>        spi-nor core code
>     c/ flash parameters updates based on SFDP tables
>     d/ post BFPT flash parameter updates
> 
> With the "mtd: spi-nor: move manuf out of the core" batches, we want to
> impose the following sequence of calls:
> 
>     1/ spi-nor core legacy flash parameters init:
>             spi_nor_default_init_params()
> 
>     2/ MFR-based manufacturer flash parameters init:
>             nor->manufacturer->fixups->default_init()
> 
>     3/ specific flash_info tweeks done when decisions can not be done just
>        on MFR:
>             nor->info->fixups->default_init()
> 
>     4/ SFDP tables flash parameters init - SFDP knows better:
>             spi_nor_sfdp_init_params()
> 
>     5/ post SFDP tables flash parameters updates - in case manufacturers
>        get the serial flash tables wrong or incomplete.
>             nor->info->fixups->post_sfdp()
>        The later can be extended to nor->manufacturer->fixups->post_sfdp()
>        if needed.
> 
> Setting of flash parameters will no longer be spread interleaved across
> the spi-nor core, there will be a clear separation on who and when will
> update the flash parameters.
> 
> Tested on sst26vf064b with atmel-quadspi SPIMEM driver.
> 
> Boris Brezillon (7):
>   mtd: spi-nor: Add a default_init() fixup hook for gd25q256
>   mtd: spi-nor: Create a ->set_4byte() method
>   mtd: spi-nor: Rework the SPI NOR lock/unlock logic
>   mtd: spi-nor: Add post_sfdp() hook to tweak flash config
>   mtd: spi-nor: Add spansion_post_sfdp_fixups()
>   mtd: spi-nor: Add a ->convert_addr() method
>   mtd: spi-nor: Add the SPI_NOR_XSR_RDY flag
> 
> Tudor Ambarus (13):
>   mtd: spi-nor: Regroup flash parameter and settings
>   mtd: spi-nor: Use nor->params
>   mtd: spi-nor: Drop quad_enable() from 'struct spi-nor'
>   mtd: spi-nor: Move erase_map to 'struct spi_nor_flash_parameter'
>   mtd: spi-nor: Add default_init() hook to tweak flash parameters
>   mtd: spi_nor: Move manufacturer quad_enable() in ->default_init()
>   mtd: spi-nor: Split spi_nor_init_params()
>   mtd: spi_nor: Add a ->setup() method
>   mtd: spi-nor: Add s3an_post_sfdp_fixups()
>   mtd: spi-nor: Bring flash params init together
>   mtd: spi_nor: Introduce spi_nor_set_addr_width()
>   mtd: spi-nor: Introduce spi_nor_get_flash_info()
>   mtd: spi-nor: Rework the disabling of block write protection
> 
>  drivers/mtd/spi-nor/spi-nor.c | 1304 +++++++++++++++++++++++------------------
>  include/linux/mtd/spi-nor.h   |  298 +++++++---
>  2 files changed, 927 insertions(+), 675 deletions(-)
> 

Addressed Boris's and Vingnesh's latest small updates.

All but last applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
