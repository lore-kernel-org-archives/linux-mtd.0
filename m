Return-Path: <SRS0=H4dZ=UV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D1A9C43613
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jun 2019 12:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 012A120679
	for <linux-mtd@archiver.kernel.org>; Sat, 22 Jun 2019 12:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRXaAvS/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="OHjgOIe7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 012A120679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXE9xkUjzqNchgeaKeg6cCLwi4k10HUkGTOE24D+hOE=; b=CRXaAvS/+Kt5b2
	P1UTqVHnU+iZsLa7UO7SQJjoqAmRnIPznCrIll0fs4qDmT02hKvA7DvraOh9YLiGkPveK7RfpHwdk
	VP20+rN0u203nE24CQ5uUAGPvKWZo/DiNwHC9iK9VlW0GgZ+SiDHP/cY+XgrDcSjqQJ2KEYpEnP6f
	Xjwz8MbvVnnSzJHu0HBAjyQWhAY4YWtc+9Z3DPseaYaTY8Y8PNItvoFac9xL2B/6Hv6HOErfqWskw
	uEncmGIvJZUmezhgwk/QNQu8fh26KUJQWuImkKJ41GwhddqW0F9sEnTU2lRplFELMtu4wqmKl076e
	lnihlElC/RxJx7AC1Lag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heelM-0001v9-LG; Sat, 22 Jun 2019 12:04:56 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heelJ-0001uh-SO
 for linux-mtd@lists.infradead.org; Sat, 22 Jun 2019 12:04:55 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,404,1557212400"; d="scan'208";a="40029744"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 22 Jun 2019 05:04:51 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 22 Jun 2019 05:04:30 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 22 Jun 2019 05:04:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFZj9ddw+4z0awGmBP6qWVXZOeAWY5XUXqaje7Ysljk=;
 b=OHjgOIe7eeW63b+0cZ4Hgr9tQ04VCCIaA7v2Aid230BjHWKkAomzmx0JySTvx4/+uIinIIh7DiI2ThFyfLGekOHOAp2GhYfOTKQSJsZ0qbaDqNAxeuOfx0laOMcBcgRpb9rL4b6MNUxppkAv3LtBaee+HAsKvLU6un9qom3wo9c=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1683.namprd11.prod.outlook.com (10.173.27.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Sat, 22 Jun 2019 12:04:30 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1987.017; Sat, 22 Jun 2019
 12:04:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <mika.westerberg@linux.intel.com>, <marek.vasut@gmail.com>
Subject: Re: [PATCH 2/2] spi-nor: intel-spi: Convert to use SPDX identifier
Thread-Topic: [PATCH 2/2] spi-nor: intel-spi: Convert to use SPDX identifier
Thread-Index: AQHVJ2NybqT78Nw3skaOmLTOzmpORKanlnmA
Date: Sat, 22 Jun 2019 12:04:29 +0000
Message-ID: <16bd8081-456d-bbc2-a7d2-4f451271b151@microchip.com>
References: <20190620122629.20838-1-mika.westerberg@linux.intel.com>
 <20190620122629.20838-2-mika.westerberg@linux.intel.com>
In-Reply-To: <20190620122629.20838-2-mika.westerberg@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VE1PR03CA0008.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::20) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.138.199]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: da990fc2-e85a-44cf-2962-08d6f709c7a2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1683; 
x-ms-traffictypediagnostic: BN6PR11MB1683:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB1683CD038C485694CE228678F0E60@BN6PR11MB1683.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0076F48C8A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(39860400002)(366004)(346002)(376002)(199004)(189003)(76176011)(316002)(66446008)(4744005)(81156014)(99286004)(81166006)(31686004)(256004)(14444005)(229853002)(5660300002)(4326008)(25786009)(52116002)(8676002)(110136005)(36756003)(54906003)(14454004)(6512007)(446003)(72206003)(102836004)(476003)(11346002)(2616005)(966005)(6246003)(6306002)(7736002)(68736007)(186003)(86362001)(71190400001)(71200400001)(53936002)(6486002)(66946007)(26005)(66066001)(6436002)(31696002)(386003)(6506007)(53546011)(6116002)(73956011)(66476007)(8936002)(305945005)(64756008)(66556008)(3846002)(486006)(2906002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1683;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: w2edBGYugqFYQoJ7vTyc0j69+mTKShecr+EkJJKPMO9rDrYKQYDIY3eZzcNc/mDDpFOCY7/zf1nMp2bVyrbTt5I7PT4azoobg8etOMF6dpCtjy+Q3dVGC+ij0edVBkE4ig81yHyYhqvoFzKUAAJlUpKf6uXid96KSiaS4yEsI1sIAWqim8mOtVZEyQ6atbyYFuOIOZCGH6QRaNw9Bf9OpA4u3TyYDMgQpC1CqOoArHmUI3l6QBGjiViVtbgOdp0OyFGuGBkuy5MyhnXOzT5uUf3vjlZ5FyV3FnxZVJioBB+wtpB+pmGyNJeQ6XtFA8BHLK98+zAiOJVhTYbDdjiLsumbgfsdI8GsOLi4WUNBzRNT+3x4ATnMC3kGqFD2/2t7rOSxmPoHeFZ6qDi2pAjPL5Om5DrWjpAIiyJJPJDyyBQ=
Content-ID: <C364E504436420438828A732507EDC8E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: da990fc2-e85a-44cf-2962-08d6f709c7a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2019 12:04:29.9026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1683
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190622_050454_027823_A736192F 
X-CRM114-Status: UNSURE (   8.30  )
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



On 06/20/2019 03:26 PM, Mika Westerberg wrote:
> External E-Mail
> 
> 
> This gets rid of the license boilerplate duplicated in each file.
> 
> No functional changes intended.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/intel-spi-pci.c      | 5 +----
>  drivers/mtd/spi-nor/intel-spi-platform.c | 5 +----
>  drivers/mtd/spi-nor/intel-spi.c          | 5 +----
>  drivers/mtd/spi-nor/intel-spi.h          | 5 +----
>  include/linux/platform_data/intel-spi.h  | 5 +----
>  5 files changed, 5 insertions(+), 20 deletions(-)
> 

The patch's subject should begin with "mtd: spi-nor:". Did the change and
applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
