Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688CBC10F27
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 15:46:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CB2E215A4
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 15:46:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FaxgMeAB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Displaydata.onmicrosoft.com header.i=@Displaydata.onmicrosoft.com header.b="hODXWiZk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CB2E215A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Displaydata.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cPSIvQ7kC8GEnjtp5XyJtsFTWyqDmvSKqW4zAnSJdmE=; b=FaxgMeABIRlPys
	1I8DHEc2p1pkWBAPQ/3C76C5V9jzrhOIjz8zgtpGIh9gPQwkyO5IohGz+E4+/uoUOrK37QOw/evNK
	aJTp8izB41HeJtMUsrD7b3hnxdvKWJ7oNH3pMkBpxSIrQd84Nrkj5dN+bkOixKUmurEkA+PIEHCf0
	GQLnU9/6EwPpbf8GH3JOaaqOA6Z8YPS6lPEQfLmu93D0qMW3pyAXavxCA+VFbpcsMcJbiAaszKHB0
	RrnsTGPJRl6mR27nWJH2+Zwu16463UCpH5LaYUJ7AWvYaNv8uFUIGD/HW84WQIW/2/dJqZRY3Fag2
	sVF+4QyFE8jReOUWmh1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBh5X-0006h0-CV; Tue, 10 Mar 2020 15:46:35 +0000
Received: from mail-eopbgr110123.outbound.protection.outlook.com
 ([40.107.11.123] helo=GBR01-CWL-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBh5U-0006gX-1H
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 15:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2Ie+dJP8w9euYBcJ2BwjWooa1ZaDWJlih6RafAR2UfUBULTslXgtEdvi1HLY9BVTZ/N6ceGRJFJCLdnVSTqIJjaFl1BI/2X/eGwKQ9LtYekRorjUoIrLi1DC3KP/WnNd1OpZ410+c+tmdDIDrrzKuJ2rNEylbwgi4kVeoLtFBHFXfJAFElVotCkCiBtfOUNiDjjxghgIw1rhHiYpkxHIkgPjjtuUEvGd+Wb6LxgjFpzt55BKF3G9w+wjI08rjL4ezcbvEV31Xx8KfSUGBuMrlhlZz4VITdPovdu/OzmSkjC6+rqWQMo8mv8vBWYNgfNPINBFKfFTcgG33Unrv9AVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4nxkAbnhHE42laxPUzqTiZu5Vt/Cy50mf0EoU8AAQA=;
 b=P4dtX7MF3ca2Ko2vwajzDbM8BTe/CNTyeY1uj18XS1/wSX5p+NxX0D6ehrgM0TuDFTJAo9zOB/QqF3LnVt65MNlDSUnc6Xbrg+jRYBRGc9rXIo32KCZ1ou4k25d+Fw12i4H52cnpCBb6hleoLtZ1dRcu6/aVy+N40JPWcZYxOx97KQwQkRmyA2Bw1TtM7DrGd9sEmg4N+xC/o1Lm5K5MBCFXSiWftdVPqFOCptO+l9wXLp26C+gYzDZO1YTvG9DwOWtBVb27gNrz2KKJXyFj/rC0BtxcbyOpRIhBBuqSaQfjj/asr/q+7pv0ov0pjyh08r82tNZCGjleD/oFkHQyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=displaydata.com; dmarc=pass action=none
 header.from=displaydata.com; dkim=pass header.d=displaydata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Displaydata.onmicrosoft.com; s=selector2-Displaydata-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4nxkAbnhHE42laxPUzqTiZu5Vt/Cy50mf0EoU8AAQA=;
 b=hODXWiZkBgt8zPMexJ5UrUA9l0fG6EBc+fAPge+Mvw0cR4At7ORK1oPv5wP1/6e8SipIhkOuEyYeXadr+X8cGlExMDni2CTxDjhm+d9G+pOuFC3ECWf+CKA72stk9uObbBNM8NYo3L7joxJ/47c6jNydp/gLmswhM2Zio+zdxD4=
Received: from LO2P265MB0478.GBRP265.PROD.OUTLOOK.COM (10.166.100.16) by
 LO2P265MB1197.GBRP265.PROD.OUTLOOK.COM (20.176.146.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Tue, 10 Mar 2020 15:46:29 +0000
Received: from LO2P265MB0478.GBRP265.PROD.OUTLOOK.COM
 ([fe80::71a7:d524:b3b:1719]) by LO2P265MB0478.GBRP265.PROD.OUTLOOK.COM
 ([fe80::71a7:d524:b3b:1719%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 15:46:29 +0000
From: Tobias Petschke <Tobias.Petschke@Displaydata.com>
To: Thomas Betker <Thomas.Betker@rohde-schwarz.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: Corrupted bz2 file when downloading from official FTP
Thread-Topic: Corrupted bz2 file when downloading from official FTP
Thread-Index: AdX28lQVwR5+BjZtRU60Jmwb/A3bEgAAJs6g
Date: Tue, 10 Mar 2020 15:46:29 +0000
Message-ID: <LO2P265MB04781AA5944DAF3436BA2A51E4FF0@LO2P265MB0478.GBRP265.PROD.OUTLOOK.COM>
References: <d8806e24caeb4f84afa0297c15da96c3@rohde-schwarz.com>
In-Reply-To: <d8806e24caeb4f84afa0297c15da96c3@rohde-schwarz.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tobias.Petschke@Displaydata.com; 
x-originating-ip: [213.210.26.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f01582ad-0a0b-44bb-2791-08d7c50a32ff
x-ms-traffictypediagnostic: LO2P265MB1197:
x-microsoft-antispam-prvs: <LO2P265MB1197D6C511A2330C81FCF12AE4FF0@LO2P265MB1197.GBRP265.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(39840400004)(346002)(366004)(136003)(396003)(189003)(199004)(55016002)(9686003)(8676002)(2906002)(71200400001)(64756008)(52536014)(110136005)(7696005)(8936002)(6506007)(66574012)(508600001)(966005)(81156014)(81166006)(33656002)(66446008)(26005)(53546011)(66946007)(66556008)(86362001)(316002)(76116006)(66476007)(186003)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB1197;
 H:LO2P265MB0478.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: Displaydata.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QkxJeTmzIKXTCXDbFgmOMZW8daqGDwWNZ4L21vU46A89YQ5enhvrf/rE/gXVnSJhMCVLgiSV3Uz1v7XVwQcGWXLK84D99BRzphnGaoGL8gQS1FI48t6KB0+fNYGRtCcJKhAM9WDa2BWMkiBm9Xb38k4tGX1ajeG3e4NM5zW/BMotysOmN7bB50cz5duRrvF1YG/Bh0ZpKwqq/yyRnu1GcFbwP/d5ze0eJILsDZ3LZNHbP0pTpXl7fl+ne+X1QDtfRlhFt9jhB1krh9YUluyFr8oVOtnS492furnLnZ66HkxeJfWicMZoShle+UN/Pryy3b/98hWde7XvhwN9TcNty+HwxEK1UCdNmWwRKDdIRfL9hPw9Qn3yASIzu0/bcjZ613OKv1AnQyvzR2Xc+8+2HWWgCvO9JEfVKNR3wyW3ann8BQ6CGK+39gLH03DzP0/1nfEU2lJy25xFYhDedFAaaUQlV/lxGQHfW02SynKxUZ6J4e+PCiEGlgNJmaLf7gCwtbXE5s/pZwmNqdbLvuMGEg==
x-ms-exchange-antispam-messagedata: f7aViJuAUbB2+MCEW3rqKoJYducZwd/ff27X6vn1f/TtALtSNx2TdzjV3E0VJYuBQUgY4ZpxqvcgYZECEsIlAKeCeT+p+8EpvY5b04gsR6gJWMzf4GsHhi2f4Z3/8Aso2iupSuCAxDyDEhJQt47UCw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: Displaydata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f01582ad-0a0b-44bb-2791-08d7c50a32ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 15:46:29.1742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fd99c23-97f1-40ff-aff3-b7e196f06d8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /5Ll4zp5Bvi/xG24w2i5bLB5aFm437RENaT2XHgXWNEZ9Fv6yrfe/XuFn+r+K3zXT5Vq5Xf/XuXZWzMLiUQQEkU4e8ZoatAZ5dUwP1Jl5eE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB1197
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_084632_082365_621D7B1F 
X-CRM114-Status: GOOD (  12.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Thanks for checking Thomas, I'll keep looking at my end then.

-----Original Message-----
From: Thomas Betker <Thomas.Betker@rohde-schwarz.com>
Sent: 10 March 2020 15:41
To: Tobias Petschke <Tobias.Petschke@Displaydata.com>; linux-mtd@lists.infradead.org
Subject: RE: Corrupted bz2 file when downloading from official FTP

Hello Tobias,

I tried downloading the URL right now (using wget), and the file seems to be okay -- neither tar nor bzcat complain.

Hope this helps,
Thomas

-----Original Message-----
From: linux-mtd <linux-mtd-bounces@lists.infradead.org> On Behalf Of Tobias Petschke
Sent: Tuesday, March 10, 2020 4:21 PM
To: linux-mtd@lists.infradead.org
Subject: *EXT* [Newsletter] Corrupted bz2 file when downloading from official FTP

Hello everyone,

I am having problems retrieving an mtd-utils release from the official FTP server and was hoping you guys may be able to take a look at this.

When extracting ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-1.5.0.tar.bz2 after download, bzcat complains with "Data integrity error when decompressing.", i.e. the file seems corrupted. I have tried to download and extract the same file using the Windows Chrome browser and 7-zip - with the same result: I cannot extract the tar file inside. I have tried a more recent release (v 2.1.1) with the same result.

This used to work without problems for me. Any help would be appreciated, in particular if somebody could verify that the file above is not actually corrupted on the server.

Regards and thanks in advance
Tobias

Disclaimer: This email contains proprietary information some or all of which may be legally privileged and/or is confidential. It is for the intended recipient only. If an addressing or transmission error has misdirected this email, please notify the author by replying to this email. If you are not the intended recipient, you must not use, disclose, distribute, copy or print this email. Any views expressed in this message are those of the individual sender, except where the message states otherwise. Displaydata accepts no responsibility for any computer virus which might be transferred by way of this email. We may monitor all email communication through our networks. If you contact us by email, we may store your name and address to facilitate communication. Click here<https://www.displaydata.com/privacy-policy> to read our privacy policy. Displaydata Ltd is registered in England and Wales, company registration number: 03929602. Registered Office: Malvern Hills Science Park, Geraldine
  Road, Malvern, Worcestershire, WR14 3SZ, UK

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
Disclaimer: This email contains proprietary information some or all of which may be legally privileged and/or is confidential. It is for the intended recipient only. If an addressing or transmission error has misdirected this email, please notify the author by replying to this email. If you are not the intended recipient, you must not use, disclose, distribute, copy or print this email. Any views expressed in this message are those of the individual sender, except where the message states otherwise. Displaydata accepts no responsibility for any computer virus which might be transferred by way of this email. We may monitor all email communication through our networks. If you contact us by email, we may store your name and address to facilitate communication. Click here<https://www.displaydata.com/privacy-policy> to read our privacy policy. Displaydata Ltd is registered in England and Wales, company registration number: 03929602. Registered Office: Malvern Hills Science Park, Geraldine
  Road, Malvern, Worcestershire, WR14 3SZ, UK

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
