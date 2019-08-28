Return-Path: <SRS0=Lrxn=WY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B46C3A5A1
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 10:19:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8E85208CB
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Aug 2019 10:19:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VIr83quL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="XDPc875w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8E85208CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cr7wbQHnIu0ahH4cmLn/bJThMOZYIivdgthXWkWfx7E=; b=VIr83quLzKY6pq
	2wrR4+AZUCyjvlPFczL2Gf5XziwtvVtt3xv+2fawJ0ViU5aWqdxjqZQbSSIovEEV53kcg5r79qfiQ
	sbOSaAovSiyHzvm56IpJ49xxF3AHcum7UL+xt/doMxOyVSbb8LKr9JKbarANBnBnYQ2wM3cIK3Q+a
	Sz/FE6SQIcZYs+SV94eXPmqoJfuIWpvDFY3Vv/nsHeH3b8QtHSUJtskuaJuXN/fAX3ozxH0vaB+UO
	QQTItA86KVHyX8Wnd/QftKo9AJ1FSu76HZPWPpLCob5LGL1AQBYkXFwoOWwZAlTd9DQhmGmwZ39bS
	rCMzvbgX/lsVdqt1W83A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2v30-00082O-Ak; Wed, 28 Aug 2019 10:19:26 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2v2w-000820-SR
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2019 10:19:24 +0000
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
IronPort-SDR: vlio57bwePCraNwc6A/CoDO9e1ug0UroM4FjR8mwOESHA22u8mcoxTB2q3tBEiniqEp6oZo+n/
 0tZiZ7EFw4BLFQLkR5dd+quprsfc1VZnkYqknxL/MTJf4WFxNOZejSOhXlwx5gdcHGm9Cd1/ff
 nsi3mR0NvOz5xcE01kqyf2GC5kQ2Hp+a6faASfrVrC9cBZOUnbWU7sK/3Z4M8UW9ULJvgRfvNv
 qOGz+1SjOCuee1jgJ0Z3cZcC9/bWIi9nlIphTM0R8/LDapkVqkqfy8Vl7uTjkUEphgCiOFMhfQ
 onI=
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="48305850"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 28 Aug 2019 03:19:21 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 28 Aug 2019 03:19:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 28 Aug 2019 03:19:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j74woCEEUaZT5SWAXrD7loGf8TC3nrOKWhVEQIlEvNd70J5a3qmKZ49XH1rsWQaP8sWKxf+kxHpq92K9crK/EnZyYq0SO36V2k1DX1uBrraeNn39simfbzyiDdDer3q7YE7A4BNxStDVCogob6CNgfyghjX3QSw/Va8+cOJy1omzm0lVYbgOxY3t0NJC818uce7Fj6CQhKkIxlD/azjE6zs8OhzILwdP/Z4njTM5+ur7riw+wmKo0xc/pZmwoDyxT907gZfTVbO6Nf4GBkeiW0ID8JVXjqYzmqqxhK4GOLsUhr18QPAZmgUJxH/U7WV3OLuyCdGPcwuNP6sTVkwppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S04HuFQXQ67d5c+VIHf85dlaTl8L1EFHf+UmS4/Mb7M=;
 b=W9UQgnl22k/GJfBv1AepFsrjrRTVMDnb105a0ALM5qiDDCmaOvKm+LCjXzA7Ov1vxZH6HhDEooc9n9RMK54TaWPlmYORv3H04X4l7i/jnWFPfC9xTwHWRLaDylSPsS3N325QPaxVtRDJiVs2CunNqZUdMcbRS8tHWbAZY9cCsxEwWRoTHiO0zSicfaJvtbzw9/NkWvSCenBZjgxEbOd5bzpMHxmpiKezSMofk/mEsp2phx3M6W0Eqgv9stnkkFB/9n8dyOjoL0uzNclmwERwldFcCJ6vYvJnJacTIiIEwoUM9b4tU7Pi5EMpyWk9qNlwqIoIyfrFDMpjXvx2PxS7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S04HuFQXQ67d5c+VIHf85dlaTl8L1EFHf+UmS4/Mb7M=;
 b=XDPc875wklRctPn7iCJqUIz08Q34VLkrca1EYTOL6QeqgNAhNQ/YI4mD8nsq6w7AXEZ5gYjbqWeg+AXW6jEFUaJKm4VOA0Y8u3yQue8VwWU/I5vXgbfxSyejmWSs6mgI48napoiJlMIf3tz40AItqTbxzA4eL5ELBld3AU/CRzA=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3727.namprd11.prod.outlook.com (20.178.252.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 10:19:14 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::70c3:e929:4da2:60a5%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 10:19:14 +0000
From: <Tudor.Ambarus@microchip.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <marek.vasut@gmail.com>,
 <vigneshr@ti.com>, <trivial@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH trivial] mtd: spi-nor: Remove unused macro
Thread-Topic: [PATCH trivial] mtd: spi-nor: Remove unused macro
Thread-Index: AQHVWckCovcz0915vkiPSX7w3f/ICKcQYHsA
Date: Wed, 28 Aug 2019 10:19:14 +0000
Message-ID: <08a97755-7c0e-e6ea-9c97-383ebaf7f93c@microchip.com>
References: <20190823153946.12860-1-tudor.ambarus@microchip.com>
In-Reply-To: <20190823153946.12860-1-tudor.ambarus@microchip.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0102CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::26) To MN2PR11MB4448.namprd11.prod.outlook.com
 (2603:10b6:208:193::29)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 382186a9-b792-4639-f112-08d72ba12d2a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR11MB3727; 
x-ms-traffictypediagnostic: MN2PR11MB3727:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR11MB37276020B31D1588F3BFA561F0A30@MN2PR11MB3727.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:983;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(446003)(4744005)(6246003)(11346002)(76176011)(2616005)(6436002)(2201001)(6306002)(25786009)(5660300002)(36756003)(99286004)(6506007)(6486002)(316002)(6512007)(14444005)(256004)(2501003)(486006)(53936002)(2906002)(476003)(52116002)(66066001)(71190400001)(229853002)(102836004)(186003)(478600001)(81156014)(81166006)(110136005)(8676002)(966005)(86362001)(26005)(66446008)(64756008)(66556008)(66476007)(305945005)(6116002)(14454004)(3846002)(31696002)(7736002)(8936002)(66946007)(71200400001)(31686004)(53546011)(386003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3727;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OQvb4ouA12RhGaZw6dORvHpNcpHWVmRQqvHWURJvZ81ZbWEUX2yJBW8yjYfXnwZSbS0aNFmKSzqhkixN6dkf28uLIZcuiuizxX2jEBVNbasUNha+Rzw6T40H/hEPc/7tNzrzaaDRWELdrjLQICyVYhjVU3OX4kShpVabljKBnzcw9ls/VRQFZFFqZTiTMcHYcFCFoD9AwZj9xrWBY9gv9De82trT6KdIdbquner8hqzMqrhQCWh6pRLMKTACGYcv+DGBN06pIngt2VRlAjA1JmOfwhjrNqMVWh7QjgAW3B7m+GMpa54guYQx4zWiu2j9e1RuYdJ7fyMWY8w3P0/0YuryIzEgahZEkuWuJCTHNbsDKLOqeTfUfjBJmMrYxVmE47L5On2xHAUQQD0m1RaDrcSNe4eDZddhVngJno85Jxc=
x-ms-exchange-transport-forked: True
Content-ID: <94080E5CA9E3BB48920727EA4317D839@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 382186a9-b792-4639-f112-08d72ba12d2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 10:19:14.6840 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Noq7upA6TBMzIshzHjax7dS7jnOv7aLvrsbMfeAeFd153oqstq23ZoJecz5BZlEEROOt0Gwlm+C8BVUs7g30RxWsgk9IpR5tiNTgk16OtrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3727
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_031923_028817_8DE37C71 
X-CRM114-Status: UNSURE (   7.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 08/23/2019 06:39 PM, Tudor Ambarus - M18064 wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Remove leftover from nor->cmd_buf.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  include/linux/mtd/spi-nor.h | 1 -
>  1 file changed, 1 deletion(-)
> 

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git,
spi-nor/next branch.

Thanks,
ta
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
