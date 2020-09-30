Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC52C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:17:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E28B5206A5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:17:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bC4ycmhy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="FoKzn2tA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="l50mPkLx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E28B5206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mlJbZOO0vYv3eeF9paRdcJUksz5aQOA5ckiwF6hRHCA=; b=bC4ycmhyYpFjFlZpDSR/AwL+a
	fMy4ootb8K41KB9CFuF+uYrTU4BkGwHCFasolEKMeG/LLAA1tcpR8ZW0VBFYnO//7+cQio4h8Hkxs
	NbBwUNgPCOj+gb2fdKvWskGkKczepa/HT/10CY75j/BvmaJ4g+UggWI9KL7KNFX1fh1KqDsi1RtXB
	DBK/bWC/3KpLxKamtA+UjqYOOBXn8cJiQMapEIOawWHb3/fT/wAEmXvPeZzA0lien0qefa0Hli86b
	K68qa1KDF+ulKAjuVIninbZ8zf5VielHEDxqe+D5hQNb4dGdHghIo6Ko8zTLqBgFvVDUdIoA4mRq9
	KoBSniL6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNVQN-0000o3-2R; Wed, 30 Sep 2020 06:17:11 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNVQJ-0000m8-HJ
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 06:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601446627; x=1632982627;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=h2dqXd+6+GhMdKUZmlFiHQKroTtaKxnoNCqqny0u5y0=;
 b=FoKzn2tATTESExjahBvKkuRzugoop39pqk18FpBf91OlUvFAJ4IXtlQh
 OA5SZP9ds3YIZWfxzhsqh7geL1OfMlwoTVnTzJqatJ6HMZXU78URcQ/06
 Ay7H/0AMQLhdgqR7JkWyMUBfOzC3UM8Ac3+xAmWrUJT8RDAbZX4Zlc3gI
 RRx/1P/hyjGkitCVJXHkYfaO2YUnj9ZDwarhgoFWkQuUlY7erSHjot8n2
 D1nmsGON8n8SpmoYg7OY7RE4mhRwR9AvIRdjfbr4YdHJ8qNKP9R0vSaeU
 n8AmOtyO2ClfpTpBmCf8OQamtBM7lpGXl/rLDR+4pzunRoytrgB3idKvu g==;
IronPort-SDR: c59upbEy+1vNHWArxoWS2UqZcx52EX2FhEXgoZtSgf/dkiP6mPXsU289edjzH5Kg4EWcfnUq9D
 IB47aBmy6iGIHsjzM1zIYT56x0nje12dnR+uWa7acNUEQqjXyKEU+BjcfhRPAPxw2URvIkAYJ1
 mSyWRa14SXrKO/UBXzX+t4+U5UbJfQYJ7q7UuAWTe5ogdLQQjeY0rR11MT7UeVYBawss3laTVl
 aWSPOyM9DZ0GXlVH1nE03YCutGBVffj7r2QVZ+3dgDTvuP+jI4UUp9RZjlkRH53ATiBDwtpSuW
 xUY=
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="88626517"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 23:17:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 23:16:49 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Tue, 29 Sep 2020 23:17:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R08/SGk62tzwbOTgic4ALFXH6ucBuoslBSBYKWGcBwQOSKSOWFvfbLuW+M97LWtCYnnFzsW+HZxe9b7b11Eq9lC8JjidO6BqggqNNamwoI/T7Pupv2koF3wlwBGSEfdrFDEKunm1MiRIpZwmPosh4tOSay3IWaAqo/skbvhY2wt+3aCEmpucg1sOq81hMrR8lmXp7s7zhcmawFI7LqDm81CeZtIExvTvrXkPPhO7ma6kWAr4c543fD6QW7ulqxvXrDXC1k3czBu2n5CBk2ezyDHOKiLK9ugsLcich4uDb3OpAxigNFtH6W33ezckSCyhSRuU0CQeIXDgVIsvBc/NZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2dqXd+6+GhMdKUZmlFiHQKroTtaKxnoNCqqny0u5y0=;
 b=im6VvTx/3hgBQ2u5AcwwViIdYDVqV1p8egxZho1lQswZfrsb1WR0l+Zqf6QNk3Lzwm8+a/73RNuPTf+ye2aTs3cLsrBM8EeQjMMp+c7RM/r3fD0b5kNdbbj9r+kRPrmsATB3SXLG3tCXbobtadl2TILAHJrA7v2zZW8XqkprQRDVjP04OWh82zhp+6tizjy4NDtcOqmF7/uUUGgi5KPWzPUyFZqZX9qHZsThUN/VMGQrF6WA0FNgXVZtSW9LRUABEymiSVZGnsgyCEcYooz01HHQVpi/68IqnOtblDdWNEUgDAxA3URrUwwHcrTTLxsyrAxCBtrKCDv06Uf1s4km0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2dqXd+6+GhMdKUZmlFiHQKroTtaKxnoNCqqny0u5y0=;
 b=l50mPkLxABVJPtlMfriZzWcaokxzGi71bMg/adFM7oFVgzNWbZU/Q2wgkuTEmie9ZixKzvyZ2AR+HipUg6CsWXzKRH9y1Fh6NVKUUz10TkFpOdYlSVyp08ueltfZEvKbzZJc/6DTNmkoYnnZ7UTS2OiMkeY6KfBqQLittBVd7hs=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB1946.namprd11.prod.outlook.com (2603:10b6:3:10c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Wed, 30 Sep
 2020 06:17:02 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 06:17:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 05/15] mtd: spi-nor: sfdp: get command opcode
 extension type from BFPT
Thread-Topic: [PATCH v13 05/15] mtd: spi-nor: sfdp: get command opcode
 extension type from BFPT
Thread-Index: AQHWlvFPRAFvCXk6P0+9D5vQWa5FOg==
Date: Wed, 30 Sep 2020 06:17:01 +0000
Message-ID: <db90b212-cbf9-a675-024d-11a4969b9a6b@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-6-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-6-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 59f07913-fa0a-45d7-0c00-08d86508720c
x-ms-traffictypediagnostic: DM5PR11MB1946:
x-microsoft-antispam-prvs: <DM5PR11MB1946C513BED5F90D411FE471F0330@DM5PR11MB1946.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L0nHXuX6UsgYVPtbJlTRGSEl1ib3KfSmuUx1CmS05SIvKu82ZK8WBbH5w02tdybtnRgzlT7Ge9UkFY0ox5MReEcqTvfbv9Nz7yfGALVpukGe4cxitv8fD07rtLu57Yefkj0AcZ4LHI61GMUP1gEi298+M3bZF9pgKWOSU5A0oTMw7//v4GUA7AHwq3rhnklrxtLF0LlvLqWiopAO2gcgS3DwFhLeZLIlF+ifwAiP4T7ZOnru9pNY1fBET9Kg+jvLfqzJ+BS2ZRP0vRvfmySarGqExZvkJtY7M6QiXEP9OWenskGqbZ285+33Ou4CiYBVKVNjj37IzknZozI3qLYCfcIYZS3HpvFHOcvjvAt78v3tVzipsp87FR9+AP8YlulJS0PLAIyAhBFAM5Wgd6sZN4ZWH5jMJcyLYJxFo34IcyUWUrMhXBOOmfUX0lYTacpn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39860400002)(396003)(346002)(136003)(376002)(8936002)(2906002)(71200400001)(4326008)(6486002)(86362001)(26005)(186003)(31696002)(53546011)(6506007)(2616005)(8676002)(478600001)(5660300002)(6512007)(316002)(36756003)(31686004)(91956017)(110136005)(66556008)(76116006)(54906003)(66476007)(66446008)(64756008)(66946007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: /KHjwtnR11HX+DLvAEIME0l1N6VW88vJkTUrQyfQ/KCg2dXneW4Zq7RH3ApZ+sV4zkEpY3rqBE4OvJhMe+OssHmbE2O2jP9aT14pFXbeYcUQ2qq204lw6tFBr+FZk1oJeKapVKsIulZG4vNKAQFfdSZvd0Z/fjBRwqsS5k94uJfySwg2t6VVE5zuJdItlyy4I48RGKhjfZRZczsDPOVS5vpYtpNl4VvgCYCq1dZLYdYHd4U+y2+oGIDF7sYbpvu3u5Td1e1P9PMXHukgck4FMHboo5Tr30v9I1KxttNN4+vm6XRGsHxJOFE+IJ3CW+E5R1lvO8/GFXf3u6Wlv1CTsy5wiaXiMams/YqL0LZSxTTUA3zDrtQLIfelQ4Q9EL9IeL6hRqX9+ZIAOQxJSoR3FbicO4/aDhwerFngBqkJoJ3ulemIVu0gQGbTZA7fO5m+H2856Y6pRSHuyk0bkeN1G1okhIffEDD82C/6UrcPBTCxC8sTWjpjWu8n8gZrlEfYFkh1UDE2N5AunsxxWkujYJmi6gLfHlw+E9Vt8CuRqh6kUwhtpV1A5ejRCgB9Ylnhgs1usoD364z7rzO/+A359N2ghEe0ugc1QBVaKxfCop7Zm2ck2N9z58wlDZXN5aBvFh5Ekx86X2gCC5y9MCwFRA==
x-ms-exchange-transport-forked: True
Content-ID: <BEC2888EC55E9B4FAF5B781BB72F0150@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f07913-fa0a-45d7-0c00-08d86508720c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 06:17:01.9041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xMdqz5aYBywd5QOZmITgKP3og6GVuPxzGKGdqMqVmaAIH1kLNjyy0Z0fcYq6r8qop2E2E/1Wg4xkJQ0jrdGfqrEVScT2Unc1twZRFkAMHL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1946
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_021707_932561_4F6D9B4D 
X-CRM114-Status: GOOD (  20.28  )
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
> Some devices in DTR mode expect an extra command byte called the
> extension. The extension can either be same as the opcode, bitwise
> inverse of the opcode, or another additional byte forming a 16-byte
> opcode. Get the extension type from the BFPT. For now, only flashes with
> "repeat" and "inverse" extensions are supported.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/sfdp.c | 18 ++++++++++++++++++
>  drivers/mtd/spi-nor/sfdp.h |  6 ++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 21fa9ab78eae..c77655968f80 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -606,6 +606,24 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>         if (bfpt_header->length == BFPT_DWORD_MAX_JESD216B)
>                 return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt,
>                                                 params);
> +       /* 8D-8D-8D command extension. */
> +       switch (bfpt.dwords[BFPT_DWORD(18)] & BFPT_DWORD18_CMD_EXT_MASK) {
> +       case BFPT_DWORD18_CMD_EXT_REP:
> +               nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
> +               break;
> +
> +       case BFPT_DWORD18_CMD_EXT_INV:
> +               nor->cmd_ext_type = SPI_NOR_EXT_INVERT;
> +               break;
> +
> +       case BFPT_DWORD18_CMD_EXT_RES:
> +               dev_dbg(nor->dev, "Reserved command extension used\n");
> +               break;
> +
> +       case BFPT_DWORD18_CMD_EXT_16B:
> +               dev_dbg(nor->dev, "16-bit opcodes not supported\n");
> +               return -EOPNOTSUPP;
> +       }
> 
>         return spi_nor_post_bfpt_fixups(nor, bfpt_header, &bfpt, params);
>  }
> diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
> index 7f9846b3a1ad..6d7243067252 100644
> --- a/drivers/mtd/spi-nor/sfdp.h
> +++ b/drivers/mtd/spi-nor/sfdp.h
> @@ -90,6 +90,12 @@ struct sfdp_bfpt {
>  #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD                (0x4UL << 20)
>  #define BFPT_DWORD15_QER_SR2_BIT1              (0x5UL << 20) /* Spansion */
> 
> +#define BFPT_DWORD18_CMD_EXT_MASK              GENMASK(30, 29)
> +#define BFPT_DWORD18_CMD_EXT_REP               (0x0UL << 29) /* Repeat */
> +#define BFPT_DWORD18_CMD_EXT_INV               (0x1UL << 29) /* Invert */
> +#define BFPT_DWORD18_CMD_EXT_RES               (0x2UL << 29) /* Reserved */
> +#define BFPT_DWORD18_CMD_EXT_16B               (0x3UL << 29) /* 16-bit opcode */
> +
>  struct sfdp_parameter_header {
>         u8              id_lsb;
>         u8              minor;
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
