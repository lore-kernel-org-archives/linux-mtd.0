Return-Path: <SRS0=XIAy=2A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20548C43603
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 17:11:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBC6A2073B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 17:11:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zhhatwgf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="u16UYDFN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBC6A2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqVOXXhilSQnl8LO/ofPp5ieFqjsjsn16lN2gv5atH0=; b=ZhhatwgfhDdxwB
	X4l7oGMV3RzeWvS8NaFEGdadUI4+14R29Bzg4U8tUs2769ds+W/898nFW06TGiBJaB9kzLwxRr+YR
	CrIxWU/8oq5AaWx1oXI5t6tfEhTevWOKYNvksefG8RDkhPbNTSqo1Gf76cVlBdSqFvGZU48KaBfw5
	ukNUp2etuXYQPblHqSZ1gMkihMsY/kGYFP6W5Gun/MaMrnJkhjFWwvEYHbkuPZ/mcIukk5027HptW
	MFBIgvjppOd3Dr9jGAPdkoCT7+fMPGpsZus4oaRDtD4OoiH+iiaEj0vTfrvJBqseJb0FKSO5xZXUj
	EihEueerLzxddaJZgWVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iej2G-00013c-Ux; Tue, 10 Dec 2019 17:10:56 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iej2D-000139-WB
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2019 17:10:55 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: WJH+HooO1UJOAz/Ieamhx6Z5NMfW7Fw+3TpbSj2b39x6G09fElV0VIctAahmYP34Mzd2gr3EGr
 IbWstjytlOp5t/mIeHvYUX1WJUJ+E8Cs5bs0HquALiJ+RH6iNV2QxdnvZyG21odYg/zeTs4cqC
 IwBxqiZaVxh1YWs6j8I7KcYmFcRVXiDpHr68v6/y6gDWD57UNOY2VGGKT2eu06dCjSj3pW91s3
 6cz49CAuXaWRoUmP7+novPjL2ZupjNdZ1SkhGCU4KoNlnuyfdUg57caqy8MFXVG95AS346BWIB
 /WU=
X-IronPort-AV: E=Sophos;i="5.69,300,1571727600"; d="scan'208";a="59359217"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 10 Dec 2019 10:10:50 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 10 Dec 2019 10:10:59 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 10 Dec 2019 10:10:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUs4tsnS9xzChfxEQkXeYoWN1Rezbk7mrmm1Zj8gXTS7Ca6xTHDT+JEtdN9R7Cv09P5nRqJDRL2OGYMmSD2UyFVcjzrfYAWb9iimZ5otWhFTzl8MP6yFIscyZZ0Vsxb+vP9Mbb3ppbG4JicoA3jploY+KXWywzbr3D3XcU7WM53FM98zvVgXX6y6d3tZekJJncWNaIInPCrPzoB28jzvGiTdKXy24Zz6acDma2sxa4CME6Oo4DsQPioqXngduCYzt7jHjctPc2KVAcs/sqkaBYcCsUr19uGZBfbAlE+YzpUnwe7+iQ0P4DW3bM1TJxdJppV40gzva2iDk/SxnAafgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzPZdQvdk1qSsSQP/5sgo0h7tkSCdvGnz+NRQitsQ8w=;
 b=TT6JWfuJmk4rB42g2uAq3JHFc1GvqMFaacKOnMw6YqaWAgtt7UwTzIEvygv1IizDUMKj05N2xA+1B9YTB1YQhyqagZ//OmviHp4a2GOuIw4cR7xS7x9ymYodinePBKOm1Twk+1u8i4gpvTyGZREFZ24yh+I6iS+vUVjRwNVjk3NYYSUkSJg7exSQV2UHKBr4T78wTznUIceSVyd4VR6NkjFkRSVdqr3ip0l0mAZGe7BGJ9y/DROkTLp96sOlHiPKp8OL7fLBSsqW72v3qsY2JKW4+yq49HckgIebAiSijZvz6eCy+KL/HE5rP9m5ua7sj0BemvdbyyXUR2H8BOQIFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kzPZdQvdk1qSsSQP/5sgo0h7tkSCdvGnz+NRQitsQ8w=;
 b=u16UYDFN1OVgWYV/KNY0h+2B4j2MPJdo+xAvFoScZTpMlqGPE0oYaCsbt0HNZqAoAcFecKpJNMnLpGdARX84Mhs+1fOmNLKrggbiiuIwHqeKKAZX2sRTgq7gaGQUCZRWuSakgFhXHeMdBAKXlEkhAKRzasNmVRW09QBofnJCTus=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4255.namprd11.prod.outlook.com (52.135.37.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.13; Tue, 10 Dec 2019 17:10:49 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::84c:6e75:22df:cbc9%5]) with mapi id 15.20.2516.018; Tue, 10 Dec 2019
 17:10:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <brandon.maier@rockwellcollins.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for sst26vf016b
Thread-Topic: [PATCH] mtd: spi-nor: Add support for sst26vf016b
Thread-Index: AQHVnZHVQnUd3S3MikaMOTXcv3k0NqezvlyA
Date: Tue, 10 Dec 2019 17:10:49 +0000
Message-ID: <ca733470-b953-d805-110c-2696bb9576ee@microchip.com>
References: <20191117215547.163120-1-brandon.maier@rockwellcollins.com>
In-Reply-To: <20191117215547.163120-1-brandon.maier@rockwellcollins.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM3PR07CA0091.eurprd07.prod.outlook.com
 (2603:10a6:207:6::25) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20191210191041725
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94725b56-adad-4d49-b3eb-08d77d93e73c
x-ms-traffictypediagnostic: MN2PR11MB4255:
x-microsoft-antispam-prvs: <MN2PR11MB4255DA5CB70680ACABF4E6B0F05B0@MN2PR11MB4255.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02475B2A01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(346002)(396003)(366004)(136003)(199004)(189003)(8676002)(71200400001)(81166006)(26005)(8936002)(2906002)(54906003)(186003)(110136005)(81156014)(316002)(2616005)(4326008)(52116002)(5660300002)(66946007)(36756003)(66556008)(66476007)(64756008)(6512007)(53546011)(6506007)(86362001)(478600001)(31686004)(66446008)(31696002)(6486002)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4255;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1EK7fHK3sfjtN6HTSp9QwuQGOvwWBsPaXM65rSmhsVetbFl4CELRBvq93TGkAVyzPQezJz4/PJ5O5+Cywzq7m4tE9sZPK1U9ncIYDAk+x+fClpKt8CjmZbGwTsu3Zm2mB+Cx6opvQvzM8mzBGTtM3349foSm/O1ZTBF+AdkoQyQt7QmYtRhJlMj7N7T83cvua1fM+kkIQQU/zeqSpkUIve8H6XxP6+n22d72D8tZDcaZrQkJZX5PU8JUWI7ohnWYPtxIXX9Qmg4t4PIBykOk5FEQZri9cSZONWdejCzXvSrxxz8tvk4b6cLXFHC831WORySzkCwxlUOyDdwhwaWp9kn/Rr3JEc0w8QQHfVuNb41Pzbc5OLKbsxx4CFPJyLjeDlCrwfuzqnJsaxBy4ONc1r0WkYfA07IyTnlR5uig8Y66u7FGXLGueB823OXwsyk/hcRD540ytsA5Vr5OHN7ideJJaTH2SV+NrNMvpu3R4jgjsjIC9LoGR5wvgawERTF+
x-ms-exchange-transport-forked: True
Content-ID: <603D1189F48DE44D8A81CC5EEC16341B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 94725b56-adad-4d49-b3eb-08d77d93e73c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2019 17:10:49.2832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SAGaESVg5Z4rrk/5coe/HfBu4/whPTAG005jUC6PQQNfVR3NeXspeyUauLwR5oPzXz1ZgQDXGBLIK4w0i2lv7CbuXEsbyjD3se0cTQhfPD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4255
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_091054_072538_44016C21 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: marek.vasut@gmail.com, joseph.kust@rockwellcollins.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Brandon,

On 11/17/19 11:55 PM, Brandon Maier wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> From: Joseph Kust <joseph.kust@rockwellcollins.com>
> 
> Adds support for sst26vf016b, a smaller variant of the sst26vf064b.

How was this tested, what controller did you use? Did you test the quad read?

Thanks,
ta

> 
> Signed-off-by: Joseph Kust <joseph.kust@rockwellcollins.com>
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index f4afe123e9dc..500929903f61 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -2538,6 +2538,7 @@ static const struct flash_info spi_nor_ids[] = {
>         { "sst25wf080",  INFO(0xbf2505, 0, 64 * 1024, 16, SECT_4K | SST_WRITE) },
>         { "sst26wf016b", INFO(0xbf2651, 0, 64 * 1024, 32, SECT_4K |
>                               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +       { "sst26vf016b", INFO(0xbf2641, 0, 64 * 1024, 32, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>         { "sst26vf064b", INFO(0xbf2643, 0, 64 * 1024, 128, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> 
>         /* ST Microelectronics -- newer production may have feature updates */
> --
> 2.23.0
> 
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
