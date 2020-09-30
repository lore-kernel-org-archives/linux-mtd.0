Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B04C2D0A8
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:46:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B8B32075F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 06:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hm3mH7rM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="yhQIQsEv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ZJ5U8Gfn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B8B32075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O4ppOeavV2lAyHkJD7iiKw1hyWhH8d32Oe8GKK+gkq0=; b=Hm3mH7rMZ3giRpkT/Qi1SUjW2
	UQzOZplwKUzWTJncEYvcIq+n8LsTbpM1Dy3843jtmTl1iwHIvX6A5hFFm8HYpQdgp6TIBtTuHdz8t
	vrvXgMIhDv8r0a2v2DCcoGItBZtqByCvhfPjgdGCbCvGbBrbqErPnxTY5bjxaN/V3yaQ5YfRai5Ej
	ZSLgx1DM8wGgVAw/+H9evaGJ7hgF5kcTFBq/cQOg4uIwa0mVnY2BpAb8Tye8JW3Q95JEu2+jWhe1r
	0CrR4P1JFuxztIkAV6PrDnIgTv6GGeOhpcARKXocLodakS5ZJFf+4wtr+YIGuVOlR2NRX/eD1+868
	Py+u3Nt6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNVsM-0003nu-GZ; Wed, 30 Sep 2020 06:46:06 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNVsJ-0003n3-JK
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 06:46:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1601448363; x=1632984363;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0/JHvHJuaPqs8FMuYEeP5YPhFf4FCxNnA4ToL9C85rk=;
 b=yhQIQsEvVi///ITG77gjm7KWUS054a2QGqs6yA53y+6DWrhNxhltm6Ds
 prjVKp+lZ6YYik87IRT7Y5tBQG3NLBVBq70rAKZg9gtfC6BN0ADJStr4y
 cJJybD83AO0K3coVIecGm0AxJ36F4lKz0iizjN9cOkOPf2AOP/jK+1JgJ
 KJXF8Xm/Oqh79aGw3f13yU6u+1nYxrhsBoFiKXHEjFW/SGNFndkYxlbiP
 9uic1xG18Yq9MxY/R7lkvc9ltWIHfr3KIThKserxjG0EUXE/WSx7ekoyU
 l03VifEiqU7g/KGwIB0TJZEWYf1Elj2qFsLb+yE3izNYenbNSD0/OEjge A==;
IronPort-SDR: R3OZxILgMHAzwvja38h3HhUsv/Ho1hgi6NWcrujHC1THVdd/N1koTwKxOaVdFDOGBHwtG5xD4b
 0guXoXoRbHxf3DihvG+fKj4ClopOO9Bsq/vw2R8E/Y14Swusp73uF1Mu/ZecmCJMI4BGAt2Y5r
 XOQKDB+keWYmQvTTyU/Uved1yje4xaFaxHoSf5jUqFfv2Q0/BwQEWZ4dj/ZYFXkIWXFNItPTq5
 W5WxlizcKqWRv6FpI32HhPU4YdgFRhJkHqhQmw5vln/7kRbcwZrNTsHs+MLbScKHhgm7+dYXsh
 qWQ=
X-IronPort-AV: E=Sophos;i="5.77,321,1596524400"; d="scan'208";a="28180940"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Sep 2020 23:46:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 29 Sep 2020 23:46:01 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3 via Frontend
 Transport; Tue, 29 Sep 2020 23:45:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HltuzEBnHp/8TuyuE+cY3GmhbQNUItNdnnuAwTBSTvzfKrSAbq0zFpRf6hBJpfHzeoWVpb+2T/pxR6ix4rDYBVX0a+xbH+0fyLNwN156p0IX4JQYqjfKHDm8sPCeTgxjqlYvaipg4pGA9mwd5XtNLaQiZXFYFhmBxFDWdwy5qCKZMFD+d65LhA50WN9ywBje4FafJPPaUifNJxDnu5T30qBu3aR7S2cp1U+9717qoIC0HAV9ZLCw9AXIMk2fRzyDvgU5ajcKVUV6ZuFcjjnpGDvhMRExikPNWmuL7KDuEEU6yK8AFPaA1RZmX3vN1ojvZCUxpMRLC8zn/bKXcjEMkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/JHvHJuaPqs8FMuYEeP5YPhFf4FCxNnA4ToL9C85rk=;
 b=j/c40fasZk7d1ckrLgiCqSFROJE1igqqRZYYBPNg2v7aCUEfFJU8xalXPpH1b7S+IgVXYq1TTAmsME90Tl6569hEvpfiBoLV9Qr14Zdhm96hwJ0P4pJ1LOC55XZxrbPVU4awDJR9pL4drV9jbBnRjdTWUrNfgZ2/n3qjhWSTljTAtwUDRmxY8E26sO6LOF5Xtd/huCOcrcGOFBYi9JYc50+l6wz++D7ISEiWHNnO+KRzd5bS1SwQN/wLkyutvx66FsfIM8eADjW4UEYt/HJ8IZknYLVzwzT/RLFq/2bpTNxzGIRFO8zHOQ8G1mFweTMSf13R4z884mshn3rAR58yYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0/JHvHJuaPqs8FMuYEeP5YPhFf4FCxNnA4ToL9C85rk=;
 b=ZJ5U8Gfnfse6L4+WhX5d161QkKhQ2k7dmhG4OfgNpU04N26H0NZkip8Eb25IbzrI1pBsmnkriAVsUossdjEKfpYPKX5gA3Xs+gZ3yo90q9kz5kUHglRH+rz2x6+X3qhvLN0aQADEsbEdmmgEXo4pmkwObo6cuUBQ9UBm+nDNb0I=
Received: from DM5PR11MB1914.namprd11.prod.outlook.com (2603:10b6:3:112::12)
 by DM5PR11MB2012.namprd11.prod.outlook.com (2603:10b6:3:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Wed, 30 Sep
 2020 06:46:00 +0000
Received: from DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a]) by DM5PR11MB1914.namprd11.prod.outlook.com
 ([fe80::f44a:f58e:c13b:947a%4]) with mapi id 15.20.3433.032; Wed, 30 Sep 2020
 06:46:00 +0000
From: <Tudor.Ambarus@microchip.com>
To: <p.yadav@ti.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v13 07/15] mtd: spi-nor: core: use dummy cycle and address
 width info from SFDP
Thread-Topic: [PATCH v13 07/15] mtd: spi-nor: core: use dummy cycle and
 address width info from SFDP
Thread-Index: AQHWlvVbrA++65RfX0GVoJcjVm7DyQ==
Date: Wed, 30 Sep 2020 06:46:00 +0000
Message-ID: <e8e829b2-5d06-6213-c240-17f2fdb72482@microchip.com>
References: <20200916124418.833-1-p.yadav@ti.com>
 <20200916124418.833-8-p.yadav@ti.com>
In-Reply-To: <20200916124418.833-8-p.yadav@ti.com>
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
x-ms-office365-filtering-correlation-id: 75e89fc0-3616-4b09-1e5d-08d8650c7e2e
x-ms-traffictypediagnostic: DM5PR11MB2012:
x-microsoft-antispam-prvs: <DM5PR11MB2012A650A698EA0B74366F91F0330@DM5PR11MB2012.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QonTCDV5/adEQi0NcYHMhi3qGqcqq3MclEQw8ucda456W9AWG6O6VQgfb+uShLKD4F3TFnHLBOi4L+Z8BITCSTbV1Qkm1kagT4Or+4oN3k6YOzxIJUfYsxEuFuVcqTRNDWUOoLOyOgBeBh4Ym+C64CNwHMx2kHybx23jr6Uuylqdun9URTyYjZEPe/9nGIZ5BAJy/lgpojkE51EUsxaFyl14uDhVgAWyXZJ6Te+/VTfOMoO9nkFgTMKoIbTzdVayrk7M6LczVi2+gxvzFFA6QWM1V2fqBCNBFJic9Oq34/7hkAobW48vuUG8KecOCkUU2u5K/78Wu8hAfDHjnaNdrZ8FM5CatKmoFIcgOmC7XeL0H1gkSdCNi5NnLA8dmNdU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1914.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(39860400002)(346002)(366004)(376002)(396003)(86362001)(6506007)(53546011)(2616005)(36756003)(71200400001)(26005)(6486002)(5660300002)(31686004)(478600001)(186003)(316002)(31696002)(66946007)(76116006)(8676002)(66446008)(91956017)(6512007)(66556008)(66476007)(64756008)(8936002)(4326008)(110136005)(2906002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: +geH1O5Ctti+UMMgkSFXo6u8/AztUf+08oKws6OXFr8b7xt+R/pCDVU0Koye9ZXHvLdUyp/nLTvTWEj5+mSIsZJFehajB4KFN51l+wZF8Mo8vncCOwlSdW4apO2XdfNWdben4o7j94xvfUw4zAcXaYV6HwSP2wj6dwCmfoLYgL72NiV1YcIumNC/6B2QHiGq4zcwv2lug7TygO8nQ4pvTeJ3T+4ZfyGUX4SSN4485x+/YOfTYcjy6hLwjZG6LHmSZTdQAqHiFAZv2l+HGPMv2kv0pEPBWQvYrnVHQdxOsSczb0RdrG8e9aLFwc1ZGsBVH6x3gCA5Ttvwofglz1R68voRuDJ5ZJf2NW7waq7iqYd1zp5ev7zuRg9+p7ijwwbShEBqBLVczSGGb/YOHHhakK+G5vEwMseyv5Ur8RjaCqz4kMy39O2ZNXj9afrlcSvk9lGAQnYt6Vq6u+ta9ksP4rt4vs52Ep/CRjx3ry9Gn0EMQ1+j1v8tSvFA9xfPT14Ga3AuZ6TlyeR2BjpOqSMI5PIUeakv5SZPtiuBM+VDTMfEHVKCF9aXDi28WjTLXWyAU9IJaboyk+ZzsTgBWPNtsj7Ii2TNmlsObBEKOfBFuLcci145Lju2sSpFS2u3OaEzaG/U0M5jAf3WaAZmKzG9qw==
x-ms-exchange-transport-forked: True
Content-ID: <5C3757141C9579438C3F092F57B6E65D@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1914.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e89fc0-3616-4b09-1e5d-08d8650c7e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2020 06:46:00.2770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kxs8p0XXduBLvnTI8w1peNJ1En+YeZ1OCoyBHGYmZQ9XPwTuwQmnQPcgwvwKSKjSNSFYjKh5ytF8EJuzpkOQKjvnU5gEFa8tSR7bygfMI7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_024603_752551_DC9660A4 
X-CRM114-Status: GOOD (  17.31  )
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
> The xSPI Profile 1.0 table specifies how many dummy cycles and address
> bytes are needed for the Read Status Register command in octal DTR mode.
> Use that information to send the correct Read SR command.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> ---
>  drivers/mtd/spi-nor/core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index cbb1aab27d03..88c9e18067f4 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -383,6 +383,11 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_DATA_IN(1, sr, 1));
> 
> +               if (spi_nor_protocol_is_dtr(nor->reg_proto)) {

this should be done just for octal dtr

> +                       op.addr.nbytes = nor->params->rdsr_addr_nbytes;
> +                       op.dummy.nbytes = nor->params->rdsr_dummy;
> +               }
> +
>                 spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
> @@ -415,6 +420,11 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
>                                    SPI_MEM_OP_NO_DUMMY,
>                                    SPI_MEM_OP_DATA_IN(1, fsr, 1));
> 
> +               if (spi_nor_protocol_is_dtr(nor->reg_proto)) {

same here

> +                       op.addr.nbytes = nor->params->rdsr_addr_nbytes;
> +                       op.dummy.nbytes = nor->params->rdsr_dummy;
> +               }
> +
>                 spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
> 
>                 ret = spi_mem_exec_op(nor->spimem, &op);
> --
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
