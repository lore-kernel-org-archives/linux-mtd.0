Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA53CC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 05:29:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88FBE2065F
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 05:29:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bp1RKnNI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="FTD6lx20"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88FBE2065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVxTEVkjGwzg+j2ZqAx67l72bTVz951NJdIoDFMX/ao=; b=Bp1RKnNI/HPrJj
	D5GN0Jgf4s4GpPvBuVFvFssDMGZ3iQWyj4vDW8xKVpyBYjalsaRLeTi145Xc91NpQ/qrb6qYmGfqg
	4EjSrRnXa/w0ktD+KpgvMj6es3XZwwQSujeuj8DMMmZLEnDD6VvKUaM/IYoRJqD+tmy/J9w2Dsa2K
	OPpaw7ZDflSvl4bLc3qE+meNVrP2F5z+0q1QdNHJHQH11Kz7u0u1NH++wDBs7uJd/JUMQHgrI2tw6
	bulZdHdF6CmK8xVLWa8+7Eo0mc8Wc3UIGKnmdglBNiwaNECggM+XZdZbe7bORWe7Zw1vvHsbPvamH
	SQA9tsPwfnO4PuLC67Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZSuL-0002NV-SV; Fri, 15 May 2020 05:29:17 +0000
Received: from mail-eopbgr130053.outbound.protection.outlook.com
 ([40.107.13.53] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZSuG-0002MD-EV
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 05:29:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4dyKgC+6JqYFLlXspUM4wGZsJVadLnP8fZoou0nbWF1npDxUTwJVL7lAQ3naLjcTzb1bq7+IQLlspAbqrcFUVH+9HiEhP4bQx0n2Ha8RItJ0FjDmoHbt/fGBM2U+EoTx5W22LiYK9ibdTcWcS7woIIQt0OU07hsqa5zcWuCantbEHkydI0SUDXddtViE/jkIIft3XYO5recZqPHDjA9QT6YThxCmrHAiPywFxsRGWbQMDV3kCU9pQjQy7wriLxqINfshcoRsA4J1iWAl/hr/NFn392CoFiGegYpA0qrPCpSWeHcSyk0avb8WEXi05YO6CXLNMr8tZpbj52TEt10ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tW/ykwJ834hcVV3D2xnVW2lQuVc37be+HEV7Rm9hNwU=;
 b=gzO0dq3f8KeQd9KA1qfxYJwmEN1WY5Kq2MNIsaRVFBimds9/fMEJOOzxxW9BWMSHSSNvUZU8dJvnRD+t6YN5hcWMeksN2HB0+W9VI6GALhAf2RrvlJ2EmLeDpUYz3SerZMez/W1K6bX1aiE8G4hL9h3vmC19zqFbegeWmMd1rAww6guvpy9XzpvQWPpjrVtBSaLrB04Q18jLZeFbXsRT0ACL/1Xd8uhcM1jEFz5d/Yd4hhYiPVRF7H98V3Ej0F7lYdTCQ+G3rmqmQaSdIj9cG6/Hvr73aZ7MVv7vCJdRJQxS5zvdCwbdNIvaWZYDnuj+zVnqcrIRgiHr+DOaB41ekQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tW/ykwJ834hcVV3D2xnVW2lQuVc37be+HEV7Rm9hNwU=;
 b=FTD6lx20b69mRRY922dKrsBVb1RwA5VfjTSOTPAT590AG5qAZQ7v5oSBf30bgCjcmG1ovvaE+UySPMOfuH15u9P5EwMiw9LvoPMr5f8fYYvJ900rtEr+VBWyMgpScgllj/vc+L2Avfn2BV+eYl2yjoY/ygvkadONAj/ImQ+b1As=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (2603:10a6:800:12f::16)
 by VI1PR04MB5215.eurprd04.prod.outlook.com (2603:10a6:803:59::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.35; Fri, 15 May
 2020 05:29:07 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::fd09:b822:f838:ea61]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::fd09:b822:f838:ea61%8]) with mapi id 15.20.3000.022; Fri, 15 May 2020
 05:29:07 +0000
From: Poonam Aggrwal <poonam.aggrwal@nxp.com>
To: Naresh Kamboju <naresh.kamboju@linaro.org>, "shiva.linuxworks@gmail.com"
 <shiva.linuxworks@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Shivamurthy Shastri <sshivamurthy@micron.com>, Ashish Kumar
 <ashish.kumar@nxp.com>
Subject: RE: [PATCH v7 0/6] Add new series Micron SPI NAND devices
Thread-Topic: [PATCH v7 0/6] Add new series Micron SPI NAND devices
Thread-Index: AQHV987J3lW3A1K/zUS/GagqkfFVKqipA06AgAAAeQA=
Date: Fri, 15 May 2020 05:29:07 +0000
Message-ID: <VI1PR04MB70232F2A753142DE7E0D3A6986BD0@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20200311175735.2007-1-sshivamurthy@micron.com>
 <CA+G9fYuavikY4yjc+bjnvDGHGwQRs6bf31gUa3gyFzd=0zLR7Q@mail.gmail.com>
In-Reply-To: <CA+G9fYuavikY4yjc+bjnvDGHGwQRs6bf31gUa3gyFzd=0zLR7Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [182.64.26.32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5afd596c-34c7-49c7-ee65-08d7f890e377
x-ms-traffictypediagnostic: VI1PR04MB5215:|VI1PR04MB5215:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB52153DCEE063DA765AD6C9A886BD0@VI1PR04MB5215.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 04041A2886
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9GqOECZvk9PzgTXKzYlG4py8RRSGxcFaD3X8EBnpRno5GNvhXcBaUbNg4Sop7SkpO4WqYtMAfH7lOyYJAJknFFVNFq04IN2ab2g35QnxsVrouesRjq3lCBBzrT+zNxJ7z/bjgcwztQ8p1HRDagquIbfsbT0E2uwqNRtQfzazKxjvD8QC5XaK/EiC+4fywX+N0TgO6VVLvZYGeIi9dXa+pp5GGaVfX/9yg0PaiULFYz6Z1948jxKLYSBUiGSab6IswZla2ycRggUMNdE2GyfrRrtLOX9JbUDTyDcKizQVerqAlIxznJYhuLyEQeFveu/WIdZkm8UcowhXK4yop5bEK858VxkUPmC7R9AYhqa//7zqOmzplZrgIpBQDnquMOOFqGkUU7gXDpVy27la8SSZZCuQeGh2IhzCaQDKZve0F/QiFdTFpBi3HEBJ/DR9fa9k2wl2YAhybvTxKYeRjgBwu1TAH8ixIJ5S69m6qQ/piUNK2UJpGAbiN7Mgo6bFN/ddF6l98sMAOASE/Y1hS5X5ww==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB7023.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(6506007)(52536014)(966005)(44832011)(86362001)(7416002)(83080400001)(4326008)(54906003)(33656002)(478600001)(7696005)(5660300002)(71200400001)(76116006)(6636002)(110136005)(186003)(53546011)(55016002)(8936002)(2906002)(66946007)(9686003)(66476007)(316002)(66446008)(64756008)(45080400002)(26005)(8676002)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: khx2VJOeGIyQA2Mj8W+lhsh2ICOJuWDTElF4pDcnl3QYhgciXI65SCVpxVlyl2Sm35Ls4E0C1V8pVjnmrQ1fRo6sT9n38sBwdGICnAthWW12JGavm8tyPBCcgpf4lLO5HHPHbwuyVYDRXMckrIcTAt9WNFTabqkJ6sDYVsm19HmUlysIueqoX/r5an38BKTSgUYxoTKb5KRJTQvcpMiB5hxgsdM0HmBFrSG7Bs1LZGYQbjPSdHUQekpb1Ow1lbMzvPOvjITaid1YpouAl18gPOKbTQh/0AxRn9jxweN8J1/sg69DdLMyiFzFpzMzzr41l499lXetyW57RnVoqDFO0OuKnoYPllWemeJvT8IBz2tQIC7S/Xet4pkg4os3qXdVnurVdcs6ACNgA6FM3Bg1coKOMXlgSeR+aMkMPhJd+3VDrXsheiTxUWs4kBCaThP4URJlbpK5iYvAee9ygl4qYWlaLqZm8/CQx6ElE34ttWg=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5afd596c-34c7-49c7-ee65-08d7f890e377
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2020 05:29:07.0296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XVOo/15LBwcT/DTxcDkWcVqewdkN3JWFekBPGY1WzDasIxCFse4Ic3kpe69SIpRKAeKeKBT+BsC8tRcUkDenmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_222912_593590_B24FCD6D 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
 Suram Suram <suram@nxp.com>, Chuanhong Guo <gch981213@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Adding Ashish.

Regards
Poonam

> -----Original Message-----
> From: Naresh Kamboju <naresh.kamboju@linaro.org>
> Sent: Friday, May 15, 2020 10:57 AM
> To: shiva.linuxworks@gmail.com; Miquel Raynal <miquel.raynal@bootlin.com>;
> Shivamurthy Shastri <sshivamurthy@micron.com>
> Cc: Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> <vigneshr@ti.com>; Boris Brezillon <boris.brezillon@collabora.com>;
> Chuanhong Guo <gch981213@gmail.com>; Frieder Schrempf
> <frieder.schrempf@kontron.de>; linux-mtd@lists.infradead.org; open list <linux-
> kernel@vger.kernel.org>; Poonam Aggrwal <poonam.aggrwal@nxp.com>;
> Suram Suram <suram@nxp.com>; lkft-triage@lists.linaro.org
> Subject: Re: [PATCH v7 0/6] Add new series Micron SPI NAND devices
> 
> On Wed, 11 Mar 2020 at 23:28, <shiva.linuxworks@gmail.com> wrote:
> >
> > From: Shivamurthy Shastri <sshivamurthy@micron.com>
> >
> > This patchset is for the new series of Micron SPI NAND devices, and
> > the following links are their datasheets.
> 
> While boot NXP ls2088 device with mainline kernel the following nand warning
> noticed. How critical this warning ?
> 
> [    1.357722] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x48
> [    1.364085] nand: Micron MT29F16G08ABACAWP
> [    1.368181] nand: 2048 MiB, SLC, erase size: 512 KiB, page size:
> 4096, OOB size: 224
> [    1.375932] nand: WARNING: 530000000.flash: the ECC used on your
> system is too weak compared to the one required by the NAND chip
> 
> [    1.388767] Bad block table found at page 524160, version 0x01
> [    1.396833] Bad block table found at page 524032, version 0x01
> [    1.403781] nand_read_bbt: bad block at 0x000002d00000
> [    1.408921] nand_read_bbt: bad block at 0x000002d80000
> [    1.414750] fsl,ifc-nand 530000000.nand: IFC NAND device at
> 0x530000000, bank 2
> 
> 
> Full test log,
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fqa-
> reports.linaro.org%2Flkft%2Flinux-mainline-oe%2Fbuild%2Fv5.7-rc5-55-
> g1ae7efb38854%2Ftestrun%2F18254%2Flog&amp;data=02%7C01%7Cpoonam.
> aggrwal%40nxp.com%7C146f634c869f4c70baa108d7f8909ffb%7C686ea1d3bc2
> b4c6fa92cd99c5c301635%7C0%7C0%7C637251172354638298&amp;sdata=%2B
> Jhs%2Fb92%2BA56WzYdHe%2BBhXWfjk8feCGAFv%2BRzFKC9PM%3D&amp;rese
> rved=0
> 
> - Naresh
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
