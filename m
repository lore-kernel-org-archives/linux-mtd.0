Return-Path: <SRS0=3Meg=3L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D433C32771
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 06:48:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 166042253D
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2020 06:48:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qCmAS70q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ImJx4iMe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 166042253D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPBU08vSY2CSHWWtvZjNUPe6nXQzrSMubtEcQcoKilU=; b=qCmAS70qewtOFf
	JCeUBFAcRXpHJ2OqVdNBR9sKPyjr2kARAvdgi+km2MHW3aOJlBGvyf5PHf0/Xu/3Q3bV9kPG5CxeG
	QRYrNRYHn5LxaU2H0rWnU2v4XD/0Vemd6kZhDsTts9UAKXbH5+9NtRCIiZErYE9a4H3BNY9+1TaJO
	m150ynOLEBg9eCYOb4u3PVOqB0dDXZmqzwNt+pHXgXPVnO1+12BncR+NzvgZ8QqixvBNnfnFKzy+O
	eG6oCKqElKyJhQjGJqsC345ZP+bPLEssm8gSQR/d3xbetJeu0167dl7i4uaz0KSVM/IF+IYM2ZIHm
	R+AdGGtWWjtIb/bozAfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iu9oK-0005jz-CE; Wed, 22 Jan 2020 06:48:20 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iu9oE-0005iD-LV
 for linux-mtd@lists.infradead.org; Wed, 22 Jan 2020 06:48:18 +0000
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: bztLMLlSpC2DQPPBBhJNpfXuVSfs7OiDnET7emPXEUFLdG6bm3PhqdIHfqS0RgTpXyK+mj92fs
 y/xlZDtHhOgLdzf3aJBD/G5SoHlawdPl6qm6oXW8iFQEtAvOZGApPhtW9R2cs5XS6z/N7EIEAw
 hd6UiMiCeJHep58F+NqVo/knQwsWoBe7uSgrzWxS7Ep8rtq6UA/Mzt+33Wqg7BDPWNpHUbyZWg
 jA+FUKpiJe4l0ec8RcM5zgpatPplgv4ocHt70Uehh10mfbOZnMP3Xned1eE8iBYgk9HQbuWuCL
 KrA=
X-IronPort-AV: E=Sophos;i="5.70,348,1574146800"; d="scan'208";a="63364374"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Jan 2020 23:48:11 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 21 Jan 2020 23:48:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Tue, 21 Jan 2020 23:48:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIWpnxN4/N8rDAdtCvFvYH65FS2L5OA85vUIKKPM8dfNj0hNNsAW56GgC8gea+A0xUnsMCtLaebvx1stEdynpGd1jlCultAYi3LwWy2tGHJBVDT5XpyxzBNKOpGwa1e/sfEQer5qtp/cmLOGTDNT3Xo5UaQjS9HnyIVZwQKXSD55UHj10fuNIdSQWE3rBkBxpu57PQF33fLx27g/tJXfFvevhLpZ5d544BR1Xxk+qdMTg7fLdg9ZBPsRjW0ARTDjsZJNg7Ix7dog/kZeN6/CUx3EvlJ4Co62NUxwm4VOxb9Wo0DBNkpvWyE/u5BEIToWuIGveoFsfTGb/RPmofPMPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9pqcxz0WMvwb7LzkxpKDFG/Ps/X1r68VOboBJMkuV4=;
 b=WLISHLncnxVLNyclDOHkTML6zOCtNzbScouqFWRilxLRSPQi+VTOQl8E8CmueniCLZKf5BSomMADt50gQv7j9PI7bsoyqEl2Xpwky0+kf2Wynd9sz0tzkGH79HGMRSlcukNXeXBfX50AyNvTD9tm9Ocd8Fh1iaiiCAW1p7OFusTFGMeq7nSiErUpmaDfPwlO1cpXybNtCqX4Df09Y/TFg2r33DbiiKezFufkdZoN+JI6u8wcmKr+KTfuWTKNhwv4DCOQEQh0L6pYqP2fkXX23bRbztP1xfasyTDZ4gEghI4cLZw+ltMbZUt2XVuOttFqJIt9RvliusDrcAHM+pVP0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n9pqcxz0WMvwb7LzkxpKDFG/Ps/X1r68VOboBJMkuV4=;
 b=ImJx4iMeJyFe4cyKzPfRMlVjQt0MG79bdxMFeXwvIOkM7dmJApInFx8PvV/Q+kcciWpCyeq5VHZwhGgo+uUFq08XuLV6G5hVdvS/Z8ZacvM/39pm0vrTu1gxRz9cfPBsuX0vBNgs5gplr18FIERRBWrC7jjRO9pBxkzHD1AoXlU=
Received: from MN2PR11MB4448.namprd11.prod.outlook.com (52.135.39.157) by
 MN2PR11MB3550.namprd11.prod.outlook.com (20.178.251.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.20; Wed, 22 Jan 2020 06:48:08 +0000
Received: from MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb]) by MN2PR11MB4448.namprd11.prod.outlook.com
 ([fe80::3c8f:7a55:cbd:adfb%5]) with mapi id 15.20.2644.027; Wed, 22 Jan 2020
 06:48:07 +0000
From: <Tudor.Ambarus@microchip.com>
To: <michael@walle.cc>
Subject: Re: [PATCH] mtd: spi-nor: Add support for w25qNNjwim
Thread-Topic: [PATCH] mtd: spi-nor: Add support for w25qNNjwim
Thread-Index: AQHVzpf32dqEzZAPf0S4HyMwJjELNQ==
Date: Wed, 22 Jan 2020 06:48:07 +0000
Message-ID: <2088283.tnVAhDz6N7@192.168.0.113>
References: <20200103223423.14025-1-michael@walle.cc>
 <5476415.ab72jjm3fZ@192.168.0.113>
 <1e78fbe87c0d6dc19a27210551b02af4@walle.cc>
In-Reply-To: <1e78fbe87c0d6dc19a27210551b02af4@walle.cc>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f03162e-219f-4418-5fc8-08d79f0709ff
x-ms-traffictypediagnostic: MN2PR11MB3550:
x-microsoft-antispam-prvs: <MN2PR11MB35505AA2FBB9C631D11E4351F00C0@MN2PR11MB3550.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 029097202E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(39860400002)(396003)(366004)(376002)(346002)(199004)(189003)(53546011)(6506007)(81166006)(8676002)(81156014)(30864003)(64756008)(66556008)(9686003)(26005)(71200400001)(186003)(6486002)(86362001)(478600001)(66476007)(4326008)(8936002)(6512007)(66446008)(66946007)(76116006)(5660300002)(91956017)(54906003)(14286002)(2906002)(6916009)(316002)(39026012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR11MB3550;
 H:MN2PR11MB4448.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gzIWlJ+GaeqdJ+y+4naPwkV3X9teZLBXzUCYSvMKaJmOfDHqLCmOgemZ3jhCD6oK9qUWwdx1q+URGrAb7EXkQJGkIRPcWGj4h/lDpajyzUhk+4BCT1woWfOhP7lpfXHNxUgbwki416jLrBR/4RL/p4O/npvuA/JOWNBT7oKY/BJior5ZB3TKMZg/FDzkULB1inLnOJ0J4ZHnyVJFoW2DBerQB9J/R6HRvV+efgInCKKNnkDcH1V9D6CfWXM6jNRzsyLzxBMi623W61k8bcTP1KFL2evZgP6l1xbB0E0+PO1S436maN0w8FXWwsy0RdQQh01pT+KoQ0wOQMyi/RitFEjFpXwTnq98EOtO3TyvnadnFdMvAPgtATRi5AJcuRJLjFYidApI+fR1pNToyzmV3IZGp5qlalWSuTb9+YQnz6PxmwAyMqbv6xl65A+ByFBpIFq3RejF3w/N03583VaaFwtqeqcpWhkFrl4p5I97mY+xWLcZ3bTXgnGKYzbAxL5u
x-ms-exchange-transport-forked: True
Content-ID: <E12EC0405ADE6640AFB20FDCB6748AAA@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f03162e-219f-4418-5fc8-08d79f0709ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2020 06:48:07.5044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lav8fMisMM2fLvr+BOJWZuv4Lu52slgsswRl0MjUu/8I0+mg4TWqv3t4ne8l80dtVzDKULeNw2VVUYsoaOqYfreHSOOgzHwS3KmGw69/O8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_224814_808924_1AD0B6AD 
X-CRM114-Status: GOOD (  40.82  )
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

Hi, Michael,

On Wednesday, January 22, 2020 1:28:52 AM EET Michael Walle wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Hi Tudor,
> 
> Am 2020-01-21 19:40, schrieb Tudor.Ambarus@microchip.com:
> > Hi, Michael,
> > 
> > On Monday, January 20, 2020 5:55:55 PM EET Michael Walle wrote:
> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> the
> >> content is safe
> >> 
> >> Hi Tudor,
> >> 
> >> Am 2020-01-20 12:03, schrieb Tudor.Ambarus@microchip.com:
> >> > On Monday, January 20, 2020 12:24:25 AM EET Michael Walle wrote:
> >> >> EXTERNAL EMAIL: Do not click links or open attachments unless you know
> >> >> the
> >> >> content is safe
> >> >> 
> >> >> Hi Tudor,
> >> > 
> >> > Hi, Michael,
> >> > 
> >> >> >> Am 2020-01-13 11:07, schrieb Michael Walle:
> >> >> >> >>> Btw. is renaming the flashes also considered a backwards
> >> >> >> >>> incomaptible
> >> >> >> >>> change?
> >> >> >> >> 
> >> >> >> >> No, we can fix the names.
> >> >> >> >> 
> >> >> >> >>> And can there be two flashes with the same name? Because IMHO
> >> >> >> >>> it
> >> >> >> >>> would
> >> >> >> >>> be
> >> >> >> >> 
> >> >> >> >> I would prefer that we don't. Why would you have two different
> >> >> >> >> jedec-ids with
> >> >> >> >> the same name?
> >> >> >> > 
> >> >> >> > Because as pointed out in the Winbond example you cannot
> >> >> >> > distiguish
> >> >> >> > between
> >> >> >> > W25Q32DW and W25Q32JWIQ; and in the Macronix example between
> >> >> >> > MX25L8005
> >> >> >> > and
> >> >> >> > MX25L8006E. Thus my reasoning was to show only the common part,
> >> >> >> > ie
> >> >> >> > W25Q32
> >> >> >> > or MX25L80 which should be the same for this particular ID. Like
> >> >> >> > I
> >> >> >> > said, I'd
> >> >> >> > prefer showing an ambiguous name instead of a wrong one. But then
> >> >> >> > you
> >> >> >> > may
> >> >> >> > have different IDs with the same ambiguous name.
> >> >> >> 
> >> >> >> Another solution would be to have the device tree provide a hint
> >> >> >> for
> >> >> >> the
> >> >> >> actual flash chip. There would be multiple entries in the
> >> >> >> spi_nor_ids
> >> >> >> with the
> >> >> >> same flash id. By default the first one is used (keeping the
> >> >> >> current
> >> >> >> behaviour). If there is for example
> >> >> >> 
> >> >> >>    compatible = "jedec,spi-nor", "w25q32jwq";
> >> >> >> 
> >> >> >> the flash_info for the w25q32jwq will be chosen.
> >> >> > 
> >> >> > This won't work for plug-able flashes. You will influence the name
> >> >> > in
> >> >> > dt to be
> >> >> > chosen as w25q32jwq, and if you change w25q32jwq with w25q32dw you
> >> >> > will
> >> >> > end up
> >> >> > with a wrong name for w25q32dw, thus the same problem.
> >> >> 
> >> >> No, because then the device tree is wrong and doesn't fit the
> >> >> hardware.
> >> >> You'd
> >> >> have to some instance which could change the device tree node, like
> >> >> the
> >> >> bootloader or some device tree overlay for plugable flashes. We should
> >> >> try to
> >> >> solve the actual problem at hand first..
> >> >> 
> >> >> It is just not possible to autodetect the SPI flash, just because
> >> >> the vendors reuse the same IDs for flashes with different features
> >> >> (and
> >> >> the
> >> >> SFDP is likely not enough). Therefore, you need to have a hint in some
> >> >> place
> >> >> to use the flash properly.
> >> >> 
> >> >> > If the flashes are identical but differ just in terms of name, we
> >> >> > can
> >> >> > rename
> >> >> > the flash to "w25q32jwq (w25q32dw)". I haven't studied the
> >> >> > differences
> >> >> > between
> >> >> > these flashes; if you want to fix them, send a patch and I'll try to
> >> >> > help.
> >> >> 
> >> >> It is not only the name, here are two examples which differ in
> >> >> 
> >> >> functionality:
> >> >>   (1) mx25l8005 doesn't support dual/quad mode. mx25l8006e supports
> >> >> 
> >> >> dual/quad
> >> >> 
> >> >>       mode
> >> >>   
> >> >>   (2) mx25u3235f doesn't support TB bit, mx25u3232e has a TB bit.
> >> >> 
> >> >> well.. to repeat myself, the mx25l25635_post_bfpt_fixups is a third
> >> > 
> >> > sorry if this exhausted you.
> >> 
> >> TBH, this is no fun (and I'm doing this on my spare time because I
> >> like
> > 
> > It's not my fault that you're not having fun when someone disagrees
> > with you.
> 
> The reason is not the disagreement, but how you're (not) answering my
> arguments.
> Like in the other thread, the question about the uselessness of the
> flash_lock
> and flash_unlock tools with SPI-NOR and the (IMHO) bad behaviour when
> the user

The flash unlock at probe was a bad decision, but we can't be backward 
compatible. kconfig or module param will solve the problem without breaking 
backward compatibility.

> actually uses flash_lock. Please, don't take this personally, I'll buy
> you a
> beer at FOSDEM :p back to the technical stuff.

I don't take this personally, but I think the discussion went in a wrong 
direction, and I feel that we waste time on theoretical problems.

> 
> >> open source). I guess our opinions differ waaay too much. I don't
> > 
> > Up to a point, yes, our opinions differ. I'm not rejecting your
> > suggestion, I
> > just say that we should implement it as a last resort, when there's
> > nothing
> > auto-detectable at run-time that can differentiate between two flashes
> > that
> > share the same id.
> > 
> >> really like band-aid fixes; eg. with vague information "it seems that
> >> the F version adveritses support for Fast Read 4-4-4", what about
> >> other
> > 
> > We can update the comment to clear the incertitude: "The F version
> > advertises
> > support for Fast Read 4-4-4""
> > 
> >> flashes with that idcode and this property. This might break at any
> >> time
> >> or with anyone trying support for other flashes with that ID.
> > 
> > The jedec-id should be unique in the first place, manufacturers that
> > use the
> > same jedec-id for different flavors of flashes are doing a bad thing. A
> > third
> > flash with the same jedec-id is unlikely to happen.
> 
> MX25U3232F, MX25U3235F, MX25U3273F, MX25U3235E all use the same 0x2c2536
> identification. And these are only the active ones. I bet there are a
> bunch of older 32MBit flashes.
> 
> MX25U6432F, MX25U6472F, MX25U6433F, MX25U6435F, MX25U6473F all use the
> same 0x2c2537 id.
> 
> W25Q32JW-IQ, W25Q32DW, W25Q32FW all use the same 0x156016 id.
> 
> btw. thats why I argued to just have MX25U32 or W25Q32 as a name for the
> flashes.
> 
> >> That's what I've meant with first come first serve, I'm lucky now that
> >> there was no flash with the same jedec id as the W25Q32JW.
> >> 
> >> To add the MX25U3232F I could check the JEDEC revision (or the BFPT
> >> length) because it differers from the MX25U3235F. But I don't feel
> >> well
> > 
> > I prefer this because it's auto-detectable. If you don't feel well
> > doing it,
> > don't do it.
> 
> ok, I'll do so for the MX25U3232F support.
> 
> >> doing that. Who says Macronix won't update their description for the
> >> MX25U3235F to the new revision.. FYI the Winbond guys apparently use
> >> the
> > 
> > You are raising theoretical problems. We can fix this when we will
> > encounter
> > it.
> > 
> >> first OTP region to store the JEDEC data, which is clever because they
> >> can update it during production.
> > 
> > If you say so.
> > 
> >> >> example.
> >> > 
> >> > Flash auto-detection is nice and we should preserve it if possible. I
> >> > would
> >> > prefer having a post bfpt fixup than giving a hint about the flash in
> >> > the
> >> > compatible.
> >> 
> >> see above.
> >> 
> >> > The flashes that you mention are quite old and I don't know if it
> >> > is worth to harm the auto-detection for them. A compromise has to be
> >> > made.
> >> 
> >> so you'd drop support for them? because SFDP is never read if there is
> >> no
> >> DUAL_READ or QUAD_READ flag.
> > 
> > mx25l8006e  defines bfpt, while mx25l8005 doesn't. We can differentiate
> > these
> > too.
> > 
> >> > You can gain traction in your endeavor if you have such a flash and
> >> > there's
> >> > nothing auto-detectable that differentiates it from some other flash
> >> > that
> >> > shares the sama jedec-id.
> >> > 
> >> > If you have such a flash and you care about it, send a patch and I'll
> >> > try to
> >> > help.
> >> 
> >> Given my reasoning above.. well maybe in the future. The Macronix
> >> would
> > 
> > ok
> > 
> >> be
> >> a second source candidate. For now we are using the Winbond flash.
> >> 
> >> I would rather like to have the flash protection topic and OTP support
> >> sorted out, because that is something we are actually using.
> > 
> > You can speed up the process by reviewing/testing the BP3 support. In
> > turn,
> > maybe Jungseung will review your OTP patches.
> > 
> > To sum up: the flash auto-detection (with capabilities) greatly ease
> > the
> > device tree node description and it allows us to plug and play
> > different
> > manufacturer flashes using the same dtb. I have a connector on one of
> > my
> > boards, to which I connect different types of flashes (assuming they
> > have
> > similar frequency and modes). So I would always prefer to have a post
> > bfpt
> > hook to differentiate between flashes which share the same jedec-id,
> > than
> > compromising the generic compatible.
> 
> and making assumptions which are true for the flashes you currently know
> about.

I don't want to introduce code which I don't know if it will ever be used.

> > Of course, if there's nothing auto-
> > detectable that can differentiate between the flashes, then your idea
> > can be
> > implemented, but I would do this as a last resort.
> > 
> > There's also the idea of compromise. The jedec-id should be unique in
> > the
> > first place, manufacturers that use the same jedec-id for different
> > flavors of
> > flashes are taking a wrong design decision. Do I want to cripple the
> > generic
> > compatible just for an old flash with a bad jedec-id? I don't know yet.
> > Also,
> > the flashes that share the same id are quite old, and if nobody
> > screamed about
> > this until now, it's fine by me.
> 
> See above, the assumption that newer flashes have differnet jedec-ids is
> wrong.
> 
> > You raised some theoretical questions, you
> > don't really use the macronix flashes, what I say is that we should
> > consider
> > fixing them when it's actually required. And that the extension of the
> > compatible should be done as a last resort, as of now it has more
> > disadvantages than advantages.
> 
> Well what are the disadvantages? I don't argue against the
> autodetection. I

- generic compatible eases the use. I don't have to check the dtb each time I 
change a plug-able flash, to see if I gave a wrong hint for the flash in the 
extended compatible
- people will prefer to use the extended compatible instead of trying to auto-
detect the differences at run-time (it's easier, but wrong).

> argue to have a mechanism _already_ in place when the autodetection
> fails.
> If you don't specify the hint, everything stays the same.
> 
> We could have the advantages of both worlds, have a generic "w25q32"
> which tries
> its best for autodetection and a specific "w25q32fw" which could can be
> hinted.
> Same for like "mx25u32" and "mx25u3232f", "mx25u3235f" etc.
> 

If you possess 2 flashes that we can't correctly detect at run-time and you 
care to fix them, then your suggestion has a good change to be implemented. I 
will not introduce code that is not used, in the hope that it will be used. No 
compatible extension if we have a way to auto-detect the flash.

Cheers,
ta

> 
> > Cheers,
> > ta
> > 
> >> -michael
> >> 
> >> >> -michael
> >> >> 
> >> >> > Cheers,
> >> >> > ta
> >> >> > 
> >> >> >> I know this will conflict with the new rule that there should only
> >> >> >> be
> >> >> >> 
> >> >> >>    compatible = "jedec,spi-nor";
> >> >> >> 
> >> >> >> without the actual flash chip. But it seems that it is not always
> >> >> >> possible
> >> >> >> to just use the jedec id to match the correct chip.
> >> >> >> 
> >> >> >> Also see for example mx25l25635_post_bfpt_fixups() which tries to
> >> >> >> figure
> >> >> >> out different behaviour by looking at "some" SFDP data. In this
> >> >> >> case
> >> >> >> we
> >> >> >> might have been lucky, but I fear that this won't work in all cases
> >> >> >> and
> >> >> >> for older flashes it won't work at all.
> >> >> >> 
> >> >> >> BTW I do not suggest to add the strings to the the
> >> >> >> spi_nor_dev_ids[].
> >> >> >> 
> >> >> >> I guess that would be a less invasive way to fix different flashes
> >> >> >> with
> >> >> >> same jedec ids.
> >> >> >> 
> >> >> >> -michael




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
