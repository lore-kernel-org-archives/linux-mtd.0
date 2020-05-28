Return-Path: <SRS0=EQmy=7K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00233C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 18:42:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C78EB2078C
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2020 18:42:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TRiDNqf4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="uC/PH9Pk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="lTKipPnG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C78EB2078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09ZGk3E67un+ssrDvQDlONKmAfVySYRC5OzJdHh/aHA=; b=TRiDNqf4IDJX1d
	ubSx61hvVzeEU8NHAVKvxh7q2lu2RBLk/mEf5IFk6ZoAf0pcdPFNHUlw74tnvQ8+dg1JZqX3ZoyII
	8CK7CTJfR5BT/AecJG8hKCvxhU5lsJq8xTYXwyzU20hAsEtkML6PPs/eiRt7TxslsqgLk+ZhiWQEk
	Mt8/mJvUvqTCIPbh72f8QyZsTrEZ92MRAvtPPh3EbrnsqqrER2XO0zvQD07eHd2LVShrcYUvjbQEs
	kRsWP1ZwUDBJYCm4aOH4jLv2HEpJEn/pjVswmcaJeEj+c8X/FwjGiti6QkhG8aZi1LDV5TxUo02D8
	QvhZStpDT9tBEdZJLVuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeNU8-0004ds-QE; Thu, 28 May 2020 18:42:32 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeNU5-0004dK-HD
 for linux-mtd@lists.infradead.org; Thu, 28 May 2020 18:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1590691349; x=1622227349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=B9JMsZylPEFohmiIJJMRjMEjwsnjlbXsALYniIgt93g=;
 b=uC/PH9PkY/3HDB4A1jOGcXR9V8f0QdiIrhiyjXT39InWorTv3qGDq+lH
 Tz3Eq37gUmSnlmTjUoG0slwEzAygJPWCPirfejfkv7k+iCkOAJT353aiu
 vQM8WDyw8ta/9mLLTpKA4MZ9mpv/H4maQF7du5Ig8fl+epUEjIl82nfMs
 /rkQacMVsyQECHvyJUuYOtPVk5ksl49ktM9PGIV2X8GThNcbyoo5Ll9/P
 vYZlqwJDAyCNtMWEhy+AZlqmhqQXHfBLVK926mGJJkEUBdqlPLikQsfjb
 dPZ8IditnrrARsnlI/rjZAZXm4OYZZw9K6tVVqVzTO4mdysvwwyqK3ddL Q==;
IronPort-SDR: YvKIDzg349lYQmGfPcdNGotYYf7W+fk+CV3uoToRpw2OwNqHoZDCRjBdNBSMZtz5Y0hHR++ayL
 CJNbjJLPtchDKQcIWtGIpzCPIAfJ4kvDZysZJagYdcuoWIUjywbE1SWoJfg5BlNPsA5cwt//ab
 An71C3JwHkdulkwgJhimfklWZzgSr8Yo2qwY7aGJ/d62ltw2fMq02rC4ehRbU8WXcGYK7qKKzt
 XeT7z7pPaLeLCAwozRSMD8lrJ97/ckbe2BI+vprLxQ4uQE4LKsAHQEy9U6WmgLupfrr2Dj8HjF
 7m0=
X-IronPort-AV: E=Sophos;i="5.73,445,1583218800"; d="scan'208";a="13825038"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 May 2020 11:42:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 28 May 2020 11:42:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 28 May 2020 11:42:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJeHo8QrG9WOjchgGAGYxITDmmt5dDgshTCSGwz1OiWwAHiFJ8atqNaK6HOj0IAG3uw4UGclOihOsioBqJG6bSHgOeb8H4tTceqWsm3B4FfPtIif9H9KbLQAuTePkhbX2hKY931zoamVYE/PfDtlgwP5cKmTJNWLaGvo131SGAWIm8rz3X3MpFbza21DcnTo5SmXn5t1Xs6bMjbZA/djJ41eQONlaZTEkwhcYiM8fMbsXFPeG4ppduNFW5xGvJ5bojh7HfSGbB4T+xBU8iUYx6ZrWilEeENoMGeumk/sfQtUUN0COm+rFs1MlLCN1T5Ibw7h2ZAIMc1++zP49maa8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umFAE7JILaoaA8H04SvL0ZYUS1l3T73adxcY3iQzq44=;
 b=ASFKguiMYO0N09RN6815nmhJuwNG1Vryz5/WHCf1fBwDGXoD0QW9UdPUV6WwlnmTI46R9Yg0FTHBPkbNh+OT5O04cvWlXUM8Izkf9DUwoE0zcyZWugRZOK61l0ZdcUARJnDQlnsyhUmrUaD9eic287++c4P4tj4Us3CSeXRdBMSmFFPbwLSRCVaPDkVRMktYdfq2L3eoR5MaUrDqXM5nlJH7ko2ngaNSUMkQc675rSgNh/7ZhpdvN7Nv9iBfCumN+kYucMYyw0PEJbxFlQDvIkHb7VVJRSMnqhN3ich13opsun8HpL0g3NClATDJzeKT52WWsM023uMqcmSmsNyXPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=umFAE7JILaoaA8H04SvL0ZYUS1l3T73adxcY3iQzq44=;
 b=lTKipPnGi7CGWWD7B2uygjfPc/PQc7zXLXV1jKzrrFWwFyc/lw4m1lcj2565teXAqT2Ey8uz342dXSkyp3KMN2ykpFARTv/raVIIQAvpuw8K3eyQRP/dJP/7sRe9zGpGVIJe4luDzQwkLm33a3h2Zj8gqelTAfJUIpRS5ZBAu4o=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4498.namprd11.prod.outlook.com (2603:10b6:a03:1c2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19; Thu, 28 May
 2020 18:42:25 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.3045.018; Thu, 28 May 2020
 18:42:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>
Subject: Re: [PATCH v2 3/6] mtd: spi-nor: cadence-quadspi: Don't initialize
 rx_dma_complete on failure
Thread-Topic: [PATCH v2 3/6] mtd: spi-nor: cadence-quadspi: Don't initialize
 rx_dma_complete on failure
Thread-Index: AQHWM0FckzWSr68KdEWbg3txzf1/QKi92PEA
Date: Thu, 28 May 2020 18:42:25 +0000
Message-ID: <11478827.xOqK0cN8QE@192.168.0.120>
References: <20200526093604.11846-1-vigneshr@ti.com>
 <20200526093604.11846-4-vigneshr@ti.com>
In-Reply-To: <20200526093604.11846-4-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 752cf617-8d02-41c8-dc53-08d80336dde3
x-ms-traffictypediagnostic: BY5PR11MB4498:
x-microsoft-antispam-prvs: <BY5PR11MB44988AB094D2ED7A985143C6F08E0@BY5PR11MB4498.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-forefront-prvs: 0417A3FFD2
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tfDP18ANdXoMI3Df3NGcllUXrnfCh+XB1WNZfY98U4IPZwtNSeiYvZoIZ6LM58fdpSnEjOzy4ihK1R/ff7Wp/ZTLYzT3gkcaACn0vRZ8QscQVvxc6K3uO6C9JeiPSkXxhY2hCFTMQg4kpnO+B1mrK1cQt83l94/xfZA/8+QhhQ/DMgfOdV5nfv5QYvs1DBu9BYQNsiNuFLYMAe5ladOlkAI/FjQq/PSgMU7ka/sdpRUtCLI3S3XytzWaYbhT+X2PabLZEb8Z+18vl6tA6Ofbl3g5X66jlooOyB11uRFAuSBQGqv9tXMxFTpZs00QEq7f7Ty8kz7KYqGd+uAjRN9rDJGMECoCHEA3E79POqX0tI7Z4ATrnLJohrD31afxBVks
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(346002)(376002)(366004)(396003)(76116006)(91956017)(66946007)(5660300002)(66556008)(8936002)(316002)(7416002)(66476007)(71200400001)(54906003)(2906002)(4326008)(9686003)(6916009)(6512007)(186003)(14286002)(6486002)(86362001)(8676002)(26005)(478600001)(6506007)(66446008)(53546011)(64756008)(4744005)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: SQMs3uNW+g8wKO3/L7Zel3FIewN7LQhbfjJNaspM6pv2mY3QkGOD0FVDLBX6bp509g7RZLaS6jEzauFu3PEyOB2/jn6PDOa69e2H2Q+W7RGzbMQSuts/S59WYc2qJ3fdiWcUzXyyJ8KlJIvkbQlYmVbyvKJWETJRnj1S3yEJ7tJWAzDjPG2k5+Pxch3m2UlZlcKrwmgb/ciTr9hS94l43Fr3bOfY0u5d1LsquTzg1aW11MsJKT89XyfkWpsgyy7BAFjC/zFzkt+z/8U3IevTFIcu9QiEpCPU/LYaUXWOuoHx9rooKHlMTx1yDad14bBhGFN1IYzUhdgbH5Lq1sZWC+94gbg11o7qCoiGqEksOKFB9krK/Za9GM0akgXhSZRrQsnQ9r1PHG9Ce+O/FQ/kPsgN4Nm1lhVpGGs14ZGKSW1hmGujVhyUZ8zZFNot1lSN+u9bJAoEXhIW03wqytRRODy2L6PKLWGg7A9aLAgJkYw=
x-ms-exchange-transport-forked: True
Content-ID: <EA10AF2404108E4AB9B5ED3DF17AF8ED@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 752cf617-8d02-41c8-dc53-08d80336dde3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2020 18:42:25.7411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lceioGQiIpsGo6YV+wSAj+/NFaRDFHfKRfoPjD6Z5f+O7jveY5yKI83g7eJDcRoTLUIRBpDlSiLiB2wTmSQSzOkgefHoovV3c3J+DvwsAwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4498
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_114229_634392_168A03BB 
X-CRM114-Status: UNSURE (   8.08  )
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

On Tuesday, May 26, 2020 12:36:01 PM EEST Vignesh Raghavendra wrote:
> If driver fails to acquire DMA channel then don't initialize
> rx_dma_complete struct as it won't be used.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mtd/spi-nor/controllers/cadence-quadspi.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
