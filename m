Return-Path: <SRS0=8wrd=WZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89616C3A59F
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 10:46:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AEF52189D
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 10:46:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cqjddiIu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="U1cEku+j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AEF52189D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulXzDvAhGn8pGP/TivyJTHbW0PE/SNZbo3p1C8eMLlM=; b=cqjddiIuGoiVvj
	kuEH+0TuVum13QrIW/Kh+L+xzstRS5BipA1OtYSwqu/VYt87pi/qnOWFgpkIwenYPIEJ+bHgochfL
	fAfX82fcRHLnzECutzjmgXa0tarwTH0njRii4V1NzYuOwMQ8S6HMBX30NhPqFADlWtemis7vmDM8i
	oflVaKTer2Pyk8JT3iJCVuxb+X3Mgf4dago7/SZHxwC8JUiLzri/FqxKw24euU8736m32MIY8q5M1
	JdixizSUBYAUttJv4Pz72+r1Tv9X7INdBmE3WVxBetMuCHjtHhA4w0OarseZFkcmMfs7z8KLsXMme
	ee3BKwrSSmyqUg3glh/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3Hwf-0006Z8-Qj; Thu, 29 Aug 2019 10:46:25 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3Hwa-0006Yb-VQ
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2019 10:46:23 +0000
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
IronPort-SDR: 5h7ayx3zVeM+bO5TeUlLSxeTwFUGVIT2fMJQdYkHeeyRj4iqe3bErK84iBVW7ynG2vjV7Omt4O
 TaTw6XAjAhJx5mlroR8HylifNCUHHA3oOkN0pOfOlQXhvrGfJ9JiCtwKeMHNoLvldaQOtamW8w
 jZfuTvztRPk7cu3utlb2XnDGDeAm9C+pQNFMKpLKK0RY+ucNoClSCqYr1/YZYzTfBVz7Dq0OKQ
 c2Uo6IK6wM8awXtJIkalgBP2maS28L1BXAtL8riSkpjr5Lg+4FOH/ncnHmrCghdbOV6goURHMJ
 p/Q=
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="45451523"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Aug 2019 03:45:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 29 Aug 2019 03:45:55 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 29 Aug 2019 03:45:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ELVmo7LJ8gqpdXSnXin12S1ebpZPqRgfLu3MhRU4SVuvTVa44W2nLGwhfLISQg454Cjp5uV1ya2ImvGrZPMFVmMN6a6jK1yW5nAOWKeBDMcohBa1HD/+BlHjZ0ijkm8XFZFvmOFR74b6pZeKd4OBEyovdF4GNVWCvhxlAQTHhqAQu8Upp8YedsdB66Q4czagJWg7LelGEaqllyThDmKWww8N3JkdPtXtn6WSUw+stNUuTxoZUg/wVdfMBqVTAfNJm/2W9SjbjhNFC919imUSSZVrRNp8tCtH/OgZzm3GvZcFbGVu9Z6mmkeaKSJKbU3YrPaf5kz6h6af7SNhFFB6Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg3ZUj/k654fnNg79MxYRhhudD+v2tWxi8Uh15Vha6c=;
 b=Hj4Je3x9Y6jXZ5vgxZ1FXKa858TA0Xf6bL1DYZc1FH/HAt5TsH5rB/iIvfEa33QioHzHgfLSitgpI9Fjwcx5H+z7YYLxIq9xRJ0x7jTuI6W5dKFuw7xd8sA2FMMLSq6vqSmRRslyZjXuM/Dnpsfs3WiGXc1tWpsbaZ1pK/WKYXwn5b2aJj6hVhn17ngEAkoHvKTvLLw5fXVc1TxO6eD8pYdjwacQ7jBLEGX3bOsAx6wTXff1lR7BsXmAnB7WeY/e+2cvkRj61PdNR25IMu2/w+TU1J1A8/A5qy+Twk/kPZKHYzhEaZ0v4/79toviryYNI6lORG2xO6DjkGdUO1qXvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vg3ZUj/k654fnNg79MxYRhhudD+v2tWxi8Uh15Vha6c=;
 b=U1cEku+j1xuz5X9TXXrA9usMBmkMMo8Fwxhksi+5zlaVdBGPUe608ANbgDJQNCOjXsHO+Ekk8RoP7EhDGFHxlpkeYQxqibKm+0EOn7I+VsWnHQugReZdGMZYAx5QMRfIRIMjB0bLO4Hh2luNykSDdn+XYjQzDY0zBjxoOM8kz/s=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4223.namprd11.prod.outlook.com (52.135.37.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Thu, 29 Aug 2019 10:45:56 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Thu, 29 Aug 2019
 10:45:56 +0000
From: <Tudor.Ambarus@microchip.com>
To: <zhuohao@chromium.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v8 1/2] mtd: mtdcore: add debugfs nodes for querying the
 flash name and id
Thread-Topic: [PATCH v8 1/2] mtd: mtdcore: add debugfs nodes for querying the
 flash name and id
Thread-Index: AQHVL13wObdpOhskukSjDBbUPOYAwKcSTxiA
Date: Thu, 29 Aug 2019 10:45:56 +0000
Message-ID: <88ee3af8-243e-6411-94f2-ea04402a739f@microchip.com>
References: <20190630160711.178679-1-zhuohao@chromium.org>
In-Reply-To: <20190630160711.178679-1-zhuohao@chromium.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR03CA0057.eurprd03.prod.outlook.com
 (2603:10a6:803:50::28) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7edb60d-c0ec-44ea-6c4d-08d72c6e1258
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB4223; 
x-ms-traffictypediagnostic: MN2PR11MB4223:
x-ms-exchange-purlcount: 8
x-microsoft-antispam-prvs: <MN2PR11MB42231B9AE7C706E5FC9C90C6F0A20@MN2PR11MB4223.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(39860400002)(376002)(366004)(396003)(199004)(189003)(6306002)(52116002)(81156014)(14454004)(6512007)(81166006)(8676002)(305945005)(478600001)(7736002)(36756003)(86362001)(31696002)(316002)(2906002)(3846002)(6116002)(110136005)(6486002)(966005)(6436002)(66066001)(54906003)(99286004)(4326008)(26005)(11346002)(386003)(476003)(6506007)(2501003)(2616005)(25786009)(446003)(76176011)(6246003)(14444005)(256004)(71190400001)(102836004)(71200400001)(486006)(53546011)(7416002)(31686004)(66446008)(66946007)(229853002)(5660300002)(66476007)(66556008)(8936002)(53936002)(186003)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4223;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5b0ZGW0gIjW6pEBHdsoGeqtFfiwvnJzIgmQY8RrseWwePIvJs5fS6CTN9cIupeRbaMFH1rGQ3OX1dwDHB4jbiWiY9/76TPhnRorTgFZENJjRC8exvkAC7+sU9ECXbMioqBdDNDcphyFjDZFJ/F336922LptpgZ8st+Cly8Bk9rtCCM31da33PQDfzT38w4O62OBP5zB/i5G3eGHj+Xfy42xyt5cUli65aUSZXkv6OQDnVAg9yUB9I8bdZ7KyI/B81bZdgHa1E0sqA3uyj5NhwV5NI8e5lPPVRPNe5V9XlzqZbPLYhNutz3Jr2Q8BQgYdrrZnHWFrohx73abvn0LjoU6G991kIOF9ORVbJxQj6ncz/6njb3liLt3B1uw7CmXHmMKo5els03Ux1Xv7cDWCz4T/XmfrpbMzcuac9zdgxz0=
x-ms-exchange-transport-forked: True
Content-ID: <116F74AE0EF0A34287B406D8F7CE2A96@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c7edb60d-c0ec-44ea-6c4d-08d72c6e1258
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 10:45:56.4552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x/PAWXYt2NC39ZLIs+5aCozQu5gzVsdcDSHlXFvjpf66uttAcr3QjQEApxuyhctaQ9Q1ybHaHKvEt7j/MpP0sABKAKGf/h7+lYkNy6CHOlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4223
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_034621_175525_DA6F2C5A 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: drinkcat@chromium.org, bbrezillon@kernel.org, richard@nod.at,
 briannorris@chromium.org, marek.vasut@gmail.com, boris.brezillon@collabora.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 06/30/2019 07:07 PM, Zhuohao Lee wrote:
> External E-Mail
> 
> 
> Currently, we don't have vfs nodes for querying the underlying flash name
> and flash id. This information is important especially when we want to
> know the flash detail of the defective system. In order to support the
> query, we add mtd_debugfs_populate() to create two debugfs nodes
> (ie. partname and partid). The upper driver can assign the pointer to
> partname and partid before calling mtd_device_register().
> 
> Signed-off-by: Zhuohao Lee <zhuohao@chromium.org>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
> Changes in V8:
> - Change pr_debug/pr_err to dev_dbg/dev_err respectively
> - Previous discussion: https://patchwork.ozlabs.org/patch/1109227/
> Changes in V7:
> - Remove unused check for partname/partid
> - Previous discussion: https://patchwork.ozlabs.org/patch/1109200/
> Changes in V6:
> - Create the debugfs only when the partname/partid is not NULL
> - Previous discussion: https://patchwork.ozlabs.org/patch/1109041/
> Changes in V5:
> - Move debugfs_create_dir() to mtd_debugfs_populate()
> - Previous discussion: https://patchwork.ozlabs.org/patch/1107810/
> Changes in V4:
> - Separate the change to two patches. The first patch is adding the general
>   handling for the partname and partid in the mtdcore.c. The second patch
>   is enabling the two debugfs nodes for spi-nor.
> - Previous discussion: https://patchwork.ozlabs.org/patch/1097377/
> Changes in v3:
> - Add partname and partid to mtd.h and create debugfs inside mtdcore.c
> - Previous discussion: https://patchwork.ozlabs.org/patch/1095731/
> Changes in v2:
> - Change to use debugfs to output flash name and id
> - Previous discussion: https://patchwork.ozlabs.org/patch/1067763/
> ---
>  drivers/mtd/mtdcore.c   | 85 ++++++++++++++++++++++++++++++++++++-----
>  include/linux/mtd/mtd.h |  3 ++
>  2 files changed, 79 insertions(+), 9 deletions(-)
> 

Fixed checkpatch warnings and checks and
Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
