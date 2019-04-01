Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CC4C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 14:54:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F1F20880
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 14:54:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DAphKgkE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="VoDLRpFM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59F1F20880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yeJ1h6XPahPaM4P33I34J9/ffPkZWcgl3u7bL14F/+o=; b=DAphKgkEmusmKC
	Q/GdkmK/4Jroc6ydGBJkyHSb5JY5+AjQdox2ymVVG39n4ova4qVt5iWjavoDul1CTKWjgRheRxILH
	nDa2DnIVA522XMyI4d99YHPCKzU7xrZ5cYpBiTnPpkVCPB1FKMsHqF6QiHCUtpuMGQJeFGZHRY3VG
	CpkoQOkQ0EMWp81gj19BCfYXF8PZMQmUKkcOGumIIsrO5CGfs/WNGLF3vUztWpbFtVByjcgJThiWJ
	dWKraj1/1wNZTQ4or0JVQXGbFWER5le/aICyAbRjaQBj/1KwMHoSFE1XJX34kaOu3UalxEZdunjzT
	d25OKgzVJAzbKCU7NFZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAyJy-0001kC-7d; Mon, 01 Apr 2019 14:53:58 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAyJv-0001jl-3D
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 14:53:56 +0000
X-IronPort-AV: E=Sophos;i="5.60,296,1549954800"; d="scan'208";a="30583192"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 01 Apr 2019 07:53:52 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.107) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Mon, 1 Apr 2019 07:53:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvQhF3OCtFXkaqOdzxKtzOI1U+dIdKJH3xUi+pWdOT4=;
 b=VoDLRpFMbxm2PEMvwgRKIz/MH9Kv6/R/oINX+lLI6cF/YULV8gN+GX3GfHSwZLf8kDhHeLQ60tsIjn6Q3IWA890L4NHpruV9IdItMOrXvfMz89Fyn8aoXhEkv5SrmZ2QO2hi6yO5Nw4Jbv5bPo9titrUGQrUazgBiHImy592M3o=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1553.namprd11.prod.outlook.com (10.172.23.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.17; Mon, 1 Apr 2019 14:53:49 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3%9]) with mapi id 15.20.1750.017; Mon, 1 Apr 2019
 14:53:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <boris.brezillon@collabora.com>,
 <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix spelling mistake in error message
Thread-Topic: [PATCH] mtd: rawnand: atmel: Fix spelling mistake in error
 message
Thread-Index: AQHU6JoyxJBLUt+lx0ifsjFhKaVMf6YnZDAA
Date: Mon, 1 Apr 2019 14:53:49 +0000
Message-ID: <b6d8ee10-ecbf-5a70-1092-27ec6d12f9c3@microchip.com>
References: <20190401144901.8965-1-miquel.raynal@bootlin.com>
In-Reply-To: <20190401144901.8965-1-miquel.raynal@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0236.eurprd07.prod.outlook.com
 (2603:10a6:802:58::39) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6855f500-81f8-473d-e22c-08d6b6b1d94e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1553; 
x-ms-traffictypediagnostic: BN6PR11MB1553:
x-microsoft-antispam-prvs: <BN6PR11MB15536D1847FBC5A7C631317BF0550@BN6PR11MB1553.namprd11.prod.outlook.com>
x-forefront-prvs: 0994F5E0C5
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(396003)(366004)(39860400002)(136003)(199004)(189003)(6512007)(6116002)(31686004)(97736004)(26005)(15650500001)(36756003)(256004)(53546011)(14444005)(186003)(6506007)(386003)(3846002)(4326008)(478600001)(102836004)(106356001)(229853002)(31696002)(99286004)(52116002)(86362001)(76176011)(105586002)(68736007)(72206003)(5660300002)(4744005)(81166006)(81156014)(110136005)(25786009)(6436002)(6486002)(316002)(6246003)(7736002)(305945005)(476003)(14454004)(8936002)(53936002)(71190400001)(71200400001)(2906002)(11346002)(446003)(66066001)(486006)(2616005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1553;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4jE9NoIClqha41bKy8FHwzj8SchUQbdY/bLcFOeYKUW1iXQPn89ge6+LO2r4K8IpXNIWvMckdxPR2ujeGa61TGxKZxvHzin01kUM94HV0Ja9lpQG8VFB1WIUH4x2NTRgHeODugJM6NHp9UaNn9KfoVFw9ND/XU6r3lRZUO+QBs5MorYZ4SDlk3XUabmv0KQ0QIHT6yxoZvbL2rZXLRCFYXiAFy1U710yIjGAv+z9xvucXk9G1rN78FoWi/fIyB0MwuzF918bhOz9X3JYwGOJQ1qtJhuuia0ps72kFc5i3QIdYTVlbZ0ncZ5CjQ8XKyIXgZVBryjMNp/ewdaboUGIRrP3zbtJw1/NwHQz+50dcIc83c+V3t+nj8cAlBVk4t/8sbvDkraOSSxPEUyDvNSF6JMN7iA/oKneAGgTKAwdOhY=
Content-ID: <0216C83148415B4DAE045E57BFFEAB02@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6855f500-81f8-473d-e22c-08d6b6b1d94e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2019 14:53:49.3878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1553
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_075355_335592_1F833ED2 
X-CRM114-Status: GOOD (  14.33  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 04/01/2019 05:49 PM, Miquel Raynal wrote:
> External E-Mail
> 
> 
> Wrong copy/paste from the previous block, the error message should
> refer to #size-cells instead of #address-cells.
> 
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index 5781fcf6b76c..3ec421ac44e2 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1797,7 +1797,7 @@ static int atmel_nand_controller_add_nands(struct atmel_nand_controller *nc)
>  
>  	ret = of_property_read_u32(np, "#size-cells", &val);
>  	if (ret) {
> -		dev_err(dev, "missing #address-cells property\n");
> +		dev_err(dev, "missing #size-cells property\n");
>  		return ret;
>  	}
>  
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
