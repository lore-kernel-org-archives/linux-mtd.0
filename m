Return-Path: <SRS0=+wMu=RY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AB2C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 16:50:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E0FA2183E
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Mar 2019 16:50:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FpnN5eo9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="xNHZXx96"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E0FA2183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=boM1/JJwhgp2YdmbAeR5JAAsyWcXZ3bJhMYZsKvNWpU=; b=FpnN5eo9HSJ/Co
	byS2yr/y5T4TR7Dsj8VpW+uvwHL22jmNP0NRzlVurNqQyeUJg+o5HQ+QCS+hIV8UlUU7m+gYw7LHQ
	YwmZVfr8A9KHj0sKX9ZxytWRQSgTG11T7YX4fIl8UMjyKzqkv8m4GdPcf/cwvcjMVS0kMsezL05DQ
	dEhoGKXIf87Tn5CpF5k3Azkbk5caVDUMDe+jHaU7Lspe9LF9EqnK9YEJ1Hma9yZOC+IDwaUoTB5BR
	Vfq3zCIZXexE9RyX6NAhVFTiYx8IkWBpcgiz5P/zpi0PGwYEvwh+SvCzwGBslS8agK9JaFNXNHf/N
	qEHrO1WWF8FIH/1OZgIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h70tN-0003fC-FW; Thu, 21 Mar 2019 16:50:09 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h70rK-0000Jp-Gg
 for linux-mtd@lists.infradead.org; Thu, 21 Mar 2019 16:48:12 +0000
X-IronPort-AV: E=Sophos;i="5.58,498,1544511600"; d="scan'208";a="29830251"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 21 Mar 2019 09:48:01 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.107) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Thu, 21 Mar 2019 09:48:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hx1uy5mMZ23hqbkleKVg+czdrFOeC9F6L8SSHJUuFbs=;
 b=xNHZXx96S2UTKWmP+LFlftzP9UL+4aZNs8REB5G8j34bNeHvfJ4eZCUpcOLe9vzMzUQmL6tJ17R/2hU9yDZiooVGbNEgvS00q2uO1Xn/6HmKF97bysCPI9xLRZ04Dd9s0M0/35sH53bYRCxKyQg5cPpe2LJmfn/ndERwKxh0HJc=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB2035.namprd11.prod.outlook.com (10.173.26.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1709.14; Thu, 21 Mar 2019 16:47:58 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::85a9:6cf6:d651:128e%10]) with mapi id 15.20.1709.015; Thu, 21 Mar
 2019 16:47:58 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: Fix comment of
 spi_nor_find_best_erase_type()
Thread-Topic: [PATCH 1/2] mtd: spi-nor: Fix comment of
 spi_nor_find_best_erase_type()
Thread-Index: AQHUs9bso/GnQYE6mk2WTEcPOT6KLaYWo+4A
Date: Thu, 21 Mar 2019 16:47:58 +0000
Message-ID: <ae6ed239-203d-6d41-c8c4-7bf3c7a9feee@microchip.com>
References: <8875821d-feaa-6a7d-d9d2-d992be9cd235@microchip.com>
 <20190319165651.23695-1-alexander.sverdlin@nokia.com>
 <20190319165651.23695-2-alexander.sverdlin@nokia.com>
In-Reply-To: <20190319165651.23695-2-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR04CA0127.eurprd04.prod.outlook.com
 (2603:10a6:803:f0::25) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63bd1245-d62c-4886-7f02-08d6ae1cf8f3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB2035; 
x-ms-traffictypediagnostic: BN6PR11MB2035:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB203523DCD1F9908A4C6CA48CF0420@BN6PR11MB2035.namprd11.prod.outlook.com>
x-forefront-prvs: 0983EAD6B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(346002)(39860400002)(136003)(189003)(199004)(3846002)(446003)(14444005)(476003)(316002)(71190400001)(99286004)(256004)(106356001)(2906002)(105586002)(97736004)(71200400001)(25786009)(305945005)(486006)(66066001)(68736007)(7736002)(72206003)(4326008)(31686004)(110136005)(54906003)(5660300002)(53546011)(36756003)(2616005)(186003)(6436002)(2501003)(86362001)(966005)(31696002)(478600001)(4744005)(14454004)(229853002)(6116002)(8936002)(81156014)(6486002)(8676002)(6306002)(11346002)(81166006)(6506007)(6512007)(102836004)(386003)(76176011)(26005)(52116002)(6246003)(53936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB2035;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vXLVR0T4KprBUaGWhkCtthvk9VCYfsXjoqdt1jfhnfUkaj4FzpKXo7VKlgsGY7qAQ2fflMGNgwW9zh8/Ln2K27wpkmeguJIcT2aU5SmzkNNPfwbll8xq58C47OBT17zPyl+6NyQEm/dyuXsoH9X5dAz0SjkmCMjlDfkVr97sJR6TlvtzBvNvFagXkO34uEn1AMuLeunZkN7VVg/dsqIGILAgbv7HJHOqvz9G5roJ8cW5kQdAL1lmXYm9cMD7dN367uXdGmBNKKTTa5OG/U/uPx/KCzYVDIeVweR1isZa6eZCXahCJ8AiUD5J+iZyksCb/X5ngt+0bSqo5Z9mLI1MxCTkZlsQV5zJ2Co07HQq+7D5+GJsE1AkijTUeNZzRvh45oxBxtunBaqZ3S7qRkeUOr8BtxTev+vM9iBagTCYTus=
Content-ID: <BFDD999E4E31B545874221619B78204C@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bd1245-d62c-4886-7f02-08d6ae1cf8f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2019 16:47:58.4303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2035
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_094803_170242_0D327B30 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: richard@nod.at, computersforpeace@gmail.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, bbrezillon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 03/19/2019 06:57 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> Erase types are sorted *smallest* type first, refer to
> spi_nor_sort_erase_mask().
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to http://git.infradead.org/linux-mtd.git, spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
