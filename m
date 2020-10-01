Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFB7C4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:10:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92AE6208B8
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 08:10:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s2Ifk+ID";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="aWqjMnnX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="kFAscr2U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92AE6208B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I5j+fK04YYwOn2v0KUjFwgvr8J36VHl7Jzlpq4BbZdQ=; b=s2Ifk+IDw0EIMGmFMGq1JMOXk
	B/BZqciO/b5kbJFqqXNO1ZLyIXdbHC+B4oIm14T1hl9pd75E0+xot3GWWpxUBbTFXbSMAR8b+46Dr
	lQo4nepnLv0ESMip4T0edzlU5yKg/ZgYQa+S+TSXuW+QozeuzXlyKIFpYhm7vqBtak/KrovaYwc5n
	oGD7MliEeahpJEMxrdgl2lkgYUo+W2P0rRA/4jia3Sb278aDGc+aZixxSmY9ABgaVdWJcvrgwzz9O
	lm7i21CfCa79aTbCc99ZBSGuvL+ZzHzFyE1rG0eWRB5h+PgtOysFsJctMc/P1/5ED2Q9cAoSt7xh+
	ypKpXRnVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNteX-0007kE-8E; Thu, 01 Oct 2020 08:09:25 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNteT-0007ib-Em
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 08:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601539761; x=1633075761;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=cafUnTESJDdjYnNnJexgVcRUCwTh+2d84mIQYBQ8VyE=;
 b=aWqjMnnXVeiDEg5tLXmOQABdnlrjNWE6O+BHA+7ESNfxV92gJucYsPEM
 Zn5sP5UMFCCNrE9rZzbiUvGfWBbLPGFKTfKywXXqZUKXIvton4+dh4CQE
 OLB9YbFkIP84G0Ly+bAH7Y03jubIyR+frY1jC0Y+eEfGAqJ+q+cig60So
 oeMzCxEKqMtv80z3mCzg/gyuHVMR788GTZ7P/y16oU9hrf/eIUbZ9Bnc/
 BM3/ybopGdHitQK5bDqMExiAl6EkmtZ5PlOnbnwDDrp0PoVVI7KTxYWlN
 RKnOsqdas3Xvl5/vDyAvP8EvuIBJJRs3NJCEETesJk/58xHvK237zjd5W g==;
IronPort-SDR: efg51cydjfx5k1TGotrWtZAtGcN9PsDV9PjtXWRn7kXKgvcp0Mk5soc7hqroMPrk042PEEbMYJ
 QZHQszJLna+/7HCVj2KFIaEW+WjBLXHGYjnNis6PCwlV0FocE3yxdCbldiXwB71zwzOR44IidF
 TYqUMDB8lWDqILXzKZCICo5fi60gMc1IqOH6GjQa7L9f0D2cYIZe17jl0SMfI7Kkk4cDDZop9t
 +5dq5PXhp46+EAXXnZURg44KOBMrGOib72U8DLHWJtb0hf74QhTCAdcmKLJYuUE9wsjMXjEPbB
 Kf8=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="28340985"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 01:09:18 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 01:08:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Thu, 1 Oct 2020 01:09:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZeYwBHaAn/uLG6Tl+1I/CNoUu74cRZh0PNxziCSFhfybBm5Q13HpuZ8cAoD4F7y/5JWr0Rk27/Clc/N0JjyLE4fIZB3+e74GrfedqBSnUwoir1M7uY5uhLFdxLnA3lXpUkZgfd/d6xwwgFyp/MzU6KUJ1vtd0+PXBwP8DQCLUaB3e8pCd3XrtTj6ul0pmgEwU9hE4uzmXG9gukYc1taXUW8kVemi+lWu7EVLtSfuVYiXBBTn5IN4JWfkV1wQ1czIvDLejaYWVNFjkZNHG0HkEbu4eSYEsupVfglv+mYmFcXyqUUQ0PvoDziw7ucxqXpXuq7zflYVoVgVjPv7Dmt+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cafUnTESJDdjYnNnJexgVcRUCwTh+2d84mIQYBQ8VyE=;
 b=JZPL21raHh/3mnWyPBOLdaqeQq0Tn3C2jFkDVFxFdUobCzff5U2LLhljQafuJERN5OfFJMIeDKYZZ0Pg/CNRYZ/SCX647bjvTuEzng/uwy4Uht+9oUi40sEl3nYLcPnBb7/B05LCsGtKK2GhjfxmsIwkZnp0oj8GjnOCTiKU/Bdvuz7zivsPXWjeaReDdKu7MV/A9jMHfrpFQjDgqw172ObZa0Ur0krv44MecTlqGWFUCCv3/MzqnJ5LnZPquV6WFcOxB7pGD+LP1mM35j6vTZy1hQkcw4xpWCEyzrqvbJgh70jbp+CJxd+6WYGTmONcB99PZQgonPliBlXY2lR3Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cafUnTESJDdjYnNnJexgVcRUCwTh+2d84mIQYBQ8VyE=;
 b=kFAscr2Uvhjrd0gmE8M/U3VhlgXePoAD1FBdCp8mCeMUCD7U4e/DGshnjWLRTQn5iVy0RGNKPxoy/J8L2tjQHnx8teEvJCaIgem3QJSLYQIk5GHHbn1lQSdH7P4zBV1/lVA2qUaeFSnfnDzI4phQV4DKJgYvwH237lTtxG+fZ/E=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (10.175.91.12) by
 DM6PR11MB4594.namprd11.prod.outlook.com (20.180.252.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Thu, 1 Oct 2020 08:09:14 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 08:09:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 08/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Thread-Topic: [PATCH v14 08/15] mtd: spi-nor: core: enable octal DTR mode when
 possible
Thread-Index: AQHWl8oabzlDdL0vp0ONiMw+1kL2TA==
Date: Thu, 1 Oct 2020 08:09:14 +0000
Message-ID: <3e162719-80c7-03dc-dc2a-29a46bc4cb2c@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-9-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-9-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.51.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f10d3e00-d79d-4445-8683-08d865e14920
x-ms-traffictypediagnostic: DM6PR11MB4594:
x-microsoft-antispam-prvs: <DM6PR11MB4594FA27B0D01DDD237E2D36F0300@DM6PR11MB4594.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ORoWjD6ab27FRl1pC2Ua5nUeCo3ORCEX/+aJvMi8avELMGMUihxeh6kUErwCk5SWHM0D6SgCDh7GOfBi0ERd0fIh92QxQJ0zDldxcJk8y55YAvjDmyXX41Ue8N795YE7HA0C4GwkTacdlfCSpEZUfMourSn0bZcYqvLYKsJK4Fku+01qpmOyxP4VN0NyZcaU6fAm76OOkFCTvvyKpNCyJVJxRiJHgD59cuLNGs3VjXme2VVO8DMXrf4YTF4PMM/3pRIoBVENGkmj39VcIAe1jc6sPCgQ6no0i9nd7dsP2+HIqCdybsD3I1tfc9FwQzxoQVYXoZxznfsUcsWzCaHh/A/n8NHtjt73nTd1+teEjt0RVz+XlbIYSApK35iYWQYf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(396003)(376002)(346002)(136003)(86362001)(6512007)(36756003)(83380400001)(4326008)(478600001)(8676002)(110136005)(31696002)(2616005)(8936002)(31686004)(91956017)(5660300002)(76116006)(71200400001)(54906003)(186003)(6486002)(2906002)(66946007)(316002)(64756008)(6506007)(53546011)(66446008)(66556008)(66476007)(26005)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: P2k6YTXtV7Q9wEPEQDvwdYuVdjCMn2xvhwiQgNQFOGVK7Dmu2ylGKoTLtUKRa4hG9sfWOubEIaF60NC+m6mqn6O9h/3dcf3oTfGw2rV9LoWiNS3GwXNwp+CM/Yy6yh3Mw2cvm5f7TJgeSIGePy1DjC99mgyJRtE6NpPtU3+6SrNl6vmMmngI6u+4CfGd82orGSgPGbjDSIczopRMK3qap18N+tfyjDEg7zantKyZrrAIiYsmS+hlFke2N7fX5Ccqvdc5omZe7vMBdiXLonGEUc/y53cvHDby4lBQr3jORD7sCIg+VYnHvw7QavIJuT9hj39ga6nyVfba0NBnyig/WqX7gmAQM57pjj5fLjjO2mOkCO0vIg8yRynEmtlnHWuDRqPr9YwwGBt3XshGjFVSz0paJNJl9LtA2Qj2FIHcyQvXf3vTloCXBJss9Ux8qDmRmFGwBWEj86zUQLxOlBGQbq+QtUWqjCa34gAbApn0zrnHcKPVCnrLllUutXgbYIpsFmHsZRzULK7EkqnZWjoCIy36VEoom48ADZ2y/ZUiC7yTbjkK9V7qY/sFLunuwDdA/ozMCJCa6X9IBEfv5piraM+PLIIzsoaHGx0NK3voBPv1uM17Qpe4dhiVMNBqKrRUxH1ZtNi7A6LwPUu0YMBQ7A==
x-ms-exchange-transport-forked: True
Content-ID: <33019604D7CEC649B137852452E1D41B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f10d3e00-d79d-4445-8683-08d865e14920
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 08:09:14.0800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hsj2M2H9oFiXucxxo4PHaKiung+jZxTrxSg1PqAd4fZf+NuIZFgBYbsIASCdYzvq/78JshzOl/Nd0/vjc308wb0vMWiTTXgMDuiTkC13B+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_040922_270069_980FC29F 
X-CRM114-Status: GOOD (  23.26  )
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

On 9/30/20 9:57 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Allow flashes to specify a hook to enable octal DTR mode. Use this hook
> whenever possible to get optimal transfer speeds.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c | 35 +++++++++++++++++++++++++++++++++++
>  drivers/mtd/spi-nor/core.h |  2 ++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 73a26e7e32c2..6b54a923002a 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3068,6 +3068,35 @@ static int spi_nor_init_params(struct spi_nor *nor)
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
> +       ret = nor->params->octal_dtr_enable(nor, enable);

Ideally patch 9/15 and 10/15 should have been before 8/15. We should deny
the access to octal dtr enable for NV flashes since moment 0.

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
> @@ -3107,6 +3136,12 @@ static int spi_nor_init(struct spi_nor *nor)
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
> index 9a33c8d07335..5cfe2db9ee13 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -203,6 +203,7 @@ struct spi_nor_locking_ops {
>   *                      higher index in the array, the higher priority.
>   * @erase_map:         the erase map parsed from the SFDP Sector Map Parameter
>   *                      Table.
> + * @octal_dtr_enable:  enables SPI NOR octal DTR mode.
>   * @quad_enable:       enables SPI NOR quad mode.
>   * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
>   * @convert_addr:      converts an absolute address into something the flash
> @@ -226,6 +227,7 @@ struct spi_nor_flash_parameter {
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
