Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4542CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:34:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A68D320679
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:34:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SqQrum/Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="RPTyTB2l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A68D320679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVumbHofKJp6cRslrX1J96P2tGKEoIxP690C9QEzyKE=; b=SqQrum/Z/7edMC
	1BPpqzzISHAYhvb9qRIf4ISvq3kxpKQnHBDGu1+iiMe6M/6YzXwx7qE3Pb/z9ASGKiXXwfuKOpbD2
	BmF1eXYyBMCyWbNU/YEJr8DV+/iAtI2sQnzUkIXVmPmzFQqgZQ7e4ybROMvcCjmjJD2i2wY1lZ2Tf
	A89XD3DUjzg9skReBysYqt2OaZGF2QNEY6BjGeMLZbRUhPeMAwaBIDktxQC+ncipgbJT5nd7RsM51
	7S04Y/JZA1hNEjCgaHZ/ihSsdr80GtrtYRMhxyAZiQ2fKvNr+x8Im/aUJw0E83E1pdBdJ2LVltulh
	ZvEFpCEx/ognLhRXfzQQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQqk0-0000L7-7L; Sat, 02 Nov 2019 10:34:44 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQqjy-0000KN-0b
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:34:43 +0000
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
IronPort-SDR: eZFV9Z7cC5N77olVT2vaTFMlpYSIYt+CUhS7uQcnChYQz+8GAPRIpv1M8opK+PSyQrmC8vGhUI
 aDkz9v03jpiqlpfFkje7+vCh+YbtI8+uPVu3s+cvHgHTnVOdBZ/BqAQdYt5Tc/ZI5D70tD8i01
 bnpm9Fex3dfRerX60vI13/sJ2OctHI79XwtNzryPl5YZqY90iW1e6WZYly0bp+/znt06lVPPUW
 RAHsT59d6EOPj4dt5BF3bQV1R27fGUS88K28pjyQHbwbVX3/NoxZgYj0s9ivFLMv5QMWPsZMA1
 MpI=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53867316"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:34:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:34:41 -0700
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 2 Nov 2019 03:34:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PB21Nvp5azl0E/e4GCZ0dMOtFUHs1c6YYy5l2OE46OXbpVb90qLkjoPqoH136uVDP4KxRPuxhHoL8x7VE690DbbeHeEFVO5s71E+zDkumzFBiyBYUOalPN6sH97AsqHWvJXvzYJZjlvCUgB8+I/CrOw0zrzyk8qw1pceyA1C+zBXAjeqUbxhoUNCyExahD9M9bA1PBoYeVbUM5AyS+OaGrKDwettEW+KYN6JUsJeUjjG9i3+iM7gqhF1Uf8YOvAYbtcGbUsIrB4CuqBPm5UKBSDTQvQaGoI1O59HvXLAGJx2ZsfnT1JDVF5L2aB9dr6AX9OPd9ZIETtLa2fYaMHpdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slCIrUVzIjgmcOfZwx8hOmzpvLn2RwE2SyARnryqe6o=;
 b=LlngQiHbd/PZEv1UL2mOL3q1CojAHBE/CxQJ0NSgO8s5mJ8xL91bqvcfFM4nJGoFZLn1YkhhmE9I4KK9e8Zq7PlglKo6q595iAeP4jFIatZHPSWKRXBvMgdQqlwjIyJRCJ6t/tboa7Hz3lqVxR1Bh+vctTv2p4J5pMVVR+ESemLYs77NcbJk+7PMYwCq5nJbJYj9Fv5isbbdUZcEbqztk78EyZD1VfkHSwdogf+l3NCdJ+7xDym5PyVnNVuYwVUJJQfqVyPekKjo11d+VJ4GLC/GTPH5+JTc/5iROSW6qBCMHb4P9XhgcLEYEd+GULQVR3veAegr9oM4GcNwAQnRVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slCIrUVzIjgmcOfZwx8hOmzpvLn2RwE2SyARnryqe6o=;
 b=RPTyTB2ly7Z92rU7Cxg/b7wisXa6s/2YD7PzAKgWu3s+v/KI4Qp+CASArCiH+gu86iw52ON9UXQD/ZDC3Ctn1bzea80YXQL3I2N20Sf3F1E72ZQ9suVFmLm4hjeZdP9G2VdxZRRKtBdpJ1Zdii+K009ePGldKC69oV6w/vuKrMg=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4223.namprd11.prod.outlook.com (52.135.37.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.25; Sat, 2 Nov 2019 10:34:39 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:34:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 02/32] mtd: spi-nor: Drop duplicated new line
Thread-Topic: [PATCH v3 02/32] mtd: spi-nor: Drop duplicated new line
Thread-Index: AQHVjkpcVF6t47BCbkObuhpxXRw/Nad3taOA
Date: Sat, 2 Nov 2019 10:34:39 +0000
Message-ID: <444e0646-6593-be04-3c28-3f2e6f00caab@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-3-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-3-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P194CA0025.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::14) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f02fc4ab-51e4-47c1-a56e-08d75f804399
x-ms-traffictypediagnostic: MN2PR11MB4223:
x-microsoft-antispam-prvs: <MN2PR11MB4223CC388FEDA5B23B43D154F07D0@MN2PR11MB4223.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(366004)(376002)(396003)(346002)(199004)(189003)(8676002)(6436002)(5660300002)(52116002)(36756003)(81166006)(81156014)(486006)(14444005)(71200400001)(256004)(7736002)(229853002)(71190400001)(25786009)(476003)(99286004)(6486002)(2616005)(54906003)(558084003)(31686004)(478600001)(3846002)(6116002)(2501003)(11346002)(305945005)(2906002)(26005)(446003)(14454004)(186003)(64756008)(4326008)(6246003)(66066001)(6512007)(31696002)(110136005)(53546011)(6506007)(76176011)(66446008)(86362001)(8936002)(386003)(2201001)(66946007)(66476007)(66556008)(102836004)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4223;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3m5XzzfBHk/r9hcTuN1hGNlz1xR8h97IokxneCZ9VZdYELaBSax33b4T0DsZsULuWVJzHRWV+qS8TGsqJbOHvR7SjxfQXyg5jV2ettjEDpmWQO+I93Fm56rwfNDq6ntnf45pAsUAHLFr4XesHcFYkKYG7CFOLjrZAT99ihBjQQM8Yhdx0kp1aM38coclzErXCczuoATMHc/8rjSCaYJBbuhNty7jg/9VTNCkyjYjI5VqfpXw8NcAokG0QIvx4l6rXdkzWPB2OZIOeflroj6XSu9t+4YoZjXeZ1msqPzAclbQfMce4qleSUZT5xK79WEacEQFUbR4Usyk2Rr7z69Qi8agZ7oIogTduEI8iR5qqUPLsceN1vNF0vY6KoUJmws/zjoSG8V1WWq4swxndW92herSYoE8M9rjJwa+1Xosie8zkkPmXigOMcf8T4FhGfTJ
x-ms-exchange-transport-forked: True
Content-ID: <6F01F6B5BE3A214CBEAC0A053B746C58@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f02fc4ab-51e4-47c1-a56e-08d75f804399
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:34:39.3238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vwyaU/oFdAgAraGjWzsXSOiJrOxz5lkWtrxczkaS4tOpaNdckni6wTXmpVpqEmexRXRJiFQssGNXyZNRL7TxGqkaEz5vMmWvBa9UAXwMjZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_033442_060665_6D9029EC 
X-CRM114-Status: UNSURE (   6.84  )
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
> Two new lines, one after another, drop one.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 1 -
>  1 file changed, 1 deletion(-)

Applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
