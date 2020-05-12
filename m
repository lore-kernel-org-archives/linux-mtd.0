Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC90DC54E8B
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 13:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8082206CC
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 13:07:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FoQ2frTp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="vvtMV6Jg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="TpUKiVUn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8082206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBhRRtNtKnS4hddPmVgtLngzosT85az4mG1W+vDv8io=; b=FoQ2frTpeDChsX
	UaWvkgkubpYQxKS+dddlss5OA4W6KmCwMudJzRDs2vnoiCekL5OlF93iJ5XgT60bBRGTsDqaFCIBC
	WUtdWr3YrvQGRlpUYnbscmF3qoRXP3DDPUsDO7MVjypW4A2J9/DmfvzFGxoFMy1g39xrmPCMNhDZo
	mSn1cGGaNySENUWi7ynwZflJKH+LjNdFl8H3XppM6S4/oz6qNCxh/ua1aBtzTxN8mtl+pxIbzsyUp
	L/g+dzWTFWTdBVNBYX1C6Sn6W2FQMSCed04ITtWHNm0aqAa4MXTu94NlHKy5dUUb+QzYTU6ZhmGXC
	j1c/+2UxRnUUbJ6hnTNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYUcY-0004Ub-6T; Tue, 12 May 2020 13:06:54 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYUcV-0004Td-8n
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 13:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1589288811; x=1620824811;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=xocvzlE6c+mJ2d8yUDOfYclSZJFjQleBnkUCgFpqlhE=;
 b=vvtMV6JgXW1n0BvPjZf50rzMAttlU+p+uli3lLYB9sVinmotxV7OArfj
 KIUx4DN347kzZRcn+dV215OfLVU9+gh3tTnRlr+khG36NWKGf13rqo31Y
 +ClhFWVtezyLp5t+77MG0IVgjpfesUQV7pwElL5XafPdqnGq88goBWz+N
 6J107c76Zz2jzhaSnmq9hfWJXF+4ZR9aox/UnhHB6Mqes/uMbb8hdy9EJ
 erbAVaT6w1jKYhcP+zoW6kDgtFhrTTF32PfcvZAySF8off8qpGQ7jMgYk
 Nf9fDxXZhuJ2LHJsoKAczL5d6a5CkMLyoZV3e3PIfHP0QlD2oDtyxnTCA g==;
IronPort-SDR: u+lP6gcP3qa+aTXd/09vcEbArI+nogXKFkCzlcNeL5Kka00RGcXwHXDhyEf1OesTXoJTLDYlAX
 u1UYkG7KbsALDgteLvXH8RKckhxgsaSB/pyAafPVY8O8swJpcpEKMZ3vip/cHu7Ic9Vx8wnrMc
 P0fBhcecf+hiXspkXHSlEKAAe3CfACD9PZOmumtbCu5tmdx0hh+Cbzm2WXT7ETcuUJQiuggNSX
 oV1P0JEOlNecHn7hxgUsHZ/EaFPwMEunaCe1ioUUZeoR42BfJpD4Dte6tTIgtiiftrNzMaFrRV
 N4A=
X-IronPort-AV: E=Sophos;i="5.73,383,1583218800"; d="scan'208";a="76337347"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 May 2020 06:06:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 12 May 2020 06:06:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 12 May 2020 06:06:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Msc1r9DtXSpXSqBZ4x8kP4qNbovnVxnNDQlAxExgTDno8ZjqlLTeA85c0g/zDzvx3qWwlZTvjg3mqwjQgXu8rlZOqyk00eFvlb+QetulOcWQ4lc1gy/7kbUa5hBVSDz2eVx5iP4/8MWIIG1eovDwK44cEZE6P8fv/vdxUBmHDSuqvDDKaBuLEQOSI6LacwlodTnz3A4cPWydEz/6DiXfmuob3gMLjyVd1Xru2RvZ10PaRDapSWgfMH5ZWnYXo/g8ze7Rhdj41Ga4qVXoiTwiYlCV6ONh+6lAK0bp5i75+NXyEICAsSNlqWP7E4KnT1UXZ3d8+fICqJj3owV+W5DPtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbneQ6KIiO3mqO3u/dFL2aB+SB0b7UopSolqnVnMPig=;
 b=GDVCsfDO+dZJqX0d33vP84001CZlB5BiO3rIRLL/MGVpJ4v9Mi7uIfsgJUe0lL/n8jW+HojlQ90q7Bux4r0sRBp0zRy8BcYPQ3ca1zQ7X5QHf0cQQG4QSAgj1Xik79HDhJmOaMfeUP8kSJgnwnm0JAVGHGcDo6QlaZXGQWJPum1nxLhhHM9X9htNFJaW64943k9iKL3BsH4o3BhtOGOPFCEKGz7KmV9m/kkbUA8mFB2tReNHe6dl/KFJsDlZkTWT3IOpmDkkVCe46OLjgf+IdvfRYAEwUKlXJmdpE8PdVwrbnJIQDCzFCDt2+w0leYWyXafbzdMyeR/tUVJvEvbATw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbneQ6KIiO3mqO3u/dFL2aB+SB0b7UopSolqnVnMPig=;
 b=TpUKiVUnJtveztwJf8bLHxgmHfCT8pCFzUVRTfD/fuzM7NMpZmr/DIv01Bh4F0ZCOTxMJDArAGiV8EoAlRY7acnijD3EYGc0qfpF9La+EsRaTeeeGZro+Epd8vVls7CJvfeLNDPSSEflFSfL1ho2k0VW5chqpP9KX8U6bIngIpM=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4401.namprd11.prod.outlook.com (2603:10b6:a03:1be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Tue, 12 May
 2020 13:06:45 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::d847:5d58:5325:c536%7]) with mapi id 15.20.2979.033; Tue, 12 May 2020
 13:06:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 2/6] mtd: rawnand: atmel: Drop redundant
 nand_read_page_op()
Thread-Topic: [PATCH v2 2/6] mtd: rawnand: atmel: Drop redundant
 nand_read_page_op()
Thread-Index: AQHWKF4wD7ykwMoAn0GFgBlRTRr1Rw==
Date: Tue, 12 May 2020 13:06:45 +0000
Message-ID: <2910135.AWSuKZ8WUj@192.168.0.120>
References: <20200429132046.583658-1-boris.brezillon@collabora.com>
 <20200429132046.583658-3-boris.brezillon@collabora.com>
In-Reply-To: <20200429132046.583658-3-boris.brezillon@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12118372-8ad1-4ae8-b831-08d7f675529e
x-ms-traffictypediagnostic: BY5PR11MB4401:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB440141C50D0EF01FA81A735CF0BE0@BY5PR11MB4401.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 0401647B7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y187GAJ4hC7cc2oKZSCU5boVfe8IefU7GQ1xM3B2kLluJQig7q9tQnK2XwbfxFLK/DcLUbfOMuBC2v8nsYmWpkloF+CSa2Fap2v/koKCf5h19W9yEQGEYZThLvha5ciE9Cv2zV4o2TdKyAe3haRqd31BddzDuRv3Zha3Zj5RCyJ6VH7CfRkc7+TXQwXuYhkBoJMzvQTZzIPpLtlsYIuzTy/g9a4kFBHTDXhCcaKJRVpybWXCmBAEC0n5bBduXyWrVX4McRoCx9dx4i+1YAtn4xlevvJeLhr/c48n80rGwqUVxfX+y5Qiv7hr4h2JXp1G92mES1GILUgFK5W4GCoIxcobnhR613fFvZ/+xvtYsNsnFYFBde2t7TiAHSvdkcHy9SK61C6uXJKfYaoEqlAs2mGEtp0plaAsuVR4NThqN+jhIy1jJiM+eLvMn1VA8sLS9w5RKhqLH0ixBgS3e2X8Tj+pam68JX1CM7ERseGppEamd0yI1jzW/hm6JIQoWRYKkc6nOrKN7O88LOEzM/cR0YeVgf48Z0MayAHdkj8ufkjUt9L5iVuM7x6sH9x2ypH9
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4419.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(39860400002)(136003)(376002)(396003)(366004)(346002)(33430700001)(8936002)(6486002)(2906002)(186003)(26005)(6506007)(9686003)(5660300002)(6512007)(53546011)(6916009)(71200400001)(66476007)(54906003)(4326008)(91956017)(478600001)(66946007)(76116006)(14286002)(64756008)(8676002)(66556008)(86362001)(33440700001)(4744005)(316002)(66446008)(39026012);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: TAy63WGBsOAAtklhmTxleNh3P897RaB8w0byVtNCMUXm1XjxRg73dtbwQfAHockJWEFdL7/TmvvPmh0tmE05ywTi7zgBGQx7bJ99kaLO+ehE7lIuDjcWx19su0g555uHacA+/yzS+yxk2cH3N4VmRyBem25CqxJ1o7qSMZ+5SvhzXQOUcolXtyceodpdF3AWLc6WyXGfeyPnElNfnFSGfPm4deS6waaDkv9xkuPlHgrP5tS2PONsfkWDgq93UPddo89CXpFx+CInjO4bLsAXlsVUkMDn66qN1j861DB7AyiXVjGor65mmuVF8uPKwelcf4NUq6WmfzqYUj0wcBWdOedzGj+81leOPygkwRbKr1mUAggbnqQU2NRonmbuZKrperG7EDQAhsB2bgHTk8a9u9u/MdTncbfOUyfwOx6zXxFnYNpvwUE1/EzY+g/wecvdzMnAZfL/AwW2EinQ9kK4PPnIfQi5Ns5dTcZ2dwA650U=
Content-ID: <6EB6ABC5FF91434E91B1EB74FF02A834@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 12118372-8ad1-4ae8-b831-08d7f675529e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2020 13:06:45.3215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3SqdEF313TKTXP/Z6ZysIzGpts0G5qlx5cJn17oxAUqWc7nToDHybPCFG9agZ7dKq1nvPoFQLM4279uVju+4IFG/xS2bln4cRQ+2OiTP4IA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4401
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_060651_328270_56B5D6A6 
X-CRM114-Status: UNSURE (   9.60  )
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, richard@nod.at,
 Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wednesday, April 29, 2020 4:20:42 PM EEST Boris Brezillon wrote:
> The legacy page read path in atmel_hsmc_nand_pmecc_read_pg() issues
> a nand_read_page_op() that's already issued by
> atmel_nand_pmecc_read_pg(). Let's get rid of the unneeded one.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in v2:
> * New patch
> ---
>  drivers/mtd/nand/raw/atmel/nand-controller.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
