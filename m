Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D0CC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:32:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3568206B6
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 10:32:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jsHpgehb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="CqeuqhLD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3568206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0OQWqjzyIhwklWsx51ApCtO8/qSPEQpdszn4MlxO1xQ=; b=jsHpgehbEdRNWO
	nuyXHJ4C2tvNQUddwxZjjX7Q812bzQ1P00Uf9MsLX9DMc1UoxVjEr8jTAFfNQTZpjivnGApI4Kp0L
	OHQTc00+PFiPPcE1A2Fi8EGdOu3DiDHonoZ1wA+llqb238ZtVsO3X1M2/MxIJSR1PL3r7EK2zJMMe
	AkD+zbfs8CA0wEAj+Xgcb59V8rWO7EWfPfwdjQIA6pk9F1Z1+QNNYsOv4nz700OaR9UICUz6VJll0
	6q9XricrkLYsQvgkI/xhRbbXgmRhApNAIiPktUQ+HRTokx2tpZCLQv5ciO8770yJlEHLt9I4mqkoV
	HUs6TGyawHnrVStd/Zew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9SKr-0004P4-73; Thu, 28 Mar 2019 10:32:37 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9SKo-0004OK-3Z
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 10:32:36 +0000
X-IronPort-AV: E=Sophos;i="5.60,280,1549954800"; d="scan'208";a="30323103"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 28 Mar 2019 03:32:27 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Thu, 28 Mar 2019 03:32:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQrfs2z+pvvUQIVgHDxh78+lztr5MgGuFY6+h5y5EL4=;
 b=CqeuqhLD2Zmbnlg0+/8qKBiR1SAkYGRnLdc63/l4eRjc80S1CP1csyc4YI2lxUr2Ng7zrFVHDg+5rMTJpyFoVem2YHVGwqeqGKcBLKiySZmC0ZugoQ/bIGRGtDjiM4ZiQVFXbG/g/ZxfHth0oKq/2KgOELVwGa/lBnGYtjHeHiA=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1972.namprd11.prod.outlook.com (10.175.100.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.15; Thu, 28 Mar 2019 10:32:25 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3%9]) with mapi id 15.20.1730.019; Thu, 28 Mar 2019
 10:32:25 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <bbrezillon@kernel.org>, <marek.vasut@gmail.com>, <richard@nod.at>
Subject: Re: [PATCH] MAINTAINERS: Add myself as co-maintainer for MTD
Thread-Topic: [PATCH] MAINTAINERS: Add myself as co-maintainer for MTD
Thread-Index: AQHU4vAJ2j1zDpLGl0ml0cNqWoULGaYg3SYA
Date: Thu, 28 Mar 2019 10:32:24 +0000
Message-ID: <1f0f42e8-8b68-e97e-3b37-96b5f9dd6bb2@microchip.com>
References: <20190325094846.30709-1-vigneshr@ti.com>
In-Reply-To: <20190325094846.30709-1-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0275.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::42) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: df314c84-5c12-401f-a9da-08d6b368aade
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1972; 
x-ms-traffictypediagnostic: BN6PR11MB1972:
x-microsoft-antispam-prvs: <BN6PR11MB19721649586F1039A0AC4BCAF0590@BN6PR11MB1972.namprd11.prod.outlook.com>
x-forefront-prvs: 0990C54589
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(39860400002)(366004)(396003)(376002)(199004)(189003)(5660300002)(53936002)(7736002)(31686004)(106356001)(3846002)(305945005)(102836004)(6512007)(6246003)(68736007)(76176011)(14444005)(53546011)(256004)(6506007)(6116002)(386003)(105586002)(4326008)(97736004)(25786009)(54906003)(8936002)(66066001)(6306002)(110136005)(316002)(86362001)(229853002)(81156014)(81166006)(6436002)(99286004)(26005)(71190400001)(4744005)(2906002)(36756003)(486006)(11346002)(478600001)(186003)(446003)(2616005)(52116002)(72206003)(476003)(31696002)(14454004)(8676002)(71200400001)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1972;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qVyYzc8zOtBiROjwsUS5vQ8FMg2KaYaeQVA7mDrVktpLMo1EDaLlERPW5vbTd8f9VNR513kUZ2/DPBsJikiCMjWd6mWw9MUm0FSAh7zkRK8Pf4dnkR0VnsFpK4XB7zQDLGOxgNpriPJqJY5R95OKbeOfbtoYfdZBSnzgUFLTWVU2MrTk2IvucAptWZ43vZuLSLgoI6iky7YJx9ulP8GDRhVLjmuDBFI6yxqJXSxR1My9zwm1DtG8FeXAdAMxdL33PKCIxeAywJo/FakU02xIsZSZbjBTqeR1UhoALcc7wXBtRvY5/81QftKe3/uFvucif2ASQQVnMgIh62z64GnCH17RX65L8VfLITnaOQlwYFIBOPvsVL+YgdpkJUTAhaC7NduQhz2WildzCOe4YcTL+xidXG2hZmAsi3nkGbTDwj8=
Content-ID: <4A3C5761F3CE1F439710BB5D2753F96C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: df314c84-5c12-401f-a9da-08d6b368aade
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2019 10:32:25.0529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1972
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_033234_341665_BD57828A 
X-CRM114-Status: GOOD (  15.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 03/25/2019 11:48 AM, Vignesh Raghavendra wrote:
> External E-Mail
> 
> 
> I have been contributing and reviewing MTD patches for a while now and
> would like to add myself as co-maintainer for MTD to help maintain
> CFI and SPI NOR parts of the subsystem.
> Hopefully, this will help in taking some load off current maintainers.
> 
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>

for spi-nor:

Acked-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Thanks,
ta
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3453f397ad87..d950fa01d829 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10014,6 +10014,7 @@ M:	Brian Norris <computersforpeace@gmail.com>
>  M:	Boris Brezillon <bbrezillon@kernel.org>
>  M:	Marek Vasut <marek.vasut@gmail.com>
>  M:	Richard Weinberger <richard@nod.at>
> +M:	Vignesh Raghavendra <vigneshr@ti.com>
>  L:	linux-mtd@lists.infradead.org
>  W:	http://www.linux-mtd.infradead.org/
>  Q:	http://patchwork.ozlabs.org/project/linux-mtd/list/
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
