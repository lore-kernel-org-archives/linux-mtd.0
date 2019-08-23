Return-Path: <SRS0=tnEL=WT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6EBC3A5A4
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 16:08:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 255712133F
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Aug 2019 16:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kiCh8VhY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="qzHJKk5c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 255712133F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnuQ7uJiE0GZW2Zzhx2gan3MX/dOFiKHY+1ssdpWe60=; b=kiCh8VhYwQO3N2
	PmN/W3eNMvHqaD+QafkvmMp6n0x6NuuPmtOMdNZ/ikfC3SZn0jKSrbyT1Zs93lqS//wmJbeyC6XEb
	s/cxgbGoZ0E8gejNs0tvJytIYfyJU0aZU8Khgf72CUqpKwqjxsvrWgrGiFTEjRoVbGN+lohSwugML
	8RlO3bbuwNpQ9tCXCZhKkwm6fbeWIglar159RTqk5Nwuq/I/D/AB6qwEhkk51febs7tuGL5Tad0Sl
	vzvyedNPkukTK6O9OIBi2ceNo2rTVmnumkWpNyHtJxcucYwn0QmoYgUxc84JnlkpPxQG3Is/Gwz8a
	0JHqIgLyeOOYpJtU/E8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i1C6X-0000YK-8f; Fri, 23 Aug 2019 16:07:57 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i1C6U-0000Xj-73
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2019 16:07:55 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: ogO3tExMKkqIL3YI69aK9J3ow9tBM+SO1HGA7M7FAjwXAoy83X7XfxBBQkQkEZoLV/FoL1cl8U
 t6aCD/av2+7XIli2Uly0z3CjOMTlC4mqW0A/tZKdDzqipTDLaXauNSNqzLFLGQ6e7Aj0PTRKdC
 3H0HxJUMLBOXDZteFQmZH0k6cvEsM5SkDNyxCdGJCKGwzN91FoJjah1MdRAMHTja6G9YWNp5e8
 sYvyCqZOjCJvuJo3HQ8O6Xim2cZavSTnnPFwV8jkv2MhvuXeAXZ2gUkxCftyn8gHw4Ns3DtAMf
 gNs=
X-IronPort-AV: E=Sophos;i="5.64,421,1559545200"; d="scan'208";a="45399391"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 23 Aug 2019 09:07:52 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 23 Aug 2019 09:07:47 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 23 Aug 2019 09:07:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PEnKC+nQ7n7B3pkKq2KywbndeWP0mfDrjwIhim9KLX9jfrzDAji8ZuzomuTx4cOyJf/qhJUxEDrxeUENfQeLTfqrK+YCuLkF0/hdfS1nLHTDBVy191RN7O5tvuJIsCVHMV9qdrppSc4IQrHGD8OxCHglGKVVQMvzjvdX58VIHiPwRBi3M9LowkJ+HSZ+mqnY5mLN6XXS/7WWeZqPfgkvKxu7zXwhTikWNShZz+TZ3j8P4fdnnzl7TeY9zKZBdMXedgAsX5asaulKcdrYVJJTYS10pehE1hYcid/w5mvXFaDk+E2/17/q7OezKPAbOT1HhDKPg9ddAJYcB7PWnEDCVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwJVG/Owy1MP/r9Sc86/05Hdb24kqUA9Yujrdc22Fkw=;
 b=k8o18lF7mlx/TBNTnIW09gEbftDHZBgrRhQR50oCIIGJ0OPgG7qU5ivpMsAF/66m/Cnt+tzpAM6IhcZJbZ1hKb+yhFDDpd0KVizUS7HYbsqFq2I/l0Covq9guFHZTz6SxMLYps2xkn+/5Q4C4GR33147wX6SLFOtbTxaHX5PDuN92MJz93mERWduvyCLLYTIA6ifbQaU2gwdMtnJjE/1eSwsBfJGoimsLz1Q6O0CeS14BeAbCiKhNaw/w5oXLsNJrhmpeGpII5VdEGymxXvINQi+sseUYf+3axE5Ln60gez5DHNR8Z651qEmmTwbLZpKfBtfVpLK90AuwAxy7Q3NtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwJVG/Owy1MP/r9Sc86/05Hdb24kqUA9Yujrdc22Fkw=;
 b=qzHJKk5cgnnxdIW7xzUMQXMEU6Y3yj7wS3bv4k7cP8B0DZnju6+rcFVxGAPgw4sS06FufaUH6YW4+F9zq3mQyrPN+rWWOPdUYJSE8OC2sJxKtXcgfCXvOa3BnyawMDtB8qzgr1tQ+wQEuDzhOofsxFIE69gaSvreJ4uvBVJXPT8=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4000.namprd11.prod.outlook.com (10.255.181.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 16:07:46 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 16:07:46 +0000
From: <Tudor.Ambarus@microchip.com>
To: <marek.vasut@gmail.com>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] mtd: spi-nor: add Global Block Unlock support
Thread-Topic: [PATCH 0/2] mtd: spi-nor: add Global Block Unlock support
Thread-Index: AQHVWcyE8k/5ko42FESjGCuiD3PSZ6cI5iyA
Date: Fri, 23 Aug 2019 16:07:46 +0000
Message-ID: <8e8e85e2-9645-0c1d-0c02-171185567fd9@microchip.com>
References: <20190823160452.14905-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190823160452.14905-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P18901CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::17) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6085c55a-95a7-46c1-4ddb-08d727e40959
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB4000; 
x-ms-traffictypediagnostic: MN2PR11MB4000:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB40009040801DF5910A53DC8AF0A40@MN2PR11MB4000.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(376002)(39860400002)(366004)(136003)(199004)(189003)(6246003)(99286004)(53936002)(6486002)(66556008)(31686004)(6436002)(66446008)(256004)(6512007)(86362001)(229853002)(81166006)(31696002)(8676002)(66946007)(71200400001)(71190400001)(14454004)(7736002)(2201001)(6306002)(478600001)(305945005)(102836004)(81156014)(6506007)(53546011)(316002)(25786009)(26005)(446003)(5660300002)(386003)(476003)(966005)(486006)(2616005)(11346002)(66476007)(64756008)(2906002)(52116002)(4744005)(8936002)(186003)(3846002)(36756003)(76176011)(66066001)(2501003)(110136005)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4000;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: am9B4t+FyR5Z2mpmZSQja8YzS7FdN5LLGwKWEH4/g/UYcJHTyp2SN9lNpd+/u8WWWnhu+qbHBkaWdxKmobGkgWchJFkvLsbC8dGJuI4OhAJDqfMIe4PeH+SW4mf5CHiNOKdnf911DnDE1tDwXXhOMCh9tZ8jTHX0tNd2SmcFfQeVr9XswxPpOjxu03psO0VRTaf53gPCnztyEpVkZbeQTGrfcW6T7v1watxGUdV3jHvA8Xw3RIYK5MDKwZ86VBkA7UdIxsrwcS4qOWtjwG0TQ3mB80vavTHpA+jVdwbI5yP65HFS9hgeQ3w7m/aL5B7hBXrj9FXmlx1VnHN6yn7AVMAiGxJXu1ySLXo3jS31KZxFi+hFkuwbNDWUTYh8BmGWrbsxqdA+Yi6/D7u817S+Ikjt1DHlC8coaMkJwfhhFBU=
x-ms-exchange-transport-forked: True
Content-ID: <34DB623D43E15B4CB70EB654248579E7@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6085c55a-95a7-46c1-4ddb-08d727e40959
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 16:07:46.0927 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GJ/Wd5/aJEjyLCg+wGTYH8oJMq7JZD+vFdGnD3yavZwVkWu0z+z/FZpUUlEQf2Bj+QV1sa0ma39kTMVpDIOldlaL2sqC8lt8xvhwin2d9xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_090754_288508_162B4F60 
X-CRM114-Status: GOOD (  11.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



This has nothing to do with the move manufacturer out of the spi-nor core
pursue, but depends on:

https://patchwork.ozlabs.org/project/linux-mtd/list/?series=127030

On 08/23/2019 07:05 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> This is similar with what other nor flashes are doing by clearing the
> block protection bits from the status register: disable the write
> protection after a power-on reset cycle.
> 
> The Global Block-Protection Unlock command offers a single command cycle
> that unlocks the entire memory array. Prefer this method for higher
> throughput.
> 
> Tested on the sst26vf064b flash using the atmel-quadspi driver.
> 
> Tudor Ambarus (2):
>   mtd: spi-nor: add Global Block Unlock support
>   mtd: spi-nor: unlock global block protection on sst26vf064b
> 
>  drivers/mtd/spi-nor/spi-nor.c | 51 +++++++++++++++++++++++++++++++++++++++++--
>  include/linux/mtd/spi-nor.h   |  1 +
>  2 files changed, 50 insertions(+), 2 deletions(-)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
