Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F782C4332E
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 18:52:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1093F20637
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 18:52:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AGTh7s1A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="pwg3FLQQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1093F20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fbppDDPc///YCLfCuMJ0LfnX6+LUmJzKdvn5ISgxAPA=; b=AGTh7s1AvXQ29o
	ek5zVL/FhGY9VOEuitwlriaOIfeeMMXTfTq6rcv6lmdLxrqs8+vOL6Av7YnSUfpKv2B2Ckl6rT+jj
	9DO/whqPCE/l1VG4vzUcUGOvvtbFQzadYTYZ+nKJfTGUZhdJUAco5+zTtOZJe8rRr1yfc8UXlZrPE
	RngaEdairyb7lNj+mOpKYLgFKIVrJfSvcHwBugQE3YOQt8kd/avRYXpezH4hYgnD+vHms1dvt2oku
	TcM8b3V+DnDBFh5aJJD9Xc6q9r1+4+KJ24GLbIXm9heKLC132bSCOewY5D27GcnVhU009wJZT2rGq
	b9lqb3hdQ3+xDlA10/UA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGSB6-00012T-Gk; Mon, 23 Mar 2020 18:52:00 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGSB3-000124-Ix
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 18:51:59 +0000
IronPort-SDR: 2+mthQdPzNcNxF1/dnTnBdTzsDh3l5nue5hPQgb3JH71y4ap9kntQT49+W0aaEh67xvi8YyVwd
 9o2M+QBXSEWnFPg3rM2z/T1A820Utxa8VlkAVyKWbJEpFEMjyE7PmL2sRbBa+JFkTK/wpGcL3x
 aPCFx2ZKx5R5y8hcTj+4YmsyXJ+L7NVkzJAb2RwI57vs3WGTkElD7Gr5njCToyIDuZXtiWR/Cg
 y6NHk6jkycSe0Zpj9ShzODTByQK0gbQ/+BgoFNxtc9Wdd6PfpqkXEq/k7y3Y1k7a+YS6Cf9/+K
 p2M=
X-IronPort-AV: E=Sophos;i="5.72,297,1580799600"; d="scan'208";a="69881822"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Mar 2020 11:51:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 23 Mar 2020 11:51:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 23 Mar 2020 11:51:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+Q4NU9lRiPhopd4PBcIz46eR0cq6Oi5Spftc7WBRRVNhq/YHxWJKf2BheZ94WJXHqBESMhSHlO03jHLW399R7WwosY5n92yEKua79h5q2id+BWO+BZDr3AqRGjUMxyUK9Bkh3WdOhrIHBN91aQEzA1DFD7LZbexVRpoaWYfx/d5BPvPPYicM9jkBo0s6++Li1h+J7UprJkEUUsHGGeyK1AypO69S4HTfixq9hUzd4h1mXQ3usIvqFbm5NVFVXTsx6+Ofn/rEoaX/v2MB6xDMtBdZvYECme7AbR2/zy6fHBLZDFOTxzHMepHp8qexfGJLM1sfLoYIY5EPQuD9te1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvBDzk/kvM+tRgg1peV7+cwWQCt+ZjVe9r/+RIygwLA=;
 b=Qd++ScPsWuCr71HI8H8jQXFHg2YPPqZ3upZoWuRuqk6ikfFanyaAYs7b1a2XfUbuUCeOrJjWjj4pRkXr6WiOpEGsBIm1TWHP4AB6fwEzzq68IgrHvml9W2euXrWO6QUFNH3N+wuYBNAVYNswkLIakYB5A3PBJ5NIWkDBm5V+SVaaFfiE485aHWy3cd7ZmcpdTUr0Gp3DeZSsg43OzpCSnwKrgRGKDlvZeUwhMznQLcy/PFjUJBBavSpNnMr72RsP4DmM7/Cm71t0NsGRKmMycNFNSm5GQo+EFCongLaZXvKDPjvFtzoK5kzBjVWKoFjyjYtPHWCJgO5qE6OlrBTsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RvBDzk/kvM+tRgg1peV7+cwWQCt+ZjVe9r/+RIygwLA=;
 b=pwg3FLQQt5UHNjZaIQckMhXkEW0WHAP8VtnXzVpNOd1ADQXDKVbHYLiqsBtgiwfOUkUnv+uE40uZ7RQ6wE5MYcZrEDswVEsh/eORI6WcO8Pbs69eDK5MLQZ28SHe/J5bIP4r8t5ABmEFwwRBchxGOxUn3OG8/KKzD+x2qBeMy74=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4069.namprd11.prod.outlook.com (2603:10b6:a03:191::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.20; Mon, 23 Mar
 2020 18:51:51 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2835.021; Mon, 23 Mar 2020
 18:51:51 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH v3 4/5] mtd: spi-nor: Add SR 4bit block protection support
Thread-Topic: [PATCH v3 4/5] mtd: spi-nor: Add SR 4bit block protection support
Thread-Index: AQHWAPTegR7iigdWDECxp9El2paD9w==
Date: Mon, 23 Mar 2020 18:51:51 +0000
Message-ID: <5016025.OgzQjxSONP@192.168.0.120>
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <20200323092430.1466234-6-tudor.ambarus@microchip.com>
 <572905d538f5ee36a1c4d19de720b696@walle.cc>
In-Reply-To: <572905d538f5ee36a1c4d19de720b696@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83bba3aa-b222-4607-87a2-08d7cf5b3fe1
x-ms-traffictypediagnostic: BY5PR11MB4069:
x-microsoft-antispam-prvs: <BY5PR11MB40693B7AF15ACFF262C2B2CDF0F00@BY5PR11MB4069.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0351D213B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(136003)(396003)(346002)(199004)(66556008)(14286002)(4326008)(8936002)(316002)(6512007)(9686003)(53546011)(6506007)(81156014)(8676002)(81166006)(6486002)(5660300002)(186003)(54906003)(91956017)(26005)(66446008)(76116006)(2906002)(66476007)(64756008)(66946007)(6916009)(478600001)(71200400001)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4069;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eCvGTYbcxCrzsTfSWUrsho3DxnQX63Oo4RTHLOPWmUiW5rwgvxF4ojuYQ9v4OODYHYp3jQiG+MQ2p0eHWMcJf1MXWkRD6KNlcb0hF6zAtKC6RQaP12Oer5iMHWtqqvOLon5aGW4zdiuTkK8ohjF1vKSkkxaAYzmF+bB6U6/wANcw5Z7NgvQkgMog/kvh99xJMeO0sPvN0osVL29liZQyv/pr2C88vDMNcB+eQ3ABwbzmfF8n0N24xycz7nGjXWk+dfEevSEWyjyvmjl1SD2RU+LpZ1mcECLCtcNr+GzdaopIgHV/Hs4cj/DngKuuzNlxdHnZZ5/3413gBWGBZBJXWlTngMbEidrXraao38yMk77SLwoHQsiB0x3owmWRbRhoCtik0YJSr38/hNLxYADV5kpOcDjZ8yKK9uP+9VXoFqnWIjj4mpljuFvU0nhHF4UR
x-ms-exchange-antispam-messagedata: TbbtYX3t9sQOZkKD9UnSJXF1IaYQ3jrbpSPRICCESIx7i/1JRwty63iPcinLX0/wyZ2HUVk9jt4qXiBelyCnBVBQXEpcLC+IvopKD1fAO913TuIki2CahFXFQ/QUyvreXBleTxNUcTTTPBWdREbTnQ==
x-ms-exchange-transport-forked: True
Content-ID: <7D097B1BC3B30B4EA986CF01AA44BB4B@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 83bba3aa-b222-4607-87a2-08d7cf5b3fe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2020 18:51:51.5553 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AW64+qFQZbQUCIMY/01/VOvxDQbMCA+YMkIFBfWpuYnb4Jd/Lezu9gml5U/whzH3RGPQ1CpITYp8uYlCDvd+KmIopbL1QzEVdMW3AaluNy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_115157_660046_465A7E4B 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: linux-mtd@lists.infradead.org, vigneshr@ti.com, js07.lee@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, March 23, 2020 8:33:19 PM EET Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> Am 2020-03-23 10:24, schrieb Tudor.Ambarus@microchip.com:
> > From: Jungseung Lee <js07.lee@samsung.com>
> > 
> > Currently, we are supporting block protection only for flash chips with
> > 3 block protection bits (BP0-2) in the SR register.
> > 
> > Enable block protection support for flashes with 4 block protection
> > bits
> > (BP0-3).
> > 
> > Add a flash_info flag for flashes that describe 4 block protection
> > bits.
> > Add another flash_info flag for flashes in which BP3 bit is not
> > adjacent
> > to the BP0-2 bits.
> > 
> > Signed-off-by: Jungseung Lee <js07.lee@samsung.com>
> > Reviewed-by: Michael Walle <michael@walle.cc>
> > Tested-by: Michael Walle <michael@walle.cc>
> > [ta:
> > - introduce spi_nor_get_sr_bp_mask(), spi_nor_get_sr_tb_mask()
> > - drop Micron n25q512ax3 / BP0-3) boilerplate description
> 
> that was actually a comment on my side some time ago. Because the
> current
> example isn't really good and lacks the second case (which is added by
> this patch).
> 

I didn't like the example that was introduced by Jungseung because of the last 
column, the "Protected Portion" -> it focuses on Upper/Lower 1/pow(2, n). I 
think it is better to replace the "Protected Portion" column with a "Protected 
Block(s)" column (see a winbond datasheet), in order to be in sync with how 
the code looks now.

It's true that the current example has the same problem. Would you care to 
send a patch to replace the current example? (keeping two examples would be 
too much). Or maybe remove the example entirely?

Also, would you please review 1/5 as well? I need an agreement on that before 
applying the series.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
