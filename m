Return-Path: <SRS0=n7A6=Y2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4FCCA9EC7
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:44:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B3E320679
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Nov 2019 10:44:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mscLxIza";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Vk5aAA7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B3E320679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrdqDkWsbyicsbX4POwEXESzfWZYYvJnUqKQA76p+ys=; b=mscLxIzakUt6rp
	rRmmLmrMFAhzh92YYg6sh/5YYTOiN/ykcEi/p4/zkqFKUesWPwxUZYcRJAodlBp43aKf1BLPIXGe2
	maAiPeGMXYUbA0jKxeBTz72A2eQmx3tYomj6fRj0TGPLrVAgjCjcISyLrWL9I67wMOHSD84qC9iZh
	hhmn95oddKCeP0GM1tumTXD2Oq3/5V+pe/iQrxNX78wJ9Q1IS/7pjT1WfvbHdhVx0OzRVEHxBLtcM
	YwS+ROH83Jbb9t57qi9D/ogr9tTJy4Kdhg0+u+0OzNdmURq0A16VTSTxlcAVSopMrFEh/X28B2Tv3
	f5nuS5Fczby8KYWULfZw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQqtE-0005EJ-Jm; Sat, 02 Nov 2019 10:44:16 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQqtC-0005Dx-8w
 for linux-mtd@lists.infradead.org; Sat, 02 Nov 2019 10:44:15 +0000
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
IronPort-SDR: dqLOTch4Wp/HX+Dd+ZSfhTjEOn0gXjj87nsPxnjj2R60zVVCkki2hf+jka8Gns91k+MZptv9QN
 i9WJ9SHoWqIxXNSR41faVNyM7qUQIin3ZlymtMKgYqF8oTHbaEmTV0ypla8qh7CE8PmwvH679u
 GhRfTqSG56GHFqX0mH4pt5Qf++rcjLu3RRP8qUnQRDZhUbnua9Rz+bszUwm9RbgBhmGV/envJj
 gSZW+wbZG8tGsjo2TsXbG/sWXyJVvGFhNkd5XY3ooKqdvXXldvLEWJsKFJ1eAFYoGfnQzKU5Or
 Jo8=
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="53868133"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 02 Nov 2019 03:44:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 03:44:13 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 2 Nov 2019 03:44:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWeN3awINSlZaBQQu3IWzB7XYGBhosMUg0/iWkzbKmCs6nY3zbjFdLxNjbI/0DPS19s24OHaCPg7LpGBcfVyQ3YI6HrrzK7Fvb7dPo8p6aSOPdvYxWMUMfIvcr4oLpegiuJPS2ny26UhslRQfje5U2NXUlZf6n6aleFFq+uj1k2BwKeNl1mcmT9GxZYG4CSn58/BLd2F7LotGw3WwL1PU4R1pxNNfXmE2lb84d/hgolYHHlawZGUL5+S72FDc8OpIEy+VO0Man0I2GZZNQ9aDM0jfeUcd4BoxTFxtevkoj63OTJIxRD4uK9aOoK5+ugdz9sipi24f6qedJnHkdbCAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E6k81Gv2WN/Ar8PoDUcCyOeJj9HJVjroCrcQEtHDEg=;
 b=P3qpax+AYe+ulnuSWC7sC+zG7FjSiCjhgOpIFFwIJa0HOlGzYY8tZ3aczLi5oTz1IO/aCpt7oPs9bQXT8tbrQRoIDpdRi/+uPIbMe+dlX4B2tnUW5cKFVQMMUJO9zl8Z6SCxbOTJhtOHb+my3uzelAfcdrEejcygz18pYjRn0qVIT9NuxVZx8TMGAeqP+3FTo7K/t/221JfyWXvi3nwzp1eihm3KO/MS2XvN7wx1AUEp3c775vaiOANQQr+MAeCLbnzODQfscvVz3OZWjRlIO5Qis4avS1WgckflFMKTPddl9tW4oEl34Nqi4EZZCOGz1l1E6/KFI7lvPnXv5ePzCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7E6k81Gv2WN/Ar8PoDUcCyOeJj9HJVjroCrcQEtHDEg=;
 b=Vk5aAA7mQOMccF5ENNNLBaQ/u6aW7xozqV5CubwbEQU/0Wjx+vWmi382halsCXvlZz084opuMZqBSmTYWmkFjAto1nsbkpWa64zl5bFzfyL/Mv3CSG1DpE0GvQzlnPZazQ3xksqEI6HCp/FFvgMWMeAcwd18EhmWEi6jLqE9lUU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3629.namprd11.prod.outlook.com (20.178.252.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Sat, 2 Nov 2019 10:44:05 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::c09c:36c8:3301:4457%5]) with mapi id 15.20.2408.018; Sat, 2 Nov 2019
 10:44:05 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <boris.brezillon@collabora.com>
Subject: Re: [PATCH v3 09/32] mtd: spi-nor: Pointer parameter for FSR in
 spi_nor_read_fsr()
Thread-Topic: [PATCH v3 09/32] mtd: spi-nor: Pointer parameter for FSR in
 spi_nor_read_fsr()
Thread-Index: AQHVjkpjFsCVETDwxUiEqOeciq1tr6d3uD+A
Date: Sat, 2 Nov 2019 10:44:05 +0000
Message-ID: <478ae771-75fc-b721-3278-1f1a35735ec1@microchip.com>
References: <20191029111615.3706-1-tudor.ambarus@microchip.com>
 <20191029111615.3706-10-tudor.ambarus@microchip.com>
In-Reply-To: <20191029111615.3706-10-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::16) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.120.239.29]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 383a9e07-f980-4470-6395-08d75f819541
x-ms-traffictypediagnostic: MN2PR11MB3629:
x-microsoft-antispam-prvs: <MN2PR11MB362924102DEF64D76031FFCAF07D0@MN2PR11MB3629.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
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
x-microsoft-antispam-message-info: YMjOoJW/2M81dIPIMTV63eSYz6R0tR1k4geLRJEY8ICKCmUhnmIPDlwOTxo3+Zi6QOOgto65BqXcbNZYpdGp+Rdu+Gpn1+XFCaLwWAShFRW1sVrOykcLHoIOWd+p+6Tn0ccWsMwG6q7C3OS1khgUz+7EqBu76mKs+5X7erPSizt5DVtjsWs0dkDhHWk4UydbKhSHeF/2+zlKS50JdyK/Uk/AWAz0RDX1Byz2GcqFa6VcSNGL1yJb1RqJbM7guyu1CMYwf7+j6u6kTPyp5FztRvXEtGPwouStTMUHwdRSBY3dnKNb+glCBK+cvgoU/v7cHmNO5r1EpE8omhOjpTUU7Ag2hIBcYnUJ0FefI+kLf3xmGUzpj9BKYaEa/xrYvOcwB+NYD/49hovsgJjxeTCSYmTmzeiGtQgQVTw35p/HD1q4h6eITtzUpU3SUmsc4M0Y
x-ms-exchange-transport-forked: True
Content-ID: <6CDD3EBF2E81EF4A928871E79571C774@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 383a9e07-f980-4470-6395-08d75f819541
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2019 10:44:05.7803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOCPn6PB9qmcW3XjSiZ1T6lbpnkcG7PE+VXrjNWLpEGTU9Al09C2gpLoPUJNz6Mf48rg/STsYRzKBulw0aHTCQ89CIGifgcENrvzzwiey9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3629
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191102_034414_323323_D1ACC1F1 
X-CRM114-Status: UNSURE (   9.46  )
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
> the value of the Flag Status Register will be written. This way we
> avoid the casts between int and u8, which can be confusing.
> 
> Caller stops compare the return value of spi_nor_read_fsr() with negative,
> spi_nor_read_fsr() returns 0 on success and -errno otherwise.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 38 ++++++++++++++++++++------------------
>  1 file changed, 20 insertions(+), 18 deletions(-)

Replaced &nor->bouncebuf[0] with nor->bouncebuf and applied to spi-nor/next. Thanks.
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
