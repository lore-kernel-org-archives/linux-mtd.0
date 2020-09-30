Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B1AC2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:52:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA0C22075F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 07:52:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oh2TeEBi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="M+xkaTlq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="B1zo3aTF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA0C22075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+6OkyDZ1RZeml259TJ6x5VRCVievc3iw3NsJqJMyZwM=; b=Oh2TeEBigOS6eIdtO0Uzanpfw
	xVLUFodOM2vcK8MU+W7Yc10MWWgtrad0mIDhSy7QbW28I0AfNF9DE6cMcO98gjUhb+CpQCKu/WXUe
	npcuG/6kYk3phU9Y/sIxlQF4c1wQRBrLeGcK12A9Jxc3m4tttvYI81QEew8qceYJ1mM2kYbEfioUr
	RX5C5PV9ywiLLWUcL6YVANO1udnAMltpzEh9sRk/34RYmWzjyMsnWsNO1Xw6e6A/lO+L5SJrlvIDl
	sUWMVaS1j0VYkEd/jU911cHVIlbo5MTpGpK8gf/bsuIhcJpAIPa08LubL0RvcCAx/mu4Qr3IToCv8
	1uoZl2QGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWtr-00060C-Ka; Wed, 30 Sep 2020 07:51:43 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWto-0005y0-U2
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 07:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601452300; x=1632988300;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZAjli6RJSPscFkZUAzuDpLjDdXPQTsrWnUM+VQjgggU=;
 b=M+xkaTlqL0V1Z7sF7bvvzlIRrdYmPvmQTN+NiyxKdn1oFfM6Lwx4NU6I
 rCmVhEMsEd+J+0l9e0KrlcPZ9Jc19czNjEcrpC3mSFJgk2S93YDpKsNoD
 wGGO9nlITnHCnEoAc4Ulk4mBz+chCCGPn1VTr0JOycoHDojjZFuREGydF
 5j25QJwY6PeuBBz+W/F63iEnr+sHMAbHmtyKT7gj0c9zujZbTj5jXTfAZ
 HT6EKEuM0sHMl1LuB+1SWWMKbSPptBjLNpdCYuIHiPIsb256bWSNwdPGK
 +ejA+0tyGsjPwQbYhIv58Vt12Rf0KOSn8GuYqGnmPz/3rFhwgBCExILW0 w==;
IronPort-SDR: EyF74EnMl7M4LgizkIWVdDtKWqHIReAAePCtYw8fx+QDSGRxJyqoTb1YEokn/cPNANmhAHuoHf
 o5/RQh1EPx9IPjiWj/UmsYEQamAjJp1gT9ka173wB7hRaidsLRiQo4hTkEdjcSwOjiGnODCPNN
 NTD2TCE9DHADBgqBswDB9r+Ue+rLtJRS3JvfXHQmEwZVv8ijMGlW2qjAkhg4WYOgh56buHjaWo
 UWh2bpgLRvTlBQcvNkvRPwfrWgcZKCs5gDKTeJB/Zs3Lx5gqhgG7D0/EJXyjEQYmI74zs9F/sQ
 bFY=
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="28191639"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Sep 2020 00:51:39 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 30 Sep 2020 00:51:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 30 Sep 2020 00:51:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P63+iR61rmr9feKrRAEzfZjDRa/4/Pxofjdnp10k4PxUef861H5LV3h4o76G3SLrCUHFtxv0xabm8jCwg7xsXzQCe+EBmxeMI8yeIl/u816aOgv7Po0yLdj2UCmrqCVJ7eB8T5y8kZUoklEGc6n0FslALXtSoFA985QtyRqCwMpk21sbzQCIJK5njavgt1H/Ba/1bMge+Oflg+4Iccp/NcDSU0cUphIepyMe1BfZGt61e5rkpba2Fo2Jf4HI4yprcQw0SGfKOIe9hIz11qjq6T4+dKRp9tyOV+gopfuiT1apGpnix2Mpn8IsvISFBW0aWzbUAciHy1gcFCtBxZPmfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAjli6RJSPscFkZUAzuDpLjDdXPQTsrWnUM+VQjgggU=;
 b=kdfeRixH/tcT5koax2MC3albCdqEexSi5lvFXMlUAaXHmquEp/lrF+QIO1Q2FUu5yc9sp1MJXbzHOiuk0PwCQNP1x3W3oiCiFctMBE/enmH/Qyxmc0707lXIf5UoX4wCdUHg6KnBiBuHdWIRCoj0FGPZK/TEY1onnJSof6OFAexE0RzafIkWYJ18fq4EkvlXtQRullaaZtP2p9RIHBlCZr4TZ6nuzqvbxn6zbH1X1jOlhxJKyaD9FrXXxdX7Yeqiln2B8lYwK4lcLUYMH6Gr0U/aGoMCmg1UCfRmDmgPv8iThJm9z3TWZ3tyS56sqC5GZ33b8AgyjMFBkuD+M/OJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAjli6RJSPscFkZUAzuDpLjDdXPQTsrWnUM+VQjgggU=;
 b=B1zo3aTFZK9+bVcXMyawm71X01sHZz84z8EcMm6yIt9rlO07/fiSMeCFlxAYrgeIc7gtStlTeyUh56Dzf8QtSW2CTzBxbtFgc+wmfBYyQsfue96zUSdIbjvaj/5xephPXSxCF/oFwJeS6nobL7QrPLJX1gISMwRDYUmXachcgiY=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (10.175.91.12) by
 DM6PR11MB2650.namprd11.prod.outlook.com (20.176.98.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Wed, 30 Sep 2020 07:51:37 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 07:51:37 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 13/15] mtd: spi-nor: core: expose
 spi_nor_default_setup() in core.h
Thread-Topic: [PATCH v13 13/15] mtd: spi-nor: core: expose
 spi_nor_default_setup() in core.h
Thread-Index: AQHWlv6Gc8Ir4MjTDkiKaIPwKqe4Ew==
Date: Wed, 30 Sep 2020 07:51:37 +0000
Message-ID: <ef62bf4e-1b2c-aa3e-39b7-fd8d118e582d@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-14-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-14-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [5.13.1.187]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8aab031-89e8-4bf0-97c3-08d86515a901
x-ms-traffictypediagnostic: DM6PR11MB2650:
x-microsoft-antispam-prvs: <DM6PR11MB2650108AC37460BD8D6FC235F0330@DM6PR11MB2650.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +GgR61jbGE6kmT2M8EjrS8iXaqq5OGUYLfyAqiwEXL6yn5VXB1oJZH+zeQxexJZ7a+CwmZDIGs7QoQaNLwFc1W0av9YWOniXDfcZdKK+kjBjt2xyG6zKhUB72YOHsST/hkEBOB8C1TG+TNXo4qv1zS0JsUx0AXXLnL62hUcGxMzEKV21CM6ueaS33p+wyWt/L2EdT3N1fGABrDmA1t5hxHY9iIIuqv1oWuEw2UYnsgdut+e7ir1sR0I1d+VPZoeP7CPNj5VIps1mdhTHYzWUc5e3h+3gs+pfWre8riWGg3OvlhMh7Me8Tzt0TXQ+tlvoa4nwOxvlOO+cucM5+n9HWilZs17bLsHyayom/xZJukX1rMXbUog8lSHJ47MeyGW8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(376002)(39860400002)(136003)(366004)(110136005)(316002)(86362001)(54906003)(478600001)(76116006)(91956017)(66946007)(71200400001)(66446008)(64756008)(66556008)(66476007)(6506007)(26005)(36756003)(186003)(53546011)(5660300002)(2906002)(8676002)(4326008)(31696002)(6512007)(2616005)(6486002)(8936002)(31686004)(83380400001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: QYyIw0i9DUoiQMjHcTvzHYotHyekF5AM4KyJNYJjS5Fi8B0O1WEIPBdXivVShRfv/xunesT/5vY1JeE1K/M/wkZsz2lS3BXfiTMiuDv6jfLCa8dkmevs6B6LpyfW1REM6Oy0o8Sng/tjhSOjt+Vs4gBEA2rGN+sc9IJKeFFlt2bLmdaUTU3GjnryKsSdbv0DKj+RpatBPJ5VYds2yBSJbSMMIsuUynvtZDJQy4Ra44nI/4BEIcDyDafL/++aXS2j5OV/MjFMewutAxbyV1wyx8HsGecdUu2wzIyndyrqKWyWDrYfOhkZryYiR+mcQGbjVxZlQa+iwC93qf1xZzU50hxyI26eMzWPSgPR6bk+7S5uT8IbRv/vyZULBxKS9IzskBY7E0xCNzRWOINqR2PBFaZhv1/E/JXpmWbw8LPYpV06NoQuOS5nKeKJ6y0h4Y9ffbYTaim8Zy4wALQpB+kmkR1EMWi67wJj3Xvn++Ft3BVJrgkL3vZroq48mYP9nYqBzTARq+UEw/ux9iacboDe1SJYJOk9QSYn+1xUWBgeXPgmhom5dFpgONGxqn7PcWR6I2l7nHHOi/yhfDSicgkiL2FWWMHklT8LamTFMHiBqUtlN7OB/0sIgHbWjj68JZuJY1dutrgei301M/5o4GMuqg==
x-ms-exchange-transport-forked: True
Content-ID: <6A07D6BE49333240B4F98E6332ED62C6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8aab031-89e8-4bf0-97c3-08d86515a901
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 07:51:37.5328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rb3oSyJ67whgwvLPdXCVA53iyeUwjNHmg5KxD0cyyvTELKswCnCHe0vDhDrs+R8hNeAtHNp9BuFdFlMwnkmmOtKqj+rHg/CR+r8Bj3AQAPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2650
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_035141_116225_66CEA853 
X-CRM114-Status: GOOD (  21.66  )
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

On 9/16/20 3:44 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> Flashes might want to add a custom setup hook to configure the flash in
> the proper mode for operation. But after that, they would still want to
> run the default setup hook because it selects the read, program, and
> erase operations. Since there is little point in repeating all that
> code, expose the spi_nor_default_setup() in core.h to
> manufacturer-specific files.

But you don't use it in the following patches. Can we drop this one for now?
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c | 4 ++--
>  drivers/mtd/spi-nor/core.h | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index d5c92c9c7307..34edfcf33172 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2759,8 +2759,8 @@ static int spi_nor_select_erase(struct spi_nor *nor)
>         return 0;
>  }
> 
> -static int spi_nor_default_setup(struct spi_nor *nor,
> -                                const struct spi_nor_hwcaps *hwcaps)
> +int spi_nor_default_setup(struct spi_nor *nor,
> +                         const struct spi_nor_hwcaps *hwcaps)
>  {
>         struct spi_nor_flash_parameter *params = nor->params;
>         u32 ignored_mask, shared_mask;
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index e2c7324d997e..10dc03506f93 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -453,6 +453,9 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>                              const struct sfdp_bfpt *bfpt,
>                              struct spi_nor_flash_parameter *params);
> 
> +int spi_nor_default_setup(struct spi_nor *nor,
> +                         const struct spi_nor_hwcaps *hwcaps);
> +
>  static struct spi_nor __maybe_unused *mtd_to_spi_nor(struct mtd_info *mtd)
>  {
>         return mtd->priv;
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
