Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A5B0C3A5A3
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 07:20:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65C2F2070B
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 07:20:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d+gCH7rg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="PSS6ARUb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65C2F2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2aVxVCDTmxkYs1+uvv6scB6V02rbxzjJvbamT66EDY=; b=d+gCH7rgzkHtyl
	YW2raZ1uY4IkJTzQzZoRLNwxGKrbFM72mPWazcWXnwYOjN8QV16BvlQ1G6ycc9k5RfGZ5ttl1pzha
	8pCtrFxGTkBhWkz5IsUCggkfY5E8iGZWniqPjREVCOLU7DF15rrEePWqmGyQP91SwkUj3XzJK0mHf
	4KXvCDFhb2rw/f27eH0FSafEqIf9lVtYjTkxOI/2hZL7ZB0G4FtR9vLyMX/y4rT7V8tx124SYTzP/
	nImg7NVSD937+0cUnBNfdwMnutN3HhzJIdKe57IciG/MIrFBjoDIOvWea6D3+CwMmajwO8W5N1Rr3
	RvMEw98Kzaj7exv96Ptg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3bC7-0000rK-58; Fri, 30 Aug 2019 07:19:39 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3b8r-0006lP-SO
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 07:16:23 +0000
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
IronPort-SDR: 7WEKOwVZLtxPerzVZsPZA+G/AHqFTyAwOLeI0TyyoXgdB41o/jj0oj5ILcPNTFdnLKLmB440ZW
 yCEBaAsJ62loqXytaMsmA5bWywVWH0X6lLNNzItIsnvte2e612JHCrI357647FRZNG7R2BRvb2
 ibZtA7XC/7JfVrhW6iJLhB1tBqm5XtHUeSZfTNYqX84q0ut59OwxjsCsRNu1olMHoiZ92vL2xW
 mzMe/csJD3MTFlpjn7qWz5v1AM2UgFSuhup3jG0xXc7fzvHxjYlA3oh49z9FYuDwiDphD0LOvS
 Kss=
X-IronPort-AV: E=Sophos;i="5.64,446,1559545200"; d="scan'208";a="48616412"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 30 Aug 2019 00:16:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 30 Aug 2019 00:16:12 -0700
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Fri, 30 Aug 2019 00:16:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJk8tQ6QaPjA2sAYjXaGuqcICQQIqUvadjxTzoPBANBsk7Yk3de/UwSCgPoZGA1DtMC1t9VrEigWBZ1Z0X4roQvBhj6Omls9Dgth8gghVI7xyW5NfCt/+QvfY2AYV1hlZPpr4tKOy7DbZCvMPU/H5Kq0UstDl4Z129bkuObgsVCHOJRfOWXWspYUVWUVcKHTnry9KRavaCQ68nKoHwT7jmczKIFuwSOmD43Ma3uK8y3/uchy8eNFaDbt0eaXLXpuaI+FYP4vx33LkrkfEYksnMtOvosL+STFDjiAe3q9WWFfomsih53AoZWJE+cH+7fAxpcVCeWoNiayZPgyVRbRFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpAKWpWXCgxdYQxCvMFaaQd/99azXb3kIgdnRp7cEFY=;
 b=O+yN6vEid7rKE4FRYU3rwywVjgxwv4eD/bf6nYYUwZv67FF0q4HNZIuLvonlD6v9qn4IWoG86ErQhPGjEmb6tJhMef1x3OKKdwCpPByzJ5rkwNzeI0spknQ82HjHr71p/cCugAp6hyzfy1qqKYXmlCpl/JW5CrEkgZC1ySF4/SC8RuXzeqCYnxJFZz6R0xVxmn2c1orC62pSxIv5rSxxAY+G+VJzVWcgo6ZNG/v+TWQHWWywJgpyj6P/cZjXpbNp3n5+5NHkQYoUMPgG+iDfUmA47BZXA4kEy/qyY3Z17iihryNDvDwcfLXMknRRbQm1dzYXaqFjwQtqBR/8Ewiorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mpAKWpWXCgxdYQxCvMFaaQd/99azXb3kIgdnRp7cEFY=;
 b=PSS6ARUbesd0CurnjvHXt+709H88zCiTh6ncpWnou2bYJpk+xZuyur7SJpI9iMouMCRNJV2r8TvneDDe+lNn3sntwNgzLRgd60Qb1d5v62zecg2zH+YDmy4aJYdzWXXS50Mx4bnmH2C2imCLaSTeIxkkCH5naIL1vqhjRN/xiGw=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3583.namprd11.prod.outlook.com (20.178.250.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Fri, 30 Aug 2019 07:16:10 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 07:16:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <Ashish.Kumar@nxp.com>, <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>, 
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v4] mtd: spi-nor: Rename n25q512a to mt25qu512a(n25q512a)
Thread-Topic: [PATCH v4] mtd: spi-nor: Rename n25q512a to mt25qu512a(n25q512a)
Thread-Index: AQHVXmJrKLsGvTkXLUmH+yAw5Ce1FKcTSMuA
Date: Fri, 30 Aug 2019 07:16:10 +0000
Message-ID: <f8e546e3-c175-33e8-f691-963a75fae2f4@microchip.com>
References: <1567080445-32695-1-git-send-email-Ashish.Kumar@nxp.com>
 <1567080445-32695-2-git-send-email-Ashish.Kumar@nxp.com>
In-Reply-To: <1567080445-32695-2-git-send-email-Ashish.Kumar@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0019.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:d0::29) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f8748605-6afb-424e-8d09-08d72d19eef5
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3583; 
x-ms-traffictypediagnostic: MN2PR11MB3583:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB35835ED5CBA048C6D6540559F0BD0@MN2PR11MB3583.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:747;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(376002)(346002)(39860400002)(199004)(189003)(31696002)(99286004)(6486002)(316002)(53546011)(6506007)(36756003)(54906003)(52116002)(31686004)(76176011)(6436002)(53936002)(102836004)(110136005)(2501003)(386003)(64756008)(4326008)(66556008)(66446008)(25786009)(66476007)(66946007)(256004)(14444005)(6512007)(26005)(186003)(229853002)(476003)(6306002)(486006)(8936002)(81166006)(2616005)(11346002)(2201001)(3846002)(6246003)(6116002)(71200400001)(71190400001)(305945005)(4744005)(7416002)(966005)(7736002)(5660300002)(2906002)(86362001)(14454004)(446003)(66066001)(8676002)(478600001)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3583;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nNL4SXdknwuugaA3nEsgvGAZJ4c6ckQFmbwKsU+R/FauZGEUD7gAuYcS1Jdvk3gsDs9RvIQHu5rqkMtqDQ/YfQaTooYkInKg7N2F+NAuPCtpZ+JEPL6MKLc/tPUZXjZ1oHHW84J2kianKf5cbznAnnF9nF8O3qIQ1ssdSc3XQjvSupd4WpSFdVAFDmliQyzocS4rg90ITOGrLo0/i+B7Ry3/y9XuGPSTvDO/Q7mnlQsGrwgVapLQt1BnYMht6DUanNLl4d1jegiqFWGdk/8q+s3vUJVvUbOk3NKPbmPuE3MHRX/x2Zbc43mq8gexUni4h/DEpRCIbgf7/EHmND7FmM2Z+y4+8irR1PdNQcOQnZ74xmfroSX4IddqcvVy54B81TRRNbafCkOeOQwId4k4/l1mcRZwPq8ikPHgBRjBbLQ=
x-ms-exchange-transport-forked: True
Content-ID: <560C3BD64ADFEB43AFB83F6A598A5270@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f8748605-6afb-424e-8d09-08d72d19eef5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 07:16:10.3836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IpQt38IJmlje6+0zWtoNB341JPU9+BMFDPLISbGp6kil+bE+S0Mry+0P8R7zHKFmALXiTWJ1Hv7wyXiMXwuP8CaP4/tGXidXRnsdpoqQ9j0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3583
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_001619_012590_6BC3B1A5 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: kuldeep.singh@nxp.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/29/2019 03:07 PM, Ashish Kumar wrote:
> External E-Mail
> 
> 
> mt25qu512a is rebranded after its spinoff from STM, so it is
> different only in term of operating frequency, JEDEC id
> is same as that of n25q512a.
> SPI_NOR_4B_OPCODES is appended to flash property.
> This flash is tested for Single I/O and QUAD I/O mode on LS1046FRWY.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> Signed-off-by: Ashish Kumar <Ashish.Kumar@nxp.com>
> Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>
> 

Renamed entry to "mt25qu512a (n25q512a)", reworded commit message, ordered entry
by size, dropped comment as it looked redundant and
Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
