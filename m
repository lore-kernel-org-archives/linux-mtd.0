Return-Path: <SRS0=MsPh=FC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052A3C63697
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 10:59:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 792C221534
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Nov 2020 10:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ehdMYMh0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="bS5Szyhe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="AcnsyAHo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 792C221534
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Content-ID:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00JM6yYBZwesA62I9F6seTT8BdLFhfD2xmZDGudonII=; b=ehdMYMh0hKXSuoOSp1/VBQxASv
	mn7WQKeIDFkiA2NqR4SwES07OCkBMISUV7FtDKDnqqV3II4tKqYjIo61M9pDQu+fiLu39lUszc0DW
	if2LuLE3cEwU6aysctH8NnqBo/DiCRJISKLimS/X+K8V54pmuTC4u1WyNBrrIcpQGS4EdfmRmdgDg
	9c9pPxw6e6N9hvxbl2NXnFgeJlpwKXRwrPd4VxVoiibEXLRM9Q/cWsi5HH0BuFc3fHN+xYz+D9F3O
	mtGFoPpPM1C9IIhegqA71ToiJHheXi7aQAN/leDiAaBZh5ZkVr1YzdeUCqDh0Z6fnjK3IEVRgsPSK
	TP4DCqrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kixvn-00019n-BY; Sat, 28 Nov 2020 10:58:19 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kixvi-00018v-Bk
 for linux-mtd@lists.infradead.org; Sat, 28 Nov 2020 10:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1606561094; x=1638097094;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=P8/pe3ruIH0FqiTY/DGUDJs6U4GX+jFB4a5qWn9L2+0=;
 b=bS5SzyhexkSHrTlDfPHiY1zA8i89Ufz97R6jc2K3sBUQebNj23WksMA6
 Z+uY2T0vlhIFjWd8i6BZtxeAhSoDeZADUZ7Ku4Gvmt7KJbyKS2SHerbi8
 MZqWZYRqvKXCS9f4FPndJIKSOV1POnoGpWJz8vFVH+6gxf9/l90LF3yos
 owUFfqB7boeOgby6SCpy4pceLo94RTlYzWBt+aK3XwnGo9vHpbVxstA6Q
 agjVHkziL5ZdHVOyFiyNHpRWDf0QX3U2ISMY1LCPria1nuyiM2xaqxfUi
 cqcQxoJDiT3g0T3efcMLoci5gxtJRgEY8Culu8915wH3xkp5fDrUbyohL w==;
IronPort-SDR: QWQSbJvYUnj7T6HBG1efrN3UN+bkn6ixAf0Fs1WQwT28pn9MPEcIR3T2Ot26Uo3s5BiNBJQrAH
 Q1Q22lk4QL2r9OeW2pqjWgsCtuVFvkycEPTh3fi6eMhyjHwyMrcIuyiJ069p+9czCVUGTnapsg
 W+fIbYt73duajsCqaHES4+TCeNPcmij86oKdlOrvtEp2oPybOuFlgS/apCBJCXmP1SyXwDUNbU
 wralCXTbxeUuZIQ0zYy0QLWUqftz+oXN8oEP73JN2JapkDDvttkRTyRLOSFVPjB9A3FWRX8qcQ
 jJk=
X-IronPort-AV: E=Sophos;i="5.78,377,1599548400"; d="scan'208";a="97853979"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Nov 2020 03:58:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Sat, 28 Nov 2020 03:58:06 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Sat, 28 Nov 2020 03:58:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LidxHGIiFamCj9pumZ4CGArFrwXeAGWhLFfXeSsRJ8sEKsaJcr7zldKv4gK/Q6KiauKoBrvzl9vBDK7T1bBDUa9Ub1Thx25Vsqm56fFKEFsmoxyhlRlhLafgKB7P1FZdES/TDtvGMH6UFM9xa6vwxMpcYO9qVo5Jb7tgfnbSf8w592AOTRFm9HP1Mfg/D/3v4yXpC0t9JE8llAuMbsxAUj/ySKooNGCEJHJgPvir7TtGGG910W60/U1OhnoXP5muLsUlijP6Ifq+JAIF46PSIVt4vLWziikASOam2jMw6J6MBozirRNc9RzKoxKGoh0csb7mZNpFXCXMsnoEyvjHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8/pe3ruIH0FqiTY/DGUDJs6U4GX+jFB4a5qWn9L2+0=;
 b=bf0znYgAWszrkQ1HXAc12p+vz4CWYdtanvIg6yo+KEfLprW8VHe/o5Xfq7C7KKyV+nHqXZ6PXXPtSc/pYREsMHxLiROYX2Y2tRkD/EEBmlbvwhuIzRAez9QRKsT/FhRsJyKcuY1oVCbHJ3xLuhwg3cfkCUijM6mJGHXn3Yjl/CWBDsx9qSgqtyqMmBBGztF+3q7Us4TmgVAhMvM0X2xpVq/HLcdDrm+EJP4GN2g8DWriEsCIrwG8karASYUoyfRkbQXaMzWVjaLd+sNu5mAoYBDSrLEauXoVHuaGbEGvjIY59CM+2ox3Ec1gDPxpjqlwDAQv0ko86GpWyWjoWXJn9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8/pe3ruIH0FqiTY/DGUDJs6U4GX+jFB4a5qWn9L2+0=;
 b=AcnsyAHo60FLwPd6wwelUNxSy1P47O4TUa91HBxV65uVto4ryN6bECVQUW9LyPwdgtagOwPx5adMmc9/gF38BgXkDlPFJM1mU+u87ri1l5dObV+k/7QSFNZd6xOm50eS1jXYKIFucxHbBziTZdU+xpGIVTZErQJ1RuyP8sWtuaA=
Received: from SA2PR11MB4874.namprd11.prod.outlook.com (2603:10b6:806:f9::23)
 by SN6PR11MB2832.namprd11.prod.outlook.com (2603:10b6:805:5b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Sat, 28 Nov
 2020 10:58:03 +0000
Received: from SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761]) by SA2PR11MB4874.namprd11.prod.outlook.com
 ([fe80::6903:3212:cc9e:761%7]) with mapi id 15.20.3611.026; Sat, 28 Nov 2020
 10:58:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] UBI: Do not zero out EC and VID on ECC-ed NOR
 flashes
Thread-Topic: [PATCH v2 1/3] UBI: Do not zero out EC and VID on ECC-ed NOR
 flashes
Thread-Index: AQHWxXVXIQOfePlSqE2QYyUaWfStsQ==
Date: Sat, 28 Nov 2020 10:58:02 +0000
Message-ID: <2f07715e-fe44-c5fd-6194-b74ba9f22545@microchip.com>
References: <20201118182459.18197-1-p.yadav@ti.com>
 <20201118182459.18197-2-p.yadav@ti.com>
In-Reply-To: <20201118182459.18197-2-p.yadav@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03bbe0d2-5d98-4ce9-3285-08d8938c7a4f
x-ms-traffictypediagnostic: SN6PR11MB2832:
x-microsoft-antispam-prvs: <SN6PR11MB28324D5376F68DB2E90F757AF0F70@SN6PR11MB2832.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iOpVQnELlw0W1OZ+BVuJ1eXhIs79jkG2YUIcZFbmZzV5dkwIhXLIE7+luIOyXOxk6R2Sgo84z3SDs8vg2OSHxKJfnpImk2n2/8axx/gL1C2bGgzWG6WY9ZU3YKomAT030qlntkpbv8tzfFk0ao3rapJPMfeKu4fLjovqd9ujcRM3dQGHvhu44ndT6Ro2QNGBZxV0pmoTn9U/Rov4TRTbo2s34jf4NLZG8ZP8qd3SXkk76I0j0yE3TIPlQsYXsBdxg4ib/3Vm8SbjV0Lp6WvPlTi7FslWI9cJ+qdoll29a4sOG19Ro2I8mVhmgfj2Y6aw8GUQHhXj7VIJOiJWtqNjswS+e+/SZbS3jKM9XWgIIQRsN1KOLeNvqsKKQ71bTPsC
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4874.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(136003)(346002)(396003)(366004)(376002)(2616005)(83380400001)(6486002)(36756003)(31686004)(478600001)(86362001)(76116006)(316002)(6512007)(53546011)(71200400001)(64756008)(66946007)(66556008)(2906002)(66446008)(66476007)(110136005)(5660300002)(186003)(6506007)(26005)(31696002)(8676002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?YkhUWTdycjJaZFA5ZHE1bFhHeGxocmp5UWgrYllMSDZ6Ykk5cFl1T0NLYUo0?=
 =?utf-8?B?eFlENXJXb2UxZjhJcDVLWjkxMWcyWXM3RWNKNExXKzFka2s2ZDB2RnVnK0VP?=
 =?utf-8?B?WnlRdkxYaUJvSys3TEtUd0c0NFNLN0pWZm9rbDNwTER5T1JsRHVDeGxpeFI5?=
 =?utf-8?B?TGx5M1Yza0hDMUFkNExmdVpBZllBKzBQVEZvanZxSHR6ZHgxemF6MTdvR1Ny?=
 =?utf-8?B?TlZ6L0ZueUFuaTFZemdZd1RQYXBadlBaTGxiSXUyNTZJSjZ3SmFRcVV6QW9F?=
 =?utf-8?B?SzdNelE5emwwZVQrSjFLRE1CVTI0OUxtNWRVYkQ4TnphcnZVTTgyRnMyL3Fk?=
 =?utf-8?B?WEVqM0JrcmdmVk8wQUQ1QWx1QkJTcGRsUGFYeUUwR2VtMWFhRTlRekZzSW5w?=
 =?utf-8?B?MWF0OUl6aDVxaEtBaTRjZ3BBZ1hEOUI2eVZ4WDgzMTZwUFUzNVd6L0hVMjFH?=
 =?utf-8?B?S1RGd0R6SkN3SkZITFA0cGJaallGNU5zK0s5WVdZbWMzWXJnQWlwUUhFS295?=
 =?utf-8?B?cXR1b1dzNnF4YU5lT1dCZ2xkaEZiQXczYzB0K1JTTmEyK2NkSDBmcUpCa0hw?=
 =?utf-8?B?NHlVbkJZWGJ0OTkrZmNYK01DT09aUnJsNGxsMVZLeTZ2RjlQTmllNEY0emlU?=
 =?utf-8?B?RWJrRHhoL1dLOWw3bU50VENmazJ1TW9vWkpxaDh2Yk81Q0kyUnNZNjdzQ2hP?=
 =?utf-8?B?Y0U1N1ZsMHZZWmNOVWROMFFPZUlxalFIY3E0KzRyMW9vR3dSUGN0aFJCWjVx?=
 =?utf-8?B?a0tIT1ZheFlRaTlxdVhGaG1Gbko0SnBFRVUzcXVtV3BCYm9kQTF0YjRRak81?=
 =?utf-8?B?SXo4TGoySk0vbVdFTWlCUmhtNG1INk9yQlBmT1I1TTJxUFA1QSszQVFTZ044?=
 =?utf-8?B?VXpmUGZ3akxaT0E0dVA0WEtrM2I0TEVQRW83U2dBMkdhMDFOb3RQNnVpTWtF?=
 =?utf-8?B?SG84clJIQ2tma0Zab245V3VMRHZxazF1ZCtoSUtuVldkOEVrOEZidE9UOTVu?=
 =?utf-8?B?K1hTazBKWm44b0Z2eUVraUk5ME9tSyszT094YjRUTDB0Rk5uZ0pKSXVoWVdF?=
 =?utf-8?B?OGJ4OEJYVDhvRVBKcnljd1FZQTJXWVg1Wm9MWno3N1RETFhzM0JIMFlkeWxm?=
 =?utf-8?B?WDk0Qk5pOThuLzhoeStad0kwVVUvUWFXLzJpVmlaSHhObFJqcUtWSElhdndz?=
 =?utf-8?B?M20zUnRGaHF3OXhuOHJIMWMwYXhnL2FoMS9xUzBsaTlld0pDbmMyS3Y4RnRS?=
 =?utf-8?B?a3Ixd1FVcktRU2xSbEowWlBqN2grSVZ2bEcxQ2xZakNjWWpRNjBpN0s1cnFC?=
 =?utf-8?Q?pGB2RX59LRoow=3D?=
x-ms-exchange-transport-forked: True
Content-ID: <DBAF3EB6E166164C8D31D6DC0BF742F7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4874.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03bbe0d2-5d98-4ce9-3285-08d8938c7a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Nov 2020 10:58:02.8087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ae6FeI+CH/gcNKzXnhRwbmSWZhvjhIoDq7Mrlp4wkxx1Yrr4FVmq5WGrkv5MXCtPP1tmQIAk1YhYfixbomjcNNy0n9N20G55igmKqAbmaXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2832
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_055816_187912_B382F7C3 
X-CRM114-Status: GOOD (  27.70  )
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

On 11/18/20 8:24 PM, Pratyush Yadav wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> For NOR flashes EC and VID are zeroed out before an erase is issued to
> make sure UBI does not mistakenly treat the PEB as used and associate it
> with an LEB.
> 
> But on some flashes, like the Cypress Semper S28 SPI NOR flash family,
> multi-pass page programming is not allowed on the default ECC scheme.
> This means zeroing out these magic numbers will result in the flash
> throwing a page programming error.
> 
> Do not zero out EC and VID for such flashes. A writesize > 1 is an
> indication of an ECC-ed flash.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
> 
> Notes:
>     Changes in v2:
> 
>     - Use mtd->writesize to check if multi-pass programming can be done
>       instead of using MTD_NO_MULTI_PASS_WRITE.
>     - Remove the assertion that a NOR flash most have writesize of 1.
> 
>  drivers/mtd/ubi/build.c | 4 +---
>  drivers/mtd/ubi/io.c    | 9 ++++++++-
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index e85b04e9716b..25fd7816b1f4 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -628,10 +628,8 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
>                 ubi->bad_peb_limit = get_bad_peb_limit(ubi, max_beb_per1024);
>         }
> 
> -       if (ubi->mtd->type == MTD_NORFLASH) {
> -               ubi_assert(ubi->mtd->writesize == 1);
> +       if (ubi->mtd->type == MTD_NORFLASH)
>                 ubi->nor_flash = 1;
> -       }
> 
>         ubi->min_io_size = ubi->mtd->writesize;
>         ubi->hdrs_min_io_size = ubi->mtd->writesize >> ubi->mtd->subpage_sft;
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index 14d890b00d2c..2f3312c31e51 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -535,7 +535,14 @@ int ubi_io_sync_erase(struct ubi_device *ubi, int pnum, int torture)
>                 return -EROFS;
>         }
> 
> -       if (ubi->nor_flash) {
> +       /*
> +        * If the flash is ECC-ed then we have to erase the ECC block before we
> +        * can write to it. But the write is in preparation to an erase in the
> +        * first place. This means we cannot zero out EC and VID before the
> +        * erase and we just have to hope the flash starts erasing from the
> +        * start of the page.
> +        */
> +       if (ubi->nor_flash && ubi->mtd->writesize == 1) {

Are there any SPI NORs with ECC block size of 4 bytes? Should we call
nor_erase_prepare() in this case?

Anyway, there's none in SPI NOR as of now, so:

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

>                 err = nor_erase_prepare(ubi, pnum);
>                 if (err)
>                         return err;
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
