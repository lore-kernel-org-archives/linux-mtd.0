Return-Path: <SRS0=EHtI=ZD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB0AC43331
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 19:36:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F782214E0
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2019 19:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HoQs3ZYt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="HNGXT2dn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F782214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YsgPqslfm5jk2l627LkiCqYxLJBdxYQc+leyplqUic=; b=HoQs3ZYtS/Q49x
	YKoY6Ngic8BMFRjwU3shTSz4Cr/DzUKzNQZA/dAvyFBeJ+Uzju/024CAhJBdmH+DIRmc+1E+xUm1G
	qmjVd1vH52ujTyunsmdXDoW7NrDd+rkjA3QOCQKcf0VosYnlEN+Cl2APkkeCQRXPHzpnRH5IW/Ice
	o1E2ZaXDJMV4NQDaW/rs/FRVdYHVpz1tPZhzgYcemWw0jaq3VPq9OfXq75Wqa7uYX1PgqYK03yUKR
	jifEuPAnUiS+FMxorQ667r4pXf0xvwFzn9uMy9r11wTxhOWit/TZFKU53vJgrjHfBOXuruEewlgr/
	4LVb1VAmWROI9NpLVTKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUFU4-0003mo-KL; Mon, 11 Nov 2019 19:36:20 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUFU1-0003mQ-RN
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2019 19:36:19 +0000
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 9n7/+3TlStCUbizOe9iZYp6eMCCXRK8U5suCrtytQmkhon8mZ4Im6IpCh2MFprSBGnMNZ5QuLE
 RuyqSbi+bMunlQH8GmXYA5OjqmAIz14qTbyN8UnALhh5s8Yd2pfqtv7IZLjFSq5cgd5FBcG6HM
 wpYit0XJX+is6bkFo8WvK3AYvUpMhVJIEDJhQtZ8Fle8NWsIHkKeAJsXDl1FbgpkL8VwY9EWEJ
 +OeRjSdBjp9uiQ/WkOAgQkWu970+qZkU7ULi1OpUFS2RlNcywu+uJGzGezJEQkW9nEKLfR0Vlz
 5Q0=
X-IronPort-AV: E=Sophos;i="5.68,293,1569308400"; d="scan'208";a="55008736"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 11 Nov 2019 12:36:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Nov 2019 12:36:14 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 11 Nov 2019 12:36:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kLm9cS4mGZSz398gpVYflHIPDusC1I1qR9zgFN06IBYl/cl6MXj12yqnSkHfQQBk694aYG1dpIriHqX45jJ4QKPYEphRKYpOY1CaLv2nX0lAqNgnLUMOPrc1YK7Q5YXUD2+XyHhKUR1zFRNaDIMOlvhMX79d/4etLgoXc7D32CYEn5gnT9nDKCpbKUWMTZjyp8oVtYV5FF5SFAxROR2DMR/2MFbZBFl2VsGkG550ecge/BT5u/MjSgkvSHOnPVMqFD0A3ryfJcsucLNZogfoJAAuthl3yKkh0DiAHp3Qt62ov3YL4zWM4+11XNC8dWi97eAi89a//CMwwD/bGc9GwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdvO+cf3Z5uNQ//JVMGYkda5jBPNS/JA0fyRYcYqH40=;
 b=dojs3JUXLiQhHsSZuXzcd3hNKtzyjsBuk2+34W7iSGgMaLj0gKNA+Fa5anJnAbUAszMchT9lVi4DYQaja6a3NY1FKXkA1fMDc4b6O2GI3u4GjP7n8ydNGbQjGOqr5M2MMxB2JjIXd0PdgOlezYueUx1aRomFUAlyXOkWNbmFrexL39sw9JJSkdcKECN5zcijvHxX3/gwqnNI7A0iGHFz0fyNeI9YSUJagyLXlDdqT9sgjXXv+UCnOphe6Q62wrMGi7kT+2zPbW83FGhAWGyfCi5P/njGn/KY/CE0wFHXGG/ie09T0pdNwHyLX2cdbH0z3tvSAzFHhMZnZET6ikAMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdvO+cf3Z5uNQ//JVMGYkda5jBPNS/JA0fyRYcYqH40=;
 b=HNGXT2dnUsKQffCHiqFilNTMAtCpyzu1kOOVEwKrYrvMU/RXSw8cwQq9YZ3Rlwt8jXv0S7MgO+XL6ViZa/dukqY7sTVq8P1Db+YV7PmG1mN45P/zDY5OJ1qoUVy2AsXqBDTtut+VTyfEGKMWMrzuRdkCTDBeItciv8UWvgqROnw=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4128.namprd11.prod.outlook.com (20.179.150.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Mon, 11 Nov 2019 19:36:14 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2430.027; Mon, 11 Nov 2019
 19:36:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sagar.kadam@sifive.com>, <vigneshr@ti.com>
Subject: Re: [PATCH v10 1/2] mtd: spi-nor: Add support for is25wp256
Thread-Topic: [PATCH v10 1/2] mtd: spi-nor: Add support for is25wp256
Thread-Index: AQHViP1BNjlSY/AumkmGAXgnFs7kjaeGfIuA
Date: Mon, 11 Nov 2019 19:36:14 +0000
Message-ID: <63648416-6391-37b5-5fd9-e683b9e5b79b@microchip.com>
References: <CAARK3HkOwyvg=xr7fw1SrP_=B+Gj+waQmtZvgiK4AUpQrbM41Q@mail.gmail.com>
 <20191022172210.19865-1-tudor.ambarus@microchip.com>
In-Reply-To: <20191022172210.19865-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0174.eurprd07.prod.outlook.com
 (2603:10a6:802:3e::22) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [5.12.60.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2ac7db4a-dd7d-4174-32aa-08d766de69be
x-ms-traffictypediagnostic: MN2PR11MB4128:
x-microsoft-antispam-prvs: <MN2PR11MB41282A92D2E58B8DF4B2DCC8F0740@MN2PR11MB4128.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0218A015FA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(346002)(396003)(376002)(136003)(189003)(199004)(8676002)(5660300002)(8936002)(11346002)(2616005)(99286004)(446003)(81166006)(2906002)(81156014)(305945005)(102836004)(7736002)(6506007)(66066001)(4744005)(386003)(76176011)(31686004)(26005)(53546011)(71190400001)(71200400001)(2501003)(52116002)(186003)(25786009)(229853002)(36756003)(256004)(476003)(66476007)(6116002)(3846002)(4326008)(6246003)(6512007)(478600001)(6486002)(486006)(64756008)(66946007)(66556008)(66446008)(6436002)(14454004)(86362001)(316002)(31696002)(14444005)(110136005)(138113003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4128;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GUueQkgLUzL8T2lZktkBcsJaI3S92+1YOaC8wjm94R9rzcbA7lsxnLoxeV+XbL9cM+22W08YV0eHhcgyuvc1nv52lNKaiBmwW6fGwdYMDJpQXChs5AL06swUqbaHYlmMEFrDkeOzpCwYqEaW+g5KmdeSHCKRCVeCzA31ojvc+UOot5iUJB1oDCUahoryZ0K7/RZ4+Sfk4bWcVRhhPkCrGDycbSjLK3tLcetUNYXWK8d6tAf9+WVhBPDMLmTZ02nlTRh+PlUUyBrVDagICuudzF94+Nzdt4sLFsNqGS7OAy35WHCbpCfIgt9uZHvyAJvGPuupU7c3jUpMeFMRHOzIYqypiaxuRl6uySRelhDwMHRTiF8hVTbwRk1RKTjSS1+oc/ypjWgJI7WTfzI2gXRGxu7uKsm3SXYGIebaAE4hQkaYDf0XiwcN176cZFbknkGR
x-ms-exchange-transport-forked: True
Content-ID: <E24F79D8D04AAE4694BC182EB7FCFCC6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ac7db4a-dd7d-4174-32aa-08d766de69be
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2019 19:36:14.1568 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SGyMmSFb78mAVupuK+RVijDS+ROM3ypBK47snQ/yj7J9nZ2K5vfrch8NFGjsrcayMsyOWry5W8c3hNCerjernU33iSGSl2TpiLI8U+fCY/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_113617_892454_0BBB7D65 
X-CRM114-Status: UNSURE (   9.99  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/22/2019 08:22 PM, Tudor.Ambarus@microchip.com wrote:
> From: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> 
> Update the spi_nor_id table for is25wp256 (32MB) device from ISSI,
> present on HiFive Unleashed dev board (Rev: A00).
> 
> Use the post bfpt fixup hook for the is25wp256 device, as done for
> the is25lp256 device to overwrite the wrong address width advertised
> by BFPT.
> 
> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
> [tudor.ambarus@microchip.com: rebase, split and adapt for v5.4-rc4]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
> Sagar, I set the fixups hook in this patch, to avoid adding support for a flash that doesn't work from day one.
> 
>  drivers/mtd/spi-nor/spi-nor.c | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to spi-nor/next.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
