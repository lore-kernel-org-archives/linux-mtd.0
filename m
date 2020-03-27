Return-Path: <SRS0=DmJj=5M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26251C43331
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 10:47:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1C720578
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Mar 2020 10:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i7GUBcFM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="XjCnY+mV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA1C720578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EgOqRk90Us1ETBVk54LHwGZpTMSsHhfUWDQW22g4uvA=; b=i7GUBcFMwCI4W8
	g4rVfZDc2I81W2jy87CPA/gdSzSaeCWzJcH3nJ0owh50Y07LT9usEQCFemQ+kuKzelAl9yfXWGdbR
	RURGLteSK+Vun3LGJm4JYVBCiKB+lsoi6mglbRZChrH/RWfcrpMR+Jw8VhweLYJ5+RHimIBYl0Z3u
	BgnG+6DQfu8L9QLb8lSMT5YLyhtJ1IMjns8+h1fK7EHJ3HSwhF2pzipBEkMNsrtd5q/5gJ5mIgA12
	47uO45V7CYOh+r+19y51qG0x2D/pR6Wue8HG9n8C9UMhVKXJafxlZrsCMzwknwoGBxeG3WV5IteL2
	b5hIpni3iK9pOzQCQ3BQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHmW4-0002gt-Ed; Fri, 27 Mar 2020 10:47:08 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHmVz-0002fY-9O
 for linux-mtd@lists.infradead.org; Fri, 27 Mar 2020 10:47:07 +0000
IronPort-SDR: NOT/CJA/ZKlwV1TWr5Zwbom8oM/O+aQHm1GDkujV7fF+D5K6uCQm4vQIH291VQzupV2n/EPt6M
 DBweK6Y+da9eWeCGQFY7oeKfnp+RbzYo3zfIkt6Js0PWklzeyv3wfOWlTM9K2jO37J3U3LYOQw
 byiuCAjKtfWWc5fWupK/6kro76x9k1s78iZC1AQljtj4xY6RMQDNFyMMQfEG2QMEfmi1dqPhBE
 MqLxUlgqVUt7J2Se6vFYn1DJ4Lc+5TM3kdTuPymiJymGAJgjpQRFLYzn4Nav+Bv+IvbqQOv2bV
 jMM=
X-IronPort-AV: E=Sophos;i="5.72,312,1580799600"; d="scan'208";a="70474705"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Mar 2020 03:47:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 27 Mar 2020 03:47:02 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 27 Mar 2020 03:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeOsrsBpgJX58Jcr5KGP1urVSU+Owsgt7OS9wEE0r6RA2nVrEKeAQkU0xNfWcgUrJM58sGdiogdCIFDV08GIV6uFIHCEFZA5Y1Yky6Ug5XOO51pGjW5QCuz5yZ+TJlOY1CndfQr/DgBGwWf2GbewEHBiMtgxyFgYVh4ojjGRNZHkTMU3Pw1TVgHYLpjBFjfFi6q7tkFPWmkyDji+mehg2/RWxZD/niiP5gN0yT+wpdj8JQiv5zN9tT9tr5ahKT56qlwDhpcEU+/zgoUERWsDscv94SRpRMhRfUdqpfAC4JWAKJaRL5suA1tgR05fYzxNPQAXFad918NvM4E037yajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6jjoXRKiZ5D4xiW0TDEoV/6BnXFLjoPzk3TLs/1m/I=;
 b=BB1SJA+fea5KVtdbWT/wO7NfxvgxPARZsHOFt7GLz7M6nvjHH4prgxzDcLKC8VK/swerR4IEUmb9dZEyspcEYP10nDpmrQSHf90x9IlxbGA6/nV0X8kI0Ub1Aa4BiAFX21/xRcgpIGQ1yhCFZiYH/YCUDLjECPDNTJYADcRLBnzihu4LTw0AtupvhNGd1mfTsiVO6q90mV5tq8VVVzaB9qMb3fZzLsZnqtNdShbkPXs34pwBcONgRO1Ly2deTj8tDwj0WosPSYrzkkXMGeR7zvuioo+RHZ+Ii04+g0jN1DAe0HdT9HjTMbNPSC6/O253NF9Q6gTiW4O6tzdWCqzV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6jjoXRKiZ5D4xiW0TDEoV/6BnXFLjoPzk3TLs/1m/I=;
 b=XjCnY+mVnyB4KOoJ3+iutfOxCH41qlQgKySVTR//oCh2jtpnu2z/RiklRJO91C0hzfueLcRrw1KQUfdpF1Fu7KlmaOiw9hnYyId2RGiohqJDr8bzH2HYNsJytvfooUoTbyUQWUa31PWo5TmEE8fnvt+vlafOnXasriJxKZUJXzA=
Received: from BY5PR11MB4419.namprd11.prod.outlook.com (2603:10b6:a03:1c8::13)
 by BY5PR11MB4005.namprd11.prod.outlook.com (2603:10b6:a03:18c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Fri, 27 Mar
 2020 10:47:01 +0000
Received: from BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692]) by BY5PR11MB4419.namprd11.prod.outlook.com
 ([fe80::e918:9196:b47e:9692%3]) with mapi id 15.20.2856.019; Fri, 27 Mar 2020
 10:47:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2] mtd: Convert fallthrough comments into statements
Thread-Topic: [PATCH v2] mtd: Convert fallthrough comments into statements
Thread-Index: AQHWBBPXknEEtiCtukmNSeqEFUoMUQ==
Date: Fri, 27 Mar 2020 10:47:01 +0000
Message-ID: <28554733.QVLUH62UzK@192.168.0.120>
References: <20200325212115.14170-1-miquel.raynal@bootlin.com>
 <11409771.dsHhkDzkrP@192.168.0.120> <20200327095323.2f0ea693@xps13>
In-Reply-To: <20200327095323.2f0ea693@xps13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0aaad81b-6af6-4b16-0ed6-08d7d23c2e3c
x-ms-traffictypediagnostic: BY5PR11MB4005:
x-microsoft-antispam-prvs: <BY5PR11MB400581F37C42B6B2B4819D82F0CC0@BY5PR11MB4005.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:1107;
x-forefront-prvs: 0355F3A3AE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(39860400002)(376002)(366004)(396003)(14286002)(8936002)(66476007)(81166006)(66556008)(66446008)(5660300002)(53546011)(6506007)(64756008)(76116006)(9686003)(316002)(66946007)(26005)(54906003)(8676002)(186003)(81156014)(6512007)(86362001)(4326008)(6916009)(71200400001)(2906002)(4744005)(478600001)(6486002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BY5PR11MB4005;
 H:BY5PR11MB4419.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D9ptkNEWPzZikidiXbYE937qnH9DKr56ItjEnzeXvDCzcy4XrX31B4pAlhsYEY9axvb+r6lBa/6h9s5y8h9HkffpQncWkmHaURTIxk0Z5CNpKeRhkwm2pb+n+WwVUb7ccERd7lTayrl5Upmq0cxKAPRq5l8szt7ZrBGDoNH8Kdv0v++rZMB/aH2bqZ1pX4FW4B5Ozs7kt43otHcjpRGlOWYPmPWuWWPqavR8hUsrUvgDxfdWG7wDUg1c+E+CkrVeF2Kb/EQsXr6jimbGgMXotvieqqIEC89zofYip3F80dxFrO/jQcbqfNYKoCdv9nwdS9WAXZufiiBrCRXVEuw6vnEi1LMd/Ih/Rdi/pJbmJSp2WPsMjyVLWCElw7l1S3d7XSzfXZslB0K1dqZJIuMuyf5Nw1GFrc7a7PSopVJLwxWjOWlKuT2AWvb/C6bRDXlF5ILV8dD949BYkNc9c0FtUp8KjM18cx3VKIyQ8NhIS3kxoNo3bT/EYmWjk7uOuwRY
x-ms-exchange-antispam-messagedata: XjbNDOMAMa2AWLbqsCM7ixkP6lu2twpEey+3aZJKh4zIw5KVS8Cty3gmsRQGnh5wpfR0rLeYPzgSRhf4QPFNO5jkwztvnm6EkMkCWSCSImKwHlp3D4S7g2KaTLs6MqIspHxSoiAsly3CifdhVp4FIw==
x-ms-exchange-transport-forked: True
Content-ID: <90FB4BFEEC14B34E907D34207E0EC270@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aaad81b-6af6-4b16-0ed6-08d7d23c2e3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2020 10:47:01.0244 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +SoowEo8r4UDnF+D30upIwPXULTl/8mjlZ0Y/xJLfN1JB97gYbhSLfLpQqrdScuZIMyxxmTydrnIJDHWt06peTqYwMzZ6mXQ/Z6+LmZILv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200327_034703_397163_42ABD13E 
X-CRM114-Status: UNSURE (   9.64  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Friday, March 27, 2020 10:53:23 AM EET Miquel Raynal wrote:
> <Tudor.Ambarus@microchip.com> wrote on Fri, 27 Mar 2020 08:43:52 +0000:
> > On Wednesday, March 25, 2020 11:21:15 PM EET Miquel Raynal wrote:
> > > --- a/drivers/mtd/spi-nor/sfdp.c
> > > +++ b/drivers/mtd/spi-nor/sfdp.c
> > > @@ -623,7 +623,6 @@ static u8 spi_nor_smpt_addr_width(const struct
> > > spi_nor
> > > *nor, const u32 settings) case SMPT_CMD_ADDRESS_LEN_4:
> > > return 4;
> > > case SMPT_CMD_ADDRESS_LEN_USE_CURRENT:
> > > -               /* fall through */
> > 
> > just noticed that you forgot the statement here.
> > 
> > > default:
> > > return nor->addr_width;
> > > }
> 
> I think this one is not needed, you don't need a fallthrough statement
> when there are multiples case statements in a raw (default might be
> seen as a case statement). So it was removed on purpose.

You're right, that's ok.

Cheers,
ta



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
