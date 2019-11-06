Return-Path: <SRS0=BbO6=Y6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D721C5DF62
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 07:08:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE095217D7
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Nov 2019 07:08:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u40Jvbzt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="RJKoBNoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE095217D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7uk4nPuCaVLmYbg0GCDX4KuUOfmei0FzT1M9C3dWZg=; b=u40JvbztEzp4U6
	2BwC7MF6PEnD8gOlv7wmo3drjb4lIwFcQ7XrrN8Rfp4WWpulSGm9TPU0t2KP7vWQgWVLLoKxapvpB
	PqVPEvR4Ans7FQG7M1UGLJItihuKJ5l1QFZl7VFH46jRERVHq0aRRfixOW4R0vgv1SKf4V9lPnf27
	eYhXePclY1GKEsQ2aToiJnhfLtiUUSHwL8DLjO/v7Qu3Bg93Lxz7Asmr8Z+lPD2lpGT/jmR+4d2Px
	3D13A4rczhJ+QIp3nbTFhnyEv5CmGKiDvNQoTS3kbKSCQzlU3rYqq5MjrmPFmD9t5wjXCsjlPf1Ny
	/ipmSDZ4jSUg8YY2/dng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSFQN-0007wt-Si; Wed, 06 Nov 2019 07:08:15 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSFQI-0007va-IE
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2019 07:08:13 +0000
Received-SPF: Pass (esa6.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa6.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa6.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa6.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 0KHS4T2Cxhabbwr/cjWQxgKjZXDk9eMaA7+2O0mqixCRrt5f2tU+ZPNmgtUp5B4HOpb3dtd2BT
 ttPgqH4r66AcTZNHGcEMXzQiGodI1tqJnI3D/fQUQn1En2UdEnu7rxX/DCzDsxy5z3jVDmOvdt
 pO4uruA2FwvAjtrbUnyqE5wFKL5Kar31Mqgo242a/ZdcnUKOPju1/mKKjvQGQy3upHQDoITJee
 ZkPWzFa68PvoNtyLJheRDneyj8uGdIsexV6Et0NrP40rMPPZEd6AkB6JYvOkYH+H7t0q9npvVD
 GWc=
X-IronPort-AV: E=Sophos;i="5.68,272,1569308400"; d="scan'208";a="53067295"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Nov 2019 00:08:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 6 Nov 2019 00:07:22 -0700
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 6 Nov 2019 00:07:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHb9KTY4RAXgszRRXMIfQSjxLP+c1fpLmI+Gi/EuXgm23CJWiqJQ2W/kVp9I3LLrrowJUHvazluoEEWBNYXVPTrTMmovW9lQEq2Dip9S4eepTur4qAVwonZrpGy4TpZtTVSVbe5bwMQP2ywIv4H/JfHxwdFFdabDFfM+tP5dkD1l3lcX/Qygec40B2sEpm2iwb6XV2s/SyiIfGlBFk4MBS0SoTm2aN5nIbM5IFtrAbwQaRHD3DTnKTr/7ZIWTzHioapwd6ESM9YBgMhlFyiiwUwCqGVE2C4f7X/+15MQgNDmjoMS3/qUDHhh+a+E28aYtZqZ+g5eq8SXrhG1oyBbQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMsaRRGP2+MR/zPfEcRiut6gHr3+Gnnxz97PACCSJOU=;
 b=RO6CaDp8UT4HtqG5Q/Y7/WWJdI8wQ0oPF3B6YThqX8iI7+jK1jxPjxh3cHTETsvOjDdxNCEpyoZqz8H4M83kmnYlwmF0AfNkEkIaG4xLEPNrEOvNtyETRQUCUxBxYewBdcDgXE1Pjq1Khl4cYRSiiBlP6gVBu8cugJOsiXgvr15PsF8nQBFGWXmqU53wvQJG/3kppUvgbMIZG4yom9gORmuP/xPfFSBn7nPadrIx7xJONpVe5A+QerPbBLErCZMu8cSDpGWYtzgDH802fFlHt7DODi11V5Q4Gl23QebNX/h0yowpUk/iMml/SxcQGf18ZW7SrJSA1wYI4vux2j90pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YMsaRRGP2+MR/zPfEcRiut6gHr3+Gnnxz97PACCSJOU=;
 b=RJKoBNoPbsUiUB5uoSDOmHYOhkz0AAUUlTQ/gv1TgCynNSKnFLwjXxKx/qX6ccPJzTelw3k7iK7+mYX5a7AJ0zaAvpVn0w7oEjcmPLzpDjY1UojXwI9MFhP1gy80CP8yfG/H9KHMNgPVuD7P6mw4lHBVAt+Rut6f/TTe1bTgoFI=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3839.namprd11.prod.outlook.com (20.178.254.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 07:07:21 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 07:07:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 01/20] mtd: spi-nor: Use dev_dbg insted of dev_err for
 low level info
Thread-Topic: [PATCH v4 01/20] mtd: spi-nor: Use dev_dbg insted of dev_err for
 low level info
Thread-Index: AQHVkW/xBgAv7ThozEyzMFjaioqIiKd8gdYAgAE86QA=
Date: Wed, 6 Nov 2019 07:07:21 +0000
Message-ID: <baac5e0e-4e85-8a88-b8e5-43bd644de7c8@microchip.com>
References: <20191102112316.20715-1-tudor.ambarus@microchip.com>
 <20191102112316.20715-2-tudor.ambarus@microchip.com>
 <bc98d845-1994-69a8-a655-81ba1bb9253f@ti.com>
In-Reply-To: <bc98d845-1994-69a8-a655-81ba1bb9253f@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0902CA0057.eurprd09.prod.outlook.com
 (2603:10a6:802:1::46) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ac96868-ab16-489b-0c27-08d76287f790
x-ms-traffictypediagnostic: MN2PR11MB3839:
x-microsoft-antispam-prvs: <MN2PR11MB3839AE5ECCA0020338618ABBF0790@MN2PR11MB3839.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(396003)(136003)(346002)(376002)(199004)(189003)(66556008)(6512007)(86362001)(66476007)(6486002)(478600001)(64756008)(66446008)(25786009)(53546011)(102836004)(8676002)(386003)(6506007)(14454004)(26005)(8936002)(81166006)(81156014)(486006)(52116002)(446003)(11346002)(476003)(2616005)(186003)(36756003)(229853002)(7736002)(316002)(110136005)(54906003)(6436002)(66066001)(31696002)(76176011)(305945005)(2501003)(99286004)(6246003)(2906002)(256004)(14444005)(6116002)(3846002)(5660300002)(4326008)(71190400001)(31686004)(71200400001)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3839;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GeVFF62+Rn9DODWIKf9TpDQUYxrHQY6+G7xMJ8JtjfDsBhZUY7mguWBjs/hNw5aUd1qbRGIov6dejg6THAxXZbdqQKlUE61eJpL11UfGXt6qEtklYIxegdEL5StIwugVkkodXAK0wRGTZNgYulIvDIXauMqe6XWMKI6T8qTgD3yEhSvpxJt18Y8BWjtoTkCmduNiFvCSMyrEvrwlSSRZg/upR1Bj1CIkfblIaC8zxIhJvB0APsEPQv7sC2HZsCmo03j4G/WrDTkaixzvUexI8hgd2dkdlMalAOBpz8KLW5vP1Q0mWzhHjvRQjAPkI9iDTIuvJr3to4va/exZpnHgFCLB+hX/DC5sVeYqHKwcbJAnMY7mEZglgJJMYepA0IBEgAI6LW4wXLRcjSSuHnWc7mZ6Jb4shzun4cTHuqMV8GOPUWwjblvXTwibMYaS4yWB
x-ms-exchange-transport-forked: True
Content-ID: <733F7DCDABD27C41A9A8121F29C207FA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ac96868-ab16-489b-0c27-08d76287f790
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 07:07:21.3332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7XVupPXO0AKPdWO1nxyAg67FV1cpymDfFKW7EbLtVTIk0sZ4HWawl2D9DhkPk5507fO2yP+cewiXNJ1MNQrB80d59LNvI/2As+ugzQNPi/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3839
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_230810_661886_EB8EA858 
X-CRM114-Status: GOOD (  15.26  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/05/2019 02:12 PM, Vignesh Raghavendra wrote:
> External E-Mail
> 
> 
> Hi,
> 
> On 02/11/19 4:53 PM, Tudor.Ambarus@microchip.com wrote:
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> What most users care about is "my dev is not working properly".
>> All low level information should be discovered when activating
>> the debug traces.
>>
>> Keep error messages for just three cases:
>> - when the JEDEC ID is not recognized
>> - when the resume() call fails
>> - when the spi_nor_check() fails.
>>
>> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 52 +++++++++++++++++++++----------------------
>>  1 file changed, 26 insertions(+), 26 deletions(-)
>>
> [...]
>>  
>> @@ -679,9 +679,9 @@ static int spi_nor_sr_ready(struct spi_nor *nor)
>>  	if (nor->flags & SNOR_F_USE_CLSR &&
>>  	    nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
>>  		if (nor->bouncebuf[0] & SR_E_ERR)
>> -			dev_err(nor->dev, "Erase Error occurred\n");
>> +			dev_dbg(nor->dev, "Erase Error occurred\n");
>>  		else
>> -			dev_err(nor->dev, "Programming Error occurred\n");
>> +			dev_dbg(nor->dev, "Programming Error occurred\n");
>>  
>>  		spi_nor_clear_sr(nor);
>>  		return -EIO;
>> @@ -714,12 +714,12 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
>>  
>>  	if (nor->bouncebuf[0] & (FSR_E_ERR | FSR_P_ERR)) {
>>  		if (nor->bouncebuf[0] & FSR_E_ERR)
>> -			dev_err(nor->dev, "Erase operation failed.\n");
>> +			dev_dbg(nor->dev, "Erase operation failed.\n");
>>  		else
>> -			dev_err(nor->dev, "Program operation failed.\n");
>> +			dev_dbg(nor->dev, "Program operation failed.\n");
>>  
>>  		if (nor->bouncebuf[0] & FSR_PT_ERR)
>> -			dev_err(nor->dev,
>> +			dev_dbg(nor->dev,
>>  			"Attempted to modify a protected sector.\n");
>>
> 
> Since, we are specifically parsing FSR bits to know the reason for
> failure, I think we should use dev_err()s here.
> I specifically like the last one which informs the user that
> program/erase operation failed as sector was write protected.
> 

Yep, will use dev_err to report erase/program errors in both spi_nor_sr_ready()
and spi_nor_fsr_ready(), together with the attempt of modifying a protected sector.

Thanks!

> Rest looks fine to me:
> 
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> 
> Regards
> Vignesh
> 
>>  		spi_nor_clear_fsr(nor);
>> @@ -770,7 +770,7 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>>  		cond_resched();
>>  	}
>>  
>> -	dev_err(nor->dev, "flash operation timed out\n");
>> +	dev_dbg(nor->dev, "flash operation timed out\n");
>>  
>>  	return -ETIMEDOUT;
>>  }
>> @@ -807,7 +807,7 @@ static int spi_nor_write_sr_cr(struct spi_nor *nor, const u8 *sr_cr)
>>  	}
>>  
>>  	if (ret) {
>> -		dev_err(nor->dev,
>> +		dev_dbg(nor->dev,
>>  			"error while writing configuration register\n");
>>  		return -EINVAL;
>>  	}
>> @@ -1771,7 +1771,7 @@ static int macronix_quad_enable(struct spi_nor *nor)
>>  		return ret;
>>  
>>  	if (!(nor->bouncebuf[0] & SR_QUAD_EN_MX)) {
>> -		dev_err(nor->dev, "Macronix Quad bit not set\n");
>> +		dev_dbg(nor->dev, "Macronix Quad bit not set\n");
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -1819,7 +1819,7 @@ static int spansion_quad_enable(struct spi_nor *nor)
>>  		return ret;
>>  
>>  	if (!(nor->bouncebuf[0] & CR_QUAD_EN_SPAN)) {
>> -		dev_err(nor->dev, "Spansion Quad bit not set\n");
>> +		dev_dbg(nor->dev, "Spansion Quad bit not set\n");
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -1897,7 +1897,7 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
>>  		return ret;
>>  
>>  	if (!(sr_cr[1] & CR_QUAD_EN_SPAN)) {
>> -		dev_err(nor->dev, "Spansion Quad bit not set\n");
>> +		dev_dbg(nor->dev, "Spansion Quad bit not set\n");
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -1935,7 +1935,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>>  
>>  	ret = spi_nor_write_sr2(nor, sr2);
>>  	if (ret) {
>> -		dev_err(nor->dev, "error while writing status register 2\n");
>> +		dev_dbg(nor->dev, "error while writing status register 2\n");
>>  		return ret;
>>  	}
>>  
>> @@ -1949,7 +1949,7 @@ static int sr2_bit7_quad_enable(struct spi_nor *nor)
>>  		return ret;
>>  
>>  	if (!(*sr2 & SR2_QUAD_EN_BIT7)) {
>> -		dev_err(nor->dev, "SR2 Quad bit not set\n");
>> +		dev_dbg(nor->dev, "SR2 Quad bit not set\n");
>>  		return -EINVAL;
>>  	}
>>  
>> @@ -1978,7 +1978,7 @@ static int spi_nor_clear_sr_bp(struct spi_nor *nor)
>>  
>>  	ret = spi_nor_write_sr(nor, nor->bouncebuf[0] & ~mask);
>>  	if (ret) {
>> -		dev_err(nor->dev, "write to status register failed\n");
>> +		dev_dbg(nor->dev, "write to status register failed\n");
>>  		return ret;
>>  	}
>>  
>> @@ -2525,7 +2525,7 @@ static const struct flash_info *spi_nor_read_id(struct spi_nor *nor)
>>  						    SPI_NOR_MAX_ID_LEN);
>>  	}
>>  	if (tmp) {
>> -		dev_err(nor->dev, "error %d reading JEDEC ID\n", tmp);
>> +		dev_dbg(nor->dev, "error %d reading JEDEC ID\n", tmp);
>>  		return ERR_PTR(tmp);
>>  	}
>>  
>> @@ -2740,7 +2740,7 @@ static int s3an_nor_setup(struct spi_nor *nor,
>>  
>>  	ret = spi_nor_xread_sr(nor, nor->bouncebuf);
>>  	if (ret) {
>> -		dev_err(nor->dev, "error %d reading XRDSR\n", ret);
>> +		dev_dbg(nor->dev, "error %d reading XRDSR\n", ret);
>>  		return ret;
>>  	}
>>  
>> @@ -4102,7 +4102,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>>  		err = spi_nor_read_sfdp(nor, sizeof(header),
>>  					psize, param_headers);
>>  		if (err < 0) {
>> -			dev_err(dev, "failed to read SFDP parameter headers\n");
>> +			dev_dbg(dev, "failed to read SFDP parameter headers\n");
>>  			goto exit;
>>  		}
>>  	}
>> @@ -4349,7 +4349,7 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>>  	/* Select the (Fast) Read command. */
>>  	err = spi_nor_select_read(nor, shared_mask);
>>  	if (err) {
>> -		dev_err(nor->dev,
>> +		dev_dbg(nor->dev,
>>  			"can't select read settings supported by both the SPI controller and memory.\n");
>>  		return err;
>>  	}
>> @@ -4357,7 +4357,7 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>>  	/* Select the Page Program command. */
>>  	err = spi_nor_select_pp(nor, shared_mask);
>>  	if (err) {
>> -		dev_err(nor->dev,
>> +		dev_dbg(nor->dev,
>>  			"can't select write settings supported by both the SPI controller and memory.\n");
>>  		return err;
>>  	}
>> @@ -4365,7 +4365,7 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>>  	/* Select the Sector Erase command. */
>>  	err = spi_nor_select_erase(nor);
>>  	if (err) {
>> -		dev_err(nor->dev,
>> +		dev_dbg(nor->dev,
>>  			"can't select erase settings supported by both the SPI controller and memory.\n");
>>  		return err;
>>  	}
>> @@ -4686,7 +4686,7 @@ static int spi_nor_init(struct spi_nor *nor)
>>  
>>  		err = nor->clear_sr_bp(nor);
>>  		if (err) {
>> -			dev_err(nor->dev,
>> +			dev_dbg(nor->dev,
>>  				"fail to clear block protection bits\n");
>>  			return err;
>>  		}
>> @@ -4694,7 +4694,7 @@ static int spi_nor_init(struct spi_nor *nor)
>>  
>>  	err = spi_nor_quad_enable(nor);
>>  	if (err) {
>> -		dev_err(nor->dev, "quad mode not supported\n");
>> +		dev_dbg(nor->dev, "quad mode not supported\n");
>>  		return err;
>>  	}
>>  
>> @@ -4762,7 +4762,7 @@ static int spi_nor_set_addr_width(struct spi_nor *nor)
>>  	}
>>  
>>  	if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
>> -		dev_err(nor->dev, "address width is too large: %u\n",
>> +		dev_dbg(nor->dev, "address width is too large: %u\n",
>>  			nor->addr_width);
>>  		return -EINVAL;
>>  	}
>>
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
