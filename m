Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872FAC004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 18:33:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5656220656
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 18:33:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3jKzAfY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="PoowSsx0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5656220656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LHNATzBKzzupORSRY7X5ypb9y3aMKygejYUbBGbosUg=; b=d3jKzAfYRuoX7G
	KhUR4ayjGw2uOpJj/mhcifA1si63c6yuB40vu7SgiS+9gMUfhsYKqC1S6N/2F87K+RumHXFj/cnYD
	EcA2p7TRyZ+571AZzIuT5bjmuhWdvi0Y3NpMkBUezQR0LYHmjJBvcsNHjptTj+y6/nLwm+FTxpdEd
	h4jsVY644MpJPdaFeuo0VmsTy6ZcSFYJxjSjS9A0uz999BRVTlMDQ3MotplPCojKVkcqUKjH08Wbe
	2ooM3yFeIAExp271HyT53579lDuJD6IDlBSwRaEdkORcZe7o9gge3Kw5Ks/haUM3yt8DkZTZ41QrS
	sYBjxqeX1tZD6qfOvLkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO4u5-0007FU-7y; Tue, 07 May 2019 18:33:25 +0000
Received: from mail-eopbgr140040.outbound.protection.outlook.com
 ([40.107.14.40] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO4u1-0007F0-N8; Tue, 07 May 2019 18:33:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vq/WP10A+sinh1xf3kCKBoiZHCgadiRc8ZUU3lqnzxQ=;
 b=PoowSsx07jQTqmdCQtQN69MyfqVW9bb35OkV339vfWDiTfHtlzBpy2wknXz4zNoq/6EDhGsd38kZy0lMhBP0192oySYUepqwI3Ze+aOb+znVGQrzgFU6/RSzsBUJjX5vb9DVkiTqRi9aepel4EiRC9r6eScqxxh1fAXyARuJQQw=
Received: from VI1PR04MB5871.eurprd04.prod.outlook.com (20.178.205.13) by
 VI1PR04MB3200.eurprd04.prod.outlook.com (10.170.229.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 18:33:14 +0000
Received: from VI1PR04MB5871.eurprd04.prod.outlook.com
 ([fe80::f0ec:9ba8:16da:1d28]) by VI1PR04MB5871.eurprd04.prod.outlook.com
 ([fe80::f0ec:9ba8:16da:1d28%2]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 18:33:14 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Jagdish Gediya <jagdish.gediya@nxp.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, Arnd
 Bergmann <arnd@arndb.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Subject: RE: [PATCH v2 2/2] arm64: defconfig: Enable access to CFI-compliant
 memory mapped NOR flash
Thread-Topic: [PATCH v2 2/2] arm64: defconfig: Enable access to CFI-compliant
 memory mapped NOR flash
Thread-Index: AQHVBM6mpvzRI8sFlUSX3WYj8ye056Zf9TKw
Date: Tue, 7 May 2019 18:33:14 +0000
Message-ID: <VI1PR04MB58713BD7F9C3468F29E2D58A8F310@VI1PR04MB5871.eurprd04.prod.outlook.com>
References: <1557231354-11758-1-git-send-email-jagdish.gediya@nxp.com>
 <1557231354-11758-2-git-send-email-jagdish.gediya@nxp.com>
In-Reply-To: <1557231354-11758-2-git-send-email-jagdish.gediya@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 207e26bd-b303-49f5-e442-08d6d31a7780
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB3200; 
x-ms-traffictypediagnostic: VI1PR04MB3200:
x-microsoft-antispam-prvs: <VI1PR04MB320005802DBFAE17D0EEC0D08F310@VI1PR04MB3200.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:350;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(396003)(346002)(366004)(136003)(13464003)(189003)(199004)(66446008)(64756008)(66556008)(5660300002)(66476007)(186003)(256004)(86362001)(14444005)(6506007)(53546011)(71200400001)(55016002)(71190400001)(66946007)(73956011)(76116006)(2501003)(26005)(66066001)(476003)(478600001)(486006)(11346002)(446003)(2201001)(6436002)(102836004)(3846002)(54906003)(4326008)(7736002)(8936002)(6116002)(110136005)(81156014)(81166006)(74316002)(229853002)(9686003)(68736007)(14454004)(305945005)(8676002)(7696005)(52536014)(2906002)(76176011)(316002)(33656002)(99286004)(25786009)(53936002)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB3200;
 H:VI1PR04MB5871.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BWubCbHIUiyZlJIyp4Jkjf/RD8edXLihv5zUUzVMzcWPaS/KbCxpot1X1WHafFicNIGJTOFg+RcQHl8b6MZBRLyb65HZ8Gd3H9Ri5gXcCL/DxRCkNId1e7fDxPoCbNID/Q1mMucpMVSkFTcflln4vLN2D8lrR9ryCLy2vWFwFz5PCFWROQBU4FM+YJ0tht9BPgV+sX7cA2BGnEFDRKoO49jVsqhJNTjhI2ZhIHWnO91WMznoFT9t7OzdPcugcSwUjO6z4rqL3vaQ/nKyOFP/tMLw53WOZ1MnTPejQePU16/VmEXyX//vhnUAg/BZGFox1hIll747UnRx72uPMBHcFwrlrU/HVo9Alwq8EzWelGQWaQ7//g2aYfC5E7Brv0UREvZvRMCvZcfU4NN+HH1MeOzUt9+H9iFS/EeBIBtmvL0=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 207e26bd-b303-49f5-e442-08d6d31a7780
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 18:33:14.6579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_113321_818144_A058A107 
X-CRM114-Status: GOOD (  15.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Jagdish Gediya <jagdish.gediya@nxp.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Jagdish Gediya <jagdish.gediya@nxp.com>
> Sent: Tuesday, May 7, 2019 7:16 AM
> To: linux-mtd@lists.infradead.org
> Cc: bbrezillon@kernel.org; Leo Li <leoyang.li@nxp.com>; Prabhakar
> Kushwaha <prabhakar.kushwaha@nxp.com>; Jagdish Gediya
> <jagdish.gediya@nxp.com>
> Subject: [PATCH v2 2/2] arm64: defconfig: Enable access to CFI-compliant
> memory mapped NOR flash

This should be sent to arm mailing list and arm maintainers(added for you), and cc the MTD owners.

> 
> Enable below configs in arm64 defconfig file,
> CONFIG_MTD_CFI=y
> CONFIG_MTD_CFI_INTELEXT=y
> CONFIG_MTD_CFI_AMDSTD=y
> CONFIG_MTD_CFI_STAA=y
> CONFIG_MTD_PHYSMAP=y
> CONFIG_MTD_PHYSMAP_OF=y

This include both CFI and PHYSMAP changes, and probably better to be separate.  And it will be good to mention that CONFIG_MTD_PHYSMAP_OF has been enabled previously in the defconfig.  It is because of the following change to the driver that it is no longer selectable alone but need CONFIG_MTD_PHYSMAP to be selectable.

commit 642b1e8dbed7bbbf8c4deb3c9a0496f17278badc
Author: Boris Brezillon <boris.brezillon@bootlin.com>
Date:   Fri Oct 19 09:49:04 2018 +0200

    mtd: maps: Merge physmap_of.c into physmap-core.c

    There's no real reason to have two separate driver for the DT and pdata
    case. Just do what we do everywhere else and handle DT and pdata
    parsing in the same driver.

    Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
    Reviewed-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
    Acked-by: Linus Walleij <linus.walleij@linaro.org>

> 
> These configs are needed to access CFI compliant memory mapped NOR
> flashes e.g. NOR flash connected over Freescale IFC.
> 
> Signed-off-by: Jagdish Gediya <jagdish.gediya@nxp.com>
> ---
> Change since v2:
>  Split the defconfig changes between,
>  1. Changes as a result of 'make savedefconfig' command
>  2. Enablement of actually needed configs
> 
>  arch/arm64/configs/defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index aff014e..ac06501 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -193,6 +193,12 @@ CONFIG_HISILICON_LPC=y
>  CONFIG_SIMPLE_PM_BUS=y
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
> +CONFIG_MTD_CFI=y
> +CONFIG_MTD_CFI_INTELEXT=y
> +CONFIG_MTD_CFI_AMDSTD=y
> +CONFIG_MTD_CFI_STAA=y
> +CONFIG_MTD_PHYSMAP=y
> +CONFIG_MTD_PHYSMAP_OF=y
>  CONFIG_MTD_M25P80=y
>  CONFIG_MTD_NAND=y
>  CONFIG_MTD_NAND_DENALI_DT=y
> --
> 2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
