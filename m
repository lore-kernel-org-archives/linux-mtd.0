Return-Path: <SRS0=oU9n=QV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAD_ENC_HEADER,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E6C0C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 15:57:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1D63222D0
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Feb 2019 15:57:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LYw0V93i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=telspandata.onmicrosoft.com header.i=@telspandata.onmicrosoft.com header.b="LqyvEVLP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1D63222D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telspandata.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JkNhE9qI3q7TVJsgC6TgX+VHBXkrlPNXgmirf4SIeKY=; b=LYw0V93innzlrU
	/+zCrnhO6U79Jk1vnoi8GjKKlPCy3HeKcWSv1LOLevgHDdpfrIjH2Sn5GgbhfcQjrmEj1hZSY66iP
	XiKYPx0D0DImgq0iH0qiQr2iJMIBdcsOeJdPCRs78nqr/ZoY9Wxu0Pbqr5ZgWeoX55m3cVQoEVwrV
	n8FErTUgAIFgITYiGEG2jXX8UlungwWksEXxvvFBZy+0O/gOa9kXRug+fC1BobqkyY7aazTslfPk7
	GnljFrc9CSgmAd721wbpveOBPTWMDs/Gz8xGNGiltq6JbaM5IavlqlXSUzAvvCqYKoui50z6vaXnl
	EQciuLHsSJ+OsmjMWu6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guJO4-0001Kr-1l; Thu, 14 Feb 2019 15:57:20 +0000
Received: from mail-eopbgr720048.outbound.protection.outlook.com
 ([40.107.72.48] helo=NAM05-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guJNN-0000Jn-SG
 for linux-mtd@lists.infradead.org; Thu, 14 Feb 2019 15:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=telspandata.onmicrosoft.com; s=selector1-telspandata-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iol8tuVXt/QqttwnlbP80arLPLlO/s/QW2a7k3rtyIo=;
 b=LqyvEVLPKTwK7HLjtArT7Er1DhkN7L32xaU/Iot/qaX3Y1zmE+oDvjeRJH9Mw1gJ2kvm+m7X4pSu58xVVKR6X8f9zwDOs9C7KuuMkS/qPxnvunVVGcNe/eCocjSlPUMYhxa/xK43aKRTM5bBBNIEZ5DHLSCTSZ0T0f2+UPpkYkc=
Received: from DM6PR16MB2665.namprd16.prod.outlook.com (20.177.220.10) by
 DM6PR16MB2506.namprd16.prod.outlook.com (20.177.217.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Thu, 14 Feb 2019 15:56:32 +0000
Received: from DM6PR16MB2665.namprd16.prod.outlook.com
 ([fe80::2458:9950:7549:af0]) by DM6PR16MB2665.namprd16.prod.outlook.com
 ([fe80::2458:9950:7549:af0%5]) with mapi id 15.20.1601.023; Thu, 14 Feb 2019
 15:56:32 +0000
From: Matt Schepers <mschepers@telspandata.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: mtd utilities work but ubi utilities do not?
Thread-Topic: mtd utilities work but ubi utilities do not?
Thread-Index: AQHUw/Wa2AwIel9T9kixDMSG2KbPfKXelZuAgAAGK6GAAErtgIAAggFc
Date: Thu, 14 Feb 2019 15:56:32 +0000
Message-ID: <DM6PR16MB26650DE0AA34A9F80441B5ECB0670@DM6PR16MB2665.namprd16.prod.outlook.com>
References: <DM6PR16MB266514008732CC2ECF6C5257B0660@DM6PR16MB2665.namprd16.prod.outlook.com>
 <d24d0b1d-135c-1779-5e4c-db9d20504f3b@sigma-star.at>
 <DM6PR16MB2665DA2D6DCD8FE7B829D572B0670@DM6PR16MB2665.namprd16.prod.outlook.com>,
 <CAFLxGvzeD=zoWWK3tGy8R9=Dkfq+SorMGDn5gNADsHqZmg-2Ow@mail.gmail.com>
In-Reply-To: <CAFLxGvzeD=zoWWK3tGy8R9=Dkfq+SorMGDn5gNADsHqZmg-2Ow@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mschepers@telspandata.com; 
x-originating-ip: [96.69.169.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9fe4396-79f9-4889-bc3f-08d69294fd56
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:DM6PR16MB2506; 
x-ms-traffictypediagnostic: DM6PR16MB2506:
x-microsoft-antispam-prvs: <DM6PR16MB250613B10EBB0ADA9BE7A43CB0670@DM6PR16MB2506.namprd16.prod.outlook.com>
x-forefront-prvs: 09480768F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39830400003)(376002)(396003)(136003)(346002)(199004)(149574003)(189003)(486006)(68736007)(74316002)(81156014)(106356001)(66066001)(86362001)(6246003)(6436002)(55016002)(11346002)(446003)(8936002)(316002)(256004)(8676002)(81166006)(476003)(76176011)(53936002)(14444005)(14454004)(71190400001)(508600001)(71200400001)(105586002)(53546011)(6506007)(3846002)(4326008)(6916009)(102836004)(7736002)(26005)(54906003)(33656002)(229853002)(2906002)(97736004)(99286004)(186003)(25786009)(6116002)(7696005)(93886005)(305945005)(9686003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR16MB2506;
 H:DM6PR16MB2665.namprd16.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: telspandata.com does not designate
 permitted sender hosts)
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; DM6PR16MB2506;
 23:qqq7izHB7oCN58VZwo/dP8UIoQdqw9eZjDJ78V7?=
 =?iso-8859-1?Q?A2JB0N3bCaOHMMmT7cvI0ZLBVfqagJBEp2JXz/LhuewRtGtKtkF5640sNk?=
 =?iso-8859-1?Q?HAX73oQu4lWWR5yjXx2iB+ba7hm38k1JNqd6DkipXbWNf9Hv/58UkpP0SL?=
 =?iso-8859-1?Q?W9HW+wqCxf0Lvf3l+KQdLliZV1PgxPOBq9VxOIT7ZBpvx84azu7y+oUCgB?=
 =?iso-8859-1?Q?Kw7PA72whYh5vq3S5tXsE7HCAQwqideD36wV30NcTLTICLMSnzYT6zTHBp?=
 =?iso-8859-1?Q?b8slwdPNc2P6LecJ+0QrMPqEtKbLVGeehUqM6yiru9MqVi1TtVA9NiRWnl?=
 =?iso-8859-1?Q?d8dY9JqM4jslGspq7/MVG3Gb17ccAt8d0C6/NR+iZd4sVaqiwvnTkN5H9y?=
 =?iso-8859-1?Q?DYmVSQut+AbalhWl045KWpiK2iKFif3lXZH4YLxzs/pEpeAksf3TfXLaUa?=
 =?iso-8859-1?Q?eQpKnP5/qG/PgokmAbHpwozZHhs7AtWpLWRONTx4xQTY8TwKiX+rEZj5t4?=
 =?iso-8859-1?Q?QSuiDirEZyEZrOXVtE4NtaAtQg8O+YiiHLKp1dZ6Vo6ShI4sNW7/N64pcZ?=
 =?iso-8859-1?Q?NQFUgFk8uR6Mssnxdc4Ps4VdQxontyAuBeyYQqL1CZpqNFfKphuhEO56J4?=
 =?iso-8859-1?Q?tJwHro4uRslJ3aUgCshiJhAXktS9z/Z0Uhay7BZ83tqu3/gStlKE5lNnHq?=
 =?iso-8859-1?Q?CHm+T/51HHOuEybuLYIOm7CYOTT06WC22SxyxQVh4sKC5L/mLRXxAtieRK?=
 =?iso-8859-1?Q?T6S8PgIQlAJF5datVOsusKK0s/aih8PzY0D1RfBK8wwvW0slgBS/m7yD5V?=
 =?iso-8859-1?Q?TkUZl0WnRhh6l64a1aQjtY39lMCXJtqQEjNzdpDHXoeCM4nqPtRCuoC6Wp?=
 =?iso-8859-1?Q?GnDiMyxexyn3ZrRYOgNl+J8ELvRWv2DMpUVreMyd8rz610K928e5Z5l+6G?=
 =?iso-8859-1?Q?5mpsyyuad8czjVcv9JnqeTf2t9Pbr/Jp7+z7q0CqIfRFdoER8nhoOqYo/b?=
 =?iso-8859-1?Q?rSUr+t6IIWxy/2fuWvr/gDevWU/xkCAXmoh7obinyXb5Iz4tZXOekwN5qm?=
 =?iso-8859-1?Q?DJhnE2gH/jDKcIdDvkalBe019OEoGr3C+BXMFBBHop05v+KnjldvxYGCUM?=
 =?iso-8859-1?Q?LMe6SzBo/lk0E8qdLdeUmhuicAgl7XqVU77CSh7qtgoxXnMtfcEImgQelS?=
 =?iso-8859-1?Q?XUPjcNt2MQF1t7odTqn6BlPxp8uMsnm6oGbNRJdgIpTHovSEZtJzKm5FQk?=
 =?iso-8859-1?Q?vxYAdmzk4Ufuw5Vx56RmNzkuL975+QGgTl9OeTHVHeSaUmcpA1yzZpJpSa?=
 =?iso-8859-1?Q?b4=3D?=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BJAhlh1FzjnuVwJIc2wRqk2PhUNeM0Upp42LiCmZgMVNrqFg73HZbbY0/lGq+4ua3q5y8XQzVZScJpKOgatOQw//k/90P3inkDSy8t20Pb7N6k5pyK/s5GZqZHxIqRA+I1EpGCUpELXP3ldvoGOPioRg6vAptDiBC9aYhvRIB6kHD8AJ09cC2N3S0KlDonA1vXV4AolskKaaVeF2qHbwLY4f2R8Agmi5H0ogrrpwrAxjvsCMad986thKms2O7K2B8e0cJoC9vy56h45lPTrDfY11yC1/CdOVpplDMZfcLJ+/Nrpkc54zasyh8T0PM43J+BvIceqiUcSujJCys8JwRMJeywMsEcJq/DNNSDrmcSnCzG5ox137+vpmS/5nK3VkcYjHeiOTM2x/iIdgk4Q+xfAtPhCikRR2RB+yB+xA0Go=
MIME-Version: 1.0
X-OriginatorOrg: telspandata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9fe4396-79f9-4889-bc3f-08d69294fd56
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2019 15:56:32.1728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 980119cc-b60c-4c4d-84e8-5d25446e5dc3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR16MB2506
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_075638_214377_54C44583 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Richard, 

It could be the case that it is a problem with partial page/reads writes in the driver. Is there a quick way to completely disable this and see? I have already tried setting the VID offset in ubiattach but I get the same error described before.

If there is not a way to quickly disable partial page reads/writes how do you recommend that I troubleshoot this?

Respectfully,
Matt Schepers

________________________________________
From: Richard Weinberger <richard.weinberger@gmail.com>
Sent: Thursday, February 14, 2019 12:31 AM
To: Matt Schepers
Cc: David Oberhollenzer; linux-mtd@lists.infradead.org
Subject: Re: mtd utilities work but ubi utilities do not?

On Thu, Feb 14, 2019 at 4:09 AM Matt Schepers <mschepers@telspandata.com> wrote:
>
> David, thank you for that information. However the following sequence of commands produces an uncorrectable ECC error where I think it shouldn't:
>
> command sequence:
> flash_erase /dev/mtd7 0 2048
> ubiattach -p /dev/mtd7
> ubidetach -p /dev/mtd7
> ubiattach -p /dev/mtd7
>
> dmesg:
> [  362.807750] ubi0 warning: ubi_io_read: error -77 (ECC error) while reading 64 bytes from PEB 2044:0, read only 64 bytes, retry
> [  362.808328] __nand_correct_data: uncorrectable ECC error

Looks more like your NAND driver is buggy.
Maybe subpage support.

--
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
