Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E4AC433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 18:37:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E50E82078C
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 18:37:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vw4xz4/R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Og8PbWQw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="r/Lyv/sJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E50E82078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0VO9koum7ONNi0w7l1/Oo8HQFffYygjikOdNxl39ZGw=; b=Vw4xz4/R1QtUgF
	FV1zLSUgPLVC3IwF209QdkxPX6V04rn/Zr80m0VyWnu7s5E8D1mI+TYSSs42XRgZ57Tq0YZX58Lps
	QC6UNQpJcjl+xvcfXvsoXw3w6+bsynxyz1CA+9DrgJIxVOFJQA1Go6Cu89RsAfYHJEnDcb32ebNOS
	w5ED9r+3Vlzrri15y8kSyWQ0XQu4YufDH2yPQZGICSCrXiHEi1hBgQF6HT0g0lCyv6y3snetd70rB
	n12Gc5xw/1sOWgEFl3JVhyOdHB2QROUAl0oG8hi+R6ooQWCdUQxSreTMjOy7Wn76IpKdLwVZVVzz9
	H+oTIDN53/Y7GmEtj6FQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeNPO-00009A-Pw; Thu, 28 May 2020 18:37:38 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeNPH-00007p-6m
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 18:37:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590691052; x=1622227052;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=ZC+4PF417J+7ZXy9R0MrjLQuKiZGnap3XzD84XPhR14=;
 b=Og8PbWQwQq2/ekm8dnOsl+NMfWsQLsCjoFtdCU1x0ZUa7MhEfqwMcPOr
 BzNGgncxGJfoHxrqqSsHjE6otMVfbKVok6LXDaqXvo62r1xKZ4X+kMRwH
 HwQtMa1SDIUpIX3X7Fpt7R0OMHUEAwX2VyQoJgPm9av10U7yB6mOUaksX
 zxwgM/jgcXjaSV4dIjiFWdsdVKbkX7KvTVy/pFTfakyHWdeZ6RN+7p8jL
 9tCsvZBlFN/Oe8z7C4iqhQCfLURhuCtzk9J8GJeRt6bx4Gzky2MC5iuf1
 PkjJ33bmhHuks47ImEVM7mIF5YBRD/BDtCP9326Ix078Bz86teoTzb8Mg w==;
IronPort-SDR: H+9o4FzTPSLEoc3HfnF68+fARoZEyywEjMwf+6FqlmfVwDZ5/PGD5a1fjISOeiI6Uwv4Kj+XJB
 l39S4bH1LTy4IxCedFi65GimWPd7/Izen6wxFOmddycTdF5CWu7kH5DOWnAqb+4Cg75T3bsac2
 9K+FEpBFU0jwN7yeGJQ2ko/DX5sZ5QTfRre4ouTFpYOGJuULHafVIIMRqXQJOBHQzq4rguM+6W
 61/pbmGbQldBJBmP437UB4OT6oiOa69bEX2jeDPfI0IVwBKomyBVmm75HgUdsAWTRcUYNaLhpF
 G1k=
X-IronPort-AV: E=Sophos;i="5.73,445,1583218800"; d="scan'208";a="77413573"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 May 2020 11:37:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 May 2020 11:37:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 28 May 2020 11:37:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgLBHxYrop/woSzkA+S056WTjkMdLwdq1XoQBzZmTnJBtS7PGXPGl27VaeYX4KPP5CX2BOCR9tkzPCAkRAM7TYRHCiBeBKpuS40gkJYPZyDE4f55UoCkURtZcrcXlpJrf6ebT2Ks8e0twEOQ8wfcVxXNcsc6SNs5mu3Rk3XuSBgFmQ1gDr3URJa9hcmxz21CXO5yXEKAbJFEESxn1HlYuQGkZ2IYT69Aud/cdcYoXeuNAtQeBb4xpPNgie6wzAaNPEukyBRmHwJF0feUzNOq+nOTA9kTVHbw5WWh6gR1okAmp1Q0wbq9Nftxdah4+9zZOxbdlAdjc2YU8wufQP8f7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/40cNo5Ei2pzFNRIVeQ6QVzkm3FJKwflvU8kuosvgo=;
 b=FAZvMClD5ssM+2dfzYsAaHeGOF0pK1ACKL93CRI79+sldSLs87OSnJ247mD7X6ztSKCg349jzYIvyQxOliHXkAScZFA+Ea2wz1PnYwIGOA/EwKc7TF43y7u0GIvH7hS6WoQl88jjnouEqd4H3UozmNBbtJix1owqr1qaC2A1TC6luzGKpVzJPMTe43zvVmFdAxZGPauxuui7Ou0/RHN2EGCmXQ9vN3BZjhCW3yaQAzfzTuv9mMCpdn0O8UF8x7bvVN9zK7wBCMDUSWLxf0gYnzFdHXQbU3w6oRbm2sKkGlrSP6Quk5IvU+tVZk5jwA+5VvDNlHWYEq+HIsxVhkE/7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/40cNo5Ei2pzFNRIVeQ6QVzkm3FJKwflvU8kuosvgo=;
 b=r/Lyv/sJg+65BWvN46rXAglxHiJI3rPWKgENY+a4irSuYvcUt189Xa01mX5TBld3Bx5yYOkbZYYBVdQUPjKfk3Vg8nbQG2Yq96cW1Lll8IIuPcxhu97nc0PjqAkVk2BD2dfsyXB2hMPYZRCXwyEAnKf8JL5TG5zR0ja2NT4E7U8=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4386.namprd11.prod.outlook.com (2603:10b6:a03:1bc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 28 May
 2020 18:37:28 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 18:37:28 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>
Subject: Re: [PATCH 2/6] mtd: spi-nor: cadence-quadspi: Provide a way to
 disable DAC mode
Thread-Topic: [PATCH 2/6] mtd: spi-nor: cadence-quadspi: Provide a way to
 disable DAC mode
Thread-Index: AQHWNR8J45vtEFmIPE2fbETkM911ng==
Date: Thu, 28 May 2020 18:37:28 +0000
Message-ID: <2963748.sPVSOTQjie@192.168.0.120>
References: <20200508185411.487-1-vigneshr@ti.com>
 <20200508185411.487-3-vigneshr@ti.com>
In-Reply-To: <20200508185411.487-3-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f8c94d8-41d3-49cd-4136-08d803362c93
x-ms-traffictypediagnostic: BY5PR11MB4386:
x-microsoft-antispam-prvs: <BY5PR11MB43868A42DE70E2745752B695F08E0@BY5PR11MB4386.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ISXlBzeW5wXykNHpJv8tPnoFN/mK2v5ojGwaEA0I4N8kBpPoo4+49lMg8HO//Bpae0sEQ6V846iE55Gd6OnqWod1lxcw8rIeUNV1H9xbqjhbkTIyPiPqLu06Qw2U7XEH2IuGntnjC06N8qPz2c5Ugn3+IawRlL4VTchPk3+mhyxG2Tmbb4pqFE4YmMSuUqVb/QXk6QauhJtMSBNZ6mKDAHfAgIbjVwTSfCbNXifi35O7mkAmfyKiOuqwKzvRl+XbduyzaMNgQKEV6K1cbCDrKyv9cLNjlKpHiHaMkCbkNt1BbGSeW8DCQeVy4htSufQVNPAsS8Yh/Qeu1no2BtkhpgCgD76+yEUmCyDaol/0E8G6ejGJ5Dv8mm7r4muBSOiF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(346002)(376002)(396003)(366004)(136003)(39860400002)(14286002)(6486002)(66946007)(91956017)(76116006)(8936002)(316002)(54906003)(26005)(83380400001)(53546011)(6506007)(8676002)(66556008)(6512007)(64756008)(66476007)(4326008)(2906002)(71200400001)(9686003)(66446008)(7416002)(86362001)(5660300002)(478600001)(6916009)(186003)(4744005)(43043002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: u3c3VOAgoP1ZpS4fsEz06sq0TiLZ3sT6zCZfZ+ATreeUXg4sZpbNBcHl7el2n/5Ss7IzOsPr7S1YVySdmydtnU9B0Ljcr0urssxclyI8Txg4/DoTXTlrkjScZ0sureHZWChNIsuDow4OLKWgIeCulY+uAiVK/uyXuzdVVkEYj7cEqBVXRVbtK15kymIy8qTYtshFI/jJ3uqRVIiekvkGH2GeqWyMaZsmfuRlualhAfESq4kfKhb+fQJKGr9UdmK2QDJmxMPR0FY6SXjWTCdsrRxo+vdH/hFfGnJDwmTem+o3BhtR5HMiEWf4qB+B92VZzzwo75K7ecwiJ1VH8tIdmQIjmdc5ho0HIvN3TptgzYP2nqCF6bjWIn1dCBWFhzkmLJVddS1125Kymy4/+Jsw0aJfMGBsB7pG7hf003pts8vhOnxYbFSaFfCynq8EtvqdYWpWiq9RZm5HR5avbyWpvmRAVzsfP7QFoPxp6/uibKY=
x-ms-exchange-transport-forked: True
Content-ID: <99577D8AD56E33429E5FFF694D09518E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8c94d8-41d3-49cd-4136-08d803362c93
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 18:37:28.2261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nj8WRC3OiwCzQsmN46Or5FcWdWEn9C96WDCXc+PUcPe7DB/IHyfaca5sjhXgUkzU6ZHaskkFrI4flqvaiMNHU7dxfBBTbRA/vzY2f/wIIsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4386
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_113731_341765_D6FCBDA1 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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
Cc: marex@denx.de, bbrezillon@kernel.org, dinguyen@kernel.org,
 simon.k.r.goldschmidt@gmail.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vadivel.muruganx.ramuthevar@linux.intel.com,
 broonie@kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Friday, May 8, 2020 9:54:07 PM EEST Vignesh Raghavendra wrote:
> Currently direct access mode is used on platforms that have AHB window
> (memory mapped window) larger than flash size. This feature is limited
> to TI platforms as non TI platforms have < 1MB of AHB window.
> Therefore introduce a driver quirk to disable DAC mode and set it for
> non TI compatibles. This is in preparation to move to spi-mem framework
> where flash geometry cannot be known.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mtd/spi-nor/controllers/cadence-quadspi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
