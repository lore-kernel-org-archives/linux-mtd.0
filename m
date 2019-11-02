Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04F71CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:53:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEC36214AF
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:53:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="krBxtcc8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="MK7cv75z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEC36214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HxmBcv/Lv16lIAlTsJBJJMbAC7Wc6asIKsc8KzB2Kyk=; b=krBxtcc8aVlCW0
	1Mm70g14FIuZ7UMdTyrEndAcAmgCOYEC7Hy5K6IGtKORg1Wd0ji2EoVmr3K60IuuiZ0j+0J+mUIMm
	dJp6Vad3go9SEs0dPTD508U6PCapWtgIWgDq/bN9xF7xVJQnUoDQr737g3xX86Kmz+sDOcYLCfq5z
	4afz7F04MXGUf1ZWJb+gKr3ncVqkVoT6WNVoqQIOszHwydgp70AEss6Nq4rxb7HfXt+n8oOXiiX25
	NTX9gGkEqH2Y7wtrbA7CAu0WU+XjLPAn9HYs2wXYGP6rkCX/nxNX37sm/CYbzDn5z/QzF9Vzlc17i
	99+vGPdKLlgZkJ+K9UHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQr1a-00018o-QV; Sat, 02 Nov 2019 10:52:54 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQr1Y-00018G-8j
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:52:53 +0000
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
IronPort-SDR: GU98niBHrlzq3fSNuSfastWK0xEVv3mLMj0b1ZTkyVpMRvUxUbd1B/UgYQdFYEhU39G5uLZ9Ck
 QapqPkBdlhJvEsFkZk9rLq4eH6GhshlvJX+gM2n9IXZ4SDI6o9zvT7ChCpVBDC4FXgutQ42Ttt
 6cV+wp0k7iUbtZFVSjUC+yAaLWc/SUW7G+Kpewq8ZVOhoV1XsfzI4w+xtFdInMfhjnDhmKI9X2
 8hNoNpyD3zfrFb3zNBbRX+epw6yPDkuNABRZyJviq7OThEYFzDhJbtKeUn5iONkeR4HQAqqELz
 uXE=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53899781"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:52:51 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:52:51 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 2 Nov 2019 03:52:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvZqDEgZKsondmzxt5EVtzw3WTQY2G0h1XMSuEo4xbwPfOXEdIhSKmcVo4E9OlQ165PiQgtX21FoA0sLMnV9Ax0J2Wagpph2R9BS8qSqA1NrtGxwjr1PwX6qu6NWKHR+CLmDgji/KXy6NSz4FMlh1d6xaL3rQdesL054B5LVCeCvYV8Zj8R/FINzA++V/nO1yW1tzyaeqaKXF6wA88d04y56F//4shcUq2aHVJ4MfGh5Y9Y+ulR8i/H2oU1WvSNPXl2evxRmCFHZ4Pcc89G4CVvJa1P0+F/If7DEWbFNFqfPAqyDbFFK4/cKGwHgfgAMPMKOjq1U5HPtjHycDWKkSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfjvQ0wWTbVpyqR5A2BdRhWAREKEEyx39T7aenZ2ygI=;
 b=cezalqw5tjBO5+gGmztM8+gATlxVNqfkjiZZZB/T4X7AXoW4J5FIiTe5+KxDSv2dO0FXNVnx+HN2htjBprRFmjfZyJt8VO2jek7XuMKQpIf3LAvGttzQOQsyrOduvL4frD7K8gCPcVYRXS1RvgTNmgkJGg8TDfg7aDGdVSmEXGo6VdrSZOODjjW3hNR1rpPWRXUy76TmkEBrYLJlQntl4YxwnATF/hTHgk+EJaU1vJ+WSDE7iVQwMnudms6Gyjg9x8jtAYNxWWOubcgtzQlawfdmqIDJf1TAA5wJ/mCAZjWcieRf8t5+LRyK7WK5cEWW9w4IjpqJUuCKrHURhoUAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kfjvQ0wWTbVpyqR5A2BdRhWAREKEEyx39T7aenZ2ygI=;
 b=MK7cv75zJxJ8L3FVqOTsB/A0yDttZdspmEYlmFN+jx6koIEhAZHy1xt1aDGShiuWrJVSAlX36EZiNSZRz2KLZIQBdKEqeYFDv2KAEjIsYfz3swmMemS/KISvZCVh/kOISMpLcRE2iSxVX+zHlvFkWRq8sKNEHmCzL0H2V8kzAdQ=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3871.namprd11.prod.outlook.com (20.179.151.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Sat, 2 Nov 2019 10:52:50 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:52:50 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Comet
 Lake-H SPI serial flash
Thread-Topic: [PATCH] mtd: spi-nor: intel-spi: Add support for Intel Comet
 Lake-H SPI serial flash
Thread-Index: AQHVibFs+XrdMgqxy0+430WNuDG5NKd3w+SA
Date: Sat, 2 Nov 2019 10:52:50 +0000
Message-ID: <05a0c9cb-a2f8-2cf7-4823-e5a32d21e265@microchip.com>
References: <20191023145140.51427-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20191023145140.51427-1-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR06CA0122.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::15) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae76cc6d-a8d5-4951-2979-08d75f82cdbe
x-ms-traffictypediagnostic: MN2PR11MB3871:
x-microsoft-antispam-prvs: <MN2PR11MB38716ACE4C0292081B9773C1F07D0@MN2PR11MB3871.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39860400002)(366004)(346002)(376002)(199004)(189003)(11346002)(81166006)(54906003)(446003)(316002)(8676002)(486006)(2616005)(86362001)(6506007)(7736002)(476003)(110136005)(5660300002)(305945005)(53546011)(31696002)(71190400001)(26005)(186003)(81156014)(8936002)(71200400001)(3846002)(64756008)(99286004)(66946007)(36756003)(102836004)(76176011)(52116002)(66556008)(66476007)(66446008)(4744005)(6246003)(2906002)(6116002)(386003)(4326008)(6512007)(229853002)(25786009)(14454004)(6436002)(31686004)(6486002)(256004)(478600001)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3871;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n2ptnBsMcu2jAvnVorj5vJy6h/QaLTUPi82gnudgc2rAsvP3o8Ds0NPufsP8xfiQ9vQJ3/dhmgFjBZfn3CLARDqGkpLwyAi6gRiwoWh4ywHS4Q7WUGg3PR3UWmKB0uwPYgM5N5YOs4102C3/DuMzQ094PsFiJ/eeb9dWB2cHgsqY1ZyI8OovhqUkXCq6IuJ81Sy1enlEFlxhthH3FOCymYABCvS90ZTezLZQopTmBaVH8E6s5sLeEhPh+mh3SZWXTAThijXWksNWg29Iem25pciSkc5qSrNdE89C/8EZrkv0JPTbcmCzwH6F3RkYwxLJHHbIdT1u6YPy5QPF/SbUKXvRYin5h3GDbrXb0uPJlgAcqujWyPKYX6mOOiu+0neK0LYbCPZAEn87HcEnbpKQMzxoAdje+y/wQus9M1qDvBu2ULOHIDFdWcjkTy1Hvb3N
x-ms-exchange-transport-forked: True
Content-ID: <8381020CC305C545A342324F34EDAFAB@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ae76cc6d-a8d5-4951-2979-08d75f82cdbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:52:50.0951 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PxEPEyrsN/9UT/xb94cY2FuyEguc83wbvTf3JwjHSOyyux4oqhUWPZPqu59TkPZsRC6S4BWKTIZmj3GFNyJ9z6/nDgxqRmajlrbkHnGK2Sk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3871
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_035252_388799_C5DAF6FA 
X-CRM114-Status: UNSURE (   7.69  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 10/23/2019 05:51 PM, Mika Westerberg wrote:
> Intel Comet Lake-H PCH has the same SPI serial flash controller as Comet
> Lake-LP. Add Comet Lake-H PCI ID to the driver list of supported devices.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/intel-spi-pci.c | 1 +
>  1 file changed, 1 insertion(+)

Applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
