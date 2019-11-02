Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AA2CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:34:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1283220679
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:34:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JqbZUPXC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="QI6i3fps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1283220679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BnhNlO038h49A+nwp25PwE5C61BppIT+w+IH3COB9N8=; b=JqbZUPXCUAJCoF
	5l1ZXtfByu1zyBQA+h76AeD9gzTCw5Wj/JMJ/PDtLSskl/hx5LveQiRCx1iDxVGZCVwFE+MEIWMf7
	4CqXVM3q/QR5TqZNBFw/7eVdIzOI7QHLtPT2vjFiyb4Kx70TTwq7LOuSIrRUd8M37UBnWJh0d8T28
	oO/OkR+c5APmxB8EY9IqRcHL9xIipNYM9YP2LgupOsK5FM5idWQP6oe29bZg32ZTiUJ50zD5W+aoY
	FjRIit7u2cLi3TdTP7vc3VBVhhZ8GbjFzdofh1aGdi0dhc991hirEutn/NiMwJ6Yf3ixj2M1NrWT4
	9Mn9O4dYaDauY1H5/pSQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQqjX-0008WR-MH; Sat, 02 Nov 2019 10:34:15 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQqjR-0008U8-Fa
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:34:12 +0000
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
IronPort-SDR: 6ifxTjuhNhyD8kaiWCDCPW+2xd6VwbJxxuKQEpqQbim1ieeuTvVBud3hO4QSohFnlI77OB2HlS
 wluD201+BkLu71gO/wLGVtFlEsKXLbnY7pPIJgeIZGHFvh6GPKs4D2BausSpNswIoaW21CESw+
 iLOSUd/R6pp/W7aVtghySxjWg2PRvmDzctNvVsRiBefarziFDbs7GaugwHBedIlgh+WZvd7pYH
 G0UpvG7pbT5Trvkk+3UzqO+GhknYc1pmJwhWeZFleyW6u/5I6if3ZmC1bkQykENX55PFg12pZR
 wFk=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53867297"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:34:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:34:05 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 2 Nov 2019 03:34:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lImqHnhIBfF/ZoZBxYJAZ7Gzox0fDXc9858KbeLQ+OEVWv6OOuoaJ5T5kq2Zkv8ERh6eULQxFDNd863Xof97peYycDJ6lvZLM3qNQx1KIErw7QbiMwSQYRCX7fTwKzeLEqoIyS4NlzlRunAeCGbazbCjlkXINl99vo3WrtUFPTihyprFVYw6edIpdlPxDy/644g8POkfCAksvk2PBsJY/u08T272s16mMfeomFJectDiBEdj2WO/4/7+sWFtXZH82KxsbLUJSKQbZf5SvqS0+nqYkuWltgY3pqoAETjJiaFoSBky1Tef4HrQv8hGbFA/0ljPmHnu4txwuk50Bg9EqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbaLNt48hlQK5q7CrjQAJAnuN0iwVCjK/IEU4cjvE14=;
 b=aVNcRUMnJ/NC820BM45PYPj9kxcQOqhysUpmTvlSWJv5+MDqMQYOVVptoeQZG0mNRtm/pzYkKuYHj2GNFTq8JarMLuPRO+vt1hsrRWFvUMqkdMfb8QjUBvEo5Y4J6C29eczSHuMgWOfv8OnK4H8hO3avrs6NnMqZukGfLY4YJNDGMlB218t2Yvu/hSiO1mF8qrzmp0yfeM0ExuxyNBaT/zAu+JykZ8RhQH2nxpjD3r8C/W9hOb78we3fiIw5OpCNuE+4qwNypdHYmpJcz0EOtXhw9cVOfutIxjcFJUdR0vqqT/GCX4yp7ZmqCJjvuNASYFbfQTmNS8RHGMDoYXV1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbaLNt48hlQK5q7CrjQAJAnuN0iwVCjK/IEU4cjvE14=;
 b=QI6i3fpsxDF7AbwGlBRPtXsDD+ecVeklZoJQS7mvYuJkmXcxicbKv/DDuow/yf3PlR0Li6WNt2H0aM+SHZ06rUDERXLJiTIAWuyWuTUGRUIzUAaz7T8a2s+vTeBhZ1FTF85apiqpgC8wg7Car2y1ityXPXM8mIX0K9w9vvBuT2U=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4223.namprd11.prod.outlook.com (52.135.37.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Sat, 2 Nov 2019 10:34:02 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:34:02 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 01/32] mtd: spi-nor: Prepend spi_nor_ to all Reg Ops
 methods
Thread-Topic: [PATCH v3 01/32] mtd: spi-nor: Prepend spi_nor_ to all Reg Ops
 methods
Thread-Index: AQHVjkpbEAWn0W/WNUW6ZfmVSIdQEKd3tXMA
Date: Sat, 2 Nov 2019 10:34:01 +0000
Message-ID: <1e275ecd-deaa-fdf3-cea2-05a09d4b0852@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-2-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-2-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0036.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::25) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 528a1ff5-ecb0-487d-cde1-08d75f802d53
x-ms-traffictypediagnostic: MN2PR11MB4223:
x-microsoft-antispam-prvs: <MN2PR11MB42236E17A840E9DFE112E9D5F07D0@MN2PR11MB4223.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(39860400002)(136003)(366004)(376002)(396003)(346002)(199004)(189003)(8676002)(6436002)(5660300002)(52116002)(36756003)(81166006)(4744005)(81156014)(486006)(71200400001)(256004)(7736002)(229853002)(71190400001)(25786009)(476003)(99286004)(6486002)(2616005)(54906003)(31686004)(478600001)(3846002)(6116002)(2501003)(11346002)(305945005)(2906002)(26005)(446003)(14454004)(186003)(64756008)(4326008)(6246003)(66066001)(6512007)(31696002)(110136005)(53546011)(6506007)(76176011)(66446008)(86362001)(8936002)(386003)(2201001)(66946007)(66476007)(66556008)(102836004)(316002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4223;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xdzIH3diHup4NT7/7Y3nRNbG77B/pdMwWfIOG1uOhoLTOSF9tDlHkOgYgCqfP/l4AaliSdwGPOsfxlXgNOjIjvU3SB2rD3QPltxsXQScvjXyNel3j5QK3jNrrdHl4ciayH0m6VoxOs5JVvn3DLhA1/tm6CMoNpbzCw7fLLSTsd9a7qp0sIa+Pb0srpjkbSae1ev0nucabzNLbm8gq/W8OXng5JlDwAC9FmyXFjCrv02MwPGxwGq/5CP5az5JVs/BhS4ApFve9kFuu+h8ny3NJpFr9I/B3GWCPupi5x/c5SBoBn/MVIVesd2VKSgefZ2AC8k5S0WA1JIk0GpeoZ/hJnxAbjuxr/ze1qIxoyK2om899DwV/Z0RXe5norgSKLTr9Ia0ajIH/t+Q5sjcFOeRyzINRCFtxUmN9VQOJcUxc2ZTeSVHzbX/Rlmi+SFL7gNx
x-ms-exchange-transport-forked: True
Content-ID: <BDB34A84FC17B14DA2B9D058026C7BBA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 528a1ff5-ecb0-487d-cde1-08d75f802d53
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:34:02.0582 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vjOHsJwusNayYjJDGTGjgHCcI0IGcb+EzR0/v5y+6N3cLGGZqCCUuT0NX9mKndnSqb1vQ3vfkv4Z8eThJrGIwKjIpTGU2Ctm0dncKg6QyxY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_033409_667089_B47BB5EF 
X-CRM114-Status: UNSURE (   7.56  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/29/2019 01:16 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> All the core functions should begin with "spi_nor_".
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 110 +++++++++++++++++++++---------------------
>  1 file changed, 56 insertions(+), 54 deletions(-)

Applied to spi-nor/next. Thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
