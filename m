Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A731C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 12:52:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13EAB206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 12:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZkEXYTeL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Mi/meJ+2";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="VbpH966p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13EAB206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ldpC6X5GAghfmy3OIgE8UmGm8YvdRKzvjFN/4C04RQg=; b=ZkEXYTeLdgDB4K
	nDUvp4qgQYHGhv4J6lmaCGb0/yjXXQmY1IUTkKiMOfWJ/06HTWmJhjKiVbpjsOg24DNKHB2KsuuA0
	UXZzzCs9e860cLxyw0uR0H6ChA4O6m6qPotHMwGF0NI2NIu52Fdr7LqMfocVFAjNzMWWmm1QIyMqJ
	uNGqOYe9xzW7Bd+guAxJq7xudwtrGSVoKO722beVeDSf5aiA2XsmS70QnKweea2NPM7aBnT5I1nw1
	mbL9arNOUUazOBLTD5gj2Fg+ldmu8G9lpmHWbGrj0rV8KZ54v7Rglsv8gNIliuhaICqjF8MHolyXK
	cxAdmRyzrFr9mN4c3h+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQVu4-0003Nv-L1; Mon, 20 Apr 2020 12:52:00 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQVu0-0003Lf-Bp
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 12:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587387116; x=1618923116;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Bdd4cYSVVk1v8N6BD9nIYtyj1WaGVGSbM2oZAhmJSjs=;
 b=Mi/meJ+2OdIvP0Zv+dl1R+9e+xNdMvEq8VLOb8qWjZ5z5SlXZ0Cvgk+7
 sw+Au3Oq5K+fXGTzYWi2yfWbHpyJh6SjELjc6MGiusAPOYu9ChP18YoqU
 ezFtXGINRMAOSraj4xTOxzfNQPzq2vynX7NPESMLTCZVF0e9dF8db+/Gt
 1/v8ELmik83rVHTZq625anCO8nbYaCXIiPm8uHejDqQxWKm0oLVI+JR1e
 +Gp7ujpbSrwgq9UVO6nNxIQZJRED60pGFEvCZh7JCW/K/oO/7uAo2mF4R
 JKrCi1q9cNmjKprip7Zz2Wr/FwXb+geh0I+C5qJ9OkG2VjO4W3YMsGmmC w==;
IronPort-SDR: cY2r/G2shROIY0h87iLBtZM66x7f2JFEPRaQPoSmUHELfZVNxGspBzpvF/Lq9PS+lKkNpysdtc
 yED1wCFDahHL1EaJ1oM1JkjRuE5gnxlWTL3E1htna7HGPk5EZtxBu7HWLQitiIVqsEaATmRoz3
 YsUVzN4V26Vz4rHDkoRnLlyOkE3/Gv9MH1ea4adXOj8RxvV+DeMCfF53nBV8GPI7/GQitXXoHM
 1ju3Kqgt359uPenvIZtisJAgQVUknydO7Nn3g4Q09QPzGCyZK11iwqq0XprgELY+LdYopUSkR+
 cPc=
X-IronPort-AV: E=Sophos;i="5.72,406,1580799600"; d="scan'208";a="72736294"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 05:51:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 05:51:26 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Apr 2020 05:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ez7grx6H5eRQiMKgVBQqV2nfuNY9ZUYApzab2ik93sjRQUl1/CzEgFjzgxVBKQnXS8yI031dY6TSlLtsiYvXTcrrXRopXhpZeND+YNMwIByZZ+I4lI76MSE0Bj2NubnA+xvKmJksSnnuu+msNMvQ4AllGPVinwaiu7XqvIOGtaJU6rCdScCb35Vi1PuFwHoznWaZpOeDcLt+CPtbFhKfZ0OiGLAZioiToji2YHoNt2mrCag7uLnh1u2gHS0cwcJAuQfjpekNKucO/h4aM6G9az4HqhEf9vi60tj9V006YvR+d0RWKrS3kaklPLOjTyUoSJ9gSXJtrFnryB3j1kbjIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=On1CmoM3SG6oye/Y+wJv05xYCWOvOeWwX26l/t+rb70=;
 b=miEJq9uD+QMHocPhDiGCUXPL4yCaC0obvQtQiN1cmfmC5znx9874XJFe8L3KeB+qhJMics/iqCKMEaVV79YTqMIP+XDYTUWP66oMZ777kBjoqIdgd3jCQR5ulMfU16u4koMRSY+fw70eLSODbwtE8IeCaKNP0gbxVtJwsqLMxu4On07t1tba4aZNCoFQwXI2TNY/zWTtBE++x/f1p86JnanKvp4ycNxvEehemP/4ZK+mnHuR1pt0VoImrTPz8+NrZTQtf6q1Al4UXyLDBTbnmUFfjIEeIyGUmaYFwdB/mm4IZML4kQz++f5zzTyvcQuoAf2RHm35oRna++N79GP0Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=On1CmoM3SG6oye/Y+wJv05xYCWOvOeWwX26l/t+rb70=;
 b=VbpH966pG9fnb0JFDtHbDHi9+VysZ5EvsnMi26+zJkM1eRAYnYBRj+DretSjKN98eJsxE24olJH+ORcENX5anag59+vrwHkBIvCNz3clW3KnG2MNXhdNAYZwl1Y2/jXkgRfB69cdGKDlLVpDfiNbhdclqZ/HsTpESfCQ/8gLsVo=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Mon, 20 Apr
 2020 12:51:50 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 12:51:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for s25fs128s
Thread-Topic: [PATCH v2] mtd: spi-nor: Add support for s25fs128s
Thread-Index: AQHWFv0JvKPM1oUd6UaD45+u2YvC9g==
Date: Mon, 20 Apr 2020 12:51:50 +0000
Message-ID: <8687029.PI0sD00DY9@192.168.0.120>
References: <1586939433-20861-1-git-send-email-yangyicong@hisilicon.com>
 <3664588.JgWbhVaYgF@192.168.0.120>
 <7a8b4b41-66d1-afd6-b8a4-b591a7fa36d4@cogentembedded.com>
In-Reply-To: <7a8b4b41-66d1-afd6-b8a4-b591a7fa36d4@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 45e4b1a7-6427-4e0a-19d4-08d7e5299808
x-ms-traffictypediagnostic: BY5PR11MB4260:
x-microsoft-antispam-prvs: <BY5PR11MB426061A513EBECB864F4ED61F0D40@BY5PR11MB4260.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:5; SRV:;
 IPV:NLI; SFV:SPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:OSPM;
 SFTY:;
 SFS:(10009020)(396003)(346002)(366004)(376002)(136003)(39860400002)(6916009)(8936002)(6512007)(9686003)(86362001)(8676002)(71200400001)(81156014)(2906002)(14286002)(4326008)(5660300002)(478600001)(6506007)(53546011)(26005)(6486002)(316002)(66946007)(91956017)(66476007)(54906003)(66446008)(64756008)(66556008)(76116006)(186003)(39026012)(138113003);
 DIR:OUT; SFP:1501; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cNBGgs8plKhNMXaN3tT8lNxtfJrZvL/FehFebRM1fdQ1KublU0DB38jpxor1WuJpccgMkrLRDSp8YRQIOCddswQE5TiiI9msj78gxNZ8xqL9JIFJI4DpO/+6t1GP/gmKLw/IBo9Sahi69Air11yOTzad3h3mRQs/Ag+fSKbIB+90s5cfK91U2JHF/UYpbQSmIPbmgtndKpYpwaaoEGG2DJOiWz7+9de/xF6VX2UknkPY9HFWmdUTRgYpLEE7n4iLs84wdP/HwTqhKB23+kTan5UodiRVaG13zCvjnTgtRmNI3g5q7lMmVBK8TcUzrrGgiF+xiVKkUmIQjoM2W4NE53fT2XYvyrfTJPCZHIlEg+Qm08Jwdq3YdSmcAvOzvdSAG4gkgjBMwotOT3yVb5vBunwFXCrOKyczTUS0BSHTBow727X8o8JFTakXxoWr/SAGOXkPYEEEfMjPfyozkE3kyNq+v783WyxWiKBXn6Ofm9/WMMc3u2f4Vtx/0YlQEYVnQnMX656/Ng6AETYgQO4IhTahxqWhL9ejV2aEayc/4SJmDgnC//NDWdqGKxETAz0Fv3pX7UGKUcx4O+DVxOaOujn5lc+RvOZK3MfJ3MOkjNDgsQw40baUu80is93m5+O/aZh5Q9rqnNJzwp2JsYI4CepEowAJioK21TdgH6WBHXA9re2bk2YQORxEaCvt4vJDKjmWcqrDRw2HSBBMp1s1ahudNIbTtGgXAqDdKUgUG6R8eEljdPwmmkT1rm0KuPqXRBD3h7vC4sIbqVfs/UDI3KnTVQiEhGy+zTLdP+aCUhU=
x-ms-exchange-antispam-messagedata: YnnH787mwMHT4Lz84yrOqWKAhhd4oj8dOQkQaa7F8oGyvjmT+QXkjwYf5jj0sTMbfkgfXx/qsTOALLPIGY/aRqkOlZzXWnTC6OgVV5gPc+iiBwW7XVZsJJCgSfYD/25ci94g82ckJa1ZDYoQZFM6tg==
x-ms-exchange-transport-forked: True
Content-ID: <8220204EFC34FB409E69D5AA819072FE@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e4b1a7-6427-4e0a-19d4-08d7e5299808
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 12:51:50.2462 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TazbEIeytYXO1IpjRdRlSVk3toZDxdP4OX93/pSCg8KDborGy90HLLPjcCYZ08a4iK+sDFaqZ8+hYoXD2lgt+X1/qoPWUKirOd4h8Mw/6L8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_055156_571721_6A039A23 
X-CRM114-Status: GOOD (  18.27  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 linuxarm@huawei.com, yangyicong@hisilicon.com, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, April 20, 2020 2:05:29 PM EEST Sergei Shtylyov wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> On 20.04.2020 13:18, Tudor.Ambarus@microchip.com wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> the
> >> content is safe
> 
>     Hm?
> 

Please ignore. The mchp email server adds this message in the body of the 
messages received from people outside of the company. I see this so often that 
now I ignore it.

> >> Add support for Cypress s25fs128s flash. Previously the flash is
> >> decoded as s25fl129p1 by mistake.
> >> 
> >> Add it in the flash info list to correctly decode. No functional
> >> changes. Further capability of the flash will be parsed from bfpt.
> >> 
> >> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> >> ---
> >> Change since v1:
> >> - rebase the patch on v5.7 rc1
> >> 
> >>   drivers/mtd/spi-nor/spansion.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >> 
> >> diff --git a/drivers/mtd/spi-nor/spansion.c
> >> b/drivers/mtd/spi-nor/spansion.c index 6756202..01640c1 100644
> >> --- a/drivers/mtd/spi-nor/spansion.c
> >> +++ b/drivers/mtd/spi-nor/spansion.c
> >> @@ -29,6 +29,8 @@ static const struct flash_info spansion_parts[] = {
> >> 
> >>          { "s25fl512s",  INFO6(0x010220, 0x4d0080, 256 * 1024, 256,
> >>          
> >>                                SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
> >>                                SPI_NOR_HAS_LOCK | USE_CLSR) },
> >> 
> >> +       { "s25fs128s",  INFO6(0x012018, 0x4d0181, 64 * 1024, 256,
> >> +               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> > 
> > The flash should be named "s25fs128s1" - this would be the flavor with
> > uniform 64kB sectors. One should add a "s25fs128s0" entry for the flavor
> > with uniform 256kB sectors.
> > 
> > We usually don't add new flashes if they are not tested. Please specify in
> > the commit message with which controller you tested the flash. The
> > minimal test is a read, erase, read back, write and read back. This
> > sequence should verify if read, erase and pp work fine.
> 
>     This chip (as part of the S25FS-S family) most probably requires a
> post-BFPT fixup to make the writes work. I was going to post the patch
> adding this fixup for S25FS512S chip.
> 

Ok. Please add Yicong in cc or to.
Cheers,
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
