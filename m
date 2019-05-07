Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8775BC004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 13:25:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 566972053B
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 13:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cm6mMgyl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="g7m+cTaB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 566972053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRDCne68RgrZfTtgll/f0jSAjXlHolx+idmisCbMQb4=; b=cm6mMgylSDWHgh
	a99d+EMvkjZq2Cjrdn5oqehvwmAMzSLGFZb0ZvmBGcq2uLHULCZ5cbEpW80GKTwzTsqMeSjD7bbhr
	jFrbbhC/EIuePQhyDRHyoS3GDCcfu50btELKNv30mGvb3sXjh89ITrFfzuWfNRKkQZEMJJS08LUdM
	DfvQvdk6uDgwcG2Ko2DyOzgJveKjJlTK0fbxH3VlmNFB8wy90q3uVGkZ/dNuz3OvOAiXxWi6wVbBz
	dxseIRArhZj3PVj/OIqt+Bu0Nao8voXVRV/CysKV41SXlpEMAeNgzNUg/U78uCzxSe/YdovQlWOGI
	dmLWGFA9t7kXK7rlp7IQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO05t-0000f5-Q6; Tue, 07 May 2019 13:25:17 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO05q-0000bz-Oi
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 13:25:16 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.60,441,1549954800"; d="scan'208";a="31935244"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 07 May 2019 06:25:11 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Tue, 7 May 2019 06:25:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTiBAx9Kl0NEi+vkfRCZ67wLxnIYIRye69hMkZrCfgY=;
 b=g7m+cTaBF5gYs+/v+6dtJqAqcBLvZ0zCZZGFThm3edmaHv+BYh4mnyrQKZycpvnLiYHDuefsbpFNm4R3/adXqfoHZtcdN04M1R20Vd+mNFofanlDMC7ZRUfyczZJKlecCzZ0tpXyvAvCeliic5PbPhDt10Yk51BmiYGGtoLNhvU=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1780.namprd11.prod.outlook.com (10.175.99.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Tue, 7 May 2019 13:25:08 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::35b3:7af:7216:8808%10]) with mapi id 15.20.1856.012; Tue, 7 May 2019
 13:25:08 +0000
From: <Tudor.Ambarus@microchip.com>
To: <geert@linux-m68k.org>, <jonas@norrbonn.se>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Topic: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
Thread-Index: AQHU3uz1n9sAm8MvGUei5wsE+JArGKZft50AgAANmoCAAAIxgIAABqiAgAAbqwCAAAZdgIAAApsA
Date: Tue, 7 May 2019 13:25:07 +0000
Message-ID: <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
In-Reply-To: <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:200:56::31) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb8a9eb0-8bf9-4783-d9b0-08d6d2ef6c53
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN6PR11MB1780; 
x-ms-traffictypediagnostic: BN6PR11MB1780:
x-microsoft-antispam-prvs: <BN6PR11MB1780442E3250099F206B1C7CF0310@BN6PR11MB1780.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:285;
x-forefront-prvs: 0030839EEE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(366004)(136003)(39860400002)(396003)(199004)(189003)(72206003)(305945005)(5660300002)(256004)(68736007)(31686004)(386003)(14444005)(14454004)(99286004)(7736002)(446003)(8936002)(486006)(54906003)(316002)(6436002)(110136005)(6486002)(66066001)(478600001)(11346002)(25786009)(52116002)(2616005)(6246003)(476003)(6512007)(76176011)(86362001)(31696002)(53546011)(36756003)(6506007)(66446008)(64756008)(66476007)(66556008)(66946007)(73956011)(102836004)(71200400001)(26005)(4326008)(186003)(229853002)(53936002)(2906002)(8676002)(71190400001)(6116002)(81166006)(3846002)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1780;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lkypMP0+pdeunK6RylhmINqK70DsMI/k+/Q+i9IV/CNzQpNPXWq4vBOy+7Y8sVfKwoON6zhg7iAGPB5CdPeI5S/wj6FBNVxth1VTrrk+aqEcQLrrVuodcu9lEFN9yt4LfJM5hyXkUrfGRGv5NWidLp/Rhiy1awemEx+TXIBqT3ss6ZdTYvFoU3V7XJijjoduxoFLvraFCk++4ILcEXrSr2Z6wNwBKgN6NRv0h5bB92it/q1yrlcEDJDunuCHYUZZs4cB5MCcZFBcISwLfxJ/jvZUzCDZ98NhG1JNtFO0L+NwqgMhhq0inqZdGepEY1fPMrjIRwiND1Fffs3S8KdG8DIRNtQcgAq+tgaSF0kkBpkmSooMRUx44Wppg3KHbfhQITsYrEnUNJWcaezO/GAPjeVlly9g0SfE9x2rR27SFTw=
Content-ID: <A545F38E3C029943B0595DC32EB720C6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8a9eb0-8bf9-4783-d9b0-08d6d2ef6c53
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2019 13:25:07.9958 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1780
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_062514_857763_8599F28C 
X-CRM114-Status: GOOD (  11.74  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-renesas-soc@vger.kernel.org, linux-mtd@lists.infradead.org,
 marek.vasut+renesas@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 05/07/2019 04:15 PM, Tudor Ambarus wrote:
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 73172d7f512b..b94a6eaaaca5 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -1551,6 +1551,7 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
>         u8 sr_cr[2];
>         int ret;
>  
> +       dev_err(dev, "%s\n", __FUNCTION__);
>         /* Check current Quad Enable bit value. */
>         ret = read_cr(nor);
>         if (ret < 0) {
> @@ -3911,6 +3912,12 @@ static int spi_nor_setup(struct spi_nor *nor,
>  static int spi_nor_init(struct spi_nor *nor)
>  {
>         int err;
> +       u8 val;
> +       u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> +
> +       /* Check current Quad Enable bit value. */
> +       val = read_cr(nor);
this should have been:
	val = read_sr(nor);
sorry.

> +       dev_err(nor->dev, "%s val = %02x\n", val);
and here 
	dev_err(nor->dev, "%s val = %02x\n", __FUNCTION__, val);
>  
>         /*
>          * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
> @@ -3921,7 +3928,7 @@ static int spi_nor_init(struct spi_nor *nor)
>             JEDEC_MFR(nor->info) == SNOR_MFR_SST ||
>             nor->info->flags & SPI_NOR_HAS_LOCK) {
>                 write_enable(nor);
> -               write_sr(nor, 0);
> +               write_sr(nor, val & ~mask);
>                 spi_nor_wait_till_ready(nor);
>         }
>  
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
