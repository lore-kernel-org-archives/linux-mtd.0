Return-Path: <SRS0=AizK=EC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476C2C4363A
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 09:59:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 832192225C
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2020 09:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mBwfeoeX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="L6eFTznq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="kh9Z5Utu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 832192225C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fyv9DTJuxkJCbnyIfmThGbz3PkczS1agtOQEJu7ej90=; b=mBwfeoeX/nbkpMtlJmc3v65Ap
	2XxvjoK8OOnKN3Tin1eQKOMuJ+IPdqA58BXrIdUlA44jcbWRdwhOkvTLrg0thUVfw5m5AWLpjeWJF
	GHL9/eQ1pey8Ki3Q3vgn75sW7rIYCLHftDkuu8ytLaPu7JcLk+KBX9sJx9ObzcYDj1WnxhJVveulL
	kycfiqJftGnOiEeMadSYNbswHxAz1nWQo0WfgWca8HAxNO3xZSJf3R13Bc/mc30qXsT2KzSLVpnSF
	OokJjVsc8Q17y7P7MvK5lSNJVKEHYVOrHGZASi1AeFVWLHI88TCIL7IhS+kBFLibXFfH98K4ung2A
	g6QRSUwqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXLkP-0008QX-51; Tue, 27 Oct 2020 09:58:33 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXLkH-0008P8-7c
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2020 09:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1603792705; x=1635328705;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qXrXzE217/m9GFO2l+CHSRsOWFruy7Zt8DdYErDdlT4=;
 b=L6eFTznqen/pM87gGB/fxbPfqKf8k+UqeLGnTsyMKYmpCmcoFzlR8Rsb
 Gh89GrZFN6OZ/mMarEU1I12YZsH5nmMzwk2QZ9HLJbshRy28a8pxVBPfS
 WlSHZTbheadEh5HaIO9SsfBxXhqAHppgN0MN4gFWDr4Lg8JxGSj5TDRbp
 WZUxW+YaA2fvYqeKUDQAfvNefEJy/vSOHicWMp5uIhvefyKnSfVaoVHUe
 KKiN47poftKsDl/cGW+R82cJKg9ROpcn34ZAqMKQAYqoSeJVL9p5Kf8fD
 KsZNmlJx/TDJj7fIIVLSVPBEJTnAl6UD2IPCk9p0XQJ+FFCo4hRBGAeK5 A==;
IronPort-SDR: BE2d0yATR5ch9gcLMdqG3eammviyezO/XbOT6VRcyl6OiaRFDwEnq7U1buaoi2Wrt0Xygj1fp5
 8Lu8HjJksQR+p+z0QdfPSDw2E+Z2ZLtVlTCwbAM+H+j3zUAQ4ZFSWRDppjfiI3fH2duRs71z+U
 /j/0lZJrL7AdslMA7+qSWzui6KSU5ih96OjEJo7nL3a5QNVjxw8uB4tauFqNzv4vuLcak4TSR3
 FweYOCEYSYlEmeOd58hXXxJ7ru5BIGxmj0Dh4NW1fKkRWpSQ2bceF0VVSzCo7aeJxR1p6kaf1G
 TGw=
X-IronPort-AV: E=Sophos;i="5.77,423,1596524400"; d="scan'208";a="96127258"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Oct 2020 02:58:21 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 27 Oct 2020 02:58:20 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 27 Oct 2020 02:58:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qg31563EL85H4q3hBZ6CkC7QBqvMZwKrlGQl0fZWfrMpJHVO6wWl1jdEyYvEPz93t2s2UMahSfJcXwpLV3Y5bA1zgAC5NJCwkjQx+V2Kj1/8WLlKhJ7Cw49Qptk+966a0Lk4J5DWlplch83dTgdWyhKBPuS7+Ogit0cS265QTYr/OEAUL8H3qSARoq7kQtM7l6gChv/2aEtqmdNo+/DFsWdV7MQRJHgeHEqCMFJHBPQY06F9B6WYFHwFbQLjr0JdesNpux/iTPHpMBxDCsfz4dHJJPnafQSi4fnQDU79qWYrY88whUesgkMogyqp2Ot2ICzPlEYfJsR95w3Zdn38jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXrXzE217/m9GFO2l+CHSRsOWFruy7Zt8DdYErDdlT4=;
 b=AZaDoi7WzYtGNpVKptLn614EU/vIarxqyTMGby8eFawOmWxVBJzsbCLT1AbHD8SKVtuFQfKYeDOZF6bADjsjtMARwhwaFzYY78N3fhWVMmz2/ngtIC/Ne0h9VMPMY7wNAhqM2ZA4TjFzzDekGZpsxlI6761ZNoIN4OGOvLYL3GhgkK43iH+7eztRFIWscZYZfXf7sn1QYXk2xQR0za5vvpCVQeDGzyJKHaXPsLrqrGjkSvke0vEb+uDosoOWkTJRttpS0dtov1bzMtkkvj/swkg4MAInzi6sVl9WCpEaKUrwtwklbgMZfGkiiWUvn/cqZRyPom43/H3GnCypwdtGYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXrXzE217/m9GFO2l+CHSRsOWFruy7Zt8DdYErDdlT4=;
 b=kh9Z5Utuvh8tszP9mnJhx61QiYUvE8En5sva1PZHuJwVUo0PllfyNNCslgrap7H6+/sNSLnZiWaUy/hmHspySbP7A4TUYZcNDo87L0yhVZF01LJlAAzsVkFxlXrKeTH5WkerQWZm2H3rRtp9WE4ONInI/KqZDaDtz03k1HUuFqA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 27 Oct
 2020 09:58:18 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f%3]) with mapi id 15.20.3477.028; Tue, 27 Oct 2020
 09:58:18 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v16 05/15] mtd: spi-nor: sfdp: parse xSPI Profile 1.0 table
Thread-Topic: [PATCH v16 05/15] mtd: spi-nor: sfdp: parse xSPI Profile 1.0
 table
Thread-Index: AQHWrEew/z1TmR858kKmqoEJLwXHfg==
Date: Tue, 27 Oct 2020 09:58:18 +0000
Message-ID: <dde297d5-dbba-e863-14e7-acd5d1712321@microchip.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
 <20201005153138.6437-6-p.yadav@ti.com>
In-Reply-To: <20201005153138.6437-6-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 69e43c90-6477-49cc-b4d9-08d87a5ed4a9
x-ms-traffictypediagnostic: SA2PR11MB5177:
x-microsoft-antispam-prvs: <SA2PR11MB517734D8024887ACF4EB108DF0160@SA2PR11MB5177.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1kmqGAKmZtILwrSWJb9DTm+bXYo7RPQUw9U+cKs0CQOGMgATZPTIXR6bL/DprHyhDnu6pdIn28CLePCE01byW2mmpUfzNyoAI2IWUv+lEvfwUYtMwHTdLyhc5m3yB/yMxeA4jNxwU+7Na2A81LKoR5F6k+vEZWweJjVIsmkpmpJTn4TN28S13RuRra4ZLphjQXTebY69x//4MxDou74AEBvvj9wgquOz6s7P4jf6jZD1WfLzsi5IceCeASJwlcCvNOzSAaX+GyVk+k3qQTbPGfAkD1DXAYvklQNOJ0GYXSRFDDRJc0KvKm3A3Pwj90m8RQwTgX0mH/y4H1B3IWWtCVEiejaLYx/fOEljKn2Px9IYKG4ghXeJXqmKanLC/qR5
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(136003)(396003)(376002)(31686004)(71200400001)(26005)(5660300002)(4326008)(83380400001)(53546011)(66446008)(76116006)(6506007)(66556008)(6512007)(64756008)(66476007)(66946007)(31696002)(2616005)(8676002)(478600001)(186003)(8936002)(6486002)(2906002)(54906003)(110136005)(86362001)(36756003)(316002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: P53h4dUd9zG6P0FJ8wOiAqdDanJhZ2nbpalT5P0NESYffenwzRYZBgS3g+feZuhhC0YVm09tC78iJTib8hzJ5NqhjT6Q+c8Tcv3Qbf8gFCF0A3ESlGzDXNJ+mJF7gHbF9zEc7HajmMHC6HzGpaiIT4SF16pxsKQIG6w84iWza/T99Lu1Gg1/JkRwANGHE9IOVSKczz6KnoIw3G6ws8P1iFrXAew4z6GxO7uXruD2mWbPSa6m1806HnKYyg5a5JjqmJ52hVHwoMU8jrjS4FjnzZ8DGC/8RGmk8rs0tVdeEsxQg7xTpGHBKT7GOec9cUpQY6zL0g1WXdUDmkkPyVQDyK5kN5GxhaDtZ8IOUM9FIbwcx5kK+BMI4ZYQhxJ1w7tYhKwpQn+cKJ1V3n0RE/rAfQnjoRXA/VGAIIfZlavOwB7bi21swNqcx/TgaH9jsA2xU4Ql7Vi5U3M+je5KUXMOneKSbtBevBBsUnfvzhZUoZ0aqaUXjdPosyuEaFCBcnOCTSU3U6TBI6KlJX3bKokmEL0ggiGWkt0EemAkNOZ2gvUjN6VNZwYny5gYDjCg/9bO9DPtmS9g0K/Lx8LlVTUxSvQt69pTrr5rSo9Jusr0JtH1h/cHY9EeSud8N0ognUVX+sl+NxoE3w36LAK40GA1vQ==
x-ms-exchange-transport-forked: True
Content-ID: <DA9FBD645C5E0442B9D53918D97EEE13@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e43c90-6477-49cc-b4d9-08d87a5ed4a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2020 09:58:18.5375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2kA+WWqfmIScaRgCJphSiWbQ5KCWrPGg8ujZ0/IjmCQjAVuolxUbkQCR7+W2H1ejNYQW5hhZ4X4g9dJ/WtI0FQViavk9nLTmilZ65dcouvA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_055825_724703_3730EA8D 
X-CRM114-Status: GOOD (  27.32  )
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
Cc: boris.brezillon@collabora.com, nsekhar@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/5/20 6:31 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> This table is indication that the flash is xSPI compliant and hence
> supports octal DTR mode. Extract information like the fast read opcode,
> dummy cycles, the number of dummy cycles needed for a Read Status
> Register command, and the number of address bytes needed for a Read
> Status Register command.
> 
> We don't know what speed the controller is running at. Find the fast
> read dummy cycles for the fastest frequency the flash can run at to be
> sure we are never short of dummy cycles. If nothing is available,
> default to 20. Flashes that use a different value should update it in
> their fixup hooks.
> 
> Since we want to set read settings, expose spi_nor_set_read_settings()
> in core.h.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c |  2 +-
>  drivers/mtd/spi-nor/core.h | 10 +++++
>  drivers/mtd/spi-nor/sfdp.c | 91 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 102 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 779e64974fea..ad280874a2e8 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2332,7 +2332,7 @@ static int spi_nor_check(struct spi_nor *nor)
>         return 0;
>  }
> 
> -static void
> +void
>  spi_nor_set_read_settings(struct spi_nor_read_command *read,
>                           u8 num_mode_clocks,
>                           u8 num_wait_states,
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 5d95b4183a33..9a33c8d07335 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -192,6 +192,9 @@ struct spi_nor_locking_ops {
>   *
>   * @size:              the flash memory density in bytes.
>   * @page_size:         the page size of the SPI NOR flash memory.
> + * @rdsr_dummy:                dummy cycles needed for Read Status Register command.
> + * @rdsr_addr_nbytes:  dummy address bytes needed for Read Status Register
> + *                     command.
>   * @hwcaps:            describes the read and page program hardware
>   *                     capabilities.
>   * @reads:             read capabilities ordered by priority: the higher index
> @@ -214,6 +217,8 @@ struct spi_nor_locking_ops {
>  struct spi_nor_flash_parameter {
>         u64                             size;
>         u32                             page_size;
> +       u8                              rdsr_dummy;
> +       u8                              rdsr_addr_nbytes;
> 
>         struct spi_nor_hwcaps           hwcaps;
>         struct spi_nor_read_command     reads[SNOR_CMD_READ_MAX];
> @@ -425,6 +430,11 @@ ssize_t spi_nor_write_data(struct spi_nor *nor, loff_t to, size_t len,
> 
>  int spi_nor_hwcaps_read2cmd(u32 hwcaps);
>  u8 spi_nor_convert_3to4_read(u8 opcode);
> +void spi_nor_set_read_settings(struct spi_nor_read_command *read,
> +                              u8 num_mode_clocks,
> +                              u8 num_wait_states,
> +                              u8 opcode,
> +                              enum spi_nor_protocol proto);
>  void spi_nor_set_pp_settings(struct spi_nor_pp_command *pp, u8 opcode,
>                              enum spi_nor_protocol proto);
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index c77655968f80..b2d097b44a55 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -4,6 +4,7 @@
>   * Copyright (C) 2014, Freescale Semiconductor, Inc.
>   */
> 
> +#include <linux/bitfield.h>
>  #include <linux/slab.h>
>  #include <linux/sort.h>
>  #include <linux/mtd/spi-nor.h>
> @@ -19,6 +20,7 @@
>  #define SFDP_BFPT_ID           0xff00  /* Basic Flash Parameter Table */
>  #define SFDP_SECTOR_MAP_ID     0xff81  /* Sector Map Table */
>  #define SFDP_4BAIT_ID          0xff84  /* 4-byte Address Instruction Table */
> +#define SFDP_PROFILE1_ID       0xff05  /* xSPI Profile 1.0 table. */
> 
>  #define SFDP_SIGNATURE         0x50444653U
> 
> @@ -1108,6 +1110,91 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>         return ret;
>  }
> 
> +#define PROFILE1_DWORD1_RDSR_ADDR_BYTES                BIT(29)
> +#define PROFILE1_DWORD1_RDSR_DUMMY             BIT(28)
> +#define PROFILE1_DWORD1_RD_FAST_CMD            GENMASK(15, 8)
> +#define PROFILE1_DWORD4_DUMMY_200MHZ           GENMASK(11, 7)
> +#define PROFILE1_DWORD5_DUMMY_166MHZ           GENMASK(31, 27)
> +#define PROFILE1_DWORD5_DUMMY_133MHZ           GENMASK(21, 17)
> +#define PROFILE1_DWORD5_DUMMY_100MHZ           GENMASK(11, 7)
> +
> +/**
> + * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
> + * @nor:               pointer to a 'struct spi_nor'
> + * @profile1_header:   pointer to the 'struct sfdp_parameter_header' describing
> + *                     the Profile 1.0 Table length and version.
> + * @params:            pointer to the 'struct spi_nor_flash_parameter' to be.
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_parse_profile1(struct spi_nor *nor,
> +                                 const struct sfdp_parameter_header *profile1_header,
> +                                 struct spi_nor_flash_parameter *params)
> +{
> +       u32 *dwords, addr;
> +       size_t len;
> +       int ret;
> +       u8 dummy, opcode;
> +
> +       len = profile1_header->length * sizeof(*dwords);
> +       dwords = kmalloc(len, GFP_KERNEL);
> +       if (!dwords)
> +               return -ENOMEM;
> +
> +       addr = SFDP_PARAM_HEADER_PTP(profile1_header);
> +       ret = spi_nor_read_sfdp(nor, addr, len, dwords);
> +       if (ret)
> +               goto out;
> +
> +       le32_to_cpu_array(dwords, profile1_header->length);
> +
> +       /* Get 8D-8D-8D fast read opcode and dummy cycles. */
> +       opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, dwords[0]);
> +
> +        /* Set the Read Status Register dummy cycles and dummy address bytes. */
> +       if (dwords[0] & PROFILE1_DWORD1_RDSR_DUMMY)
> +               params->rdsr_dummy = 8;
> +       else
> +               params->rdsr_dummy = 4;
> +
> +       if (dwords[0] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
> +               params->rdsr_addr_nbytes = 4;
> +       else
> +               params->rdsr_addr_nbytes = 0;
> +
> +       /*
> +        * We don't know what speed the controller is running at. Find the
> +        * dummy cycles for the fastest frequency the flash can run at to be
> +        * sure we are never short of dummy cycles. A value of 0 means the
> +        * frequency is not supported.
> +        *
> +        * Default to PROFILE1_DUMMY_DEFAULT if we don't find anything, and let
> +        * flashes set the correct value if needed in their fixup hooks.

We need to update the comment because we got rid of the PROFILE1_DUMMY_DEFAULT,
(which is fine). Operations faster than 200MHz are not part of the current xSPI Spec.
BFPT defines in DWORD20 the maximum operation speed of device in 8D-8D-8D mode, but
does not specify the number of dummy cycles required. Set dummy to zero and let the
manufacturer drivers set the required number of dummy cycles in a fixup hook.

> +        */
> +       dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[3]);
> +       if (!dummy)
> +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, dwords[4]);
> +       if (!dummy)
> +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, dwords[4]);
> +       if (!dummy)
> +               dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, dwords[4]);
> +       if (!dummy)
> +               dev_dbg(nor->dev,
> +                       "Can't find dummy cycles from Profile 1.0 table\n");
> +
> +       /* Round up to an even value to avoid tripping controllers up. */
> +       dummy = round_up(dummy, 2);
> +
> +       /* Update the fast read settings. */
> +       spi_nor_set_read_settings(&params->reads[SNOR_CMD_READ_8_8_8_DTR],
> +                                 0, dummy, opcode,
> +                                 SNOR_PROTO_8_8_8_DTR);
> +
> +out:
> +       kfree(dwords);
> +       return ret;
> +}
> +
>  /**
>   * spi_nor_parse_sfdp() - parse the Serial Flash Discoverable Parameters.
>   * @nor:               pointer to a 'struct spi_nor'
> @@ -1209,6 +1296,10 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>                         err = spi_nor_parse_4bait(nor, param_header, params);
>                         break;
> 
> +               case SFDP_PROFILE1_ID:
> +                       err = spi_nor_parse_profile1(nor, param_header, params);
> +                       break;
> +
>                 default:
>                         break;
>                 }
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
