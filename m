Return-Path: <SRS0=ASOq=UF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BA3C04AB5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 05:45:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66E3820673
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 05:45:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jkHZ8/1A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="GESAO4fu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66E3820673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cAVzfJKYl3wbTWGlcwi8042AkEExjxyXxtk74yvavOg=; b=jkHZ8/1AaAxb2j
	R01OYP5Tc6uhP2KxmDqJvHIVJWdfuBjMFMwIXfLwOX5qwp7dmhWXUFafWWBff+1qCe42bm84Y7Yy7
	FHD4A3ePiDtQUck0yeZ2wKZlU40b7uyYZmhCwFMb0wZG3mm78Hx/M5aG6DjBAcpg7XXhgcP1HgF/w
	FjeZHVdgd1b/0Ny4Kw+MxSkUwSShsxyG+Ii00VrQ3kTDVvvZVzlrF6RadY66tOvSTNe/TXC/KdxSK
	okrsCxUSoJ1+NfC54jzXNWLLwdDk9AF41oRPaXFuM8HaIAzt2p5Tu7N4WX+lX1G36JKHLFFfM5LYd
	ERvPpcnZcNsSEfTfRXIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYlDg-0003DI-0Y; Thu, 06 Jun 2019 05:45:48 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYlDc-0003C2-8T
 for linux-mtd@lists.infradead.org; Thu, 06 Jun 2019 05:45:46 +0000
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
X-IronPort-AV: E=Sophos;i="5.63,558,1557212400"; d="scan'208";a="37767415"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jun 2019 22:45:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.87.71) by
 chn-vm-ex04.mchp-main.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 5 Jun 2019 22:45:40 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 5 Jun 2019 22:45:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xf9y5dkSUEfmc3E2/91tJzjHbRTdSfh8ThS//SknM54=;
 b=GESAO4fuCcEhdIcuXp9BpfV/D6SlPUWLflUVzQLt7pUxa016KVZVzIFyBTR1s/KpxeU37h5Yhw8Uw8XtS1R5EevrNCsNNJWOll4QFcvvVbyohfGDmOhcpnPUQhjVYAM/ONVejgQmubgLDGQZ5NEYBgVQhyig5o8ARXTHenjvirw=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1332.namprd11.prod.outlook.com (10.173.32.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Thu, 6 Jun 2019 05:45:36 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1943.018; Thu, 6 Jun 2019
 05:45:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <han.xu@nxp.com>, <cyrille.pitchen@wedev4u.fr>, <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add prep/unprep for spi_nor_resume
Thread-Topic: [PATCH] mtd: spi-nor: Add prep/unprep for spi_nor_resume
Thread-Index: AQHU+uHfbtBiSaKzx0CN/OQDDONR1qaOYFKA
Date: Thu, 6 Jun 2019 05:45:35 +0000
Message-ID: <ae82d8ea-dd85-0bc3-ff2d-0ba57f635030@microchip.com>
References: <20190424210818.25205-1-han.xu@nxp.com>
In-Reply-To: <20190424210818.25205-1-han.xu@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR06CA0124.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::17) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c719bf65-65a0-4196-9cdb-08d6ea423263
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB1332; 
x-ms-traffictypediagnostic: BN6PR11MB1332:
x-microsoft-antispam-prvs: <BN6PR11MB133251318CDB0C8FE2D22E4FF0170@BN6PR11MB1332.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39860400002)(396003)(376002)(346002)(189003)(199004)(25786009)(2906002)(66556008)(229853002)(66446008)(81156014)(7736002)(64756008)(66946007)(2501003)(66476007)(4744005)(68736007)(52116002)(186003)(54906003)(110136005)(6486002)(76176011)(99286004)(4326008)(102836004)(26005)(8676002)(53546011)(6506007)(386003)(6246003)(256004)(14444005)(53936002)(486006)(36756003)(446003)(73956011)(6116002)(72206003)(5660300002)(31686004)(14454004)(71190400001)(71200400001)(6512007)(8936002)(7416002)(305945005)(11346002)(86362001)(31696002)(66066001)(2616005)(3846002)(476003)(316002)(2201001)(81166006)(6436002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1332;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1qRKcybTsS2dPq8zBmb+Z1gwwRz3JCtm6mbIHoSr+czIcOO/ULf4qpTYZai/m6R5mtEAuGhqkVEzEZlovlNoGW/F+xkYiYMEN/Bj1MFrvppa8arHn3WGkP+W+ZJwUdentBc1E+V/ILLqCRiDOtbX1Uzfl2szyNL5yLIGJFhWwIucOrp0AVdV+uFIa/NBSLRfM/Aw33p/Uh8wlwu4OXFi0GMMttjEXeTYwbL0ZHgRBLOk8PpRw/mUqmvl6sM4+sy5kB6SLoNNdCay8vdYc+btuDE8nQxMjH9/Wnq45boI/CmxbFFskdhLAv3zLARqf2YoZ4m3hyPxwATVVTM6BPv5ykfvIBDoh0RCoeUTgR5QBZOXANyd06fC3D9NP3bT38lTC029r1a+3sD37AtjdeKjYqIrK3qUITRGt6FTDVgN6fc=
Content-ID: <E18BC54166FC4D47BE7036335E4D7EA6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c719bf65-65a0-4196-9cdb-08d6ea423263
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 05:45:35.8598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1332
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190605_224544_454564_2375A81C 
X-CRM114-Status: UNSURE (   7.65  )
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
Cc: boris.brezillon@free-electrons.com, f.fainelli@gmail.com,
 kdasu.kdev@gmail.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-imx@nxp.com, computersforpeace@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Han,

On 04/25/2019 12:08 AM, Han Xu wrote:
> External E-Mail
> 
> 
> In the new implemented spi_nor_resume function, the spi_nor_init()
> should be braced by prep/unprep functions._
> 

Would you please explain why this is needed? Have you tried a suspend/resume
cycle while a write was in progress and it failed?

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
