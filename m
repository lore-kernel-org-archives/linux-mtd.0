Return-Path: <SRS0=CTVO=WI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A16BC32750
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 11:25:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0944E2085A
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Aug 2019 11:25:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mbBh28hV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="QuyZlcZP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0944E2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9O6U4P0ekFzhFh7T0JOcnTkVkmgaWaN2wUJ1U/v3fO8=; b=mbBh28hVrTHkrM
	6/BVNOIG89DzAwfuiuzglxEsM4eNbItT+tE4CkYsNqOCVnDNNV3zcNN0JkrEXU4ZYrAzLGKdDue2b
	tS/lRPPZBTbO9Evz8ajn7w+t89h/t1k2Pjvbg6B99weWk6LQRsXh9rvWJsE1v82BfRH68gtdr830p
	0HZhrThpHumZcoT8qo9IWEpjnrD7o/w1Fod7jiXI7UspohUEtF2MJLQqA/qimGQjp6DaY736sb0vD
	SjxXH6wCs8/m0PMLb+abzMN/u1ZmUy1i8HdKYjTAdx7uQ7I7JQKQkpq3W2qWt7SkKvYRQOVHdTNex
	CpMeaHyfX06F34ItVwtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx8RR-0006Ew-Nv; Mon, 12 Aug 2019 11:24:45 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx8RK-0006A9-Oh
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2019 11:24:41 +0000
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
IronPort-SDR: FZoMxtYWkbyIXj1XJisPPUlokjCFK/vMgJS6Mm7LWzrG2d6YN/a9TQYQWmST06Rxjnxw8xvwn5
 Ujyi+nSxa6Fgaxx46jaJA5YH0t3uBL8i5iCFoTOvTOnxfXqiaw28lnh5GFXxSz0eeeFMTd+ZZK
 ZqUSwkDjlCHzwWRGOmH6aF6ePieJmd16a3UaCTwhw4nolYSZx7wAL+SCimRFna0LfPVv6hG5r+
 q1htUb8cWECRS01i7wa8HvDBLPnRiQaLNG5HWPhoVlo1mVPPkOANwrYmI5gCwsHX+9pMZnVZ39
 Kq8=
X-IronPort-AV: E=Sophos;i="5.64,377,1559545200"; d="scan'208";a="43968405"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Aug 2019 04:24:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 12 Aug 2019 04:24:26 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 12 Aug 2019 04:24:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+DXWkJZEOLtpQ2jI+jVRZeQq/eUd5e/e0bBcReD6vYpHHFZzfUe56Wf/RkPSShIHfP2XzmIqUxYStJmsGJOtW7P4MAr5QKljw2MR4FbrfBgRqK1hsQ+UzonkVwObF7n4nlO0K3AncZgJd0LhW7UJZ4k38e4HVgi7z35LQbX+NOQGrL2AOQUIdD8c+uFFYUXX7okfl+ItwENfh7NnJgPj2QAy/VTCyRrJWUj29PpSyUEnQdM7G0m4JUm4Debd67aaKoU8nn7Yr6UkUEFjKZpKwV+oNskQTpdIWE7oMs6CwndQZ8q7Z9VxWxFIPtSRkpReWRxwUe3kKukmE74GhCH8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFNPkCNcvIVyLXaDum920V2U9zMnSLTS1Idjwm6g1pI=;
 b=jvlSIFYpshl7Lt6SLdxcyCWMUbpKptVvp78lXleItwCGZAGyeKGbrF0rIPzanx6dpTPmAM+C1SQicTG7SczGeeIsFXv7YjJMMruSC3yYsj8PB2IBiNCIU1KkG4Hvc8fuubiZaS1Wb5mz98R+DrM0kgUdGe0LNDfGp0/avp4PfcroRCgUZwH2XvW1h1qvTux5UtQh+CQN9rhpuQx7KdNcdmmncu914tSBcv2o2e7yRMVz7TQrBIn7UgG5y/3vMVxYjP/n8bJwBdaD2Z6Ak6XdJp1NSTtAFLV+gNB+oIh5ghegOxnR5FsT4yrPmOROZfnSZ/NSi1pW9hYS+yxvkshEIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFNPkCNcvIVyLXaDum920V2U9zMnSLTS1Idjwm6g1pI=;
 b=QuyZlcZPPpLi9QeVOK8lp5yRwD5QFrNy7Go7jk7TemB+aZJlMDANLHpEJX1R3b6rgmdOaol35caQaUsNXzoPUAKC1ZDCIMWBj8c/QHHz7wOqvphET/UOE/W+T1wnUJsFUlO3RgrgEg5/jh1rg4oJLdKzZNTFhBC+0lxdkhxFvSw=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4062.namprd11.prod.outlook.com (20.179.149.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Mon, 12 Aug 2019 11:24:26 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 11:24:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <marek.vasut@gmail.com>
Subject: Re: [PATCH 1/5] mtd: spi-nor: fix description for int
 (*flash_is_locked)()
Thread-Topic: [PATCH 1/5] mtd: spi-nor: fix description for int
 (*flash_is_locked)()
Thread-Index: AQHVPHxaKG+eJEFhOUur/Urn3TTMiqbsJe6AgAth+IA=
Date: Mon, 12 Aug 2019 11:24:26 +0000
Message-ID: <2ac48ee5-f918-2313-c30c-8d1e2d3008b5@microchip.com>
References: <20190717084745.19322-1-tudor.ambarus@microchip.com>
 <20190717084745.19322-2-tudor.ambarus@microchip.com>
 <a4f14ae4-e42c-73f5-2121-5e506dd868cf@ti.com>
In-Reply-To: <a4f14ae4-e42c-73f5-2121-5e506dd868cf@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0189.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::13) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 968ff21a-5c00-43bd-9328-08d71f17a211
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR11MB4062; 
x-ms-traffictypediagnostic: MN2PR11MB4062:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR11MB406201C97BF7A56BEB41CEEFF0D30@MN2PR11MB4062.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:352;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(39860400002)(376002)(136003)(366004)(199004)(189003)(26005)(316002)(66946007)(6306002)(6512007)(64756008)(66556008)(66476007)(66446008)(14454004)(110136005)(3846002)(99286004)(8936002)(966005)(6486002)(6436002)(36756003)(5660300002)(305945005)(54906003)(81166006)(6116002)(81156014)(4744005)(7736002)(8676002)(66066001)(4326008)(31686004)(25786009)(2906002)(107886003)(6246003)(229853002)(478600001)(53936002)(53546011)(76176011)(386003)(476003)(2616005)(2501003)(52116002)(186003)(71200400001)(71190400001)(102836004)(86362001)(14444005)(256004)(486006)(446003)(11346002)(6506007)(31696002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4062;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: kEAsSN5UxtKWVqEPMhkEmUF2VGmm4y2pRx0d1mXE6pM5KSBf0OOxr6CHKKRn8lz8E4zorNsfGT9UW7UY4omUzTAXUBbLmc3DjJPI4iXwGXLVyR3IAnY3qUp1iwX+D3GjN8TiqQTASstJ/ReI0iCyvInQInk5QrkqV/oMdRExh5O4aCAxgcNx1Yi1NFlJDZEJnIH6ByyMyf5Jwfiy6wWNvtYMVgVEKfUhlFkv9VF676sU6IUSGlEw7bFn2/1dXtEpHnXAx0P0WL7BfK1IL7Ew7J9q86Im92G2MjH9+AM62LjPMi9AbkkPCwZJEsTWjHXk7gFChgqeHkn7cEznP/DzQvIN+wSv/rH4SJ1RgjLBFt4S9I00LCpgl+imRh2dnm4FXtdPOdv+vJ2Dt7FTNRf0Ho7Qc1/jq/HfyKMOutrpYXs=
Content-ID: <70FB3AC78402B24182E5E8F90A4C3A9A@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 968ff21a-5c00-43bd-9328-08d71f17a211
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 11:24:26.2862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HBSqVv0KauPw33NqU/UWup1qtL9b4nbPWC/TpuYMHVtAGqsc/mnug/qf90V13fCLmFiYIKzSH+VDpvrnH3gWwaRV5Nf71dBdN2NWBuYP7oI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_042438_862994_04B762E1 
X-CRM114-Status: UNSURE (   6.18  )
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
Cc: richard@nod.at, linux-kernel@vger.kernel.org, Nicolas.Ferre@microchip.com,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/05/2019 08:34 AM, Vignesh Raghavendra wrote:
> External E-Mail
> 
> 
> 
> On 17/07/19 2:18 PM, Tudor.Ambarus@microchip.com wrote:
>> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>>
>> The description was interleaved.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
