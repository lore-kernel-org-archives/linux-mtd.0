Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7FF6C83003
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:49:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7660B206D6
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 06:49:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WhTREwCL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1rg0sR/A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="assR+egw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7660B206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2qe2JUE9T6t+6eerEn2zLjFjalBvFpkI/ye7Vydl3/I=; b=WhTREwCLmsKRV1
	qugWH6JpuBJlsM6sOLzxjnQh8EAt90e/LoGweUgh7uJTIe7l2fQsXk8RIEuyPSPQAOJShjvOaNPMc
	HP/vt2+T0RgFmvj8mnfxOdlhTm+8hrOuF5TqtsgIlGPyDvH2G8WXPBev0NkKc4pa9ji60lNYdT26h
	fLtoh+3tnFSIhmzRBNQqGk5siTfIBOQxV1UlG8PPi1QZoaBiXckiIFKLF0G9MoQUDbEslS6LDUNfP
	KXfw9w7w1ohjHbNKeO7cvJJfCRQj8tNBi5omZKBjNvtmZxg7CmSDxxWz3OJRovG/GNr+OP+N661Zk
	6w52meOgxFGpQ7r5UCuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTgX7-0007nS-Od; Wed, 29 Apr 2020 06:49:25 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTgX4-0007mb-4N
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 06:49:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1588142962; x=1619678962;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=hnKpW/ZlXNNlARixQ9G3gk8JjxDTPq2k4hir7QWfbkA=;
 b=1rg0sR/AdehnMTY5oHVd+8qXyiKMf+mOvndDHZROnveYZvrEu/kzeVkO
 Pxt6jBgCU+c9Yq0RVWz56Kd/+VqX8EUFl97NwGoGJqVKcKX4R/UQOy3nI
 SYMGVcDIsESYzrS3Jth/X9oQwnmRrh4zXp29/aI8+hsmoFpzanoUZ2NUq
 /165H2L08M24WxLWKmlLwpSCceqt/FotLjlmxsr7fVMw4uW+7x6NNx7h8
 IQIy+4wZ+yFe1zOsVs/fCFsyrdmqHhKOxS01FhAi6zenNBw0ekDu4j/vO
 22DxyZQn+eHlsZCd1dVmyfyNQQxEoqB8h7okZfJLdcoIcte2Xn4Fw0kse w==;
IronPort-SDR: y4bfobj24nmNedbHPX72qjjdRjtbb6WO6bi35tU/hjz9LMHT5JyBoiQuNNdKRNxQcnw31WRTgH
 HCYT56QLRD4SV4EzQ0ZmOqsaaBy/3wEXS0fUiiwGayClH+HMXj5KnWZheZ9RgSJhNzBc5nKzVK
 9CFOD+6MPgEWJVmu653fEqGeaj5/e0kQy1bF/jhPgLxoNo1ZLwT/tLwyASM1PG2vrVGPYU0yid
 b5dE2QowoBGA+y1joK/Q5nCnmOT4BWfPADEKiuDL6UuAojqshsb9bMAtGwItENKljdcIvdPyLG
 Q3M=
X-IronPort-AV: E=Sophos;i="5.73,330,1583218800"; d="scan'208";a="73653169"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Apr 2020 23:49:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 28 Apr 2020 23:49:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 28 Apr 2020 23:49:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbkptR0O5DTXT6LKIArdniGPimBGhu2JVmpqEnVWkq44VWG4RAeINukUGq1k6yBFnwFzJ6/Gh0w/d7GmgqyxNkMANcP2svHAYzVP8mCVpPDzgUmgNUQr8dsHnbY2AYuJfWcvfpm6UzOUAaF0gYYfI/qi9UZISonTG0CTyyX+41lwk+0zoLOBKmtdKDAzIJJg6zV9UScSOcUUI3/Ewk3+LOCdkoddrWIp4CzKVXOj0piJIVa+NCgmhdoufvegCfwLqoHKEm5ZNOVnRDPYOjIxC7MIQclCqjywXymwkbf8tFQDmDYE3KMutgekb7kBfJJxfJ00k4SoyaEiRGfTTcInQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnKpW/ZlXNNlARixQ9G3gk8JjxDTPq2k4hir7QWfbkA=;
 b=SkxpcRvYYCsLIRohjN2snk0/rnHGQ2YO0I/lWzRv76dioUHWPr3NC4uBGKE9RsZwyII+ydKQDA+wfR/nnd5gmcvuMFZK6VPr41JcboOv3LTw/m0Pl4AAkgrvTxfp18lXPUFzdwvLjwYemEbUz06GsheB0H2ZKYqntLvEKrS5xd8K0lIpqOYxj2Lfm1Ow0nzwjRb2OI0vAcaBV7ydDHdO0qmeGASa6tbGDMs1aBQnTgbO+wg2130LyEro/gHZJSdO7QeOcvIB4nZCXoQujB7OH31cs6hZuT0UvxeNOWH+GMa78Jqc6box+P+YUIvXPfGKUV8l1xMJdE/qFK5nqZZmwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hnKpW/ZlXNNlARixQ9G3gk8JjxDTPq2k4hir7QWfbkA=;
 b=assR+egwhr6DFHZ5xZ9DzQC+g0hZxBKS1fvbgasMiuzZVnYhGMa1qFH1gp5HcemnFiuDHsFUMdAWkN46Q4hULAL1vP3BIVnxd8UKmgWGXmTZQaCFCfEK8AbO+aTnw36apGY6Ki/iQIOS/gTf7psMU96SjlnGPM+FBryUNmgb5SQ=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4289.namprd11.prod.outlook.com (2603:10b6:a03:1ce::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 06:49:17 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2937.028; Wed, 29 Apr 2020
 06:49:17 +0000
From: <Tudor.Ambarus@microchip.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Fix description of the sr_ready()
 return value
Thread-Topic: [PATCH 2/2] mtd: spi-nor: Fix description of the sr_ready()
 return value
Thread-Index: AQHWF6Z/3awBVO2QcE269Zh7urPljA==
Date: Wed, 29 Apr 2020 06:49:17 +0000
Message-ID: <4172206.dUhbE6RG6t@192.168.0.120>
References: <20200421063129.244466-1-tudor.ambarus@microchip.com>
 <20200421063129.244466-2-tudor.ambarus@microchip.com>
 <14162c9a-2189-024f-7af2-e072ea1511da@ti.com>
In-Reply-To: <14162c9a-2189-024f-7af2-e072ea1511da@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6e6e240-5145-43f1-d1d1-08d7ec096fe7
x-ms-traffictypediagnostic: BY5PR11MB4289:
x-microsoft-antispam-prvs: <BY5PR11MB42890F35DD0D86113460D77EF0AD0@BY5PR11MB4289.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-forefront-prvs: 03883BD916
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(39860400002)(396003)(346002)(366004)(6486002)(5660300002)(6506007)(53546011)(8676002)(4744005)(8936002)(4326008)(66476007)(316002)(66446008)(54906003)(478600001)(66946007)(14286002)(64756008)(26005)(186003)(2906002)(66556008)(6512007)(91956017)(76116006)(9686003)(6916009)(86362001)(71200400001)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MBc80AfmM/jH8MSGKA2KG/oCAE6JgtxG4beCMoZPmyCTPDkmlqoJzIj7UvPHDVsCdpSG+h0/uX8NuL/moD6hUBeaG/sqGaUvWFGo3sEaS3/k/LkAmVEBg8skMD2AQQovDNRAjh5EP14ln3i/8t4IKImweM3EiF2beFoCrhSDavCfAzK4NKlNcUWtc7y6d7xHXYFQJQHW+7z78qVoyWazT+NnG1OECtlWtEW+PftIMZWHV5mVTnCm3SC6n0Bz4yCuRrIv8mtliDUBXEe9CM90rsWFI8Ib1IyUIgy6Qfi+HWYulWpmGeDm8bXpAblYvPHfBd2KKq9AWM/yueQ680MhLDImkQXVCQS0v+KvHvzlzkmCjsmSG7tUg+NmRwRI+qi1p5D+C3Y6sAtYwwiESG+LFmWlf6uPKhxbfyMztry4116jb39hnXe8ipK6Dnm7C8hTp1hxbKC+KlzvwRcnAUAYCXU714xUPxTTDFQVLW5UIRMuhhBEPV1RxZ2gxH0YL41/
x-ms-exchange-antispam-messagedata: wqYQxe49N8m4uKMMwmkQxh4otNUclWAmtPD7TmStz0aV46R4YcfotYj9/9zBtf9YacOwrXwfS+zP/I39fPNR1NshI6D+Tg8btGAPeYnKzPHy9jPi7v+mgQEskxE0BXDO0MkYlkBgdCRT3KqnxXCr2bKvEutBQj029tJ7LgD5X5mZ9wvoBT2Y/xQFWcBCMosxbDzdr6Ktw01H0h705IYeTN1wDvgs9TNI1FIFbJ0IRCeZxGuHSubbb6t56jfTA9osfPEo66hpW8Cb8NvMwqu9oqNrpxj8ZYE7yBwMx6ltVKGNw5iWr0O34Rhk1QiwDbc3oJjL+EI5jnGONEGWzQcZIuyQ+GvdfPWdeOV7s5qmhYHq9n6BA5vliTXRErj7p4tu/iwCpZWI5t/Jtipv85R1ESSVxgY26xpv6Fk+r2d/Xv+0zX0i19WFrU2cUGF2U1p4/KmLMVOLWxwS93wLqeFS7SWwaR64iXGSNRjjbfippTimlpw7bh+6Z6iFCtgWDpKAGiex9gRLY8OzAJdb2HrSoEsrrskwISeWhZIjUC7eZwR+l15lL4pJO/+IL264619gOg6VESKgjhTCMckVVmZl1Ky57EDHvr2YcR+MLenp7d+yJ7TMY8r0KnezkmnOt9H43qED0m8mc/8+Y4P4a9x49U1F/5o0ZAdftJhOLAVnIefI35V7zawuXIRAgq6/OiPjqUMSYcwq3eldY8taI1OA6QO5p+o5wZlFl/SSx86UooX60lGE7dshvVbpBui+infRy4jKe9BUF7LAPErcefk7t2AUuX0PJ3t/c03TwnO+NrU=
x-ms-exchange-transport-forked: True
Content-ID: <DDD1935A9388D04A8937EDC261E81704@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b6e6e240-5145-43f1-d1d1-08d7ec096fe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2020 06:49:17.0569 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hEJ3Di6lcB83z076gx1Ihp/+/AfApU2UXXE/BIBVmmJE4H/GzPNuz2FcSb9/TShzs0bNCrr6Ylj2N+4ymmzSw93REDcChcopecV+aU1+3So=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4289
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_234922_226324_81841473 
X-CRM114-Status: UNSURE (   8.88  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tuesday, April 28, 2020 3:21:53 PM EEST Vignesh Raghavendra wrote:
> On 21/04/20 12:01 pm, Tudor.Ambarus@microchip.com wrote:
> > From: Tudor Ambarus <tudor.ambarus@microchip.com>
> > 
> > The functions return 1 if ready, 0 if not ready, -errno on errors.
> 
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> 
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > ---
> > drivers/mtd/spi-nor/core.c | 8 ++++----
> > 1 file changed, 4 insertions(+), 4 deletions(-)

Applied. Cheers.
ta


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
