Return-Path: <SRS0=+4Px=DI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DACC4727C
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:20:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB0621481
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Oct 2020 07:20:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1f9H4oWZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="tbi0pUQ1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="iywb+YE6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DB0621481
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5eqDXrajqqhOUKlgdUrjuM9nwy7EwUHrj7PYXEwa8Pw=; b=1f9H4oWZsddYorXMv3llYu2gz
	DPooDwWNH+v9EM5cKeehw+435eiXyD6yiulCJQAN7Phz+C8rb7c5EnljMDOf72x2oWBS78bzRSqq6
	7C0H4PnA1QKPCf0nmlUFr66TZIJCZznDfzqGLYufJa56Y5iOfH030NIs3BWFAreaskX2pvXsAb6A+
	7C4AIVPDJwvd0Pj2CFet+v3pdx65g049GILvWWGlnb1KjCSNZ2z9241uw6FrOJdPOe+7j9iMTj9hr
	6T+3znNNQNenT3eH9UrVpK5U+CoGVUoEiNbrcfrRw8GkGCIrZjCdT02O+wwh1H50K4ZnoRExCJPjt
	rZ7FL0saA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNss7-0006FE-1c; Thu, 01 Oct 2020 07:19:23 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNss4-0006EP-GM
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2020 07:19:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601536760; x=1633072760;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=FTvQXOEm+3en4rfo4hjRt/QTRhkkLLW/SsfIK6VzuKw=;
 b=tbi0pUQ1YBbflW/mpQe0B7OAXcMieQR7efHSUOnClUKy/8e4S3O8Kzo6
 AfPR4t9ISejYdH3sga8c+qUQxO73VaVwKLkaZOk8eUewISQHvL63n4EP0
 B56rCde63xaHJ00zTqIBXWiMaYAau3Q8n/gU6e+npgzDQ5MdgIjt97dKq
 DQHhQtINJL/JWMvEO4w5Dm4BgU2mlSFn7FVerC8Rralk71NTcmkNpC5+E
 0pyrruaAC6/ozZd7Td8StQqTiQjegjQLJ28IWFfzRyouzFthiNLtFyKj4
 UnCEfLMrulYard8rvWKf15tV2J80nnBsyjM4XYXFsVUnd5OFpbElohtIQ w==;
IronPort-SDR: 4pRCL+p++3+x5YPbPOOvvk5LhOxZWGZgGJVY74WC5KEG7e4N77xuBRmskcSge7BEvQ/nkwbXk0
 LKCqm7qqW8ujQyMj5fA84K5g5gQ0deXeSJl5YgcCJAgnYsNmaTWHSiUS8aGFyBGkKaoRWeQCvh
 bFJB4zWyf/nnZCyZUjgAQF0nx7RCK/QqtnrjOJe45B4plAkNPv9dBzEVGCFibM9VUDRmVEKT42
 sp3oE2EPNHdE0vVYE573cEpY/10igVgK0oA+y0GlWXdeX1Buk8awo4t2vxxP/b9PSEFpeH7fmS
 kBQ=
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="97872166"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Oct 2020 00:19:16 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 1 Oct 2020 00:18:52 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Thu, 1 Oct 2020 00:18:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4OP8Zs80uH1tXM0MJ0NFXIZFvISWcoG6GgAGMIR25F8Qb6KWk9blwzF0Nj/3iCJNeoBx8WNGNlWAwFGlxdtwv7EXPaFtkbOAg9sh5E7Ramng/KZKdagZZ90JdG7LLl1tsAWyXQlYarBkeylcsvo0iJN5+QDJPFn/sIOk3J5ORt9YmuV74bPZQPeLAk/CyK2j1ON71Bff15KbdPLJkxHuIxKsSwPISiCeKg2YbrSnz/+Gd4cdbXyvyjNnx8Lj5i4ulevKuBGZ6X8h8DuIYT7CmcKiGwS+AKVQ/nu64GjxtyO5BA9M/ROB2iv+Pq9dopgmCT9FFwlRuu/DJjW31iarQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTvQXOEm+3en4rfo4hjRt/QTRhkkLLW/SsfIK6VzuKw=;
 b=CkX5A1mPHoQtscjnXMtxkh8Dx/qvfC2A7UEE3YeR40DzEITMoC/zj13GqWJjkSep+eHEp6NgVQwzdPYoouZOcv7Ov4Cp65ALBA4uBf+9NUtxx5J/YfW5z3/Y0lMHv7Vs3oJUPyG+25ufZ0htf28+Suu/Ff8FX94bYOkk3VymFlUCkpDPrJseVCyocdRuSQEz3a7tV7mT8alOt1NXN/cQxk9VQ/Pn9sL97KhqB2KmIovm2cNrsLQO2PHKQUka8i14GhhKDQEn1vVoT3gxoJbjqkgoIp50hoOOdgtK2CI6VtC4QRuaMi99GJnI0tBFUSA18L6CQ5n6yo7uHOrnohqB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTvQXOEm+3en4rfo4hjRt/QTRhkkLLW/SsfIK6VzuKw=;
 b=iywb+YE6ymDQ8Qw9OIKbyM+/8zzNHFSSoACoGSTRZ4W3PioWfx6BqCTljU/uvRELVkvDkOGMMPxTMXT8j4QHg+IvCQv/fFYHMtcgxFcokeueEgv+tvPk5bjbyod0LufvDlHmyD2AzU8qz6LE+FbaZhu4GpkwQ7isX02X2DAEQNk=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM6PR11MB4442.namprd11.prod.outlook.com (2603:10b6:5:1d9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.26; Thu, 1 Oct
 2020 07:19:14 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Thu, 1 Oct 2020
 07:19:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 01/15] mtd: spi-nor: core: use EOPNOTSUPP instead of
 ENOTSUPP
Thread-Topic: [PATCH v14 01/15] mtd: spi-nor: core: use EOPNOTSUPP instead of
 ENOTSUPP
Thread-Index: AQHWl8Mq03c/QD6Sr0Oo7ADJT92UwQ==
Date: Thu, 1 Oct 2020 07:19:14 +0000
Message-ID: <5340adf5-1bb2-1eff-3812-6976b3b76faf@microchip.com>
References: <20200930185732.6201-1-p.yadav@ti.com>
 <20200930185732.6201-2-p.yadav@ti.com>
In-Reply-To: <20200930185732.6201-2-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: fd5a05d1-85fc-4587-f578-08d865da4d5c
x-ms-traffictypediagnostic: DM6PR11MB4442:
x-microsoft-antispam-prvs: <DM6PR11MB4442ADEBA83E7FB02CD214F6F0300@DM6PR11MB4442.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J14ADsPLw4MG0awKNGyyyvQJ1/81sta+QBsW0dBp42y0VesSu57ZTlnKNWrsYxVPjvOEYIg7Vx/qX06K38OnLlTqo0rj4JQ9I7z9rZ8CYPNMBDNORVsUCFTU+p8vy4GRHHnlAJWxIqokRDO5ZqoI5Bl3JOs9Od0gWqMapFnKOImJ4BbyktrLN/1P2WzkJGYMBBOwcPZAE42t49gs2sJXJ4zuyNbj6MCTbL4hQVwm7O1lhoXRJpkmg7mEbgint5q/IRhwjPxLTJKfp0hCifuHJRDOz39ADFLM5sxxU7+s+04DR5n55kN+dbnHyD6ge9ELl51cyz7N5oOsm3rDyKWBSbq5XOZmf4bi5YihxBQ/RjeNGesJ2GZ5kXoUQ4W9+c3CcW2O1JTN48g4pFGGn3BN4ZCwmuEc7WEDC31mlQHpOX4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(316002)(110136005)(6486002)(6512007)(5660300002)(4326008)(54906003)(66946007)(31696002)(64756008)(66476007)(36756003)(53546011)(2906002)(26005)(186003)(6506007)(66446008)(66556008)(83380400001)(71200400001)(8676002)(86362001)(2616005)(91956017)(76116006)(31686004)(478600001)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 0HTquFx2ZlIReQucKU7aS/xTMsNVEe0rmkJpsNGj6L0Rqic3qBEz/kvFxETx81wGgcjP0ZmVUWb7E0FZP3H90/N8PESCCmZbCHxc81fdTJvP3D9xk/LNn8BZgZDuUbGRO/w+9ASETpdpZnsny2/+ARflv4gFCL7uQ+CpUfYtErW/yMrEAfll8pKTOQ0nwPv45dfoOsP0leHILmaZFtRU6pVZbWB+UcH0o79rulqiubBZVH5O93cJdnCQ9GCEgYHi46FFjZpu+KYYXBkQV03vCh2E2EoyDsJ+uGdvuWes4YzttEndMv1TvX9ewX5lIb8CYrUZdLwub1Z/v4pMxMqkZsuhV1+vd6u0C6FUbSFAxhHQNGDL7OPNyI/PjfC60ADA1cKx2OapDEDD5Bjzziig8nY4ANLglHzKdxtu+CvX2bhO031fat1n2GMFz5oA7WY9UivRomr/A1fY2b4PKJ+EPqechJ8IFGnqGwLzBTXguYGiy9aQP53HtPg4/KUsHfDl5O6ff1WfHiQfld9dpGmJ1XKj04a4/55ThFnTgOOO+DZjxNH7idxyyhHMBsWHodzH89nzYJMCxuJyveTMzYHm5i1zAYCeN628Cfxlv4jADeKARphPowQx2Sr7FeGpgLahy0pa6l8QRZpr4uw1Eeh84A==
x-ms-exchange-transport-forked: True
Content-ID: <EF0EE0281105BF429AA789F26EB482DB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5a05d1-85fc-4587-f578-08d865da4d5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2020 07:19:14.7709 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rRpCb9O5K2uF2v4LJmabL2VAqUb0FYGEdDtJV/twh2BVHQVntu6wi6GH1zO8d0/TJ7FuMhl/9v485i6hUalHD16ZWq9dGzoEEiDP8FaX2yM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4442
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_031920_707456_CD06EE6C 
X-CRM114-Status: GOOD (  22.81  )
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
> ENOTSUPP is not a SUSV4 error code. Using EOPNOTSUPP is preferred
> in its stead.
> 
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

The R-b tag should be after your S-o-b. This applies to other
patches in the series too. No need to resubmit, it can be fixed when
applying.

> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0369d98b2d12..4d0f8d165544 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2281,7 +2281,7 @@ static int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
>   *@nor:        pointer to a 'struct spi_nor'
>   *@op:         pointer to op template to be checked
>   *
> - * Returns 0 if operation is supported, -ENOTSUPP otherwise.
> + * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
>   */
>  static int spi_nor_spimem_check_op(struct spi_nor *nor,
>                                    struct spi_mem_op *op)
> @@ -2295,12 +2295,12 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
>         op->addr.nbytes = 4;
>         if (!spi_mem_supports_op(nor->spimem, op)) {
>                 if (nor->mtd.size > SZ_16M)
> -                       return -ENOTSUPP;
> +                       return -EOPNOTSUPP;
> 
>                 /* If flash size <= 16MB, 3 address bytes are sufficient */
>                 op->addr.nbytes = 3;
>                 if (!spi_mem_supports_op(nor->spimem, op))
> -                       return -ENOTSUPP;
> +                       return -EOPNOTSUPP;
>         }
> 
>         return 0;
> @@ -2312,7 +2312,7 @@ static int spi_nor_spimem_check_op(struct spi_nor *nor,
>   *@nor:         pointer to a 'struct spi_nor'
>   *@read:        pointer to op template to be checked
>   *
> - * Returns 0 if operation is supported, -ENOTSUPP otherwise.
> + * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
>   */
>  static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>                                        const struct spi_nor_read_command *read)
> @@ -2338,7 +2338,7 @@ static int spi_nor_spimem_check_readop(struct spi_nor *nor,
>   *@nor:         pointer to a 'struct spi_nor'
>   *@pp:          pointer to op template to be checked
>   *
> - * Returns 0 if operation is supported, -ENOTSUPP otherwise.
> + * Returns 0 if operation is supported, -EOPNOTSUPP otherwise.
>   */
>  static int spi_nor_spimem_check_pp(struct spi_nor *nor,
>                                    const struct spi_nor_pp_command *pp)
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
