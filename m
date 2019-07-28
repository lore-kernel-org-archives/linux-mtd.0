Return-Path: <SRS0=FYfc=VZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5C1FC7618F
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 05:49:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 942BE2085A
	for <linux-mtd@archiver.kernel.org>; Sun, 28 Jul 2019 05:49:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sOUGPGKA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="YK3pi9Vm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 942BE2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d1ayz0ZCdIMRuGleeGrIMXa7Ev78xoUU57Vfz+ELL18=; b=sOUGPGKAgHwMkm
	xqQG6hY66HmofbOhD8jH2wKCTRa9Tx9yL3UjalnqP8y7kvAY9QTOli4F0zzgo8KdlsjKJRMQL7gdM
	7OnvcxnHDtwjkeLOaMOvP0g4ODFcjbq01hrJzVWHkxUn5M3fXvkKh/h1F9jH/oYm2nc89JbB1lxOE
	zdM463fL/H+nOqYh/1pErXbJ2YK91RjjoVg8+JLq3ce6z9r0zc737hFHbCDXKkWoiwRQmmkZFCvaD
	sht97rrytGPclrKDDj4HshvXm1teN4l5mdMZunSF0o98LDk73laIe0PlpYc6VKVJhuqwXX8rWCmh3
	7OgkgIoTZkHkmTs1mqwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrc3T-0003Nq-BW; Sun, 28 Jul 2019 05:49:11 +0000
Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrc3O-0003NR-2r
 for linux-mtd@lists.infradead.org; Sun, 28 Jul 2019 05:49:09 +0000
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: 84YghtiC0Ck/q3tnTnEN3ov2lI+WKDVHNQDtyPPRQGOvLLMKx02Q6v2ofqPvmDdgT1AEiaJ2b7
 9ixDb9po1C09075EleSCoSVO1a9S/gQbJTkNyv/j8steOd43yFl0iveSSreGcn4/h2QHiHxRKk
 AfdY4PuRoVnxwX5i4RhkQShgYzmLfcONH/nCnOPm25JaHdHrOEzLXpwgZhiSeyHF/oalwRNOzD
 lsRrpvanjJoHXQtHGG7Y4WcZwZYAawedidjDVGMOTQSwW2wJc6cbFTXpwCeL45wEr42xR8qC6z
 q54=
X-IronPort-AV: E=Sophos;i="5.64,317,1559545200"; d="scan'208";a="43037614"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 27 Jul 2019 22:49:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 27 Jul 2019 22:48:29 -0700
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 27 Jul 2019 22:48:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NI2ocJEjsMiaoVpl5wnrSkLjF9i+Y7mj5Em0za11x4bQq/Y9pQ5xeKgEvoBRTeUjawlxqTin3MVwDhUKUJgIEi9FmjUAdbQOnSHypXrocGukKHi3C58lKBv6BzXFmu/XtHggyOQ5iiFY4KoyHkuWJtBEyJZDcZ5erXzl6ot7C2aNSAgc6BtvUY+0U3BuE9toXmqO7GlU235QZHSYdzPFqlWmElbXLmvHNHj9sBMv9h/+MoKCGMBY7GdU8cxcd2SdiuXYG9VqpZZOpLDpIGmU6gYwSX46Q45kFk4EmHtvIHV7wGXqiGF20zVzGVYTsxW7NTyEXsCm0hYgsr08+53QQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO7G6cSxXdor1YSy/RiEBG4/KVDIHQ2MN1tnbJmPous=;
 b=YjIL+RHMz9x49D4SH4U5kRVvb0O3JAV1tFFlSnQSztsPVJXPq4fQTfMU0SxzAF46myhjBG+aL2KX457FNDsUHPCCGiYTgU8Z+BLliPXx2rOeGN1lNuzv6glv+GvoiYCz+2kedbfVbhN4At8+cxUqP6EcjiroHijNc5Eq0Op0SdJCNBPJcdNWwf8NoTtWESa0pzO6xcxWCzmCr2PQrXvS+vIAPguXgmn/DQxmC8PWWjTh5fWQVHlGniXxXa9l3DdI+Zi2EZT9auozHeox1RIyYLkN0QUnd2W2QMer92xciSukyJq2sfI1+boJci62I6WsLO49lPhdpPc1Ju1fepzuNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microchip.com;dmarc=pass action=none
 header.from=microchip.com;dkim=pass header.d=microchip.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TO7G6cSxXdor1YSy/RiEBG4/KVDIHQ2MN1tnbJmPous=;
 b=YK3pi9Vm8ojWmz56IeE+Jg7LsgXlc8mEGV5lGovIDHKhNocIlcEL5RW8HIjvC/N80goZXP9HnH5X3VnO1crMNXJmgrQL28sypx/nMRewQ1FnlS16A61cax7rx+N1tY4/pQmPZdP51v38sgffj1DIwitqfdU5lfpZduvF9Z7eHNI=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3870.namprd11.prod.outlook.com (10.255.180.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Sun, 28 Jul 2019 05:48:30 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::61d1:6408:89a2:8de5%2]) with mapi id 15.20.2115.005; Sun, 28 Jul 2019
 05:48:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <roman@advem.lv>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: spi-nor: fix GigaDevice quad_enable
Thread-Topic: [PATCH 1/2] mtd: spi-nor: fix GigaDevice quad_enable
Thread-Index: AQHVQ/Zj/YTQYrM+LkKRVxGsjoLerabfiDQA
Date: Sun, 28 Jul 2019 05:48:30 +0000
Message-ID: <11718527-0145-a99d-83fe-19885c9609f0@microchip.com>
References: <20190726210830.1932-1-roman@advem.lv>
In-Reply-To: <20190726210830.1932-1-roman@advem.lv>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0801CA0077.eurprd08.prod.outlook.com
 (2603:10a6:800:7d::21) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.127.106.210]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: acc13c03-bb9a-4ae0-eec9-08d7131f37cd
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3870; 
x-ms-traffictypediagnostic: MN2PR11MB3870:
x-microsoft-antispam-prvs: <MN2PR11MB3870B9D1F2F2ACF88DE9C954F0C20@MN2PR11MB3870.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01128BA907
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(39850400004)(366004)(396003)(136003)(189003)(199004)(66556008)(6116002)(66476007)(66066001)(36756003)(64756008)(26005)(386003)(486006)(99286004)(53546011)(66446008)(5660300002)(3846002)(66946007)(76176011)(6246003)(14454004)(102836004)(71200400001)(71190400001)(6506007)(186003)(53936002)(52116002)(305945005)(6512007)(110136005)(4326008)(31696002)(229853002)(25786009)(256004)(11346002)(81166006)(31686004)(81156014)(68736007)(2906002)(6436002)(2616005)(8936002)(6486002)(478600001)(446003)(316002)(7736002)(476003)(86362001)(14444005)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3870;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nEXvNeVVcIeWy1DKYhsyiU/vyhDoMbIhQXpL7GdKbbK4VK2Ehadv3P7NMiYHnZIjHO/jqyOO+7BGqwe5KjZn7RbSUPBAZD40Qv8xyt3cs+MUSZlObuQEMPxMc7IH0AepWBiNqIEK3t5FoLGYc2Sd3iuYgT40I0YmA2HMX0ZhibmoaeEvFYyKTPVrzguaQDs9knL2x5LrtSRwphhb3YyEfbSAGuqolDbevRw2MUP3X0GefB/FFF/S4rR/Qj2p6xrbFf7ojQmOAdaoXoBDtVVboSqB7s6TTMWe/wdIgV57lKhKCIPGOsNJOy7HOwM2wMzqcKM6au9ElznRwK5bK/PFyXkejWr4S2hwbO1TY3wID7EezMBitaNl/kjEkJX9dj27sddQa4Ti4Jzk1/NEgpzp4OAS2kfl5YXmV7vvMMc3rgQ=
Content-ID: <A71A2B027C6F6F429B5D53C6C1B3EA85@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: acc13c03-bb9a-4ae0-eec9-08d7131f37cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2019 05:48:30.0203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3870
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_224906_353699_401D5BB2 
X-CRM114-Status: UNSURE (   9.94  )
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
Cc: marek.vasut@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Roman,

On 07/27/2019 12:08 AM, Roman Yeryomin wrote:
> External E-Mail
> 
> 
> According to datasheets all GD devices are capable of quad mode, which

Does any of these flashes implement the Basic Flash Parameter Table? Can't we
determine the QE Requirements by parsing BFPT?

> is enabled via Status Register-2, bit 1 (S9). This corresponds to
> Spansion SR/CR operations. Unfortunately only gd25q256 datasheet is
> clear about Quad Enable Requirements (QER), others have no such
> information in datasheets.
> So define quad_enable for all GD devices to be sure.

Which flash did you test?

Cheers,
ta

> Also gd25q256 is an exception. There are two versions: C and D.
> First one uses S6 bit (like described in e27072851bf7d) but the latter
> uses S9 bit like others. To add support for D this should be handled
> differently, so, to retain compatibility, leave gd25q256 quad_enable
> callback intact.
> 
> Signed-off-by: Roman Yeryomin <roman@advem.lv>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
