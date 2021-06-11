Return-Path: <SRS0=BpRd=LF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FORGED_HOTMAIL_RCVD2,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FA0C48BE0
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 14:09:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 208E6613FA
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 14:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 208E6613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XZCbNYZ8gWPRrTl+hxicOLnwvw7joMmZR0p0caxmpV0=; b=fT8svUW3bI7J0B
	ByI/GDjTcVd9CeuK/eEl0SCF7UBMsYxdVDW1wGhvHPhA5hCSBFgI+EL1AowC9JgGfpS4ChoMPXhzB
	BztvPXVC20h5NlMju9EJF7y/mHNLb2bhq6CgM4nXvyu28qm6rJPdkQ6C7gpXNrNT02WZCOoso3OcH
	h9pT40Ml/3yazSOOmbygGRlKIDIt65P2w3GMgCLAfDyC4D22heLM9NlUbZ1j7g6+2bAO0HhxiGlvZ
	RWN8T/OkGbpTqGCg++r/OK/QHrHrxwLwjnrYmgEzK45DDUxJ4cW6jTmgfWIJARV5kVgB/LIosBjTb
	dd4UnGJn3Nqdo8w9KrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrhq5-005ZXI-1t; Fri, 11 Jun 2021 14:08:49 +0000
Received: from mail-co1nam11olkn2062.outbound.protection.outlook.com
 ([40.92.18.62] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrhpn-005ZTN-Ns; Fri, 11 Jun 2021 14:08:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arw3bQ45sn4XozrORpFtwCNZpfGw9PRDKwcBotBkaJEQUweFlFvYtpGrwAk3A13x2uExCCcHCtgLH3a9qyn9QiLOYC6Kko6x66/2tHYfsuHzCSX4bKg5mI5+IYTxj6qe0EDmCcoAukVUk/kQkoCqTkflyUBxI+HQYPL928HME3L28apJoWkA1eC7+iwakrFytvavkfLYxDGGFwaiB430xo53n0zS2OCv1/kV6c33DIsFab5PLgZYIeRbVQV8grJpcYWLGgDgIV6ytrFLyvDydEt77kKYSKBIT/fah1GEoLgHTqBJTXGaNrcid6ENHsIJxB+3P5wFwvlbftSjDl3/pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZmTVXDRdM16b0DMzpLewPP5MRGj3FHzsQreg59QpIw=;
 b=LV/GdylDcGJ08fKHRyhAisSr9XZ303lHFA1kq5PRelNFxuSI3ne5tgyLKywQ16+ECn7FeMIh6cAqgrB1ouzKGUzqkgQfTUyKdpsJZSTmjOJhZI3hkgUF6giUxJdRHUHR+bhAjZy9iZSA36GVUkAUIZYfWrLHc6GILGvY3aAy4lk98gUsmV9kSuvHgRL23gn1BjcEQiE8p2FGQrjkdBafkW6Lucqxbu2WgmPSPPKct4Q6FZOMFTyFdZvkMrMc246WSqneJk0hqg6wgDjguz4bsE42h0nkIOgY/6a4H9vG2HKyTvw1aCmJZ5BgrsDb/WbdC3DQZzpy9RyCsZlNk1na0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZmTVXDRdM16b0DMzpLewPP5MRGj3FHzsQreg59QpIw=;
 b=lK2zSpaCGXHcLXuBpiF6wjIRB8mbLeuLDJVU2iJzcDKJjYwlCglDnAjAcfabjvQRyG8UsqpoIlOa5o9tczwijzxOS61JxEnFC0N5JwEIN9Ijp1G/QOVRVBp7mMNkm3XoRp+xir93HG9054GmOgtsniIoc5fscE+muRI/aYo3ONZCD/DtABRvYsl2cE3wj4wr/k3EbtQIyqjlnqbB4ViQ3NPaNXERGvd0i55U9vZClxXClDqISfQPmtGgtolwTbP6Q4wGmt1WZYSbneVxNaBx3g927i7isqbIBvaw2E1N4yUq1QQX7h3RUFXC0ctzVj8hQSU5DTzGGE2kKdCeSWdC8w==
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2a01:111:e400:fc4d::50) by
 DM6NAM11HT190.eop-nam11.prod.protection.outlook.com (2a01:111:e400:fc4d::182)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Fri, 11 Jun
 2021 14:08:29 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:fc4d::4d) by DM6NAM11FT062.mail.protection.outlook.com
 (2a01:111:e400:fc4d::296) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Fri, 11 Jun 2021 14:08:29 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D1C83189CBE5CEF0520634B6BE46EFE8035E7B453A259AEECE5B3FBCF2CE0B6A;
 UpperCasedChecksum:FDFDCE1428C1EA0D62302A51F9DE38EF13557ADCEDA5178CAD210420F9EEF47A;
 SizeAsReceived:8404; Count:47
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d%5]) with mapi id 15.20.4219.021; Fri, 11 Jun 2021
 14:08:28 +0000
Date: Fri, 11 Jun 2021 09:08:24 -0500
From: Chris Morgan <macromorgan@hotmail.com>
To: Jon Lin <jon.lin@rock-chips.com>
Cc: Chris Morgan <macroalpha82@gmail.com>, linux-spi@vger.kernel.org,
 broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de,
 jbx6244@gmail.com, hjc@rock-chips.com, yifeng.zhao@rock-chips.com,
 sugar.zhang@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 9/9] arm64: dts: rockchip: Enable SFC for Odroid Go
 Advance
Message-ID: <SN6PR06MB53420CFD504FA7FE3B4BEC3CA5349@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210609140412.16058-1-jon.lin@rock-chips.com>
 <20210609141348.19178-1-jon.lin@rock-chips.com>
 <20210609141348.19178-5-jon.lin@rock-chips.com>
 <20210610173657.GA20228@wintermute.localdomain>
 <89283da6-b00e-4d0f-5c4a-0169bda101d3@rock-chips.com>
 <SN6PR06MB5342327048383CC3D416C93DA5349@SN6PR06MB5342.namprd06.prod.outlook.com>
 <19481190-2a28-8602-8f5f-6258a967833d@rock-chips.com>
Content-Disposition: inline
In-Reply-To: <19481190-2a28-8602-8f5f-6258a967833d@rock-chips.com>
X-TMN: [2Vyd6SK1eB/mmeYJf29ugO7NxSfIm1/C]
X-ClientProxiedBy: SN6PR16CA0062.namprd16.prod.outlook.com
 (2603:10b6:805:ca::39) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210611140824.GA71@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN6PR16CA0062.namprd16.prod.outlook.com (2603:10b6:805:ca::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Fri, 11 Jun 2021 14:08:27 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 15ea9319-94b0-406d-d99d-08d92ce26298
X-MS-TrafficTypeDiagnostic: DM6NAM11HT190:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 50HNIIk0dAjwQw1p3Az1CatH4IYO7qW5dTP6xuTOObuJatu8nWwLAnP8ScwIyvOV8WDYoezN9UlWRMZUt8TxwRbtLOdce0IatY8OAOTm1PzLUKWDpKaU0DEi6KiuwHgKs9/V1XuBIJJBWEWQJlkgiVvhgf+d4xF30mB02ZCPsVyZMvDlTQZwiD6O8B86bXN7Im1V6n8/3myoq6zTtzr0t9pmGcBFiDK8Wnr9qpjfnk2flvSJHbslLTEXITZT4qRQlFwCw7OpLaj7aCGWGb7i6x/wI7T8plO+M0jkn5CUE2BLGBzQht802xjohbjagLZHvHS6i90ZDy4qmsM66AGwDVAeCw1A5nbO62j7wD9jrRLF+8ac4ylUphI4yMf7WGW7l1NFxxj74lFjWMOoA7NXefGrYugjsL1w77vQLAmnwBJReGvxZvi4O1GhJCXOKZ/KSJDejKGh6c9FS+8tzNtMevsA9fXq5cueH3h+xEr9PVM=
X-MS-Exchange-AntiSpam-MessageData: VsI1Py7HT7mStrH79pLI9VITb9z2NBdIxCvLVDKs1FqXWVw68IaAAPiLkMjAApr7c5tS2i4IWF+AKaBEfb2INnNzMhzxMmm6G1sdIqjz8okVOqMzvQ52pcKAAzhOLe0OtuBdS9hlDuO1lGXrYI46Xg==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ea9319-94b0-406d-d99d-08d92ce26298
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 14:08:28.6046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6NAM11HT190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_070831_816361_E7CDE944 
X-CRM114-Status: GOOD (  52.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 11, 2021 at 11:54:09AM +0800, Jon Lin wrote:
> =

> On 6/11/21 11:38 AM, Chris Morgan wrote:
> > On Fri, Jun 11, 2021 at 10:26:35AM +0800, Jon Lin wrote:
> > > Hi Chris
> > > =

> > > May you attach the XT25F128B device code to me, and I'll try to work =
it out.
> > Sure, here is the patch I am using:
> > =

> > https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatc=
hwork.ozlabs.org%2Fproject%2Flinux-mtd%2Fpatch%2FSN6PR06MB5342C82F372F37FB8=
E21B327A57A9%40SN6PR06MB5342.namprd06.prod.outlook.com%2F&amp;data=3D04%7C0=
1%7C%7Cc6a3139cc88d47d229cc08d92c8c9354%7C84df9e7fe9f640afb435aaaaaaaaaaaa%=
7C1%7C0%7C637589804539399553%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DzdYTqTXhEYI=
6%2Brq8W4msXZcfDW2XMWzP%2BvtDYMOVsrw%3D&amp;reserved=3D0
> =

> this patch works well in my rk3308 tx-2 rx-2 XT25F128BSSIGU case.

That answers the question then. There must be some board level issue
specific to the Odroid Go Advance. I'll test your latest v8 patches
to confirm again but I think I'll need to update the TX lanes here
to 1 instead of 2. Otherwise, things seem to work fine now.

Thank you.

> =

> # dd if=3D/tmp/rand.img of=3D/dev/mtdblock0 bs=3D4096 seek=3D1024
> 1024+0 records in
> 1024+0 records out
> #
> # dd if=3D/dev/mtd0 of=3D/tmp/rand1.img bs=3D4096 skip=3D1024 count=3D1024
> =

> 1024+0 records in
> 1024+0 records out
> #
> #
> # md5sum /tmp/*.img
> 83e45a56766168b47e6db1d41b1b403d=A0 /tmp/rand.img
> 83e45a56766168b47e6db1d41b1b403d=A0 /tmp/rand1.img
> #
> # dmesg | grep XT25F128BSSIGU
> [=A0=A0=A0 0.200738] spi-nor spi3.0: XT25F128BSSIGU (16384 Kbytes)
> #
> =

> > =

> > > On 6/11/21 1:36 AM, Chris Morgan wrote:
> > > > On Wed, Jun 09, 2021 at 10:13:48PM +0800, Jon Lin wrote:
> > > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > > > =

> > > > > This enables the Rockchip Serial Flash Controller for the Odroid =
Go
> > > > > Advance. Note that while the attached SPI NOR flash and the contr=
oller
> > > > > both support quad read mode, only 2 of the required 4 pins are pr=
esent.
> > > > > The rx and tx bus width is set to 2 for this reason.
> > > > > =

> > > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > > Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> > > > > ---
> > > > > =

> > > > > Changes in v7: None
> > > > > Changes in v6: None
> > > > > Changes in v5: None
> > > > > Changes in v4: None
> > > > > Changes in v3: None
> > > > > Changes in v2: None
> > > > > Changes in v1: None
> > > > > =

> > > > >    .../boot/dts/rockchip/rk3326-odroid-go2.dts      | 16 ++++++++=
++++++++
> > > > >    1 file changed, 16 insertions(+)
> > > > > =

> > > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b=
/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> > > > > index 49c97f76df77..f78e11dd8447 100644
> > > > > --- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> > > > > +++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> > > > > @@ -484,6 +484,22 @@
> > > > >    	status =3D "okay";
> > > > >    };
> > > > > +&sfc {
> > > > > +	pinctrl-0 =3D <&sfc_clk &sfc_cs0 &sfc_bus2>;
> > > > > +	pinctrl-names =3D "default";
> > > > > +	#address-cells =3D <1>;
> > > > > +	#size-cells =3D <0>;
> > > > > +	status =3D "okay";
> > > > > +
> > > > > +	flash@0 {
> > > > > +		compatible =3D "jedec,spi-nor";
> > > > > +		reg =3D <0>;
> > > > > +		spi-max-frequency =3D <108000000>;
> > > > > +		spi-rx-bus-width =3D <2>;
> > > > > +		spi-tx-bus-width =3D <2>;
> > > > Note that I am still working with Jon Lin to research this, but it =
was
> > > > found in testing that if I set the tx bus width to 1 the problems I
> > > > encountered in earlier are resolved. At this time I do not know if =
it
> > > > is an issue with the driver for the flash controller, or if the NOR=
, or
> > > > board itself has some sort of errata which prevent dual tx from wor=
king
> > > > correctly. Note that as of right now the flash chip I am using (an
> > > > XTX XT25F128B) is not currently supported in mainline, so it's very
> > > > possible this is some sort of errata with the chip. It's also possi=
ble
> > > > that there is something with the board that is interferring with du=
al
> > > > mode TX.  When Jon comes back that he has tested dual mode on the S=
FC
> > > > with a different board/chip I will recommend that we change the tx
> > > > bus width here to a 1, and then once the XT25F128B gets mainlined we
> > > > can see if someone else has issues with dual tx mode so we can note
> > > > that as a problem with the chip. Or maybe there is something weird
> > > > with dual tx mode yet on the SFC driver/controller, I don't know ye=
t.
> > > > I'm all too happy to work with a Rockchip engineer so things like
> > > > this can be determined before we hit mainline. :-)
> > > > =

> > > > The XTX25F128B driver is currently awaiting a decision on how to ha=
ndle
> > > > continuation codes, as this chip ID should be using continuation co=
des,
> > > > but doesn't appear to return them when you query for manufacturer I=
D.
> > > > So I should also note in the commit here that the SFC will still be
> > > > unusable on the Odroid Go Advance until the XTX25F128B is also
> > > > mainlined.
> > > > =

> > > > Thank you.
> > > > =

> > > > > +	};
> > > > > +};
> > > > > +
> > > > >    &tsadc {
> > > > >    	status =3D "okay";
> > > > >    };
> > > > > -- =

> > > > > 2.17.1
> > > > > =

> > > > > =

> > > > > =

> > > > =

> > > =

> > =

> > =

> =

> =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
