Return-Path: <SRS0=c5zc=3K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD846C2D0CE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 14:59:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97FD6207E0
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2020 14:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jZr615/Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="ig2B4+wN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97FD6207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEf3GIbZR9kqX7GzhJh6bvWvkCLbDnLKajL7uIfHeE8=; b=jZr615/YcZ8sZa
	xKw56WfpDHRlyCzrkK755yY0Rs6kbmUlUPOb2gfGJI297d3JvvXFjikR8dMxlPxtwVJjFim2PDkAp
	zdpjHqNx7zVS6AClViaXKycU7ydSJ6h41n2W+0bMVfi3iKysbs1NTP5OzIPljYjkCRTc5TGNYcspO
	nXYOqvJM4ZMKA/xLYPSgMvIjkmc2i5KmYLLyE6bVxFw8nCHLKTnKGImT2CBIurV3sNJFWYaU9HXfi
	nCcikFDuibGWEw28UwlUrKNbun9kG1oilSt4gG80zCR0ncRv6mHqSYhSQI+J0mP2J8hxC/l0Fnbmr
	Ha8pV/PeNEgYQzv/DShg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ituzy-0001mg-5M; Tue, 21 Jan 2020 14:59:22 +0000
Received: from mail-bn8nam11on20615.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::615]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ituzr-0001lm-Cw
 for linux-mtd@lists.infradead.org; Tue, 21 Jan 2020 14:59:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahQUBf8rDaltCG6vWZZAA4s5J+2aG6mLz3uQz3tYy4dN9eUA/xrbSUnF8+8qAlystZVT6kLMRc4LRx2C9S6bkVtcHOKBdrNIlIHuydmQAkmlnio2nVKCDIXJpNIbxo+lqheFwE4rlK5e2+5IjDdttgJpzd2RE5B12/zekMjatcW1a81ygo26mT881tWQYaYgl+SD/c774A/IrHhnDXJuywQg1h0SsJh4ZjPcTWLeKDH3teOrriJbsWwfTGB1QyXlzL8AR2Wlk1ru/IkNXDAy64Gp0s34e3EBKnsFm8UfLq8ziK9M5nATQftioP84z5AK7t14LJZmqdiBnEQjqFmGRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJk72w5um95NHsIL3MOUskAZaEZkA47EM2M2z5LJTss=;
 b=mfX1A5wcZcBuD5b+dBVouTOz/mdbKPEEsbFSSrWP8LNtOT6hkfWDEe6r0GTiBVCmJr7E4DTaFZ4hngQnnYDaomVfK0YrgnLpf9spQOLmzWb339eZEKdvCcck4ML4Oxv+COd0du3c2cxjgvAA4hmDVlFc0INGSS1J0+CjFon0m0kniw9ezoSBm9mgi/je8+exLfvxcfEr4sNmd3BjJsUHJjX9YLrXGsvDK8v4z7XyHH8rHm8hdOUk8gN4CYsUJGtL3wry3Pr1Wl01B6BDaKrXvxR4qQsdi61qken5DUEi/tw627MVzWK+WAHh1ZTh/A4MDAQ+vr0QE+KjJPaUwDTtDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJk72w5um95NHsIL3MOUskAZaEZkA47EM2M2z5LJTss=;
 b=ig2B4+wN24Vq6/ZprXI6d37x6bI2G0BGjI3fmvjxk89hbR5JSEW0jarDAxx/CPRcZIoYgyiVJygweTuH6p+ADRzQnY6byGTOv4dlSE1QCnkbHh1Tk2a700ka7bphfjHqvTK6RF/ksKUhJUKMq+W4aplnUj/piIxcGw/OSyxFh3I=
Received: from MN2PR08MB6397.namprd08.prod.outlook.com (52.132.170.74) by
 MN2SPR01MB0045.namprd08.prod.outlook.com (20.179.223.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Tue, 21 Jan 2020 14:59:12 +0000
Received: from MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::61af:ed8:e19b:cb6a]) by MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::61af:ed8:e19b:cb6a%3]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 14:59:12 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: RE: [EXT] Re: [PATCH 3/4] mtd: spinand: Add M70A series Micron SPI
 NAND devices
Thread-Topic: [EXT] Re: [PATCH 3/4] mtd: spinand: Add M70A series Micron SPI
 NAND devices
Thread-Index: AQHVz3qxhHT4F5gqHEqpiIf5nVR3gqfzXyrAgAHClgCAAAH50A==
Date: Tue, 21 Jan 2020 14:59:11 +0000
Message-ID: <MN2PR08MB6397EE91C508B6DA2263F3D6B80D0@MN2PR08MB6397.namprd08.prod.outlook.com>
References: <20200119145432.10405-1-sshivamurthy@micron.com>
 <20200119145432.10405-4-sshivamurthy@micron.com>
 <20200120111626.7cb2f6c5@xps13>
 <MN2PR08MB6397062A37D39287E820A0D8B80D0@MN2PR08MB6397.namprd08.prod.outlook.com>
 <20200121144034.05a8f49d@xps13>
In-Reply-To: <20200121144034.05a8f49d@xps13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc3NoaXZhbXVydGh5XGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctOTM1ZjVhYjAtM2M1ZS0xMWVhLWIxZTMtOTgzYjhmNzQ1MjUxXGFtZS10ZXN0XDkzNWY1YWIyLTNjNWUtMTFlYS1iMWUzLTk4M2I4Zjc0NTI1MWJvZHkudHh0IiBzej0iNTY4OSIgdD0iMTMyMjQwOTIzNDk1NTE1ODM2IiBoPSIwdGVUWGJ1aXVoUjM0a0lUMlZ1eHNFQnNvbWc9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.80.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38db92d3-5ec8-4b43-821b-08d79e8279b2
x-ms-traffictypediagnostic: MN2SPR01MB0045:|MN2SPR01MB0045:|MN2SPR01MB0045:
x-microsoft-antispam-prvs: <MN2SPR01MB0045D387487F13F2C3E768ABB80D0@MN2SPR01MB0045.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(199004)(189003)(52536014)(186003)(4326008)(6506007)(55236004)(7696005)(5660300002)(26005)(8936002)(81156014)(6916009)(2906002)(55016002)(81166006)(9686003)(8676002)(478600001)(316002)(71200400001)(33656002)(54906003)(86362001)(76116006)(66476007)(66446008)(64756008)(66556008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2SPR01MB0045;
 H:MN2PR08MB6397.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G5gdPq5VeL43b9Mwm3A19+ylR/YWYIdeJWm4fwuE+fx+wTdve41NVT4wB1OrQA1F/FIkNB9uXv3STaWRh9eTW5aW3xYbZ4rYR7xsnJb4TkS5Z6KfCFG2+mZrU7QXLnIzyw7q9Z8Nhf1+xSl9Mgjp3ukMUjGgNdAtoOD4hPpA2RhL0Rg5WdW5Nt0T6igcIGFU6rCuQgf02lNje7pIHztbioqwrpkHSTg1PFsZcDamPFyz/QjGAAeF30L6g6KhdxAFDTWxAkUOXhXiGC2Y/bAJcUXOzxMylP434gBLm3Z5Mz8dQCIz5Wm3p1Oorvv9q6m0UMM+ahlg9eDZ7QKzRonsLFlbw091BUb0IseJ+QwJ5Z5n9dS4uCZ5PDW0huitL+AKe3LnDOk1GRDuEjnMAYsEEiUSd5ByGFQDzo0rgDwflwEIKtsT/Au0M1d/ck8+opCy
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38db92d3-5ec8-4b43-821b-08d79e8279b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 14:59:11.9061 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5M43Q0YYvtoVuJTmMUXRjoXQAhTh+aPXVe8N1EXgT2k30sp/pJTk84S4UtU8QUEKMLjNMa455HTP3zFEXO/4zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2SPR01MB0045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200121_065915_607157_DF0DCEBF 
X-CRM114-Status: GOOD (  31.15  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Shivamurthy Shastri <shiva.linuxworks@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

> 
> Hi Shivamurthy,
> 
> "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com> wrote
> on
> Tue, 21 Jan 2020 12:23:20 +0000:
> 
> > Hi Miquel,
> >
> > >
> > > Hi Shiva,
> > >
> > > This is remark common to the four patches: you miss the 'v2' prefix in
> > > the object.
> > >
> >
> > Sorry for this mistake.
> > I recognized this after sending out the patches.
> >
> > > shiva.linuxworks@gmail.com wrote on Sun, 19 Jan 2020 15:54:31 +0100:
> > >
> > > > From: Shivamurthy Shastri <sshivamurthy@micron.com>
> > > >
> > > > Add device table for M70A series Micron SPI NAND devices.
> > > >
> > > > While at it, disable the Continuous Read feature which is enabled by
> > > > default.
> > >
> > > Can you please give us more detail on why this is an issue?
> >
> > "Continuous Read" is the new feature added by the Micron for
> > M70A series devices. If this feature is enabled, the READ command
> > doesn't output the OOB area. The following short description
> > describes this feature.
> >
> > Description:
> > If the Continuous Read feature is enabled, the device provides
> > the capability to read the whole block with a single command.
> > However, the read command doesn't output the OOB area.
> >
> > Read command behavior (if Continuous Read enabled):
> > The READ CACHE command doesn't require the starting column address.
> > The device always output the data starting from the first column of the
> > cache register, and once the end of the cache register reached, the data
> > output continues through the next page. With the continuous read mode,
> > it is possible to read out the entire block using a single READ command, and
> > once the end of the block reached, the output pins become High-Z state.
> 
> Ok I understand better. In this case there is no need to split this
> commit, instead just reword the commit log to something like:
> 
> --->8---
> Add device table for M70A series Micron SPI-NAND devices.
> 
> As opposed to the M60A series already supported, M70A parts have the
> "Continuous Read" feature enabled by default which does not fit the
> subsystem needs.
> 
> <here explain the feature>.
> 
> Hence, we disable the feature at probe time.
> ---8<---
> 

Sure, I will change as per your suggestion.

> However, below, you disable this bit for all the parts. Is this really
> ok? Souldn't we make it more specific to this series?

It is ok because this bit is unused in other series.

> 
> >
> > >
> > > Shall we backport it to stable?
> >
> > This is not a bug fix and applicable only to M70A series devices, there is no
> > need to backport.
> > (FYI, the previously enabled device was M79A series)
> >
> > >
> > > As a rule of thumb, when you start a sentence by "while at it" in a
> > > commit message and this is not a trivial change : split the patch,
> > > please. Unless this is really related and in this case explain how and
> > > why in the commit message.
> >
> > Okay, I will explain in my next version.
> >
> > >
> > > >
> > > > Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
> > > > ---
> > > >  drivers/mtd/nand/spi/micron.c | 31
> > > +++++++++++++++++++++++++++++++
> > > >  1 file changed, 31 insertions(+)
> > > >
> > > > diff --git a/drivers/mtd/nand/spi/micron.c
> > > b/drivers/mtd/nand/spi/micron.c
> > > > index 5fd1f921ef12..45fc37c58f8a 100644
> > > > --- a/drivers/mtd/nand/spi/micron.c
> > > > +++ b/drivers/mtd/nand/spi/micron.c
> > > > @@ -131,6 +131,26 @@ static const struct spinand_info
> > > micron_spinand_table[] = {
> > > >  		     0,
> > > >  		     SPINAND_ECCINFO(&micron_8_ooblayout,
> > > >  				     micron_8_ecc_get_status)),
> > > > +	/* M70A 4Gb 3.3V */
> > > > +	SPINAND_INFO("MT29F4G01ABAFD", 0x34,
> > > > +		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
> > > > +		     NAND_ECCREQ(8, 512),
> > > > +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> > > > +					      &write_cache_variants,
> > > > +					      &update_cache_variants),
> > > > +		     0,
> > > > +		     SPINAND_ECCINFO(&micron_8_ooblayout,
> > > > +				     micron_8_ecc_get_status)),
> > > > +	/* M70A 4Gb 1.8V */
> > > > +	SPINAND_INFO("MT29F4G01ABBFD", 0x35,
> > > > +		     NAND_MEMORG(1, 4096, 256, 64, 2048, 40, 1, 1, 1),
> > > > +		     NAND_ECCREQ(8, 512),
> > > > +		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> > > > +					      &write_cache_variants,
> > > > +					      &update_cache_variants),
> > > > +		     0,
> > > > +		     SPINAND_ECCINFO(&micron_8_ooblayout,
> > > > +				     micron_8_ecc_get_status)),
> > > >  };
> > > >
> > > >  static int micron_spinand_detect(struct spinand_device *spinand)
> > > > @@ -153,8 +173,19 @@ static int micron_spinand_detect(struct
> > > spinand_device *spinand)
> > > >  	return 1;
> > > >  }
> > > >
> > > > +static int micron_spinand_init(struct spinand_device *spinand)
> > > > +{
> > > > +	/*
> > > > +	 * M70A device series enable Continuous Read feature at Power-up,
> > > > +	 * which is not supported. Disable this bit to avoid any possible
> > > > +	 * failure.
> > > > +	 */
> > > > +	return spinand_upd_cfg(spinand, CFG_QUAD_ENABLE, 0);
> > > > +}
> > > > +
> > > >  static const struct spinand_manufacturer_ops
> > > micron_spinand_manuf_ops = {
> > > >  	.detect = micron_spinand_detect,
> > > > +	.init = micron_spinand_init,
> > > >  };
> > > >
> > > >  const struct spinand_manufacturer micron_spinand_manufacturer = {
> > >

Thanks,
Shiva
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
