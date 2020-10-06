Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDABC41604
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 08:11:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35A35206F4
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 08:11:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VhkEXxdk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="wADQLbbg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="VJdQZNm8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35A35206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RJtpMbkmV9zpGSb4ZK7AUJAWq3ElANeskzGtU3qTiHE=; b=VhkEXxdkuLJVYRwiI0XA2llzz
	JXQVNFmE50PGIV+UIqkg0YGqrZLDqm0bZqTo8pTkg4nAs/2xS4P0ekdN61MBmFGjepkWISuzvjFGE
	Ek6rCLmS4YrOYpQbHff42UXV4KmlhM30dwLIUTtsxvJdhp3K/aZRiSwZvlfg9mwq2IkAkjRVb0eNZ
	rD4sCvdqH0LbMfIjNTYnoGU3bYYZSiQMyDF3MhY7OHX86g4lJV0wk48T3SZ3y8Ni7MnGlll28wV8w
	7LJVKTLOxIL4QFeqxoQzVG68fR0KIX1UMAB7lUlVlEmqiZZZC6coRRMzyIqrI2tLOTsQoLD+TrrPf
	wbm7ch5JA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPi43-0005mw-Mn; Tue, 06 Oct 2020 08:11:15 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPi3z-0005la-TO
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 08:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601971871; x=1633507871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=djL6GhEmwb8wgNi6wpvb9RiAuLdm3dwFi5zVdDAu+xI=;
 b=wADQLbbggVdUKP3NhQcdJiMorhuxAwN7g/hnp/mTdisKayLHQSs4VfPq
 krnnTy/H/LCwLJsX13+qWJafM5LtxW1xJoVtZYxiworFqgFNfKx6NEb8V
 KCOVV7JVikbPWXk9+F4cOZFs460vKFVfVxW3IQjIP0Byq7l5M3ksooiHK
 ruWRJhYAZmK/xN4+5kYRUDq4FO3qxMcJ7Je/klVNT3DJQvZ3yzBoP4Bqc
 U4Ou+Tvv4hGa9/Ay/8bQVWtIVMYTjy/BPIEDh1/uozzOdVd3D29n6NvQc
 63seZCHDzwIlWyYodiIJgp1CMUO9JzbABEldEn5f0hlYobO4oRLeAQ4kt Q==;
IronPort-SDR: 90+jzr8O88aqmLnhiM6nWR7vjvRB2BgCmU7KvyIbL7ukEaNdq9Z+YtBX8FwvWkuxAJG7vAZwtD
 oMiXcTmc9RB37qGSlWNqtG12poXATvZhDK8GYG8sNMZjbaqfKuGZyYhxZDkdvBzySrToAgH9hc
 mFUc20sJhZJKFHDDZrYanRJ1ZI8pORG7qgHgheSsC1XwWONJlq+gQ5WMVvuUZcw3jpRS3+Bje6
 GW+xrhoToxGZumhwckkxnUISoxLzKFkXv+2o9c9pvbO6MveEW2RPhQSIBeShnbSUHDqgTzJ/tC
 a4k=
X-IronPort-AV: E=Sophos;i="5.77,342,1596524400"; d="scan'208";a="91575722"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Oct 2020 01:11:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 6 Oct 2020 01:11:08 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 6 Oct 2020 01:10:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hpb3tGreCFZzkE5pUEKztQ5wjeCYtKTLl3Afk/CIHb+kfuI6VNNrjQQ5Z1Pvk5bOVmM0QzcEEnmLy11AQ7DAg2LND7wJLOeeNqyY7gKSvSCpGS4M3kX8IQBNzcrNPV+QiHnooPswVnqBwGWs8Oh2pKcsxYRA58eSGsAkK3Ud6K9dRrPmFTrkWz7PDTYzL5nDwB+pvOVn5EfRGfduC0ZbnchDwV1KQa07DZjJjWK/eKQLtLPzYl4i2O9qKLEr/qfCOMgKdE92BcKtOsVR/gELS5c0YYovaL+dSphVLLJ1MXVKeMduJNfUT/1yVJqWTZHG5Ceus/piCbSshJzl0f9Zxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djL6GhEmwb8wgNi6wpvb9RiAuLdm3dwFi5zVdDAu+xI=;
 b=b7uTtQ/jNiJSScx4WLdXhRrRjozbj6Ww2qa2LEOj8FEA6oYOIoBuULi7BlzRX6kwJpk9QdvnDttJuK1kRkpkvG4shfwwPT+9DFFdBeITpKDK7Wz+fsSSivfpbHocuiHdLgIR1XrAePTpSWAUZpYOuzYNcuNJqBULSahZND8jK4KPiJ93TFBUnqDJxH6rWPiGlk5lDgJPrn2u6MTOepvVOjyPaysNkuy5+5QY+dOgY5HCPt843U5fxewxVYv/GGBx/d1kPZzq2u8QzWJbcVIY9pvX7UscC2ycCGV09st9fiygIEyUusr3S/n9H7dcaprdsX5y5ln9J8rlW4nM8LA1Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djL6GhEmwb8wgNi6wpvb9RiAuLdm3dwFi5zVdDAu+xI=;
 b=VJdQZNm8iHGnZ2ZS3uZW35PkXkIok3RnOe0AeJHFr0xdT9NptebH0tg2AuLeGT0NhnxUxJ7yRXVJ6r8DVm0Iokkdq7Xuy9k1r6+tTB3rR597X3gIy8E5e17GlDJhvqs1VxIltlPZ/glvzrmbv4XTvEb1Duj3wDfX0gRz8atXSe8=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SA0PR11MB4704.namprd11.prod.outlook.com (2603:10b6:806:9b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Tue, 6 Oct
 2020 08:11:05 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::7c1b:6212:7f1e:5c6f%3]) with mapi id 15.20.3433.044; Tue, 6 Oct 2020
 08:11:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v16 15/15] mtd: spi-nor: micron-st: allow using
 MT35XU512ABA in Octal DTR mode
Thread-Topic: [PATCH v16 15/15] mtd: spi-nor: micron-st: allow using
 MT35XU512ABA in Octal DTR mode
Thread-Index: AQHWm7g7N94DWcNSQUS1u+X4I4QuJQ==
Date: Tue, 6 Oct 2020 08:11:05 +0000
Message-ID: <41b8639b-2349-0278-34df-1fc0d29783ae@microchip.com>
References: <20201005153138.6437-1-p.yadav@ti.com>
 <20201005153138.6437-16-p.yadav@ti.com>
In-Reply-To: <20201005153138.6437-16-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d5d5776-bedd-4494-b252-08d869cf5f7f
x-ms-traffictypediagnostic: SA0PR11MB4704:
x-microsoft-antispam-prvs: <SA0PR11MB47040362D19108BB30F034D0F00D0@SA0PR11MB4704.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Fw3fXIHXo72FPxN15NnoO46S0ensDVin+XyGA2uZ38luGBz8FzixwsP6bRQ8T1Gy6nddEzUD6jbbcnV98CxBT9IwueIiOo47B0GM25Wy+vgSNsw0Nrz6XrijTnXyYxj1KFrF7Ukb1hQzLVe/qkoqkPSUXVpH+kNx+/ILl0YVMuDBZj3yQp8pVoZMsOA4rViTGQjrhXdgDaE4m5qx152MKbjz+v0eel/JXwmxxjOfmGdHaz+HIaE6tvoY6lde/wlFx7gF6yOv7CvWG/Niw1Kpv180UwOmYbEp4H14HVmuVSjKKHPeaQTnqVKakwlP8SoVlsJ1YQqtQg60M6HkvtUXjYrK0vVa2i/MpN3KI2VwgkOqJTZO25+k9NUizlKZ6BMo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(71200400001)(31696002)(8936002)(31686004)(86362001)(2906002)(83380400001)(6486002)(66556008)(5660300002)(64756008)(66446008)(66946007)(26005)(186003)(2616005)(76116006)(66476007)(4326008)(110136005)(54906003)(6512007)(316002)(8676002)(478600001)(36756003)(53546011)(6506007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ctVX0D4WZgDFKYFFVF+A2VdLVDhHu0FCMgy1Vpo74RWIw6biPcvOjTirkQL8x6OZU/tsuFKX5q884/zzLO4apsrAxpJvZJ+/b8v8XIRRv00mLi4wRI++Q0IXcnP62rClHkprrXSiNc+UBxy5n9YG4UPgziuEV8W/VuyxzDDYHc0GFzGG8glyla2qt6Qi73fEJIGXT3ky/lctooHNY/N9QXzTO5ziWdclmFwNzMiezmLw16XZDyDxP2UYOh6WdB5NwzIuR6VcmIjGOTxykii54W7qecPTw7xvNf5ECFGiU5hbHKfEzwfFCtqfm9DXxPqOT6HW6C/3HoQAUbdK7UsBTrgzqmyLxmRLakyKmIchG5sR2yiIUXu/iQwU+nYn6pr1PK7qzkcVWagOLti49Omx0WGe262IffjowPRJD+yHsBDq2TNvVqBuga7DLZNQaSSU1REvU97oOaR7Z4Y64xLzxiZ4aolWUThqU61aNk6/jxD1gJZ2dn+X3ufzzS/zS8jPfOAVcO8XRvxM33fXUY4VqNylsGbFJTSn76Nb/FsHkkDG0v1e6aprv8vAyFN/JJq6bMaLUzalZ79+oxTlW/jrsQSVv0YLErZ5qEgpQYIpCBCbhGGlljZBpiSFdD9FhyIqAVhWtbQPX6VzkqzZalGxAA==
x-ms-exchange-transport-forked: True
Content-ID: <ABF4F9B82A142A4C80E6E74E02289CC5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5d5776-bedd-4494-b252-08d869cf5f7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 08:11:05.0811 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yifrnxyruTXtDyHhlMuB272X7CP/B//EOWl8joSkSvirfIA35ncFD/dYw6H3cs6eUC4iN1+6/7EGQbuVYV/8lUmBHOWA+6LEdawju+2xj0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4704
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_041112_290429_263F346D 
X-CRM114-Status: GOOD (  25.83  )
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
> Since this flash doesn't have a Profile 1.0 table, the Octal DTR
> capabilities are enabled in the post SFDP fixup, along with the 8D-8D-8D
> fast read settings.
> 
> Enable Octal DTR mode with 20 dummy cycles to allow running at the
> maximum supported frequency of 200Mhz.
> 
> The flash supports the soft reset sequence. So, add the flag in the
> flash's info.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/spi-nor/micron-st.c | 115 +++++++++++++++++++++++++++++++-
>  1 file changed, 114 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
> index ef3695080710..c224e59820a1 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -8,10 +8,123 @@
> 
>  #include "core.h"
> 
> +#define SPINOR_OP_MT_DTR_RD    0xfd    /* Fast Read opcode in DTR mode */
> +#define SPINOR_OP_MT_RD_ANY_REG        0x85    /* Read volatile register */
> +#define SPINOR_OP_MT_WR_ANY_REG        0x81    /* Write volatile register */
> +#define SPINOR_REG_MT_CFR0V    0x00    /* For setting octal DTR mode */
> +#define SPINOR_REG_MT_CFR1V    0x01    /* For setting dummy cycles */
> +#define SPINOR_MT_OCT_DTR      0xe7    /* Enable Octal DTR. */
> +#define SPINOR_MT_EXSPI                0xff    /* Enable Extended SPI (default) */
> +
> +static int spi_nor_micron_octal_dtr_enable(struct spi_nor *nor, bool enable)
> +{
> +       struct spi_mem_op op;
> +       u8 *buf = nor->bouncebuf;
> +       int ret;
> +
> +       if (enable) {
> +               /* Use 20 dummy cycles for memory array reads. */
> +               ret = spi_nor_write_enable(nor);
> +               if (ret)
> +                       return ret;
> +
> +               *buf = 20;
> +               op = (struct spi_mem_op)
> +                       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
> +                                  SPI_MEM_OP_ADDR(3, SPINOR_REG_MT_CFR1V, 1),
> +                                  SPI_MEM_OP_NO_DUMMY,
> +                                  SPI_MEM_OP_DATA_OUT(1, buf, 1));
> +
> +               ret = spi_mem_exec_op(nor->spimem, &op);
> +               if (ret)
> +                       return ret;
> +
> +               ret = spi_nor_wait_till_ready(nor);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret = spi_nor_write_enable(nor);
> +       if (ret)
> +               return ret;
> +
> +       if (enable)
> +               *buf = SPINOR_MT_OCT_DTR;
> +       else
> +               *buf = SPINOR_MT_EXSPI;
> +
> +       op = (struct spi_mem_op)
> +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_MT_WR_ANY_REG, 1),
> +                          SPI_MEM_OP_ADDR(enable ? 3 : 4,
> +                                          SPINOR_REG_MT_CFR0V, 1),
> +                          SPI_MEM_OP_NO_DUMMY,
> +                          SPI_MEM_OP_DATA_OUT(1, buf, 1));
> +
> +       if (!enable)
> +               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +
> +       ret = spi_mem_exec_op(nor->spimem, &op);
> +       if (ret)
> +               return ret;
> +
> +       /* Read flash ID to make sure the switch was successful. */
> +       op = (struct spi_mem_op)
> +               SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDID, 1),
> +                          SPI_MEM_OP_NO_ADDR,
> +                          SPI_MEM_OP_DUMMY(enable ? 8 : 0, 1),
> +                          SPI_MEM_OP_DATA_IN(round_up(nor->info->id_len, 2),
> +                                             buf, 1));
> +
> +       if (enable)
> +               spi_nor_spimem_setup_op(nor, &op, SNOR_PROTO_8_8_8_DTR);
> +
> +       ret = spi_mem_exec_op(nor->spimem, &op);
> +       if (ret)
> +               return ret;
> +
> +       if (memcmp(buf, nor->info->id, nor->info->id_len))
> +               return -EINVAL;
> +
> +       return 0;
> +}
> +
> +static void mt35xu512aba_default_init(struct spi_nor *nor)
> +{
> +       nor->params->octal_dtr_enable = spi_nor_micron_octal_dtr_enable;
> +}
> +
> +static void mt35xu512aba_post_sfdp_fixup(struct spi_nor *nor)
> +{
> +       /* Set the Fast Read settings. */
> +       nor->params->hwcaps.mask |= SNOR_HWCAPS_READ_8_8_8_DTR;
> +       spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
> +                                 0, 20, SPINOR_OP_MT_DTR_RD,
> +                                 SNOR_PROTO_8_8_8_DTR);
> +
> +       nor->cmd_ext_type = SPI_NOR_EXT_REPEAT;
> +       nor->params->rdsr_dummy = 8;
> +       nor->params->rdsr_addr_nbytes = 0;
> +
> +       /*
> +        * The BFPT quad enable field is set to a reserved value so the quad
> +        * enable function is ignored by spi_nor_parse_bfpt(). Make sure we
> +        * disable it.
> +        */
> +       nor->params->quad_enable = NULL;
> +}
> +
> +static struct spi_nor_fixups mt35xu512aba_fixups = {
> +       .default_init = mt35xu512aba_default_init,
> +       .post_sfdp = mt35xu512aba_post_sfdp_fixup,
> +};
> +
>  static const struct flash_info micron_parts[] = {
>         { "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
>                                SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> -                              SPI_NOR_4B_OPCODES) },
> +                              SPI_NOR_4B_OPCODES | SPI_NOR_OCTAL_DTR_READ |
> +                              SPI_NOR_OCTAL_DTR_PP |
> +                              SPI_NOR_IO_MODE_EN_VOLATILE)
> +         .fixups = &mt35xu512aba_fixups},
>         { "mt35xu02g", INFO(0x2c5b1c, 0, 128 * 1024, 2048,
>                             SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
>                             SPI_NOR_4B_OPCODES) },
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
