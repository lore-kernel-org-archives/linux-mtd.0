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
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD34C4743D
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 03:40:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75DDB61359
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Jun 2021 03:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75DDB61359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=hotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l432bLRHxBkLIYWFxvjvf+wGHlmpPXWgm7TDGCZvvoI=; b=Ca2hGIbvl8bWVg
	BilMrzA3iCU0bflb2tdy9QRrEAWj9C3r7+TwGOdYY3Kpr2KZmxlvfrrFN3zxZH/yVt11PCAjYbEHw
	IKMyn6D0NM7IJH1MEyw19P6sbG+UE6iGHygzzT9NSxslXRvxjnS/BuGMKMeo/Z8qxkdkG/xGkYm+2
	NqMj0EQjbSVwCviGc9kVEkHKG3LNbnlgdeLyap6Icou7BgEFRs4tGP5A/JAz/0gojJyydLD3+q9uD
	6bh26mKlIDZnl1Vu4P3INbt5VfWsEql9up5GbsFuPXIJ5Qmo4ktOpDJykzg7+Sv/IjAzeldVtRkwK
	QxEu1gL2ccYdVRoKvZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrY0u-003Mtj-2Q; Fri, 11 Jun 2021 03:39:20 +0000
Received: from mail-bn7nam10olkn2101.outbound.protection.outlook.com
 ([40.92.40.101] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrY0g-003Msd-9Y; Fri, 11 Jun 2021 03:39:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQn1GiBZG2dBcTYlg37mHyDrk8VzF1wtjAaG51L1G17EMFZVu5xfjq9hy8WNx/um1JwdezTNMc7PRVxrCgdC+kB9Q8zty0D7Dy5zq92tg+prRXGu06JWzPepq5oh/tgJ03QwEBIUbYth2ab8rYr5wwzQAPqL+KElRU8Ho2cuRo5xi+k1ccWeL8/bVrDn5aBe0WgWHcwLoJxWT64d6Ypepd2g5DLvpwEQrNp7/LgQSgC4DeUdioh/w1okM1Y1/JSELLiIxsuCs7Y83uQant65b+IKl5erbNUv6T3DhbegzuRzW76B7ANuIRDF1afNmUH1WAfj1WLoCHkb+H5o8upMYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msw90XJFgnz6+hgKMXULOgz2+tCLp2tP5ZQy/x1kE4I=;
 b=TlCgjva/rOYaG7vw4ONtKgJNMDJv/xjtCfENhaQ1cGvZqh4h1HTcz+BFqRFMZl44fDGT7qTjsp7pkGhIg9fys0njEQ2V9Ez83zzd5SVaDDnudEV04/H8aywKzwuV+mAauvDj69HAP/XfhOInpi3bqvmSQUas/aJ7PxUtx/VFXnkQ+8z5eYdfvqnj56jYuh7gOZVCfHgrQYI/Pc/1P+bjeJN7H6RHoWWqgKozZYaY5FV3TleF7q1o5zAUu5Nnz2J3XCUKnSVS6jiQ8LnVlKIs0SnOn8Qz5BxhY2sr6RWZu8U4gvg6472nx8/mt7o+ISjUkSpsUD5llg+4KsbFV6y2yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=msw90XJFgnz6+hgKMXULOgz2+tCLp2tP5ZQy/x1kE4I=;
 b=iNaT48g4ncqxWTDDrMxYsy1W9/UM5OmTDVBiaPeZOThPlQeT60Smvi3+s/ifnfsbsGoFmoLJW6brxnet8If+DyqWEbkWpl0QlgodmVsNebn8hqsZHLyZgSEgFc1CeMZVN57Ldjc0WTScjdWWX/PG1i1Dx09beaxFbvlkKbTfEuJKZ/Qi/Si877wWfQ5U1U60PnrVkz5wWS9KRGeuI2wS1LJfvSoeDGUGidI3PSneubMjjD10vsmxXaWcWC9vc/Zcu5+fft1FFXbBA4w2y2OtTu1p27rBi0sCFNYycUNouOKhZaN3swOuGiLRUBVdrkiLu8BUqv+/GYoV8/E2wRJ4PQ==
Received: from MW2NAM10FT064.eop-nam10.prod.protection.outlook.com
 (2a01:111:e400:7e87::48) by
 MW2NAM10HT032.eop-nam10.prod.protection.outlook.com (2a01:111:e400:7e87::232)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.18; Fri, 11 Jun
 2021 03:39:02 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 (2a01:111:e400:7e87::4c) by MW2NAM10FT064.mail.protection.outlook.com
 (2a01:111:e400:7e87::101) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.18 via Frontend
 Transport; Fri, 11 Jun 2021 03:39:02 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:38B2E8436786BF7EEAA750A785F1D0BBDDF707221064DB3E0A2A3DE0C689E71C;
 UpperCasedChecksum:D084A3A195E99083DCAB8B1CDFD046DB7BACFE3329D00565E447E4A25BB041BC;
 SizeAsReceived:8103; Count:46
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::91a7:5b3:8e7c:621d%5]) with mapi id 15.20.4219.021; Fri, 11 Jun 2021
 03:39:02 +0000
Date: Thu, 10 Jun 2021 22:38:54 -0500
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
Message-ID: <SN6PR06MB5342327048383CC3D416C93DA5349@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20210609140412.16058-1-jon.lin@rock-chips.com>
 <20210609141348.19178-1-jon.lin@rock-chips.com>
 <20210609141348.19178-5-jon.lin@rock-chips.com>
 <20210610173657.GA20228@wintermute.localdomain>
 <89283da6-b00e-4d0f-5c4a-0169bda101d3@rock-chips.com>
Content-Disposition: inline
In-Reply-To: <89283da6-b00e-4d0f-5c4a-0169bda101d3@rock-chips.com>
X-TMN: [UEXmitQWj5ixtic83Z9XvImAT6ribvtL]
X-ClientProxiedBy: SN4PR0501CA0016.namprd05.prod.outlook.com
 (2603:10b6:803:40::29) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20210611033854.GA33@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from wintermute.localdomain (76.183.134.35) by
 SN4PR0501CA0016.namprd05.prod.outlook.com (2603:10b6:803:40::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.9 via Frontend
 Transport; Fri, 11 Jun 2021 03:38:57 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 46
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 704fe16f-0a55-4de5-9abc-08d92c8a7240
X-MS-TrafficTypeDiagnostic: MW2NAM10HT032:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hpc9Fra/cdlgi/cSxMGbTM/VPwF7V41AigANtEDbUhwaD1gHkmgU/+lzpRfJ5bQRmfEovwpHi7aFQjMC5yQb7+NzlCL313ldW3R93eSq4aFoWgQIR4bCuSA7sCEfiJUflA0fnSVhhrhIsgRj1k/CfYJmaZw/pj6UCjNfejpm0vt08O7nx0+rujqgd49IwzHNbn4fmOJMXf3fnrrRnunastalSaKI5ACzrvn8DglrK7eEaQQ4/HACq8YWcSAGjgUe4gVoEQBbopvbtkgzmewRetmt3Ul+CsganrR7M19bjpjM6/Mbr5ycDsxoLaXNjBo85WJuid8gH4MGmv0AYSkWE2IGDh5cbr4jkyta31zjZO4HWmQkxL+wad2gOwXy0ISGcy2OWnw8LNtqVJOM/F6Qb1K8amEhfPX0nOfeqCQ+M2B4YFeGoMYYIVBKaKGuRFbbTErwO3h9QHsECNQMHEGmiQ==
X-MS-Exchange-AntiSpam-MessageData: o+dYU2IQ8s6XzA8tRKITI/+pQMqyIMA9RWA5+McIgrmeXO9rVWM+3Kjtdi29RsvS3aAeyEzCoCwE/41A7Hu/x+fVP+rypaD29Gkqtvm9DCmBYXHcq0e1bmcywDolpc8zeyCzYa+Dwn1mGZl38g/ZxQ==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704fe16f-0a55-4de5-9abc-08d92c8a7240
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 03:39:01.6402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM10FT064.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2NAM10HT032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_203906_504890_8E9C9039 
X-CRM114-Status: GOOD (  45.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jun 11, 2021 at 10:26:35AM +0800, Jon Lin wrote:
> Hi Chris
> 
> May you attach the XT25F128B device code to me, and I'll try to work it out.

Sure, here is the patch I am using:

https://patchwork.ozlabs.org/project/linux-mtd/patch/SN6PR06MB5342C82F372F37FB8E21B327A57A9@SN6PR06MB5342.namprd06.prod.outlook.com/

> 
> On 6/11/21 1:36 AM, Chris Morgan wrote:
> > On Wed, Jun 09, 2021 at 10:13:48PM +0800, Jon Lin wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > This enables the Rockchip Serial Flash Controller for the Odroid Go
> > > Advance. Note that while the attached SPI NOR flash and the controller
> > > both support quad read mode, only 2 of the required 4 pins are present.
> > > The rx and tx bus width is set to 2 for this reason.
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
> > > ---
> > > 
> > > Changes in v7: None
> > > Changes in v6: None
> > > Changes in v5: None
> > > Changes in v4: None
> > > Changes in v3: None
> > > Changes in v2: None
> > > Changes in v1: None
> > > 
> > >   .../boot/dts/rockchip/rk3326-odroid-go2.dts      | 16 ++++++++++++++++
> > >   1 file changed, 16 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> > > index 49c97f76df77..f78e11dd8447 100644
> > > --- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> > > +++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> > > @@ -484,6 +484,22 @@
> > >   	status = "okay";
> > >   };
> > > +&sfc {
> > > +	pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus2>;
> > > +	pinctrl-names = "default";
> > > +	#address-cells = <1>;
> > > +	#size-cells = <0>;
> > > +	status = "okay";
> > > +
> > > +	flash@0 {
> > > +		compatible = "jedec,spi-nor";
> > > +		reg = <0>;
> > > +		spi-max-frequency = <108000000>;
> > > +		spi-rx-bus-width = <2>;
> > > +		spi-tx-bus-width = <2>;
> > Note that I am still working with Jon Lin to research this, but it was
> > found in testing that if I set the tx bus width to 1 the problems I
> > encountered in earlier are resolved. At this time I do not know if it
> > is an issue with the driver for the flash controller, or if the NOR, or
> > board itself has some sort of errata which prevent dual tx from working
> > correctly. Note that as of right now the flash chip I am using (an
> > XTX XT25F128B) is not currently supported in mainline, so it's very
> > possible this is some sort of errata with the chip. It's also possible
> > that there is something with the board that is interferring with dual
> > mode TX.  When Jon comes back that he has tested dual mode on the SFC
> > with a different board/chip I will recommend that we change the tx
> > bus width here to a 1, and then once the XT25F128B gets mainlined we
> > can see if someone else has issues with dual tx mode so we can note
> > that as a problem with the chip. Or maybe there is something weird
> > with dual tx mode yet on the SFC driver/controller, I don't know yet.
> > I'm all too happy to work with a Rockchip engineer so things like
> > this can be determined before we hit mainline. :-)
> > 
> > The XTX25F128B driver is currently awaiting a decision on how to handle
> > continuation codes, as this chip ID should be using continuation codes,
> > but doesn't appear to return them when you query for manufacturer ID.
> > So I should also note in the commit here that the SFC will still be
> > unusable on the Odroid Go Advance until the XTX25F128B is also
> > mainlined.
> > 
> > Thank you.
> > 
> > > +	};
> > > +};
> > > +
> > >   &tsadc {
> > >   	status = "okay";
> > >   };
> > > -- 
> > > 2.17.1
> > > 
> > > 
> > > 
> > 
> > 
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
