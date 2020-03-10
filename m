Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EBE9C10F27
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 15:23:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 726582051A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 15:23:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QCL9vkHP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=Displaydata.onmicrosoft.com header.i=@Displaydata.onmicrosoft.com header.b="jeINj7HG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 726582051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=Displaydata.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KdgG4jOoQAKhlbvsUh1F/VKPNqGkimqXpNVe5R+aJ0s=; b=QCL9vkHPHASdBD
	DerN3bv9I5CStZtF80+dnqk2wFPIygW3h/7EV7iGCJVXsbF+8yqOKWcwtRds2nw8mQQP7PuogFt3t
	R8VquIKrU/W1R6gopHaOsi9bK+M+9qROEG/jrRjjwSiaM+uS5qs+QialV+2kibkvpurC4/OeaTqu3
	m1jOLlotNBY4HHQAHjH2gk9hlWogWd4ZBHdPSrRbvdCxpKx7udQClFB6iLAY8oh/vgvGkf/rpsnfd
	iKA/KX5hgwMCJyzWkMsWhlYZiCRrnJxGAp/vfnxQwIe52QWLJO6ifZHOjZvHILIb2clp1sTNd1sVJ
	esMiSYGzSWYXpGvVkSaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBgix-0004rG-1s; Tue, 10 Mar 2020 15:23:15 +0000
Received: from mail-eopbgr100138.outbound.protection.outlook.com
 ([40.107.10.138] helo=GBR01-LO2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBggZ-0002YD-6o
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 15:20:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dw6iu5W3Ci8xHQ7s+fzostVwFMFZtokdC2sHI+K+3fqxHGpbVENJal+Ep+nvxF2jSGBhSTloJZXxT1kTZcr2VX3PXEmbj2PHEWMhe3Y/t4xOPyyczTkB0PZkG77Ql78cgw6INzIgITkEtCKrKnBONgC3brtSw5T6gGQGaB9V32veghu66IGq9uJ8e09kJefelS+U2+1HxiKey9+JsVmw0+X74yf3GaFsXjcJ0Qgdft+a37oX/X3ATxEivsaYQcZx/3mm/9JBGwujE2a/TOrayknP63tb7eVQEEZXcCzM0ehBRsoXgyPdB921fTA7A+ouB0lbMirQniwRvdbo3+qapg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tl0zBW+8Xv5edp5NS0BgdrTb9FPBrlisWWDIR33Qaq8=;
 b=WKrkWMr3W/xMqrEkl62P5WStPcd7p7QRMCVd4B/VGphrb+zYEmmK1emyKmVLDEE7E4WkRiLEe2u9OizM6Tt1ob0n9QCpa9G994a9BPowdfdWp6FCQ7h9u4Dw8OblFP8EnlQi0IJQZB/iEIorbsYXLMiJjcIcmDLNu3PtlpQpnqyTS8cbS6VjHeUx7q1Ydt07IBy1TMlHeSHRKEMiLQj7uZlXtEjRqR9DxDB/x867Xl83vH0fnbIATdI4KtwnghvClmozR2sAdAY8A88ms/Rb6Q8Gl75s9Lvo2Ve9JsV0+l4sb93MClhJFEpPLFWnmVqZxOniBy73en2jy2Tsk+16JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=displaydata.com; dmarc=pass action=none
 header.from=displaydata.com; dkim=pass header.d=displaydata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Displaydata.onmicrosoft.com; s=selector2-Displaydata-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tl0zBW+8Xv5edp5NS0BgdrTb9FPBrlisWWDIR33Qaq8=;
 b=jeINj7HGC79d7/O4Jt7I9oSM5Aimoy+T7/UuK7Qu3q3h91OiUdnttI4uXmQ9+djY978FCnA3Wh9MeTptL0HaC1lGXC+08gfIi4lUQP254YAlPCfBSIQotSJdaSV77zuR+ZnM7ID9rgSvRqBC5ZYGjuQ0QDA5K08Ri+IQD3TbFJk=
Received: from LO2P265MB0478.GBRP265.PROD.OUTLOOK.COM (10.166.100.16) by
 LO2P265MB0941.GBRP265.PROD.OUTLOOK.COM (20.176.144.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.18; Tue, 10 Mar 2020 15:20:44 +0000
Received: from LO2P265MB0478.GBRP265.PROD.OUTLOOK.COM
 ([fe80::71a7:d524:b3b:1719]) by LO2P265MB0478.GBRP265.PROD.OUTLOOK.COM
 ([fe80::71a7:d524:b3b:1719%7]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 15:20:44 +0000
From: Tobias Petschke <Tobias.Petschke@Displaydata.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Corrupted bz2 file when downloading from official FTP
Thread-Topic: Corrupted bz2 file when downloading from official FTP
Thread-Index: AdX2729CL/g3Xs2bS6ypzIkCcdZ51A==
Date: Tue, 10 Mar 2020 15:20:43 +0000
Message-ID: <LO2P265MB047806FD6F6EDBC7874E6FACE4FF0@LO2P265MB0478.GBRP265.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tobias.Petschke@Displaydata.com; 
x-originating-ip: [213.210.26.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fadd1de4-b60b-4bda-2a9e-08d7c5069a09
x-ms-traffictypediagnostic: LO2P265MB0941:
x-microsoft-antispam-prvs: <LO2P265MB0941D04FEDF4076AE5DA49C7E4FF0@LO2P265MB0941.GBRP265.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39840400004)(376002)(396003)(136003)(366004)(189003)(199004)(2906002)(33656002)(26005)(9686003)(55016002)(508600001)(8676002)(8936002)(6916009)(81166006)(81156014)(316002)(71200400001)(66556008)(66574012)(76116006)(52536014)(7696005)(66476007)(5660300002)(66446008)(186003)(86362001)(6506007)(66946007)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:LO2P265MB0941;
 H:LO2P265MB0478.GBRP265.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: Displaydata.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SvZb2Kp8Ufucs5o4jX2jQxuTXjvvg6qT3To/yaZ2fLqbt/rbLln/UIEGebeSAEeXhvgW5XoIXwtPTokY0qc5C2oMgKO5xgA1NG5wsh8jDvjB5qYvtFNQqEMVyPbW95AiQTwChACziZ7zcTEmibGuaTwX0IVChOMs+cVdxTYkboWGz2ogWU+NmNrUzt0TMYwXLxhYYo13wlwH/5wP5SQjAnOdWsXOMqTZtANBqHtX67YXMt4S9QVuO4F2srR9nO2eMIQHEZ1Zq3jSZKjX0Eb9akW/G4JfQJ8yUYgZG2yX5swyi78pQv9MT7hQ4U2dgvorWV9X9FjM9mjDmWFPFsG/S1EXHQ/n+ODEa6F63hDSBPZjr86qyZ4/btP25OYNVYf4u+FYLmDwWbDWXjON6JjtkoYQCivU3WUpThSrt1jCQfWMbyM7u/vJykE+sjT8xrI3
x-ms-exchange-antispam-messagedata: noFcn9rRuRosxGixtw0RoC27zv7SKzrVn/GQLmlTrUPVwPiRycl+Et58VIlSWDePdaSsxrwOexAQM5QqR4UzfQ6O0OqhvWdBdYiGeZ/ki79FYBZFiFIKU+PBQYlKKF/mO/pFdgxDSueBU+jaFD9iMg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: Displaydata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fadd1de4-b60b-4bda-2a9e-08d7c5069a09
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 15:20:43.9912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8fd99c23-97f1-40ff-aff3-b7e196f06d8f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ygk0Wpy1Hn/MTTyoOIbEE1CBEFt07lmv5PA6o1+E1YaDELWGE3Kc+WEip3pFrIYcOR94wAn7ER7BLlRR/2yI/JBsmIUbAXaN+ixg/ktQ7Bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB0941
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_082047_396245_09C77156 
X-CRM114-Status: GOOD (  11.01  )
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
