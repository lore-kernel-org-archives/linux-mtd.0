Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4854C63685
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 20:06:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F6592086D
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 20:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="njxB9d+l";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=MicronCorp.onmicrosoft.com header.i=@MicronCorp.onmicrosoft.com header.b="LdTXCrEy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F6592086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EeuK2eS8fMkkfCCYzKI6gdVgdqhMqCIKN5egIQUXv78=; b=njxB9d+luJeBc8
	BEt2aR17FyvM2Th+7DQ1h4curk+bRJk8/PI7fs5Npx5pZNSB0g3lCyBTI6Po1h5qFrnYe749FcOqC
	79NgcPX6EyUCOx/0p1JXRU68Lnvh9PfHHgNCaua5qZiCyM03NKRZJe7hFhkQ65H7TapkNJuND8Gfm
	roBYGBqabv/QLhXTQgoRTLvQsu8JhiNQ2px++ZoiDXF2PPaYoxaBNv53Z2KZUiYnymqmVfmA0gPI/
	e2K44xAOjcg/j1/c8F5bCo/CzwWoVgoUfjdgzQrs5l0JDnQkPfvcbUQPYbtVQuWWx/8shnxDS80an
	gYZeSsD2KuppaigBHCtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkaOr-0000nd-5V; Fri, 18 Jan 2019 20:05:57 +0000
Received: from mailout.micron.com ([137.201.242.129])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkaOo-0000nJ-4z
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 20:05:55 +0000
Received: from mail.micron.com (boexchangeum.micron.com [137.201.21.209])
 by mailout.micron.com (8.14.4/8.14.6) with ESMTP id x0IK5ffv005231;
 Fri, 18 Jan 2019 13:05:41 -0700
Received: from bowex36a.micron.com (137.201.85.222) by bowex17a.micron.com
 (137.201.21.209) with Microsoft SMTP Server (TLS) id 15.0.1365.1; Fri, 18 Jan
 2019 13:05:41 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (137.201.84.23)
 by bowex36a.micron.com (137.201.85.222) with Microsoft SMTP Server (TLS) id
 15.0.1365.1 via Frontend Transport; Fri, 18 Jan 2019 13:05:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=MicronCorp.onmicrosoft.com; s=selector1-micron-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VIHUm5iwixZvfHJ6P3yRjl2fMbbcbibPuRgPhaFuiSk=;
 b=LdTXCrEy39bv09wvl8m/x3vCbc55f+AZF/DVjsRPv9F/qpmPloT8cBdqfcid3z8mY+HvsdLRPDP92zFpnpOYrSvv/5NEMGECpFBBsNhsJTb83lwzBvpFglCrcm2BhHMWfhI/6AHPi5UxlG1PYcjscNottu2WOcKQhN6ZfV6w3A4=
Received: from BYAPR08MB4533.namprd08.prod.outlook.com (52.135.234.15) by
 BYAPR08MB6101.namprd08.prod.outlook.com (20.178.52.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1516.17; Fri, 18 Jan 2019 20:05:39 +0000
Received: from BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3]) by BYAPR08MB4533.namprd08.prod.outlook.com
 ([fe80::1182:ed1b:cf84:b5e3%5]) with mapi id 15.20.1537.028; Fri, 18 Jan 2019
 20:05:39 +0000
From: "Bean Huo (beanhuo)" <beanhuo@micron.com>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>, "Zoltan Szubbocsev (zszubbocsev)"
 <zszubbocsev@micron.com>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "richard@nod.at" <richard@nod.at>,
 "tglx@linutronix.de" <tglx@linutronix.de>
Subject: RE: [PATCH 0/2 v2] mtd: core: NAND erase preparation
Thread-Topic: [PATCH 0/2 v2] mtd: core: NAND erase preparation
Thread-Index: AQHUr0/rRQzFrwxm6UG8IEg7bmRBz6W1Y+Lg
Date: Fri, 18 Jan 2019 20:05:39 +0000
Message-ID: <BYAPR08MB4533F5D918D316C168FC07C0DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <20190118170422.19874-1-beanhuo@micron.com>
In-Reply-To: <20190118170422.19874-1-beanhuo@micron.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=beanhuo@micron.com; 
x-originating-ip: [165.225.81.41]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR08MB6101;
 6:ZzxLCwTzrohG0pT5Rxd7nohh/bWj+O/5XclxwAfrjzYR5+gS5wNpashbSg+LEyHQANCu+X1+meWujUAhFZPm7nqjuhS9D+ZA9BkGfLOz1IWNDSa2oWl/GfExEieZDMHe6CxCvITOsKf5ypGmeds/bSlrwYrIBFy3PXT5nOnAIPG3qbwwKSFRr1irQFM6D6d1DQhNH4LpCeVSTm/fzXSp5vBwWNVChuAHOdRzWuvimZhy3QtzG/WLsvrLs58FxXDvfNqKwu156GckSfCoW0lXnehp6/VXNbCmeGC+BM3TDTEHzn9b5bLbSmCD19cy2JnRlLfCTcCx3Ndx7fnCeIMQUUdiD1uQoRd5+nNc4IFQSB0h3VAw9zOf3iWaif30ktfCa+G+TwOUGrbdqy2l2df9q0qLxoY7dTwvxC+wi7K2/JGqrzDrtEJA7oeQ1wDBqrlb/mVAcAOp6QqfF8Tc1/ESXw==;
 5:kZJcoXU/3Nvjb1QiD4MAk+fiS098wrhuASUE1dXl8EtagUCekgsBh1ZUhk6wY9T1l+b5qqW72iokDuHDYfUFMs15h/VDs7cIhpdR+v/m5ysd/D7yJpewUik05L+OpfvURinS7kAHpePxYFUYc6tdJRsRxmouQm1Mc47rRYS5LyuOJuRX2qeS7lTdKBgaoV5WwozLLZHFxSeiWjPlXS6N9A==;
 7:ceQHQs5kpJM+S2Bn0+mWy67tTUAg0A5qnCHbHjPU0Xpg012vVxcGue8HFvSK6yaiImA5z2KGPOscTEXIr/GbNvNfdeCfQ8yLuNT+JDjSy1dOORSzDFy4L6lfdEJjejBA66wVZiqMw57olZ7Lj5AVFg==
x-ms-office365-filtering-correlation-id: 550f9505-e4a3-4da6-35b2-08d67d80517c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BYAPR08MB6101; 
x-ms-traffictypediagnostic: BYAPR08MB6101:|BYAPR08MB6101:
x-microsoft-antispam-prvs: <BYAPR08MB61018A7C896EDD75EFB925BBDB9C0@BYAPR08MB6101.namprd08.prod.outlook.com>
x-forefront-prvs: 0921D55E4F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(376002)(366004)(346002)(199004)(13464003)(54534003)(189003)(14454004)(476003)(446003)(106356001)(68736007)(66066001)(6246003)(76176011)(2501003)(256004)(2906002)(229853002)(6436002)(110136005)(11346002)(7696005)(97736004)(71190400001)(25786009)(9686003)(55236004)(8676002)(486006)(81166006)(105586002)(6116002)(7736002)(305945005)(316002)(5660300001)(6506007)(74316002)(86362001)(26005)(71200400001)(53936002)(3846002)(55016002)(81156014)(99286004)(2201001)(8936002)(102836004)(33656002)(186003)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR08MB6101;
 H:BYAPR08MB4533.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aUbHZVKp+J7DsUIORihPPzD5IHZR89Lq/r4mzI19+QSLgqxW4RpSBj1iSn2eW71l5X7M2F9QOuE6+4j4nkoA/WjI2EqfKg/3VDYFHcKaK8weWSeEc8iR+68Q+tKsgTCHyJ+AfY+HeGp7hAQ+NG4m2HPjr363Pq777icFgU1tj7xdNHthvLFMKyQ7114kSrfQ1tLKe1K4op1AYVQ2ouunF2l4LymNT7fn3MqiHJ8PaQ3An1tLiUKE38fTa5Plbht0MEc6HFqPfvOptfMjI/XUniGGokoVPzG4VGANFERw/wCR1KbqGuM4ZLmWENFYjO9NYqsguqpqgEN4YB/aMzxroWiB0QA6QsyEU7LOSYXvQ+bqNBcHpdQHV1YJQat+8LIAJZvxdOo8q+ssW6/FwcEZP1obtCs/yomxFAbCcgGek74=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 550f9505-e4a3-4da6-35b2-08d67d80517c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2019 20:05:39.3853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB6101
X-OriginatorOrg: micron.com
X-TM-AS-Product-Ver: SMEX-12.0.0.1782-8.200.1013-24372.000
X-TM-AS-Result: No--10.885900-0.000000-31
X-TM-AS-MatchedID: 150567-101405-700648-780030-106230-703782-139010-139006-8
 51106-701960-106660-700038-702931-704156-703788-707451-707866-701708-707064
 -780016-705232-701618-709803-707800-703399-704930-700104-701236-701305-7035
 23-704421-708797-702098-700251-701475-700016-148004-148007-148020-148050-20
 043-42000-42003-63-190014
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-MT-CheckInternalSenderRule: True
X-Scanned-By: MIMEDefang 2.78 on 137.201.82.98
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_120554_301741_064A3E5D 
X-CRM114-Status: UNSURE (   9.53  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, 
I don't know why,  I cannot see my patches in the linux-mtd mail list.
please ignore this one, I will re-send.

>-----Original Message-----
>From: Bean Huo [mailto:beanhuo@micron.com]
>Sent: Friday, January 18, 2019 6:04 PM
>To: boris.brezillon@bootlin.com; Zoltan Szubbocsev (zszubbocsev)
><zszubbocsev@micron.com>; miquel.raynal@bootlin.com; linux-
>mtd@lists.infradead.org; richard@nod.at; tglx@linutronix.de
>Cc: Bean Huo (beanhuo) <beanhuo@micron.com>
>Subject: [PATCH 0/2 v2] mtd: core: NAND erase preparation
>
>On some legacy planar 2D Micron NAND devices when a block erase command
>is issued, occasionally even though a block erase operation successfully
>completes and returns a pass status, the flash block may not be completely
>erased. Subsequent operations to this block on very rare cases can result in
>subtle failures or corruption. These extremely rare cases should nevertheless
>be considered.
>
>These rare occurrences have been observed on partially written blocks.
>Partially written blocks are not uncommon with UBI/UBIFS.
>
>To avoid this rare occurrence, we make sure that at least
>15 pages have been programmed to a block before it is erased.
>In case we find that less than 15 pages have been programmed, additional
>pages are programmed in the block. The observation is that additional pages
>rarely need to be written and most of the time UBI/UBIFS erases blocks that
>contain more programmed pages.
>
>Change log:
>
>v1-v2:
>  Rebased V1 to latest Linux kernel.
>  Add erase preparation function pointer in nand_manufacturer_ops.
>
>
>Signed-off-by: Bean Huo <beanhuo@micron.com>
>Reviewed-by: ZOLTAN SZUBBOCSEV <zszubbocsev@micron.com>
>
>Bean Huo (2):
>  mtd: core: add erase preparation hook function pointer
>  mtd: core: NAND filling block
>
> drivers/mtd/nand/raw/internals.h   |   2 +
> drivers/mtd/nand/raw/nand_base.c   |   5 ++
> drivers/mtd/nand/raw/nand_micron.c | 119
>+++++++++++++++++++++++++++++++++++++
> 3 files changed, 126 insertions(+)
>
>--
>2.7.4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
