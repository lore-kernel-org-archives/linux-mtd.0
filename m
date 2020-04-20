Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65214C3815B
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 09:21:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A0982145D
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 09:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K0bp4Vr9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Ad1F4Koc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="KOInWh5C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A0982145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmqIRDMI5P6P30JddGzDVx1smetuLYnJ/Z+UGdEIV8g=; b=K0bp4Vr97d7Bm7
	Klr9NBa1FOvO7P1JioATk5F2BlrFldire/63Flotmdghg/Q0GappA7tzCvPEkv0w8oNTwKKIZKQHr
	NCY4EjQwzueCtycLmYgvD9MxzfdNdyckW1u8Dm94McWbqTWK2Kk0ayHo4CguTkRDfOyDPC/jm3nf+
	gWzgbHPGpckExfp5Xo1ZQB8Cyg+vEv54356HSXO6FngwA3P/qOPAqM9ZtH9RpLj5tmIiehCUiwxP0
	BIo0F5RjYuZQ7tw5mF9rZWDkzLO6yHc4FM35kH4jF44RdsNIe7OrNVpQWkWYrDRRbji4B8jP18pYs
	Mtm7nBuMfFMbMDLZwgIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQSbt-0007gt-5E; Mon, 20 Apr 2020 09:21:01 +0000
Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQSbq-0007gG-45
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 09:20:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1587374457; x=1618910457;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=P/b6yb5oyNW8AFvcsj/rZkxjLT+0e950+82MdSvt2w0=;
 b=Ad1F4KocZ9KjL8RU4S93eIBBjPZBzXFg6HDL3IXSx70xwZNKN8gRRUyW
 5PlMx8+awdSs42SA5e5jITsfqLAsuJLiKNoxUhd1mWZLfCwdPoIlRSeai
 vTkQJTrMKmBQBuVdwF8YWsotPi7SzhDwTwmufjKxkhb6e8aW1hBDYgO27
 yJ48osl2qrZ6TCQUT0d6ClQOcIXQVOTp/gczUbLpcK2RtOMaqzaaBZL24
 bZSIXIdNLnJXRU9W1N+GPQeMxFxixXr47RKbLZnewmBPqKk+bALsPGhpU
 x8bbiSTtEYUMSs4ZLNHmpsqFzDqt/M+26nk94rSXrGUdYaYzSrFJUeb3e A==;
IronPort-SDR: WwocE1RrVjX2HAReUcJ2aVj1OwGb1jYPJz/5khTo58uIxbIheikFLQ1KRkPTJBSDPHjIz+ZlwI
 my65ALWQyB76tUeExHFE/peYZvkk8WV63J9XV6goY5K1QKGwaMZV03fZnjPf4n36Lm6rmgedTW
 0OYXbEMxRyt0zzYR3vtOS1glZ6EtKUPmWqxINuCXHfqdhIojaDtqCRSHBtMpy2nQq3ZFFYYfzB
 0aYWzC6q7ag/W5Awo6vf9bqMkUzOeVTndCX3K8I10psIUopoN11tvLbJ07yj/VvOyCLWy2Di6g
 yk8=
X-IronPort-AV: E=Sophos;i="5.72,406,1580799600"; 
   d="scan'208";a="9747306"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Apr 2020 02:20:53 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Apr 2020 02:20:59 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 20 Apr 2020 02:20:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJtsnshzvXl3FoXIcRI+mveoo7IwsTt4Xc86ATaDVMWDcBtvZE95bPb+MBLvm9qlZgKlIWg5Acc2beeRh9JJGTqhoYg/L86acX8ZztrTYo5eU6Zep5WW/M+xc++sW8osXZxqyASsgDsJ/wQJukNnVsFTEhbJgCis56JjUSm45wJiN/Ofmk6UoFr363PG4r3W2YuUiiBgkesniJhfavrgS6pk2k16Owaz65p/Xf9tOGLXONG7nzbC1tkH/WpWiNRMFozQGJtBIc2ox0X5ve18GZi5MqeVBjpBR9OZxISLHQkLBgOsygh104iHTPPrT4DaL+fQWWpktIAo3SC0N1N9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaLyxF+Rno1xdXZ1KcaIvaKcaFC+jqqjLdWNAXQGSmw=;
 b=ckFxzUNNJokAOJ6GTuwvwEXLhHdRDYIAgwhaRjkF/tgGPxEp6gyQWKU5WF1BSOGkCCq4wxgFEWDNLJIYI49OyA7vLhlUEWPrhyqQKywH+vVpOEA0uTAljeHJoMimSw5YuycI1us7oAxr25mubXJ+BApwptuyZE4Of3AP/kkdHLP3X24M6Nwv6Q1HE4ogzJYYGLmbUXTYEsd8JkZGAWmVAhSWEddbxZ5P/fo3AGc+gY22L5zKpmX6ETGMlL5O2MpaNUTYcWOgO9LVNB1AQ2iMNgDzpObfzrkMC7/ZWoHbzlM3kjTcopkOX745bBPHVpg6a/JK/kM0r1chLl0upuEvgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaLyxF+Rno1xdXZ1KcaIvaKcaFC+jqqjLdWNAXQGSmw=;
 b=KOInWh5CbEjhf8c0Emq8g7GMuSb1Y4f++FLgA34cWn12ZQOTA5OIutvEaO41EAi6wg6oTYZHJFBN9htDI1/89FL/+ThwYZ6TEu+Is4WvWTdo6JFtGQD6p4exzxVEX794cuYn4i4ArYstX1WHMJDD3G2RazcKOlOERNSbJOrLfTM=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB3989.namprd11.prod.outlook.com (2603:10b6:a03:191::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.27; Mon, 20 Apr
 2020 09:20:49 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2921.027; Mon, 20 Apr 2020
 09:20:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH v2 4/5] mtd: spi-nor: fix kernel-doc for spi_nor::info
Thread-Topic: [PATCH v2 4/5] mtd: spi-nor: fix kernel-doc for spi_nor::info
Thread-Index: AQHWFvT7+f0vyvpGZ0ub06KV7IY+Mg==
Date: Mon, 20 Apr 2020 09:20:49 +0000
Message-ID: <8251539.igJhlKP8h3@192.168.0.120>
References: <b82675c7-9c90-d0a5-f221-9f51f89e448e@cogentembedded.com>
 <2f00fec3-8385-a7f6-6bae-9014fd46fb9b@cogentembedded.com>
In-Reply-To: <2f00fec3-8385-a7f6-6bae-9014fd46fb9b@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 818a3897-b42f-4a87-f038-08d7e50c1ddc
x-ms-traffictypediagnostic: BY5PR11MB3989:
x-microsoft-antispam-prvs: <BY5PR11MB398956B9DA884B24D0FA72FBF0D40@BY5PR11MB3989.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 03793408BA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(396003)(136003)(346002)(376002)(366004)(39860400002)(5660300002)(316002)(6512007)(478600001)(9686003)(14286002)(2906002)(86362001)(54906003)(71200400001)(66946007)(4326008)(6916009)(8936002)(66476007)(66556008)(186003)(6506007)(53546011)(8676002)(81156014)(91956017)(6486002)(76116006)(26005)(66446008)(64756008)(39026012);
 DIR:OUT; SFP:1101; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DL0g8azwTIhSw18qz/mKa8XPGOmny3KFjWyGTuUrf4cc1dUtDx0QBDXG652nSqGro0DmtCYLfdlIoZJFOgqYe4Ni8h2PWZxQBqjMddruGdRgwX8SBuvjbJNmuSFFh2rDDIzfrxK8r8H6beIu+w4KhS1nYbCc0vNu7r+ZD0Sg+QWiFFjmkl0Cy1V+CNuIYHm2l+J1WDUdRHxMpqljFGvOy2naO/blQnhNstJD16rWLZklGdgefWxIH1lTQlpJJ3Wjcgyi627anoLdE+Zs/TSof/hrtTWNZY72Qw6rchQnnhmpeuTuDeu963/IsKMVLXYQQWXlz28JlQGo7mMMRnZ9Mfv7PUND2W5Za6KHFYyc7R1W0ATluIwXpdNS66JrU19B4vjw05G3XuBPNPqQQZjMpea8su70MUJMaUD9HDjXt/hv4eWoq3HlN3oNIny1zcuV+DrQJ0v3bbVagDA2bJ3ilj67Wky+Q27QInYFHoDDI0jP4jLxFIMcWNX/BuJ8utzf
x-ms-exchange-antispam-messagedata: UwMYGjSN4F3s9UBYUX/PG6JAhstg+ah0vgb8xA+sCYzGUi8Unm0+GPIksyeQljeecDfxhdcXC5dFKBt8gyeJjY0SXaBd6bNMoX8TLt0NooNUo4LExFPMQX55vzzXl2AXSWedT9QyT+vc7JyKyU4qQA==
x-ms-exchange-transport-forked: True
Content-ID: <413E01A4797AF14198378538200613E4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 818a3897-b42f-4a87-f038-08d7e50c1ddc
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2020 09:20:49.7972 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VdBCmSeCwsyxUH39I4/94VXhZ13TyIniaVl/E7/7uWvwZz06drmfK90NmkKtKer8MlJFeiBP9gEZTF8fSQKXyZAqdLxZ+TC7hZCDugwn3m4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3989
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_022058_214280_3E0ABCDA 
X-CRM114-Status: GOOD (  17.16  )
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

On Friday, April 3, 2020 11:49:48 PM EEST Sergei Shtylyov wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> When adding the 'info' field to 'struct spi_nor', some acronyms were in
> lower case and some in upper case and the JEDEC acronym mistyped -- fix
> these issues.
> 
> Fixes: 46dde01f6bab ("mtd: spi-nor: add spi_nor_init() function")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - rebased to the 'spi-nor/next' branch of the MTD repo.
> 
>  include/linux/mtd/spi-nor.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux/include/linux/mtd/spi-nor.h
> ===================================================================
> --- linux.orig/include/linux/mtd/spi-nor.h
> +++ linux/include/linux/mtd/spi-nor.h
> @@ -335,7 +335,7 @@ struct spi_nor_flash_parameter;
>   * @bouncebuf:         bounce buffer used when the buffer passed by the MTD
> *                      layer is not DMA-able
>   * @bouncebuf_size:    size of the bounce buffer
> - * @info:              spi-nor part JDEC MFR id and other info
> + * @info:              SPI-NOR part JEDEC MFR ID and other info

There is an inconsistency in this file when referring to SPI NOR. It's either 
called SPI-NOR or "SPI NOR". While I don't have a preference whether to keep 
the "-" or not, I think we should be consistent across the file and use just a 
format. So would you care to fix all the comments in spi-nor.h?

>   * @manufacturer:      spi-nor manufacturer
		^ here's another problem.

Also, I think I would fix all these typos in a single patch, the fixes are 
trivial enough, without affecting functionality and I'm not sure it is worth 
backporting them. But again I don't have a strong opinion, so if you want to 
keep these in separate commits that's ok for me.

Cheers,
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
