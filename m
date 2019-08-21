Return-Path: <SRS0=1vkS=WR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE92AC3A5A0
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 08:20:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90AF42332A
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Aug 2019 08:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bWwkVSwI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="PwsP0n5L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90AF42332A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=20RwoQ9nVBqod1BG8l9M8bVz5Mrc7QFEtfuVGiBnIrE=; b=bWwkVSwInQ1QwE
	PYLd7GmRrikAlbt8Db2z1jAnN36wZyy/LTwDqSJm6vCBptUcKNTHrFUA44qtAsWfDjL8zpqaS/W9e
	la/aSyT2xCvunRDtrBUrWvFKNA0d2o1sKD4iso8p4GLy0JaEFwFv7CjBaQbXzLlYysaAuCZ2/CDD4
	+upDDIhxJHeo6fEjyzDCwFiKVT46smrzmSBrAzAyO0+vFsXS0GG3W33tCNVOfYJ64/KfwbztrWiRb
	x+gIKJxmn0vyxLQtQ5/kA0CJHIoM8v5PD0dLvQmgrjHR9bK6JWyNDvSpAqJoTRL1JbJoEiqAc0lRN
	+37nAENhYrQZ4Bwxx9Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0Lqf-0000Yk-LQ; Wed, 21 Aug 2019 08:20:05 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0Lqa-00008E-0e
 for linux-mtd@lists.infradead.org; Wed, 21 Aug 2019 08:20:02 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: e3hDoEgp5x9CVJIuIiyYQYVtb5q9AqlxZJ4Mdax9vVhAgiLBo6TnEPnDGi9/XEHcWGgoVqiMrL
 uF4DY7c0+W2FdQhOcz3+h14jdYg+j/m3ZmTPseVPd4uBvbbZlI47xm8NYYaRvH5dbxsLLTuRy1
 35BcZnYtZgl9JnMyxrWhjwKp5IYk3TdT1RZ7Zs0ajKUq5wlLCwdeQgJuWWCm1HuHiPNJBCvz8x
 BO6WXl9xrj3SD8wQbKvj/TNrg5cUEtxKehNG66xLhsjgtoj0CMXRzqK5dtGo77A/ZpnH7syQCn
 uhs=
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="45938883"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Aug 2019 01:19:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 21 Aug 2019 01:19:56 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 21 Aug 2019 01:19:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDG4AFFD/4J+lYkrRLK0QW6Gekx+bTxCIg9HQgkO1+08Nn11hsKVaXnxuoqYIA8RaNbr1dvasSgN7ySfYS0An+24XZdUlfCOYWjjH8ild20TePwt8WJ4ATSfhwHWHNRrUH6jlIv1v3bNF5e2HsauQhhsWPJGoWm8IIbAEJYGG3m5vAknmE8H/UpWlWUO6Au19WO8g4+1fNj1RYBv/W6JR4i5ohnaJKBS1EswbuaWCKao7snG7NgGj9gPYGAIt6SZq1RbM4UvH3Gi4LkAO0hmXwHhPhO/8yA/4bgbxzC+o4KS+2BqRa2p3FT6JXwfGai07mrVqoI28tF7GxfL1o7jWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyAaYd3UBSi9P623CVeq9CjOKXpJPfNy8jNYpiXuOPA=;
 b=SrzYwBDUUDwAjBtH/F7TW4IzYjymTug8uYbIfugFOy4h/J3XVzRMH56EBWmUv9hlqBN/hduhhXvmaotD0GqYalb5TMI83K8m8vhDa9VrsNfYyX3AWvo9BGOo4qbTn4yQkA6bTiuBIMnI2w5D3R43HwQclQVE6uYl1ABrfiUxZm9GzJJMrx/MklZEuBbVtrE86fuF/Nu+PoLSbyfIQBj957nkvJFGUnOwPbug/GznNCh4IBfy87yW+i31gt9dm0/nAVv3xVCijubSv+z+6MNAzWo7SMeLSK/ITqFtyJCryka9H7I00tPg1Nu3qB7Wzyp6NJ3bILtELOU3gZXhWtlEbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QyAaYd3UBSi9P623CVeq9CjOKXpJPfNy8jNYpiXuOPA=;
 b=PwsP0n5LMFeL0IvLdTErrGtwEbzGNF2x7ip2d0AbJLVZWEHXg5cJXCD9Zn55EQ73wDfZJpkoMX+PxV51K4fiaUHD3dVBfrPbd4pdxSF9wfO4VMOA7UnYFy4EgLnKGyiyI8la8KKnEpj+NYvtOn6W6D/oxz/vVmfoEW++Mb5Wm/s=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3936.namprd11.prod.outlook.com (10.255.180.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Wed, 21 Aug 2019 08:19:49 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2178.020; Wed, 21 Aug 2019
 08:19:49 +0000
From: <Tudor.Ambarus@microchip.com>
To: <alexander.sverdlin@nokia.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] spi-nor: intel-spi: Whitelist 4B read commands
Thread-Topic: [PATCH] spi-nor: intel-spi: Whitelist 4B read commands
Thread-Index: AQHVOKtgwqaYRthXW0GNL3NvkrzY9acFgQQA
Date: Wed, 21 Aug 2019 08:19:48 +0000
Message-ID: <b14b9f13-7d1a-2eaf-beed-b0e67c0458ac@microchip.com>
References: <20190712121401.28578-1-alexander.sverdlin@nokia.com>
In-Reply-To: <20190712121401.28578-1-alexander.sverdlin@nokia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0194.eurprd08.prod.outlook.com
 (2603:10a6:800:d2::24) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8eb948f2-747e-4168-6195-08d72610553c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3936; 
x-ms-traffictypediagnostic: MN2PR11MB3936:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB3936337159E185F14A7E0A8CF0AA0@MN2PR11MB3936.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(366004)(376002)(346002)(39860400002)(136003)(199004)(189003)(25786009)(5660300002)(6486002)(86362001)(2501003)(966005)(8676002)(6512007)(6306002)(6116002)(6436002)(229853002)(3846002)(66476007)(66556008)(66946007)(66446008)(31696002)(64756008)(6246003)(53936002)(81156014)(81166006)(36756003)(66066001)(102836004)(6506007)(76176011)(316002)(71190400001)(54906003)(7736002)(14444005)(478600001)(446003)(186003)(4326008)(486006)(11346002)(26005)(476003)(386003)(53546011)(256004)(99286004)(31686004)(2906002)(8936002)(110136005)(305945005)(2616005)(71200400001)(14454004)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3936;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0ikGaix27VCVoswEy5jPFVgjPqc7QP/fFo/BWZhSFxbBrtiBNYngvyIuaBNRhHu8Igfh+/mQIjAvh45IBoEFf3xvgeF146VWz5W2+5pNPCiL/n5eCc4M6DBsHXT7TnmSea+SBOwKwGfEFz7rYKXevigXD00P0FtHU+2pcPJdzDWkHTFueFDa5zWNc61vK7DDh+Xif0vAhFnzCjK1J6e/YKTW5+SmusXTK1yK8z8RPtXraj4zkIGHkdLYZZ3sWcTlDiwCudCNiGO4YKJh6TCpNs6WuzDUhw/FNXKp5ANtxHhgtRweEH5WBxm42/bXQGiWOzSLKlKo/nhIfHd0TZtkFHSQ011ZS2YzmxjQPJji6yxLd5UVHrODkBqhEIcI3cO7RUzwYU6FvcaGkUlqEOiUD5J31+d6eBZuo+vwOv7OM3k=
x-ms-exchange-transport-forked: True
Content-ID: <8B1A92CC491F204A87BF517D8944D066@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb948f2-747e-4168-6195-08d72610553c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 08:19:49.1924 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJM5Fa0DU4e+zZWXYPMoDU0kII6rSqs93XCtNL/tET2+SLkiEDLijSXveJgRuXXnswbVyLkhLhZU/SBwoSitA/dNkrkwzmoKYkwE9P9xfz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_012000_528501_B611CEC6 
X-CRM114-Status: GOOD (  11.00  )
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
Cc: vigneshr@ti.com, richard@nod.at, marek.vasut@gmail.com,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 07/12/2019 03:14 PM, Sverdlin, Alexander (Nokia - DE/Ulm) wrote:
> External E-Mail
> 
> 
> From: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> 
> spi-nor.c issues 4B commands for some Flash chips bigger than 16Mbytes.
> Xeon(R) D-1500 documentation mentions its Integrated PCH Logic supports
> Flash chips up to 64Mbytes.
> D-1500 Integrated PCH documenation however has inconsistencies regarding
> FADDR register width and says nothing about particular commands issued
> to support 64Mbytes of Flash.
> 
> Nevetheless the tests on Xeon(R) CPU D-1548 with 512Mbit Flash chips
> Macronix MX25L51245G and Micron MT25QL512A showed that erase, write and
> read operations work just fine after SPINOR_OP_READ_4B and
> SPINOR_OP_READ_FAST_4B are white-listed (currently only
> SPINOR_OP_READ_FAST_4B is used and only for Macronix).
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
> ---
>  drivers/mtd/spi-nor/intel-spi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
