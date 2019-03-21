Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E7BC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 16:50:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E05321902
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 16:50:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z76cEYc4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="VMicfhVU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E05321902
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NljGE6srkioXdS4kJ+OVopn12MfGcYkwqZ+yLNPE7b4=; b=Z76cEYc4SoGNL0
	k/n6zHfjbsQtAsXAQTgUa93etu7qrJWAmjD234CUz6e0DIjOS1TLaxvwD1St60aqXO3VVvuHf8k6h
	8CvYEa5BScj3heNCZPaHAukQgzOa0CzJA+me21WiH9Qrdme2TBRkw5N1AFWgW6L6QwOY1Gae1nVA9
	8ddySdeeTIBtVjx6vYIHMcoaFi9jSSJ+8rjCFKTxiS4QLYFZXyPlUZRqrF4KosDHYf+L4U9PBjpeY
	QTnmk3wUf2+tN4nXVmsp6rjXU73zHrXiRB/eo6ptPSKts0rdg3t8cQ5yoQPEZDz00OOTN6inZxvuw
	CXYYJYK1Wce92GaL3RhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h70to-0004tD-Pj; Thu, 21 Mar 2019 16:50:36 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h70rX-0000Jp-EL
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 16:48:43 +0000
X-IronPort-AV: E=Sophos;i="5.58,498,1544511600"; d="scan'208";a="29830276"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 21 Mar 2019 09:48:14 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.107) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Thu, 21 Mar 2019 09:48:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkfaTd0F+U2CSvjQeYnJSJsDI7fTGNd2bKcsT/HlSxQ=;
 b=VMicfhVU/QEsoUZm79F6OSA/ZpeP2vlndeFj/+PvVGZ72h5oo4A46t1BwMr5IHU56pcw4iQMZ6IXxOy3dEzcds+a5Yd5Y8cpL37blXMMm4YP/VklHd3d4TBIvKXGp232wUxXy/RvUuI7qENpo9Bjm++KofcOecTpPy6OcHBIGq4=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB2035.namprd11.prod.outlook.com (10.173.26.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Thu, 21 Mar 2019 16:48:11 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Thu, 21 Mar
 2019 16:48:11 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>,
 <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4] mtd: spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Thread-Topic: [PATCH v4] mtd: spi-nor: intel-spi: Avoid crossing 4K address
 boundary on read/write
Thread-Index: AQHU3ngGI63UOmSWSUaADLrR2sil26YWTsEA
Date: Thu, 21 Mar 2019 16:48:11 +0000
Message-ID: <b2cb3593-12bd-3e45-ebc3-e6633add93ae@microchip.com>
References: <e171947a-07c6-d5f4-b81c-dbf8c6b1647d@microchip.com>
 <20190319171749.19052-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20190319171749.19052-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0129.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::27) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eaa0913a-e097-480e-f2bf-08d6ae1d00e0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB2035; 
x-ms-traffictypediagnostic: BN6PR11MB2035:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB20352DAA9A199B6145190FDEF0420@BN6PR11MB2035.namprd11.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(54534003)(3846002)(446003)(14444005)(476003)(316002)(71190400001)(99286004)(256004)(106356001)(2906002)(105586002)(97736004)(71200400001)(25786009)(305945005)(486006)(66066001)(68736007)(7736002)(72206003)(4326008)(31686004)(110136005)(54906003)(5660300002)(53546011)(36756003)(2616005)(186003)(6436002)(2501003)(86362001)(966005)(31696002)(478600001)(14454004)(229853002)(7416002)(6116002)(8936002)(81156014)(6486002)(8676002)(6306002)(11346002)(81166006)(6506007)(6512007)(102836004)(386003)(76176011)(26005)(52116002)(6246003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB2035;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: R7ZdDIEZxD8hjpAx7LjvnqHZm2oUwfFlQPInKXHAEdQ10xVR4LIJUDwbhmXo9lRosIuo7T34Sz2Klew4QX59FDOUMWP+y1RENgwir+XYv6BLoz8Av19ffVf4pluvNFMIgSZIqLNSPPIjROojnTz0t8Uysppi13hH13HJoVYUTgUQpHzI0TXz9bASDXq98smyiA3IlukFde9a7lCtUx9lpgoMol+QotwmHXScSeANQK04pfUaIHFevsA8oAoC/eNXJR9BzWtJL/MstV3pBFGzIi9qHYDhNIcnLlZ3Gti1vGKJckdzpU0Y0mIOQvuxtwiNm94gI/GbWmhzDmzOe9onsQMloQUST2XMmqZUGaqLDbgVGuZU8uJ86ecDG1YSjhoMf28+uD21q+Cnypd2pBIUBoff4+pAS4Bp+tznEJ1uz9g=
Content-ID: <99B77D05032E1149B688758AEC724E9E@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa0913a-e097-480e-f2bf-08d6ae1d00e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 16:48:11.6925 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2035
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_094816_532925_2598C5D3 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: computersforpeace@gmail.com, bbrezillon@kernel.org, richard@nod.at,
 romain.porte@nokia.com, stable@vger.kernel.org, marek.vasut@gmail.com,
 pascal.fabreges@nokia.com, bmeng.cn@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 03/19/2019 07:18 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> It was observed that reads crossing 4K address boundary are failing.
> 
> This limitation is mentioned in Intel documents:
> 
> Intel(R) 9 Series Chipset Family Platform Controller Hub (PCH) Datasheet:
> 
> "5.26.3 Flash Access
> Program Register Access:
> * Program Register Accesses are not allowed to cross a 4 KB boundary..."
> 
> Enhanced Serial Peripheral Interface (eSPI)
> Interface Base Specification (for Client and Server Platforms):
> 
> "5.1.4 Address
> For other memory transactions, the address may start or end at any byte
> boundary. However, the address and payload length combination must not
> cross the naturally aligned address boundary of the corresponding Maximum
> Payload Size. It must not cross a 4 KB address boundary."
> 
> Avoid this by splitting an operation crossing the boundary into two
> operations.
> 
> Cc: stable@vger.kernel.org
> Reported-by: Romain Porte <romain.porte@nokia.com>
> Tested-by: Pascal Fabreges <pascal.fabreges@nokia.com>
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
> Changelog:
> v2: More macros! As suggested by Mika.
> v3: Actually compiled. Sorry Mika, the lines are really long now.
> v4: Add "mtd:" to the subject
> 
>  drivers/mtd/spi-nor/intel-spi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to http://git.infradead.org/linux-mtd.git, spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
