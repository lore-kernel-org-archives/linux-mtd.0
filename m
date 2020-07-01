Return-Path: <SRS0=6ot8=AM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90823C433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 07:59:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 609A22073E
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2020 07:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A3FhwzKk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xDIb5kOU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="An8y+yzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 609A22073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t//lqP7rghGn/cR5s3T+48UKc1ZGxRYRCkx4cSn60Ic=; b=A3FhwzKkHAypjoxK83tYpU++Z
	ewHBdW7uyp5H1WJV4Q72ZaiBeObcOTrNIZ/3wrI9RNwJBWUGUps1dIvSAbxEuAPnvFTnounh3sthE
	WP40bioMBtAK+phUtjHsFpkBC/+PZD/FoxRLKBn/FjqlUJ+WNC7bW8B+2vlKoeoUtmHj0NiUfRUOe
	P8fFUNwIhAjVcY/LdUXO+K2zX4rHA5K2XmGBUfypWqc79Uek+LelC8l/sATUWECarn06dbAiogOZm
	YJ0snQgi3g9pp6jo2PTdsr4DJRim8HtpAmPn03ckkWlAgRRE2goq68qHuhgin7Zes5sTJTl+i53XE
	1c7nS66Kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqXdz-0005AP-3Z; Wed, 01 Jul 2020 07:58:59 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqXdx-00059i-2B
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2020 07:58:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1593590337; x=1625126337;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=sYsbF1W4v+NZZ+TYqj3gahnfDsfvjd+G2bjbbN+JiqU=;
 b=xDIb5kOUHOzfXF+JIWyOvSif/m65TSKCTUQ/tCfzJoLKgmwjwNSJlQoY
 YoTwyZdPCY1+r1zGc/t+Rr3Pd3gOajgpqZSJeUYZH9e1rLg4cvxBjh+c1
 1K9SYXT2vZO1GOY1zH9rkSmtNykjJSjxQnyNJbkngSncvvnB3W2Po3THg
 fQZRYrhW8eUhflUoPz9BY+V0wSp0Cio06GJrpF+rxxQRd4yOcxYZ2UNYp
 4xC2xaAcpxaXARwObLQJL7hihmbgvjr/7Edrdqtfebrh3v4o0085x/uwD
 UJFBuynln0GDBvYVrb/IwBZpN+2+TYg0DOt+Mpi1q+bNwOD6wN7s6YKI1 Q==;
IronPort-SDR: V27pm+WuIpFd/UodRsQIciD2qmwlfz6d+RubVmDAbrRUkVg/UTj4gd/XAmevqrLR3Uwe2jfBoX
 /Jdr5y/pcTiJZbxO6hwl0gWFAZc8v3wAloSxE9ZvZVu310edFXLVBwgeJ9Gc1/Y5kotZC4CNOg
 0YL+Cq6Z9Xxt5vB4oA95Q7zczjbYkJv88pjJzP325WT+SM/siObTs1CE18klFGMZ1rwcTxdlj1
 vHR1TrnqZ0XnMYqqSDUfSfM+hQNRgVQWb8jfnVGe97wrlqx2g9bpb5C/RTAaEOf7R8AzhQr3YI
 dn0=
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="82190898"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 01 Jul 2020 00:58:55 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Wed, 1 Jul 2020 00:58:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Wed, 1 Jul 2020 00:58:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c+mqxVzAv4a2TmhHnj3rcHKhqH12a5B7zXj89Oz4TfMQLh2A0jy4MHg1rqtifLvHrnVgEXWsskUn5N/AUVjD/VOm11rz7b4CfZb/4jq5/0N62hNIRIck1TQlU4NysndJZC5gqyCuwSMjFvSUxEHCR8rJ4P+rmK8YQ6GqItclr5TFNLk/xdKr3eYIltJeC9LssLs+tugPc3fwbhe+C+B1Z83cuR63s9zmT2u/eSn7rmFW5ZJxhEdb7//8QHem2+oNJuCyNV0oBvWONGmwvydVWzNqnWyzpIXvYEPt3ruFUh0sgMOi/SFoymBIPof6CM/AJqcMsxLtCsyDOW4OTNFPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYsbF1W4v+NZZ+TYqj3gahnfDsfvjd+G2bjbbN+JiqU=;
 b=f2zoiLpMLhPqMp5acr86/7oXAGXDw/muw0NoPIyxiGxiD/bo/plj3n7lPa3sBdl2HlIC6+yg9QdPdoLnBU/VD0gvGtI5b8NAPfuwW5avwAg78VTRWiUXeZfT4ZSPtF5J2lEdO2V02b7y1agxR1btBs5ZkcKVYauWuY2LTK1nsKrxfU3xj0Z1GcKyLVDmiAO+1nNduVdJ7S6cmd1RSOID+pMUSnN65Ehd/D3gA5a2Rz39xXDI5TazKzIuFVm1BEW0MMLuoRKf45IlrLe6cWNpREHA7fvkiQ+OOejdXQDYVk/pK9pVCmCeZniS8oPmQQ94WW7lyPonH9ZOrC+Yq3a55A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYsbF1W4v+NZZ+TYqj3gahnfDsfvjd+G2bjbbN+JiqU=;
 b=An8y+yzBTxBhIeWyk7wfbvCdjy0b7hVkBt91FBBKFwr+KvoRgNJGf2YSZV3Qj5bwEGLqfeq1cJbX57HN8TPhW6rc1TDFBXdAXV4x95i+5dqhZadn4S9+nmJ1Zm/qxsAJXUNwfO7cfE3iMrf8bVM75QtbgpqBrdDLY9bVpK0a7gM=
Received: from BYAPR11MB2856.namprd11.prod.outlook.com (2603:10b6:a02:bd::11)
 by BYAPR11MB3751.namprd11.prod.outlook.com (2603:10b6:a03:f8::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20; Wed, 1 Jul
 2020 07:58:52 +0000
Received: from BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3]) by BYAPR11MB2856.namprd11.prod.outlook.com
 ([fe80::f1d5:60ca:d163:c1b3%3]) with mapi id 15.20.3131.027; Wed, 1 Jul 2020
 07:58:52 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dinghao.liu@zju.edu.cn>, <kjlu@umn.edu>
Subject: Re: [PATCH] mtd: spi-nor: Fix runtime PM imbalance in cqspi_probe
Thread-Topic: [PATCH] mtd: spi-nor: Fix runtime PM imbalance in cqspi_probe
Thread-Index: AQHWT311TUMJ5i8fEEWqSo+Rmrg95Q==
Date: Wed, 1 Jul 2020 07:58:52 +0000
Message-ID: <328b6db3-3298-047e-51a1-d9a8bfded41a@microchip.com>
References: <20200522100520.22130-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200522100520.22130-1-dinghao.liu@zju.edu.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: zju.edu.cn; dkim=none (message not signed)
 header.d=none;zju.edu.cn; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.127.52.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 01e0b787-3858-4666-19db-08d81d949876
x-ms-traffictypediagnostic: BYAPR11MB3751:
x-microsoft-antispam-prvs: <BYAPR11MB375170B705015C65F241D992F06C0@BYAPR11MB3751.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-forefront-prvs: 04519BA941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KH5vIUa2JwZIZwBg3Hoa/6N9X+hAwSMNnucYfV1dQLD5EX7uBoSta3kY57Tiwo0gV7tQyH2sfcL74PLNValw42hLLuFagzTJyPUwheHTnSEKutoP+r430ZcmiqbHIXeXE05rtFSJovGNM97yv43bGU91+G0qeW6GU/VeJWLHD9m5tcikNY5xq+1z7gxPHZBPQefUH7pXZz32te5amjYjNlnaryGFAoBqJtbN2SLrsNe4aAXrVijZuaN8xrSP7gpJ8en1+8pskLvKwM0PiP/p6xGoQK9Yp6t05uT/4eLeG7wM0EnHPJG+1nRRSUlFOfavvI6MwcPBP5P0DCljQsQr8quggPic/szEnd9584jobiKxJ5d0XHMCYQ6d0x2EaZ3a
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2856.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(346002)(376002)(136003)(396003)(366004)(8936002)(186003)(2906002)(31686004)(86362001)(6506007)(26005)(31696002)(2616005)(5660300002)(53546011)(110136005)(66476007)(4326008)(6486002)(8676002)(66446008)(76116006)(91956017)(64756008)(71200400001)(66556008)(66946007)(54906003)(316002)(478600001)(36756003)(7416002)(6512007)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: zD/jgJDvbZuCDzjWQizfA7ddiTRFiNoFKS4mDUWWfUf601DZl140WI5oE+alnKUBfz9VB9KvkQwu+ofLRZZ/WUHll6SIYGVZt+shjxLzrmIDWQE66SU7dvQED/8x8z8Dke0bMsgLcMia2Q7xD3QluZJIX/DTeuM5YAjMPoCr9YWnKmVFkGJz6wMnyE1X3kouRXUIvngQ0uWGn+HJjWJltpebWNxTABkO1ZKG04SDdsXrAAKL1phG9wmM02KFHwbbiEuyS/4jn/PyelQ5CzBiqrvtbU6ktOAh6KIB4HMnYxxisDvng4Q0k8jytH9xmHkY4/WRK4QRcSWWEDHDF3wnzsn5stpR/rg+cPNY2syp7joIjwpnBCy3o/RKhdF/sJuS9kzCHrKU8ZbYlIvM0Jmpg3PmMYBrF9OgnZOE7QDId+GPbfuztpC5dw9cRzH5GledQ2PkIl9Gv2RttOctNW9vW5osmDHj58gF4CppHKg3B0w=
x-ms-exchange-transport-forked: True
Content-ID: <F6C5DB38314BB34FB4B7DB28871997D3@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2856.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e0b787-3858-4666-19db-08d81d949876
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2020 07:58:52.1468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3gGPSUMNSlJSgpBzvHMHY8QOFmSLD+mwu755WswLNHW9KcOUusXE08L9BNdNp8A/RHfPPmrXX9sH7HLI4TQRwq5vrS2FyDMfw5UmQZDIw+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3751
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_035857_459764_65D6F9D1 
X-CRM114-Status: GOOD (  16.40  )
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
Cc: thor.thayer@linux.intel.com, vigneshr@ti.com, bbrezillon@kernel.org,
 richard@nod.at, linux-kernel@vger.kernel.org, swboyd@chromium.org,
 michael@walle.cc, linux-mtd@lists.infradead.org, p.zabel@pengutronix.de,
 miquel.raynal@bootlin.com, tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 5/22/20 1:05 PM, Dinghao Liu wrote:
> When devm_reset_control_get_optional_exclusive() returns
> an error code, a pairing runtime PM usage counter
> decrement is needed to keep the counter balanced.
> 
> Also, call pm_runtime_disable() when pm_runtime_get_sync()
> and devm_reset_control_get_optional_exclusive() return an
> error code.
> 

I see that this is now fixed with the move to drivers/spi/spi-cadence-quadspi.c

Thanks,
ta

> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
>  drivers/mtd/spi-nor/controllers/cadence-quadspi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
> index 494dcab4aaaa..eabdf01e0d08 100644
> --- a/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/controllers/cadence-quadspi.c
> @@ -1377,6 +1377,7 @@ static int cqspi_probe(struct platform_device *pdev)
>  	ret = pm_runtime_get_sync(dev);
>  	if (ret < 0) {
>  		pm_runtime_put_noidle(dev);
> +		pm_runtime_disable(dev);
>  		return ret;
>  	}
>  
> @@ -1390,12 +1391,16 @@ static int cqspi_probe(struct platform_device *pdev)
>  	rstc = devm_reset_control_get_optional_exclusive(dev, "qspi");
>  	if (IS_ERR(rstc)) {
>  		dev_err(dev, "Cannot get QSPI reset.\n");
> +		pm_runtime_put_sync(dev);
> +		pm_runtime_disable(dev);
>  		return PTR_ERR(rstc);
>  	}
>  
>  	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
>  	if (IS_ERR(rstc_ocp)) {
>  		dev_err(dev, "Cannot get QSPI OCP reset.\n");
> +		pm_runtime_put_sync(dev);
> +		pm_runtime_disable(dev);
>  		return PTR_ERR(rstc_ocp);
>  	}
>  
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
