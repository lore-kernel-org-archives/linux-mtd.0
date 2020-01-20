Return-Path: <SRS0=bf65=3J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947DCC2D0DB
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 11:03:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6349F207FF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jan 2020 11:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B8Zvn5Fc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="Xa5hMaiW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6349F207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4IHxIw+y/3gRbLP2jJBstias7FnQcRX4FTNvD3lpl/0=; b=B8Zvn5Fcsa46jV
	1V/5RtrRT8vWqaMrRMh9GL15pBuuQ0lmUNuJa8COOYMwrgoyicH5sWyZJ42q7Il1FbumUGkeBZiWJ
	bQIB00i5rP5qZRazMfqQe/seulPIggGsHtnjTDY/xHsgbNyMGPLsSFjfRIGGBVJ09aTi2EbFsG3/m
	yptRprqdF+RyclzI+hr9Wy6eVpDkD4Lw/bgBABxVDu+ckCqgwWXIRX2+ZtPrDSDf0zQADYolHUGNy
	iK9gdgrTisn8883hd3l/AUhCupBZpEbaIF06iOupV7uFSkJqbma0rtI9Vrva9Hy4liTmg7s8XjCSP
	ZMlSEqBV83bFIBIQrXQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1itUqA-0001sG-FM; Mon, 20 Jan 2020 11:03:30 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itUq4-0001rZ-Hp
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2020 11:03:28 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
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
IronPort-SDR: 3GnK8gb0jtusXXR6Ft438mGKTvdi1y0hXNw2RaPHhj7wvwEb93Fikbo4MhStRxL5jDi9OCFx8O
 imZxodxk/VdcpQc8NABl9PlV+H5eDMEayoQG8zgPDg2ArnuI4ZS9Ndv4Khl8RVArMFz1+jT989
 jQypjBRODfCaMXFQ1UDm78EE/twPIAilGCnNl83kOz+avyh8pSkk58Mcd0azMbpzzOKGWgXm7Z
 BxKYVujvHiPRarjJQtRcowJKf7ozxWCQin7OFhfBcyQeUaUAlb3zKupktJ1ZShqswkoNnv1DQJ
 IFk=
X-IronPort-AV: E=Sophos;i="5.70,341,1574146800"; d="scan'208";a="65302330"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 20 Jan 2020 04:03:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 20 Jan 2020 04:03:22 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Mon, 20 Jan 2020 04:03:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McdZHoLUs+wCtxePewMew7xlg/gVgpKXocuyDVEwkAU3oIevB6Wa/IxPGLInwlVGo9nmpGr8T9ry72jtCQ37Yppn+aaQySLjuIJhb92KVzG7qkibYHYs1iUESzcq7xbQF3t7UuMWSVE1WH9DdfCWHFmq7ahPURvUz/zOjv0ZQ1ersxmFtTQbZU5TG6XeXte5OczawL38cjPAwaIVl2L5AdHZ5NEvOwQxQTpkQmmlCEo4EegZqJzdehVUW2oxlQIJ/mW7RGW5MxXQGIdosVXdk2DlMtd3GTZd8yNYO06fE1X7K/d+UMbYYS3SH2+q7E9T9qgiUFVhwGqgI0Nogdj7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KipscbLFjVF2iNp3N45uLDUoIWLVPBXszXW/Vd3o84=;
 b=Z4lTN0hSkpy1DWb+z9jqm4DtRSduuz7vNPrvHpMymWzUEjWM0vfRsy3hGhOWgECZV3hfhGPIUv3b4aN1xaKBRzpTnIZ0kGxK0DynpcbH0zpsXhWH/xB5XqHzvqnfEoq4HrZCf8irsdgBpW0IZIkla8xZXjj9qZi7lej6edKifCDU4nTCMMfnhgloFLrn7++m6/1TyITYayxz+1vLzQb13sPOF3Y8Q1qLrr2DYXXiB+gecb8VRP7JH/3TiMCJzUs3lwplIHFqG4fsTL9B4/FvQY6wTK81U5YM/gaK/pwt8Xuqav1HvioP+zk7HfLCthPI24+z6wBNnvKOkYtkg8rgUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KipscbLFjVF2iNp3N45uLDUoIWLVPBXszXW/Vd3o84=;
 b=Xa5hMaiWMS3+WGZpHTXYWsYtlhqQMR/HCLNz431snQaTOABBCuweMzu4LOYMubj2LPefm7aBoIliCJhtrmZKAP47Xsc7GQxhr2pNCmh5KUMNX96JZkqWjkhsIY93Sf0YV6Q9rU0c1T7YL4WmPx7R+SrZ3YNfUPlQFhOWVuAFlvM=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB4302.namprd11.prod.outlook.com (52.135.36.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.23; Mon, 20 Jan 2020 11:03:21 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2644.024; Mon, 20 Jan 2020
 11:03:21 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH] mtd: spi-nor: Add support for w25qNNjwim
Thread-Topic: [PATCH] mtd: spi-nor: Add support for w25qNNjwim
Thread-Index: AQHVzpf32dqEzZAPf0S4HyMwJjELNQ==
Date: Mon, 20 Jan 2020 11:03:21 +0000
Message-ID: <3862353.UOg0IvECEa@localhost.localdomain>
References: <20200103223423.14025-1-michael@walle.cc>
 <8021667.67K7kvUAe6@192.168.0.113>
 <66c1ad8e74fb20a061f35f8b23a925ab@walle.cc>
In-Reply-To: <66c1ad8e74fb20a061f35f8b23a925ab@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 720c100d-1aa7-4633-cac7-08d79d985ce5
x-ms-traffictypediagnostic: MN2PR11MB4302:
x-microsoft-antispam-prvs: <MN2PR11MB43022F8624B8A31F9160177AF0320@MN2PR11MB4302.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0288CD37D9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(366004)(396003)(376002)(189003)(199004)(478600001)(9686003)(6506007)(53546011)(6512007)(4326008)(6486002)(6916009)(71200400001)(86362001)(2906002)(316002)(5660300002)(8936002)(26005)(66476007)(66946007)(186003)(8676002)(54906003)(76116006)(64756008)(66446008)(91956017)(66556008)(81166006)(81156014)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB4302;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: n9XvoDlq2IDld+jMVgSu+XW9hr7UEIfIM7/2IcAhV/6iiq5+BB/zckJF9oc1zhlANu9fgUJN0//z1+eTI7eHLvNduuwkvv5+nu0a1wq0QGuIX5nRB9Z5QNOSqUnxjgFaITMBpi6+DbM1napwKhqxmX82d7xqAna29g1vK6SJu4kBeEXyx2biP3tvSWB5y4y5aLxqFqeVUVsFYD9d9sc18jdNXwGsqgG7ZSTK3ze3f8iJ6Q3jMfgTiPDVgQ8dzkj6WIgxijSQ/oC8ydLjLpCoYsPqtTh4J7+3Y2Be5boxZfsX+OQ4EElEkvQBGEJ63i78WW9qHZdDujGMS5aEp/5W2cJ40liAvxNjq/lqIhlRYaeYEskjQu4TMAtzHj1/CIoW3NmukF/e+mCiV8H9DVojqkXBtE9R5Dt6/oc/xojY7KVWiq31G5dmW/7E9MR/9PpMFIhpRg2YRIW6PsitnUnfrH7AGwJmK9udQ4iOVqFthCb3hVFb72AiobfX/m5GFgUv
x-ms-exchange-transport-forked: True
Content-ID: <65FB57CC47DA72419DF0E5DA957E08FD@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 720c100d-1aa7-4633-cac7-08d79d985ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2020 11:03:21.2679 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UXUS2AGuzKy0uKPc1t8CT+spq06f6HTCAl28LgHuE5/4U5og4plZyzOBenXR4NKvV95wuFU0JzrT9OA0tmgjcDBmKXF+bIkOMaq7PiB0KO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4302
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200120_030324_746222_F54E8942 
X-CRM114-Status: GOOD (  29.80  )
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
Cc: richard@nod.at, miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Monday, January 20, 2020 12:24:25 AM EET Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Hi Tudor,

Hi, Michael,

> 
> >> Am 2020-01-13 11:07, schrieb Michael Walle:
> >> >>> Btw. is renaming the flashes also considered a backwards incomaptible
> >> >>> change?
> >> >> 
> >> >> No, we can fix the names.
> >> >> 
> >> >>> And can there be two flashes with the same name? Because IMHO it
> >> >>> would
> >> >>> be
> >> >> 
> >> >> I would prefer that we don't. Why would you have two different
> >> >> jedec-ids with
> >> >> the same name?
> >> > 
> >> > Because as pointed out in the Winbond example you cannot distiguish
> >> > between
> >> > W25Q32DW and W25Q32JWIQ; and in the Macronix example between MX25L8005
> >> > and
> >> > MX25L8006E. Thus my reasoning was to show only the common part, ie
> >> > W25Q32
> >> > or MX25L80 which should be the same for this particular ID. Like I
> >> > said, I'd
> >> > prefer showing an ambiguous name instead of a wrong one. But then you
> >> > may
> >> > have different IDs with the same ambiguous name.
> >> 
> >> Another solution would be to have the device tree provide a hint for
> >> the
> >> actual flash chip. There would be multiple entries in the spi_nor_ids
> >> with the
> >> same flash id. By default the first one is used (keeping the current
> >> behaviour). If there is for example
> >> 
> >>    compatible = "jedec,spi-nor", "w25q32jwq";
> >> 
> >> the flash_info for the w25q32jwq will be chosen.
> > 
> > This won't work for plug-able flashes. You will influence the name in
> > dt to be
> > chosen as w25q32jwq, and if you change w25q32jwq with w25q32dw you will
> > end up
> > with a wrong name for w25q32dw, thus the same problem.
> 
> No, because then the device tree is wrong and doesn't fit the hardware.
> You'd
> have to some instance which could change the device tree node, like the
> bootloader or some device tree overlay for plugable flashes. We should
> try to
> solve the actual problem at hand first..
> 
> It is just not possible to autodetect the SPI flash, just because
> the vendors reuse the same IDs for flashes with different features (and
> the
> SFDP is likely not enough). Therefore, you need to have a hint in some
> place
> to use the flash properly.
> 
> > If the flashes are identical but differ just in terms of name, we can
> > rename
> > the flash to "w25q32jwq (w25q32dw)". I haven't studied the differences
> > between
> > these flashes; if you want to fix them, send a patch and I'll try to
> > help.
> 
> It is not only the name, here are two examples which differ in
> functionality:
>   (1) mx25l8005 doesn't support dual/quad mode. mx25l8006e supports
> dual/quad
>       mode
>   (2) mx25u3235f doesn't support TB bit, mx25u3232e has a TB bit.
> 
> well.. to repeat myself, the mx25l25635_post_bfpt_fixups is a third

sorry if this exhausted you.
> example.
> 

Flash auto-detection is nice and we should preserve it if possible. I would 
prefer having a post bfpt fixup than giving a hint about the flash in the 
compatible. The flashes that you mention are quite old and I don't know if it 
is worth to harm the auto-detection for them. A compromise has to be made.

You can gain traction in your endeavor if you have such a flash and there's 
nothing auto-detectable that differentiates it from some other flash that 
shares the sama jedec-id.

If you have such a flash and you care about it, send a patch and I'll try to 
help.

> -michael
> 
> > Cheers,
> > ta
> > 
> >> I know this will conflict with the new rule that there should only be
> >> 
> >>    compatible = "jedec,spi-nor";
> >> 
> >> without the actual flash chip. But it seems that it is not always
> >> possible
> >> to just use the jedec id to match the correct chip.
> >> 
> >> Also see for example mx25l25635_post_bfpt_fixups() which tries to
> >> figure
> >> out different behaviour by looking at "some" SFDP data. In this case
> >> we
> >> might have been lucky, but I fear that this won't work in all cases
> >> and
> >> for older flashes it won't work at all.
> >> 
> >> BTW I do not suggest to add the strings to the the spi_nor_dev_ids[].
> >> 
> >> I guess that would be a less invasive way to fix different flashes
> >> with
> >> same jedec ids.
> >> 
> >> -michael




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
