Return-Path: <SRS0=/HUW=DJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78392C4363D
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 09:49:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA435206DD
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 09:49:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VyaYNlf8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="KxVnwW+1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="AQZfHCh1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA435206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R7QadKsBkDkOs0w6sbsU5sOg5wR4ccc6PJa4sI5/QT4=; b=VyaYNlf8hAxddWDw5TnYUqL4c
	Ti6pO5RNzzzhIliqbRt73vqE+m2Txwa6Fafd9vGXllyE07jzdHniAYBgJDI6IDYC+EZ8PMq5OStNe
	BGGkx6Lu+JHqy5htuCCYBPojBXbyI2qGVYGw1vRaqSGoaf8EgZFcawNWD64Voj+1uqPCSIRrNy6TB
	BoT2fpQC3XgOU1ptqMwpGs4Ss2BE5SPZmq84dywRz2VD4pQ48yxj91zM+ZuOUG8DqpQQUhXBV5ov4
	wptHhVhCRMwW7OmIVbSZijWk+8hD+lopWR8qxNhFcOZuosdGvKJuksvnQp6N7CyAtd8aSBFlAf1Be
	UGVlVCixw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOHfN-00081F-M4; Fri, 02 Oct 2020 09:47:53 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOHfJ-00080U-VG
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2020 09:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601632069; x=1633168069;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ry+6ExZTvSGUY05KyCUbs0WORZ1KM/MPOYQlE3Eee2k=;
 b=KxVnwW+1v2Ir51aFAziol6HZFTQdNEgnfzVXZ/PwUd4s0Z6eqKgrhlGw
 f2byZwH3QQ7E+MazgOYrbfs2jx3EC2Pb9yHxaY1kVTUUKbJO8RLCtX0n+
 7HWU60VKqbn/cqxmgwZUG0KTDhq+KwBFuYY5D5NlIalH/T/1x7j7Hg9IT
 Mkg4FXkEEBI+bFpSF+3VbX9I8GxbialYO5GIEmYyazGjTITh0UTMmTQYH
 +y5ujgcJxgiyUpyxTMAH5A6W/KT95qI+sY7lhKuyySH4V38+jVmWVgGPi
 2GMoHwFmtm14tsEQ7jvqgI10Eg2ZvKSCGPJMQ+9hJK4dRjiszHGWHRiGy Q==;
IronPort-SDR: Dx/N2sqOlQvNz5t+9YgWEeww2WietgyDtd9fdRJ6Vh68U3qNkThFBXMx31z7/7JgzTmgg5JLA4
 VDFMxy/tzv0g1V+ltU7qV9zKqotSmMj88UsfVcf8CCL7m1KzRFqYHHTge4ZpkRiGKQFh49Mr8m
 A5QfZG4uNTfe3WIDZlzoYH44yxkJZsXZJIc9JUEIymin0nJTADcGQO4pSJl/HW24OMBz2SiaX5
 yu1ol5GZcw8YKGy9PaukYu9Ik3wMpiVVy8fLjym0nvo/4SKbbQFidVyFdW8WBHwZAfBLfgHjmC
 62g=
X-IronPort-AV: E=Sophos;i="5.77,327,1596524400"; d="scan'208";a="28488956"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Oct 2020 02:47:47 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 2 Oct 2020 02:47:15 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Fri, 2 Oct 2020 02:47:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkjOPTAaUP7zRK5GbkGPjFJdij7/UVNN6qINp4BFcO5ODAHm4Kl7oZJYV+wyRJeST1LpAl5lNAsezmRMUwXsiRmsExCEx4xWDmL1FUwf8iRjpqYTuz1TU2pqViyas+EfGymyq0XayeJBoDAMLePmVwkeXJvNmMa85rKJvLaj+Hcz2QY8Xa2ACz7AwFW4XxWc+R6uQ70Xv0EIXkgmcMsGNL7rxCOGJWLSqpk+P4s2v8JTtE7AKUAzuPgS+YXDwJtAD9c+c6CD4VvzNDtRlyJjYyLkwR0qBiYjANzMDS2fWdUDsILLIz1mbptYulBX4hmDx1Fby+QyVJgdd1FWaKMxaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ry+6ExZTvSGUY05KyCUbs0WORZ1KM/MPOYQlE3Eee2k=;
 b=idFJi5o9GZSa57sAUZRjKOLTDcvzevY19B8rSwEXYH83CHt1a8r42A8fgZ7LxJrICujoWNttimfgLs8IBOAOwzUWSy+UssmsbkmgUvIwOPm1JhgXh5gWmtmhAKSynqv2yiCELjCD1C0RwKTdB6oTAwxwwNidR/D0H0oOAcAqEtEc9avQzL09vrFFNfIfQ9XNU4QP9VbtwBq5/LkZs+e9j9EReq+Sg4j069zygl3cCv2Zr3/1wvbZSOzdxqnV7XKst3arhWJdaUOxbPSUjAfME18vHt+Nb7pCq+oiVo93vq9FsXb0JpgeGfvexjSuzBqfPeJMhlSOTQS2Z7w1coiSAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ry+6ExZTvSGUY05KyCUbs0WORZ1KM/MPOYQlE3Eee2k=;
 b=AQZfHCh1jqxyAF5WLFYFTjzLq1BkutQpQE0Qzic3mjWr2M79QVvp6rQsI1qXOeLsIB/kRfjqt8rn2DHRfSShv68mrwU2hv7TZl3vKkzLbcDj8IFx4Nr9tKABIBDQI6tJFDPjVqn35KDwAZM8LPIoJagenbJBOonwTK5+hYzLmUY=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB0073.namprd11.prod.outlook.com (2603:10b6:4:67::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.26; Fri, 2 Oct
 2020 09:47:45 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.039; Fri, 2 Oct 2020
 09:47:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v15 10/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Thread-Topic: [PATCH v15 10/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Thread-Index: AQHWmKEU2iGDqswa+Uy5b5nAZAV7tw==
Date: Fri, 2 Oct 2020 09:47:45 +0000
Message-ID: <1bd8bbb1-af99-3a55-cfbb-7bffd317e402@microchip.com>
References: <20201001202045.21499-1-p.yadav@ti.com>
 <20201001202045.21499-11-p.yadav@ti.com>
In-Reply-To: <20201001202045.21499-11-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 3dc617fb-4872-4172-64b6-08d866b836f6
x-ms-traffictypediagnostic: DM5PR11MB0073:
x-microsoft-antispam-prvs: <DM5PR11MB007374B0A675040D888366BAF0310@DM5PR11MB0073.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8i5icf3vZ4avDIbv92XsJ43ZRvH7+XOFUe6DGY1dY6mmpL6o8BQqclV1wdM4sfhpHAoYYfCZuqynJAVIiAT8njb0xlb+0ol/XN9g0zhfMxXJuULGJXxBwYoU7EAci40d7w0MrSNBdd6kHT5XuKWQOLHH4q/pWnBs9dEGur4GP+ZvtlrywXo4E/yIPPMqypyveegQS3dLbPKqIWspUbFpWOFpBxsVqxzYOwacnYHFZjrFoCvLPbazH2+FyeVrWdXtFf5CKvWbLEBOvITA7c4JUlK4m1xlkelUVP7O784eCHUOQPF5YEKAbwQwl3IopKDRoYRUGrOQHzUgbnvhfAS5kiFJZ4qCJ6pQwmefINdAZni2i46ji1CVAYpHb//TL1qOzxEHeW+cLrWIzuOxWAJB8WFWmrLZvfXAim4yoxv9ETJKxEclwmY5aOdf7hB1Jw4K
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(376002)(396003)(136003)(366004)(8936002)(4326008)(83380400001)(6506007)(31696002)(110136005)(66446008)(54906003)(31686004)(316002)(36756003)(478600001)(71200400001)(86362001)(64756008)(66556008)(66946007)(66476007)(26005)(53546011)(5660300002)(91956017)(76116006)(6512007)(2906002)(6486002)(2616005)(186003)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: D/a1XBoiPVBLb0Yk6axwG5C9XbKEgbTRfbvPtyShmnlSaRv2jAcIblwiRnuo/Lti4ov5c124/PSsU7f2JI3AbY8ZQAFEOvR6pGwBWgjTezxvHDK6YPuelniKkOVrDS40+1b8d1DLBfCPLAR56MHxZZc9xnbuQcYp2Y0dLtDjAll6z6aIY5pVUL3NbbNlbAIv0+QdTbrk8qbHR3s3Lu/E9oeR6cWoJHHM/xFl5US54Ohf6ApcIlQojwnhosbH/udp7H8Uh5VDMyp6RA39xODhWUY/Yj0j0MOru4oWY/PhT2sD9+VtGQ0aKI6PXjj/oY/S5lCdiCeZrk5csDB8qcyQ7OHaogZSOQZJmwNmgSGWhA2qIYwclxyaPDT/lelKNHmy3GvVT9mU0YsMLnnKaVMPMH5S33c+aSCX5UEz9p1iOFs3vzQBSPwuQRjU5h475S5XDzXyTgv4HQXPIWFI0kQaOrIv0iJW9zjDD7UdSpLgKkLyZmfXx0+31vovpi8tKcYxQpmljv9Onf0vgs9qutchR8w6WI52chx3ydYGCtYg7ELjx8W3P4+sBUHVeYhumAX5+wuM6p+mKmvkcIkRiPRJ47K9yDSQFuIEU+jJ5S+sA5KvhIN6Sjhs+zCG+ERk3BsWpw6ko/OruDwAe5fNd6U43Q==
x-ms-exchange-transport-forked: True
Content-ID: <6396B15F2969F141A3770CD3DDBA2879@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc617fb-4872-4172-64b6-08d866b836f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2020 09:47:45.2959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kdUfjjhcWKwztKCF+u+1nhjMZO/O31YsmxLE5BrPyEPRctrXEY25fa+2rmtVig15WnT9e05SHUK3NpbX0zakI7VnPUjIdXFzaOvFvdWIcPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_054750_301438_EE4C1FE6 
X-CRM114-Status: GOOD (  22.66  )
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

On 10/1/20 11:20 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Allow flashes to specify a hook to enable octal DTR mode. Use this hook
> whenever possible to get optimal transfer speeds.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/core.c | 38 ++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.h |  2 ++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index e91ddb409699..cf6ada7c8a7b 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3068,6 +3068,38 @@ static int spi_nor_init_params(struct spi_nor *nor)
>         return 0;
>  }
> 
> +/** spi_nor_octal_dtr_enable() - enable Octal DTR I/O if needed
> + * @nor:                 pointer to a 'struct spi_nor'
> + * @enable:              whether to enable or disable Octal DTR
> + *
> + * Return: 0 on success, -errno otherwise.
> + */
> +static int spi_nor_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +       int ret;
> +
> +       if (!nor->params->octal_dtr_enable)
> +               return 0;
> +
> +       if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
> +             nor->write_proto == SNOR_PROTO_8_8_8_DTR))
> +               return 0;
> +
> +       if (!(nor->flags & SNOR_F_IO_MODE_EN_VOLATILE))
> +               return 0;
> +
> +       ret = nor->params->octal_dtr_enable(nor, enable);
> +       if (ret)
> +               return ret;
> +
> +       if (enable)
> +               nor->reg_proto = SNOR_PROTO_8_8_8_DTR;
> +       else
> +               nor->reg_proto = SNOR_PROTO_1_1_1;
> +
> +       return 0;
> +}
> +
>  /**
>   * spi_nor_quad_enable() - enable Quad I/O if needed.
>   * @nor:                pointer to a 'struct spi_nor'
> @@ -3107,6 +3139,12 @@ static int spi_nor_init(struct spi_nor *nor)
>  {
>         int err;
> 
> +       err = spi_nor_octal_dtr_enable(nor, true);
> +       if (err) {
> +               dev_dbg(nor->dev, "octal mode not supported\n");
> +               return err;
> +       }
> +
>         err = spi_nor_quad_enable(nor);
>         if (err) {
>                 dev_dbg(nor->dev, "quad mode not supported\n");
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index eaece1123c0b..105a4ddeb309 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -204,6 +204,7 @@ struct spi_nor_locking_ops {
>   *                      higher index in the array, the higher priority.
>   * @erase_map:         the erase map parsed from the SFDP Sector Map Parameter
>   *                      Table.
> + * @octal_dtr_enable:  enables SPI NOR octal DTR mode.
>   * @quad_enable:       enables SPI NOR quad mode.
>   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
>   * @convert_addr:      converts an absolute address into something the flash
> @@ -227,6 +228,7 @@ struct spi_nor_flash_parameter {
> 
>         struct spi_nor_erase_map        erase_map;
> 
> +       int (*octal_dtr_enable)(struct spi_nor *nor, bool enable);
>         int (*quad_enable)(struct spi_nor *nor);
>         int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
>         u32 (*convert_addr)(struct spi_nor *nor, u32 addr);
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
