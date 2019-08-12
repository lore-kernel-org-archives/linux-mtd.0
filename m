Return-Path: <SRS0=CTVO=WI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C036C31E40
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 10:33:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC3820842
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 10:33:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mRW/g+Rc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="UT6l6SIS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC3820842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NgWsah7TDrny5x5W+bfWns2LfCk4PsXhCuOdU1KlRfg=; b=mRW/g+RcR6TAU9
	uXlb4lmfY+RjuH+0Ls215fJJs6xUdgWmjQsbGYBzK0qDQOcYrblXCQLEirbFdgdB4vJEch0nGj1aV
	QhSfvxzdWa3udrNQE3jNtQh9BWXrMlgZBQzvmZy8mrb72mkTPCWM4hUeUF114En1HyfpFuadPEoCj
	UAfHPOYuknHRQ22BqMcX3STUIOxovRJCIOggSefFoWubJysddqZa1xvStSdwE48vx32bqEHq/6nYb
	0y4bjWzNeO5o/wbwZjWpuXaqaGzL4SdMfs6x9mo4tAxKsOHW11Q7HyDRNQf3LNEcPFmCc3H7JQGAu
	KjWej3aKqGkDmmexVYBw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx7e0-0001O1-T1; Mon, 12 Aug 2019 10:33:40 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx7dv-0001My-5M
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2019 10:33:39 +0000
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
IronPort-SDR: t6DzPJvYyXAaYqX9zsO4ZhWZTgTFHg8XyfqxGAWDZjWnck+i+s6ei6B1F66IWSF3M2qb7l8g9J
 yRryxICZptsuQgJBUUf/wg1vZfUITrHWCi4fgvkDsNVDeFuhFxwNIZ+x8FkS5618bGW46eGRWg
 YzAtI5E7W8U9gHqj9GjncLBr9doj094AGYe9zivX2Wya2eS13049W1YoTDtoUaG8iNgTqynRDJ
 Dlp4Ib89dkW5T5grmVQxZo+4sr/I3iNZgGG6nYTJ87BaD1P+gAVAwSG5puAIgphq0rtdsHwx5q
 fEQ=
X-IronPort-AV: E=Sophos;i="5.64,377,1559545200"; d="scan'208";a="46199172"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Aug 2019 03:33:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 12 Aug 2019 03:33:26 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 12 Aug 2019 03:33:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=md1aVlNI63lImfQX5N7hHrXqdIAs++5CipnZtpu2JRzd9210o+owqIf6YYTnp69HvQFZq9cvKL7kQOwlgxpTi+aRxeblt4VQdnAsRlDVmnYRID4XahEjgu8C5vl66gh+86jxQKtTkRQzAq9KhwC8toG8KmHEpi4ZuOwzcq3i53a3WZBdIG4wroFhByDDmuHuAKblbwd3kO9hr32H7voCBbVyhwlGbHKOCoKK4ok7I1ToCmBPyRbWrEvYhvk1IBaEnmSE2bcPFF6ZInkYez7WxBcCR0jhk0BSqNSci5Z6STieljhzb1PKYEo8tZvyZydmjlce9rLckXM/9HAK2GlxCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzwUosm1RW7n18nptLr9sEyFkN527VcLruNk5w83nXQ=;
 b=cY80SSdHOGsV2YvQPieLhOwcN9jqIRL3+lFDhSA711peFp8KRu68htY/aeyMy2HPM0K6jlGghIpwjhv3E+EtLWyeAyGlk4SFZBw3S7i7qmWjd24xH6Dab6JnYbs7DtPCL5KbhuHAoLnPZuIe83RDajsBv0yeMu02G+1mx2NVVoa1sj9NrxK1v5s+1FnYkmk9mU/AocXfyUazn11DcZ08aaIkHhbF3AGjWUVNjAzbM/xLMyYdt6gqx4MXoedRkmaNbwBzgv1oCvucRROqij4BSAGo0aVE79JKYC0fo9iOp+RFVvYOerlLCIwl89tp4JjL5Ss0EI9L1C6e3oJg0LVNkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WzwUosm1RW7n18nptLr9sEyFkN527VcLruNk5w83nXQ=;
 b=UT6l6SIS+o8ww9g0OOvgelKX69U5xRSI2/X7FvUlfneCQxE0pmSN7zQ0UbM5HlrRmPlDaYVcSKNy5CoCAUyJKmTr7BlBTGHTC6YphVLQiVZU9Ka+iqOmex4EYeAopjMpTbdp1pQ/ziqHbcK4R05fVrmEtukNNEaUSlyWAl8yZcE=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3936.namprd11.prod.outlook.com (10.255.180.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Mon, 12 Aug 2019 10:33:23 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 10:33:23 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>
Subject: Re: [PATCH v5 0/3] Merge m25p80 into spi-nor
Thread-Topic: [PATCH v5 0/3] Merge m25p80 into spi-nor
Thread-Index: AQHVTBVGOaYYiXIg0EaqOxIPYBmUqqb3WoYA
Date: Mon, 12 Aug 2019 10:33:23 +0000
Message-ID: <10e5aeb8-c939-0c0c-704a-39d2cb2eb73d@microchip.com>
References: <20190806051041.3636-1-vigneshr@ti.com>
In-Reply-To: <20190806051041.3636-1-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P190CA0008.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::21) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b0949e43-acb3-4230-c6e3-08d71f10805c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3936; 
x-ms-traffictypediagnostic: MN2PR11MB3936:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MN2PR11MB39360D846BD728A0BB387837F0D30@MN2PR11MB3936.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(39860400002)(366004)(396003)(376002)(189003)(199004)(86362001)(305945005)(66476007)(66556008)(81166006)(478600001)(64756008)(7736002)(31696002)(6246003)(36756003)(8676002)(53936002)(81156014)(66446008)(14454004)(966005)(14444005)(256004)(6116002)(3846002)(2906002)(71190400001)(71200400001)(4326008)(6306002)(66946007)(31686004)(99286004)(66066001)(476003)(76176011)(25786009)(2616005)(316002)(229853002)(486006)(6486002)(26005)(5660300002)(11346002)(52116002)(6436002)(446003)(110136005)(53546011)(6506007)(386003)(8936002)(102836004)(186003)(6512007)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3936;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6aC7snEtf1UpnXMayOfXygD8YsCGG0FoaWXNgSmtlO0TpEDF8HogK0sa5cNK9rYEx6ISUCNUnyqxtiJzrb1fZ9nh5Sfwu1/3QB6YtOcMvh/W+FxxZ5ti+tL75/oTMHGRj13VvmrAhSBhh5dBMy7HsXkRMQY7CYYjf6S1Oz3IizGY8yzIda2YHREQ5tgWLj8TAjO+lWz8NHL7ukxdBIX98w3zVEkHAmdsTtKSwmQg1gpT00/YDaA/wWL2fBGPa4UWU66EO8gww3nG2YqOlhvP3sIwrnZ3lFlb5ouOvw8Nl8D002vN6OUOKiwfM+3QXIEd/AzlFkh6BtLutbnt2uH5zqu2ftuE+D68556AptUPi4i/As0lQoKDM9/+8cJPjifYkF9JVV8RiEkNl8UtsWIoBK6Cc36jNluKDx4UFN/lTh8=
x-ms-exchange-transport-forked: True
Content-ID: <3B4C3036C196F645A69E0DC29DE2A1EF@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b0949e43-acb3-4230-c6e3-08d71f10805c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 10:33:23.1834 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MwOkE2brxJ0ctOVkK3cWvHM0IsiYMbnJn2bO9gD6ps5eZwfZk8TwuZNm8uNVZ6kWgrNGzBZzzY6w5eXMiYnCtLvHAIFpU4XgwfdnHw3Z9Hs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_033335_318054_EAC8A1F7 
X-CRM114-Status: GOOD (  15.61  )
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
Cc: marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, tmaimon77@gmail.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/06/2019 08:10 AM, Vignesh Raghavendra wrote:
> External E-Mail
> 
> 
> This is repost of patch 6 and 7 split from from Boris Brezillon's X-X-X
> mode support series[1]
> 
> Background from cover letter for RFC[1]:
> m25p80 is just a simple SPI NOR controller driver (a wrapper around the
> SPI mem API). Not only it shouldn't be named after a specific SPI NOR
> chip, but it also doesn't deserve a specific driver IMO, especially if
> the end goal is to get rid of SPI NOR controller drivers found in
> drivers/mtd/spi-nor/ and replace them by SPI mem drivers (which would
> be placed in drivers/spi/). With this solution, we declare the SPI NOR
> driver as a spi_mem_driver, just like the SPI NAND layer is declared as
> a spi_mem driver (patch 1/2).
> This solution also allows us to check at a fined-grain level (thanks to
> the spi_mem_supports_op() function) which operations are supported and
> which ones are not, while the original m25p80 logic was basing this
> decision on the SPI_{RX,TX}_{DUAL,QUAD,OCTO} flags only (patch 2/2).
> 
> [1] https://patchwork.ozlabs.org/cover/982926/
> 
> Tested on TI' DRA7xx EVM with TI QSPI controller (a spi-mem driver) with
> DMA (s25fl256 and mx66l51235l) flash. I don't see any performance
> regression due to bounce buffer copy introduced by this series
> Also tested with cadence-quadspi (a spi-nor driver) driver
> 
> Boris Brezillon (2):
>   mtd: spi-nor: Move m25p80 code in spi-nor.c
>   mtd: spi-nor: Rework hwcaps selection for the spi-mem case
> 
> Vignesh Raghavendra (1):
>   mtd: spi-nor: always use bounce buffer for register read/writes
> 
>  drivers/mtd/devices/Kconfig   |  18 -
>  drivers/mtd/devices/Makefile  |   1 -
>  drivers/mtd/devices/m25p80.c  | 347 ---------------
>  drivers/mtd/spi-nor/Kconfig   |   2 +
>  drivers/mtd/spi-nor/spi-nor.c | 814 +++++++++++++++++++++++++++++++---
>  include/linux/mtd/spi-nor.h   |  24 +-
>  6 files changed, 777 insertions(+), 429 deletions(-)
>  delete mode 100644 drivers/mtd/devices/m25p80.c
> 

I did an erase-write-read-check and a mtd_speedtest on mx25l25635e and
sst26vf064b flashes using atmel-quadspi driver, everything was ok.

I updated patch 3/3 as I said in its thread.

All applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
