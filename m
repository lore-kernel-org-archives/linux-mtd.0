Return-Path: <SRS0=EbIY=4E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD983C3B1BF
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Feb 2020 23:03:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A045E20857
	for <linux-mtd@archiver.kernel.org>; Sun, 16 Feb 2020 23:03:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JvkSw7D9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Mn4YwJPE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A045E20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNQUt6jU+FkywKex2CMfU0m1sf8QiO1PaKkVyBc4Db0=; b=JvkSw7D9unh7ym
	sqBVZKkgeryMA6YW0NTVEWTpkxcYLMs7LaJxcK06NSiIF7JVSj6Hqcdce50dZZb6FpvAOHbnPa+ch
	LP3JbiIxO62/jwr3a2Px0ZS5Uzc3rinHkJc2xubgZ+GivZfFyQ0yrjH8cm8Uz1lpxC7FimC4OODuY
	rtKHjej378X+7utFSpoSqh1sCRD89l/sq3oFc9JI6gae6Y6E4E7l9h4DLCpUjhqQh2DLgt2IdmKCh
	ADr2VRyzlkY0aQjIlJndAdUDmSI0y1/D/hAEmu1saHdWhgcgkfuRQ+Ap+GNXFjMR0nemj/voQ45pq
	qKvxewt/cN1pBHoJSVLw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3SwT-0006FD-Sd; Sun, 16 Feb 2020 23:03:13 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3SwP-0006Em-Kx
 for linux-mtd@lists.infradead.org; Sun, 16 Feb 2020 23:03:11 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: GU6ZKVnVJMLvBt/2mFZaz0vU/aczvkdSR0A4kg0osSDsB/uOsfofJftRUflFLUoxI9yymXA8+I
 aE3NpZMoiSHObaBrAn/gnvoAzrh8ZJtCDi3dFkZ2Tv01mkQTBaWuL5rTptuBdRk9Tq0yeGmwUw
 bP615tzA+ASxhbdu6M0pTydTE5QopHNxz3T/+8MhENX/dzxNPFUCv8LWVhPDRW+TP0NdBQ/lap
 yLwCruyQQN/MthWhgeOWmLxa0lAETHDHy8+pDK48yN2xuQB3UjaLfua1XpfOhus45GG97WkX4C
 OQ4=
X-IronPort-AV: E=Sophos;i="5.70,450,1574146800"; d="scan'208";a="68696648"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 16 Feb 2020 16:03:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 16 Feb 2020 16:03:11 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 16 Feb 2020 16:03:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TthaePfGmkS5KyKluo5o1tUvy3Cisv3wV0R/CiaUJMpEScj4zCYnCrSp+LKAHWShBTyg4Mnvd+zeixD/YE6PATL//eMuWjgQvmGcJkxPwKeCJrT+Pstsqi86YxSuvRun0NqlSEmEG+GM3IshbJHISkXaRjXBG82tBUocnIteN0dIHbvlyKYamH02MbHf8RPde00a4gId5ywCCdpKItlzfqqy+BypTd7FUiOPZTyqdGRXnVx4vKarJvBlWvnwimFNNJHgp3FgOoaRXz8K3ttNXc6IivmEP4UCxou8olY6D4WJdugPVk6qkbsZU1vlI9SnXFT+SIIJQCNFaxWCkN+pCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yK97+aLnC+bWBDerECv4ph/u1wwaJEAO075NEcMsRTU=;
 b=FQ7CMPDf6Qpc3BkfZxdbHwwx3fJZRiDj61V670SDEJGrevG2uUqEiRtpk/ImyJXVWw49TeHF+3ShzuQHNCwohoa3dRG9Wmt/eqHOA4TlbK9mdgR6vhseJliK2CTd1Wwl1SBpgzbGBfFB97Fpo6WD80gEXvw1M7KKMKEc+UCryj9dw0LmvGd9Cm9wp6Hmvl231ZvA+ClfuChVBvhSkKXTDeK1ihsVHeDAUgdBefZg/w38g5wFPPHrO8dQ2gJkjjz/D8R7HxjeIFouXVL7LwTnclG2wPULJcBXp4R9KzY1oX8YCo05gPjVravsSaFo4vGT1rT5hd+pMS9QLv/Nif1smQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yK97+aLnC+bWBDerECv4ph/u1wwaJEAO075NEcMsRTU=;
 b=Mn4YwJPE2ySL2rJWZNcA4X/QEcmHHsaL6585geOfOU3dCai+z50EJkC+T34c8cslQqK1zDeuH7BuXCFvpPN7eGyqtN2JNWYlPkghOF5xa6VT/nRs2hUAaHKaFYtWd9ZEeotPF3mrRu5mWLu3zQBQ0cb7BX2cZiL5O5m8qCOpY10=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3725.namprd11.prod.outlook.com (20.178.254.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Sun, 16 Feb 2020 23:03:05 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2729.031; Sun, 16 Feb 2020
 23:03:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: use spi-mem dirmap API
Thread-Topic: [PATCH v4 2/2] mtd: spi-nor: use spi-mem dirmap API
Thread-Index: AQHV5R0+qiTnjE1KoE+/GBVEMuITag==
Date: Sun, 16 Feb 2020 23:03:05 +0000
Message-ID: <317446312.Rl8damQZns@192.168.1.3>
References: <5143a90d-fede-7025-9eaf-142414c803c3@cogentembedded.com>
 <13ff717c-a85c-8532-b86e-1dc04af0c9dd@cogentembedded.com>
In-Reply-To: <13ff717c-a85c-8532-b86e-1dc04af0c9dd@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b07ef0b2-b37b-47e7-cd22-08d7b33461a0
x-ms-traffictypediagnostic: MN2PR11MB3725:
x-microsoft-antispam-prvs: <MN2PR11MB372553E0A99C2F588E8D3A29F0170@MN2PR11MB3725.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 03152A99FF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(39850400004)(136003)(366004)(346002)(199004)(189003)(66946007)(8936002)(5660300002)(66446008)(66476007)(66556008)(64756008)(81166006)(91956017)(4326008)(76116006)(8676002)(81156014)(86362001)(9686003)(6512007)(14286002)(71200400001)(316002)(2906002)(54906003)(6916009)(26005)(53546011)(6506007)(186003)(478600001)(6486002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3725;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kMg1PJxhjYjU6NZc8ruyoB4tXj3YL2cwYfwgd2SVHiwzB2oes+C4KBGHT28jWoxUyfa4OY5s0v1lmMXCLoLtwpFVbqCsPsJjEKEwKRqgfl/6xaZDcqGFhH7rQzQM2icE3e/88zks8Dk539Fu9MRJBicS5zFcsohABuvzJMD2Ju33PDHFty5eRSxaFP83NYqtiAaKdfotv7vawfEUEW15U8UWKG/lbsOxNftJ3VFEBgdsF16MpXULCocVo3sqmpQcBeKyQLRDyszeeKltDkKEtzSFYNk83/TUw8W0dthFWwTSuAYfaE3+eqstC2W+okKtuRAkZ9d3ecaGiBrz42sVgCfRXTCspiCwDi6VuJPfM4OXRJdk9fS4Siyp7vhE7vw02ldfaIxBAuZg2IHhRqziKgNFr8XIG1WDxLh9YtjF3pve+7tEqUdndj2W6B6qyjnKV4yVe8LvRVH/N+NHua07uK3uLUQeyXtee1vPWIWRtmEHiSIAOp9xpC+ya1W58IWq
x-ms-exchange-antispam-messagedata: LTExlYniLgWO0LZaE093beGsnlIsy+NlUizqrW8iykrXRRHtARdsIGpbDVtt5HO7KJ7AQ6FVrhJ0QDcUcM9IrCjXpcCOR/LGlZ/1ANIx1Sdsy8XUt+JEYYtqMyq+T1kaA2rC/WxRryRjQKWwF8tg4Q==
x-ms-exchange-transport-forked: True
Content-ID: <CBC613115A668E459333EB13609A757E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b07ef0b2-b37b-47e7-cd22-08d7b33461a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2020 23:03:05.2145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bPb56HBbYpMmd7UqM7MTVOkhyM5MY6KKy/I0Ngm8Cjzkde2MSGPsW8SKTYCfNnGcSd5cn9EJ14UDkg8SF8wA7xhJWcXrjf6B2OHcRoXn2aA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200216_150309_755433_72D497D7 
X-CRM114-Status: GOOD (  13.07  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Sergei,

Looks good. Few nits below that I can fix when applying. Let me know if 
you're ok with the changes.

On Monday, January 27, 2020 10:29:06 PM EET Sergei Shtylyov wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Make use of the spi-mem direct mapping API to let advanced controllers
> optimize read/write operations when they support direct mapping.
> 
> Based on the original patch by Boris Brezillon
> <boris.brezillon@bootlin.com>.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> 
> ---
> Changes in version 4:
> - moved the spi_mem_dirmap_{read|write}() calls closer to the ending of
>   spi_nor_{read|write}(), adapting to the chnages caused by the new patch
>   splitting spi_nor_spimem_xfer_data()...
> 
> Changes in version 3:
> - simplified the way spi_mem_dirmap_{read|write}() are called;
> - added Boris' tag.
> 
> Changes in version 2:
> - moved the spi_mem_dirmap_{read|write}() calls from spi_nor_{read|write}()
> to spi_nor_spimem_{read|write}_data().
> 
>  drivers/mtd/spi-nor/spi-nor.c |   97
> ++++++++++++++++++++++++++++++++++++++---- include/linux/mtd/spi-nor.h   | 
>   5 ++
>  2 files changed, 93 insertions(+), 9 deletions(-)
> 
> Index: linux/drivers/mtd/spi-nor/spi-nor.c
> ===================================================================
> --- linux.orig/drivers/mtd/spi-nor/spi-nor.c
> +++ linux/drivers/mtd/spi-nor/spi-nor.c
> @@ -306,6 +306,7 @@ static ssize_t spi_nor_spimem_read_data(
>                            SPI_MEM_OP_DUMMY(nor->read_dummy, 1),
>                            SPI_MEM_OP_DATA_IN(len, buf, 1));
>         bool usebouncebuf;
> +       ssize_t nbytes;
>         int error;
> 
>         /* get transfer protocols. */
> @@ -319,14 +320,23 @@ static ssize_t spi_nor_spimem_read_data(
> 
>         usebouncebuf = spi_nor_spimem_bounce(nor, &op);
> 
> -       error = spi_nor_spimem_exec_op(nor, &op);
> -       if (error)
> -               return error;
> +       if (nor->dirmap.rdesc) {
> +               nbytes = spi_mem_dirmap_read(nor->dirmap.rdesc, op.addr.val,

op.data.nbytes = spi_mem_dirmap_read() ?

This way we can get rid of the local variable nbytes.

> +                                            op.data.nbytes,
> op.data.buf.in); +               if (nbytes < 0)
> +                       return nbytes;
> +       } else {
> +               error = spi_nor_spimem_exec_op(nor, &op);
> +               if (error)
> +                       return error;
> +
> +               nbytes = op.data.nbytes;
> +       }
> 
>         if (usebouncebuf)
> -               memcpy(buf, op.data.buf.in, op.data.nbytes);
> +               memcpy(buf, op.data.buf.in, nbytes);
> 
> -       return op.data.nbytes;
> +       return nbytes;
>  }
> 
>  /**
> @@ -366,6 +376,7 @@ static ssize_t spi_nor_spimem_write_data
>                            SPI_MEM_OP_NO_DUMMY,
>                            SPI_MEM_OP_DATA_OUT(len, buf, 1));
>         bool usebouncebuf;
> +       ssize_t nbytes;
>         int error;
> 
>         op.cmd.buswidth = spi_nor_get_protocol_inst_nbits(nor->write_proto);
> @@ -379,11 +390,19 @@ static ssize_t spi_nor_spimem_write_data
>         if (usebouncebuf)
>                 memcpy(nor->bouncebuf, buf, op.data.nbytes);
> 
> -       error = spi_nor_spimem_exec_op(nor, &op);
> -       if (error)
> -               return error;
> +       if (nor->dirmap.wdesc) {
> +               nbytes = spi_mem_dirmap_write(nor->dirmap.wdesc,
> op.addr.val, +                                          op.data.nbytes,

I'll align this to "("

op.data.nbytes = spi_mem_dirmap_write() ?

This way we can get rid of the local variable nbytes.

> op.data.buf.out); +               if (nbytes < 0)
> +                       return nbytes;

you already return nbytes below, we can drop this check.

> +       } else {
> +               error = spi_nor_spimem_exec_op(nor, &op);
> +               if (error)
> +                       return error;
> +               nbytes = op.data.nbytes;
> +       }
> 
> -       return op.data.nbytes;
> +       return nbytes;
>  }

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
