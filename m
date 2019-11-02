Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0EE2CA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:42:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 741CC20862
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gqWQM1xR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="mSh8j4Uo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 741CC20862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOiQ8nOd+9Duyf5TrydeJqZ3yDfq8VzoYk0LGt1opGM=; b=gqWQM1xRV78m0w
	IMTUtGrIc9X++6UeoiQjofj1EYk8CYSpOlcsTrTsGk8j8S2T3yZ9jiDixDN4MQJRB9s39NsJZtWDi
	30sx2YXiIQQID/yqEc37FO7QT86KWIyJgWRzC5Fjjd7BRKBeooeUlMGOm8Sf8vsqLxZNkgrW6gIlk
	UTaM75OJH8VV3bOOSkTmNvvNvoVKFGjYYWFEmuCVyZf/ko21VljMzLVQPSYkZSMi+6o0sfVgbNoqL
	Vt+ymQMFJQf8EuyZ1etoB7E6UGkxxuBr00apxSS1FJy1fZt4go79HFgg4oi/KIkNvhB1C8B686Q4e
	I73mcf6sgdM+xsD7axYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQqrh-0004r9-Uc; Sat, 02 Nov 2019 10:42:41 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQqrf-0004qQ-09
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:42:40 +0000
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
IronPort-SDR: buoDDmDeXeA4p32yIZVcxN3GJrTYfbn6yiIiDtG282Vkqi9HmvjfUXoqTklEa73Gf9n2BLaar/
 /N847P4pOEASr6Y0B50SGGnceD2oJFac/b1/LpMzQzUFtLqy50WIsyQ9bcfgBjyxKQUgobptnU
 7g1mLcGkUzwgPeKTz/E4425cyBewGJJVH7rbW1BmqtSM6QZLFMHnJKcazEwudMqsH74eiRa7w2
 qwL+mXvoJ1QOR/2DDezVkeZM1cNw59vBwmm2NWekWYiZvCWxM0/o38Dhm8XymIAS2rEkB8bzY4
 0zw=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="55070846"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:42:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:42:33 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Sat, 2 Nov 2019 03:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ep0Ld66/j9zlSq2Dh69fAi1oBprfe4N9M//Xod6XCDKgNhqf0UThJZrKBQaeJGqJh7uYJNLjCrGGctoCqxV1F/++A740js9IipdqRHVkteQnAfKGVRTLXH5e8fK5o0ATcBk8TTEuRg5LODn4P7Suqg75tESXe2BlwsyKLDxvC5wkajytP8xrRgkBk/pCULaQ3qq7aIbpajlX873uSbdA39/dreQpp0FZfPcD/hvgQxsJP0s0bLIZtgjCppH6Q9Zmju5H4chR2TgHVt9Ra/j/RUPF6ImSIcbvxk02szutmAfFCDLBhYuOEYeMjuCQTowYcpW5AQIoTT43gRdagu3YZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hVyZtWmVpCoI2cDPnqHVcZBAKMDqDxdc8pA2Kg4vsw=;
 b=Fe5HV8V2FoJ8zhVDtG8vuwVIJMPDigMIr6D7jofrylvsQ9GAV4mHwGwr6jE2rJwP4LVc7gYaWSNZtVHoGX9E0le8s21TazKzaVljGXjE/2h9Zqm2P6H4JNwciexnM0inBFA9BxMZLAhofcP4Kcrf+6fHPRvcd6OOsDzjSdu0u+x2ka2dBuKls20ICyPHu+ATBlxWbZwMDuusRUDhSx84tENGaLcmRV50y6MI6HE9yAPrgmFhtEqkQOKthU9Qgvc1zwD8CLv0vw8XvGFzT/rUMO2Kz9z+XbGBB2SUkOAaFpoyRKMoVSWdBvFLYa0+ej57tz4U9hL8wTfTzXtL2/ryiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hVyZtWmVpCoI2cDPnqHVcZBAKMDqDxdc8pA2Kg4vsw=;
 b=mSh8j4UoZP+FKkXX2LMzgF2V0+dfuBb9tSYQ10yGqAZkg07ykHY+rY5GeiHQThobdXVm6jTucnRsJzkVc4TkvDEc3r4q6fGAs/PFP5pjrTsYfXmJBncv0DZNE25RIfojEdlA0vnV7doZV28I/wMmPck7fJf6yTK+7zy/jfdE290=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3629.namprd11.prod.outlook.com (20.178.252.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Sat, 2 Nov 2019 10:42:29 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:42:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 08/32] mtd: spi-nor: Pointer parameter for SR in
 spi_nor_read_sr()
Thread-Topic: [PATCH v3 08/32] mtd: spi-nor: Pointer parameter for SR in
 spi_nor_read_sr()
Thread-Index: AQHVjkpiOw/hcnX3gEiJ07FI3O5zB6d3t84A
Date: Sat, 2 Nov 2019 10:42:29 +0000
Message-ID: <44a8a755-f3c6-f188-dc5b-dcebc1055f17@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-9-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-9-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P18901CA0006.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::16) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: be2d39c1-0174-4c6b-6d48-08d75f815bc1
x-ms-traffictypediagnostic: MN2PR11MB3629:
x-microsoft-antispam-prvs: <MN2PR11MB36293B96001954B8965D1EB1F07D0@MN2PR11MB3629.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0209425D0A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(396003)(346002)(376002)(39850400004)(136003)(189003)(199004)(66946007)(66556008)(316002)(66446008)(52116002)(2201001)(86362001)(76176011)(6512007)(53546011)(386003)(14454004)(305945005)(6116002)(229853002)(31696002)(6486002)(446003)(71190400001)(25786009)(36756003)(4326008)(66066001)(6246003)(6506007)(102836004)(2616005)(99286004)(8936002)(478600001)(71200400001)(11346002)(8676002)(81166006)(66476007)(81156014)(2501003)(256004)(3846002)(5660300002)(64756008)(7736002)(31686004)(6436002)(186003)(4744005)(2906002)(26005)(110136005)(54906003)(486006)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3629;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H55lBQlT+Y8Rbvr/1jjD+n6YD7VyZoGouy781NJQCKJgB9mIIK1UYKWuGu53m/lZnyYQYPlQTC0F0Qfs/34QJErHpfohnnKqmaTTDUOVtwyW3U4qavsy/Ic9JE02H1+S11nV2MICnF4r8Fs2tM+OTMa9jbZGfMqQv305K2reFFByFCn9hl4usejlaxBwjeT5cc+EOtjR3LHoUlzg8aftif7wY4fIecIZncxhxW7vnUUjok9nZhj4bV0NQ33aQbiR3CNu6+d+SFCnixW+CeJhBszE2rr7+XdP+fQWztphvAh5bReCyQvM1qg2nFdX1CXfvky1exOAY/G+kgoLX/LHrfNCD3OuUf9YaapRXkw7MBanGRzpl3jroK+iIEqRtE+2xK1CSvB/at9ua4wZHNYWe99SAnnb8JAY0pwh4Q9CjQ/1JpXrZUzu1JI3Q6NaxEn9
x-ms-exchange-transport-forked: True
Content-ID: <CE23FBE63892C643A8D361B15A2484E5@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: be2d39c1-0174-4c6b-6d48-08d75f815bc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:42:29.3685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nF4MbRQv2icQWOurENBkySeP/L2YtUI4jBAqzQuPd9lZ7onM0aJ9xTDnRWmAmNQ0NkHxikyIixIbwLqdZuHgCzzlLrlhc5cWX1kxy9GOp+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_034239_079454_D064953B 
X-CRM114-Status: UNSURE (   9.55  )
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



On 10/29/2019 01:17 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Let the callers pass the pointer to the DMA-able buffer where
> the value of the Status Register will be written. This way we
> avoid the casts between int and u8, which can be confusing.
> 
> Callers stop compare the return value of spi_nor_read_sr() with negative,
> spi_nor_read_sr() returns 0 on success and -errno otherwise.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 117 +++++++++++++++++++++++-------------------
>  1 file changed, 64 insertions(+), 53 deletions(-)

Replaced &nor->bouncebuf[0] with nor->bouncebuf and &sr_cr[0] with sr_cr and
applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
