Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94009C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 14:29:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B69F20709
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 14:29:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RwOZI7iI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0UnaVTem";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="hjP8J8TV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B69F20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mibSsDvwdLFPpo+iy0WcKpJGt9FISBNdT5aTc/4bebo=; b=RwOZI7iIs+2mu8KeaDz2jsKq4
	e53RIboMJS9fx0tf69ANtQq3C+YPlRF+9yXftEv7mtBlKls/lqjp7x5k7D65vO1x69D2MIksz92iH
	QAiNBTev0NluHI9sZLYooUTmSn5KQXBkagH32O9gR53BxSpWvvWOKyWAYvxsxXvCSZD9gOOtLowdb
	FMZOo0zn62TN9bkvZ5llbg3R3FiYngT2oaeZ07qI/Tylerr0lTQdP/sC8i87OTx+MsJkPzU5p4/6I
	T6D3tmcs9OjheM2NoiAQdqIxz+IPGfle/dNkUJV5hdhvONDs7sQN2sM0MHVvi34ObCrDaEMdlxJCg
	+1mI5CFdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyFjc-0004NI-EG; Wed, 22 Jul 2020 14:28:40 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyFjW-0004Ma-Eq
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 14:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1595428115; x=1626964115;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=2d4P2rmN5yKyPy94hnKpeX0+h9MooSdNJAghy8ZCARI=;
 b=0UnaVTem6V8CLfcon+OyHzu+sHdv2z8Lvpe+e6Z+iCLCk3n1IJIbfOLI
 S59BxFpDQqFP6+Ievf1yuxbWwg1K+8AujU1UoqZexgrYxSRSKo2cq2499
 /jQ1B/CdnXRhf6ZQrtaK2ans42AbbO4wkkyeLtFj7kTirZRqDa6tnpQQm
 xKvQoOjiyd4R4C9pNvtWixQRoUeB8fd8b7Rr4N2kWhfoJXewI2YH9wpby
 pZAoI2u10n/l/07KoWkDXuhC1pzL0HOnFEg255wYfsEoK7njZY/4+7JEX
 oSvNEnDntfhL9b215G49AqeYpYM8/EfGHzae6lDLPwp0Ntv6tFHsahe3p Q==;
IronPort-SDR: HAFnD9Iw4CCpxdvhphRDMIMnMK1PlC5V9FJm1rdcXvnxcjCYnSlygO9xadtJ+48Fi/CdtwyFH6
 GN38r3n4sipqllQO8rfQ+tBjB/OHrPrxL7W+BbUAyev//wUUERWjd0yvsXMCC9nJLA48nI+pJX
 u9VIUDCdfPBMsEVgiCRlqHdOzEJCoecRJL79FjUGinKDCKRSd9ScEFrB1UteavjGasiLUNFc5j
 fkTiRmnR2Ska+8+wd9dS7LSYILSc1pyPMtayVR5W27OMjfaPC4QsyLd572HC/Ua3GdmzDcdspZ
 E/0=
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="84204445"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jul 2020 07:28:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 22 Jul 2020 07:28:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Wed, 22 Jul 2020 07:27:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JK34OduzZosxbc7BMA2SPo2nXHsMNth4zQzSwy+CLl5TpNTn9QlHRHZ8/LwXmO2jGq+McztjvJML/pxsEn0RTCRwZSPJdg3eUAdOKOgL7GLGSGuOGBOIDRg7uEvfLTmqkVJ3j3SaLMLxZVi/y34tVsCwekDxIxkSPl8e1CJGAKEsIagDVp5i4cJRqubqeIq6Ldjj4XSQCnzPQV1eT6GTnw7oscI+lQcJbQtPC59R7NLuZAMiVhVLBWXInfJxGW6f5keflFQGX2ONVLOFKGmT1OVO5xhC4Vmv5FCGGkUpQGyWdJpE076xbz3EJCITKjIApZlzQlN+Qjwm/PEZH2PRzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2d4P2rmN5yKyPy94hnKpeX0+h9MooSdNJAghy8ZCARI=;
 b=COV9ZSl+SnuIlrEnR/urUSKQczwSrLACzIPtOHhqkI8Y807bc/p/Yiy3QwH8veKyaphtSe8AI/Ytdx0C1euY0bxd8DBIM6N/uCvxuvl/DNKQpBtOuBlH0yOwpf4SCh2JaKTGJVlBQudnDkdUF7fMsCjnzjONltNA72eFTI12YmzxK/aGfnmXzhcIrBdftJlhMcfU4Bw1JPxsJn57AjNh6TSbX3br/Eg6hQapK6Kl/50aEvG14NeTrYT6ga51eOq2FpvocZ2D1FcRO9vHV6GQlOs2PaCPsiKBINyUEFKqIxQIr0+TYdyeaNg2rxil8fKPU+q4dig6TccHatTp4jemcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2d4P2rmN5yKyPy94hnKpeX0+h9MooSdNJAghy8ZCARI=;
 b=hjP8J8TVwTqnGxHwHm+1Haolp8BmNUNI75QWyIgFKVI4oZPPsbCAJw80ax+s4ZC3oXfIQAm7bXURu2gSxJbQY/gKF/aJf0BgVJjTT8iuKrUVhKCHb7iZhnamwNm7U5TR8zzqZYllAszdYZl6U1m8LGO7+EZINyB8SaZN6oTP6fU=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3079.namprd11.prod.outlook.com (2603:10b6:a03:92::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Wed, 22 Jul
 2020 14:28:30 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::7424:cb9d:3c63:5181%7]) with mapi id 15.20.3216.022; Wed, 22 Jul 2020
 14:28:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Simulate WRDI command
Thread-Topic: [PATCH] mtd: spi-nor: intel-spi: Simulate WRDI command
Thread-Index: AQHWYDReSXNx4qFwZkKE6j6AE/Ov3Q==
Date: Wed, 22 Jul 2020 14:28:30 +0000
Message-ID: <b5c17892-24ec-a690-96ca-d2238b8925d1@microchip.com>
References: <282e1305-fd08-e446-1a22-eb4dff78cfb4@nokia.com>
In-Reply-To: <282e1305-fd08-e446-1a22-eb4dff78cfb4@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: nokia.com; dkim=none (message not signed)
 header.d=none;nokia.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [79.115.63.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: edad1c83-365e-43d7-9676-08d82e4b819c
x-ms-traffictypediagnostic: BYAPR11MB3079:
x-microsoft-antispam-prvs: <BYAPR11MB3079A7D0004E7E8CAE35A298F0790@BYAPR11MB3079.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v7OzNVjnWEq5OQ3gEsna2rOYPCOjoyCl+B7AhGeVSNdH9gOr8GjzAx5qPQBKfrJbDEeo8Dc9gqhGunIOmzPZkCSL4Kb9fw+suXn0cPHgzFfDi3ZERtwO1EKgqvEUExYB+csHEMY4YW62WPcH+pqHugp3VnV/xulAxd4CpBIl6kKLKUY3Q//d/XeuVdM1NztfDfqV6z4D9vKg18erXI8spKoPSZ094Y4lK+vHEt661obFMF3jbJbvMUMoZyj6eQyKmJJH2+Zypf1FhymcfpckOLOMm5P5mBigZs2kfLpBrmAxU/8emM8eMSXP1YBBZJRIbmVShyyyWzYz0spyGpPA70LC0lkW5HcXyzam7h2KeMXg1aoumAtA9RsXUwrzixZY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(39860400002)(396003)(376002)(136003)(366004)(31696002)(76116006)(91956017)(36756003)(5660300002)(2616005)(8676002)(71200400001)(86362001)(186003)(2906002)(110136005)(54906003)(4326008)(53546011)(478600001)(296002)(316002)(6512007)(31686004)(66446008)(64756008)(66556008)(8936002)(26005)(66946007)(6486002)(66476007)(6506007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: sOdzEW8iFpCZo1isjfFDJRWiVfYvJyXO5W3hOSwNWzB2i/Tlvj2K7Xm9aBOOKJoSWqA+O6zua+Jdx6zZDJwb3IXyLVC3iAYEEYpld6U0KfzE9XuB0sxOvwKqRkFSo6HKytv6tnPVNQ8KvvaUJiOulZKN5CTqAllntvqcGZVBBkM15DruZdC/awqgKaxObFD6/RQ0QOTSyr7f5kiyd/dgQjYD2Ycww2tLzhc1OPWPPoZofrsd1G7zm53OL5MX443pNQ5wXNKD0mZjwk77xTrUZagWU3zOqaG+I9sqweP4bHVyz2l7mW6jHk131oVFDoSnlerVMHWGkSVM/3wsymzYPhsB9yc8D4Pm05JeSkpRzeNjWZTkPBtEdFQZBQzAAIWWcwAl1vQ7133t1Nugb8SgAZQqZko35gxBbTj4unCbx3HTHLytuwlGybHLoKBdXMbXUr15W0PdHnJ0YPMIMOU6Oibi6SxjN8BzSevJBRyDOMw=
x-ms-exchange-transport-forked: True
Content-ID: <384A485FECB9F24993F0605FDF80C572@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edad1c83-365e-43d7-9676-08d82e4b819c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 14:28:30.3683 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GDlB8c62XkaLVolaMLb3QKowBKpNHqXpFw4R7z+WB8BIIFC6PK6xHrDFdtnYwu5VqB2hvsbuXmJEF8iHKFhpTt/XvymnR+MZgejrLoh2MO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_102834_766209_7E4AEA08 
X-CRM114-Status: GOOD (  20.86  )
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
Cc: ibr@ilbers.de, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+ Mika

Hi, Mika,

Would you please review the patch from below?

Thanks!

On 7/22/20 5:01 PM, Alexander Sverdlin wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> After spi_nor_write_disable() return code checks were introduced in the
> spi-nor front end intel-spi backend stopped to work because WRDI was never
> supported and always failed.
> 
> Just pretend it was sucessful and ignore the command itself. HW sequencer
> shall do the right thing automatically, while with SW sequencer we cannot
> do it anyway, because the only tool we had was preopcode and it makes no
> sense for WRDI.
> 
> Cc: stable@vger.kernel.org
> Fixes: bce679e5ae3a ("mtd: spi-nor: Check for errors after each Register Operation")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/controllers/intel-spi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
> index 61d2a0a..134b356 100644
> --- a/drivers/mtd/spi-nor/controllers/intel-spi.c
> +++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
> @@ -612,6 +612,14 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
>                 return 0;
>         }
> 
> +       /*
> +        * We hope that HW sequencer will do the right thing automatically and
> +        * with the SW seuencer we cannot use preopcode any way, so just ignore
> +        * write disable operation and pretend it was completed successfully.
> +        */
> +       if (opcode == SPINOR_OP_WRDI)
> +               return 0;
> +
>         writel(0, ispi->base + FADDR);
> 
>         /* Write the value beforehand */
> --
> 2.10.2
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
