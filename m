Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62050C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Mar 2022 17:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/Z0ev9/ethcHbWjx1GQZt0aTcbVn4obNrLwN2w+PDs=; b=kg54QZTGhtMPN2
	gZ1MjCGnwPN8bjr+e6bqgysTpOk6j5KYqbPBweRhWsOxrCG/yNIb/np8Dg0qGAi5SSZS/zGTTcGkf
	kEkwZuN4s35e4DvQ7tb3b6dIFN3rqf/bGDC+qfzilBtqbevM79ac8Hxf8yO0WgC1yTWkhkiIOpEvp
	jNJUfTP+gsR3CGEA7yxVupBdfMf1ytjA0qPEKBAUXJyBQ4CPXi+cu1dFpV/SzElHcJQZT+jeYX0/o
	FL3/dHr+YGRRcDVc9aWWsOFTQgkQbYSXULWK2Kp3Gv0xpe6TKnmOGPyoj6+iMw1c4QRrkQWcTjLvI
	APOGV68zxGir8+mhS9GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWi4T-00BhPe-RS; Tue, 22 Mar 2022 17:13:25 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWi4Q-00BhOg-FK
 for linux-mtd@lists.infradead.org; Tue, 22 Mar 2022 17:13:24 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 q1-20020a17090a4f8100b001c6575ae105so2362900pjh.0
 for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2022 10:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+qudXniZb9K5QVfJRdcJDJbsn9DWsaCKdCaUQwJGYqg=;
 b=OCFgeaC9XtoADQl9/G26ndUp9+LFnhzaiqzER4qqzyAzP+os883/75mW9+k9eV+4cr
 IgYNoHB/Dq54YphSu5dHNRv6Sn0XGdbOBz4/IvvDkB6SD9lDNmTlnpjHNUTWYNh6rmbW
 Wq1Kh6xCCcqO917fPR/evSLO1Pw/1hhIHmpmC6vXmjjTFs6lmyvetqKvSqcPInB5HmkA
 AdKH95kfQ/YtRNPX46Nr7Rmly72QEZs7IPZxiQgEzMd/28LKviOaddMjHY78eBUMhKJL
 8HQQIIGkNx/1ZID61sQozjYUxQvyagxsT114jfHBUj8OmJf9kWujX6y8ZMLxGL0X/tNM
 Mc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qudXniZb9K5QVfJRdcJDJbsn9DWsaCKdCaUQwJGYqg=;
 b=nGmRVis73Wrvb3+psObfm4ru3qRbxzgx+FX4EMAlDMGs57jkY+6c0kesV44Wio6xMi
 okq7wd0jYbtaNReEKDaN8mVV8ocq13EUK4rOXhqAIf2Di0gfTjKIg1+585z4lm0GomFO
 staeYB9Tlq5kbBvaXyrKK5TDjaWR4AMMzDNVp8oRU887olSlB02uqf4H4W4uctXIfWKX
 klxjj7Lta3mIm5S7ws8loYbDUlvF/O0nzomTCX5kAcc1KsS3ycz2wCAUbSkVbPcVY3J1
 mKWKwyg6C1fINU34ZbzVnvU/KjDZc7EffLo5ABzjdwoFlmvzRKOgglZn3+6O4Jq/Lr+M
 2S7Q==
X-Gm-Message-State: AOAM5327SdoCzdQJC37WH5nUm9xQO9teSavk47m6hVjA4yBmjPdcsasx
 zeXvIoMo7WYBdmUSJ51NbnTPgKUavigFJA5wH/XfuA==
X-Google-Smtp-Source: ABdhPJzbeMzMKqrv7y5+6yf5szQGLejB5RTlucAdjVnntPUvyHoXrk+pb8uXGfLgvc6XqIH8yVcoygAun2YGZzRvTbE=
X-Received: by 2002:a17:902:c401:b0:154:152a:7fb7 with SMTP id
 k1-20020a170902c40100b00154152a7fb7mr19706021plk.63.1647969201613; Tue, 22
 Mar 2022 10:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210510100043.449294-1-sean@geanix.com>
 <20210511024926.t6kunesknbwe7k2x@umbrella>
 <a33cac1f-7988-08ea-7d9d-c9b76b80cc3e@geanix.com>
 <20210513200242.fxvfvwgua35hbqvr@umbrella>
 <edd64777-ff6a-82fd-63bb-7b2f31f63f44@geanix.com>
 <05831c2f-668f-1386-2ba6-4ce623b50d49@kontron.de>
 <CA+EcR2178yu6DWP2NCODh7autEsXs69JmZaFxROVqzez4jR7bQ@mail.gmail.com>
 <fbd5cebf-2221-7582-c834-4d8da29d81d0@kontron.de>
 <8eba4158-3a1e-a159-df3d-b89dc4aabadf@kontron.de>
 <CAJ+vNU0sVtoyiU2U0hZiNPbzMJDBGxgdRoFFpZ=_cQVKZK3P4w@mail.gmail.com>
In-Reply-To: <CAJ+vNU0sVtoyiU2U0hZiNPbzMJDBGxgdRoFFpZ=_cQVKZK3P4w@mail.gmail.com>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 22 Mar 2022 10:13:10 -0700
Message-ID: <CAJ+vNU0LC3vY1VrvHtnNtmqR6ZrCTV5EMkKEJq97bJaCXPiSxg@mail.gmail.com>
Subject: Re: [EXT] [PATCH] mtd: mxs_nand: default to legacy bch and rename to
 modern bch option
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Ye Li <ye.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Sean Nyekjaer <sean@geanix.com>, 
 Stefano Babic <sbabic@denx.de>, Alice Guo <alice.guo@nxp.com>,
 dl-uboot-imx <uboot-imx@nxp.com>, 
 "han.xu" <han.xu@nxp.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Peng Fan <peng.fan@nxp.com>, 
 Sean Anderson <seanga2@gmail.com>, Simon Glass <sjg@chromium.org>,
 u-boot <u-boot@lists.denx.de>, Han Xu <xhnjupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_101322_607483_7637DEC8 
X-CRM114-Status: GOOD (  65.97  )
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

On Mon, Mar 21, 2022 at 12:42 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> On Mon, Mar 21, 2022 at 1:34 AM Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
> >
> > Hi Ye,
> >
> > Am 17.03.22 um 14:54 schrieb Frieder Schrempf:
> > > Hi Han,
> > >
> > > Am 17.03.22 um 14:33 schrieb Han Xu:
> > >>
> > >>
> > >> On Thu, Mar 17, 2022 at 8:27 AM Frieder Schrempf
> > >> <frieder.schrempf@kontron.de <mailto:frieder.schrempf@kontron.de>> wrote:
> > >>
> > >>     Hi Stefano,
> > >>
> > >>     this old patch was delegated to you in patchwork. If you're not the
> > >>     correct maintainer to address, please let me know. As the NAND layer
> > >>     seems to be unmaintained at the moment, I'm not sure whom to ask.
> > >>
> > >>     This patch fixes a regression that was introduced by 616f03dabacb ("
> > >>     mtd: gpmi: change the BCH layout setting for large oob NAND") which
> > >>     alters the BCH layout in a way that doesn't match with the
> > >>     implementation in the Linux kernel.
> > >>
> > >>     This causes failures when loading an UBI image in U-Boot that was
> > >>     flashed by Linux or vice versa (see [1]).
> > >>
> > >>     There has been an approach to fix this through an optional devicetree
> > >>     property in 51cdf83eea ("mtd: gpmi: provide the option to use legacy bch
> > >>     geometry"), but this is not acceptable. The "legacy" BCH layout
> > >>     compatible with Linux should be used by default.
> > >>
> > >>     The approach to upstream the "new" layout to the kernel [2] seems to be
> > >>     stalled and even if it would succeed, it would break systems that use an
> > >>     old U-Boot and a new kernel, which is again not really acceptable in my
> > >>     opinion.
> > >>
> > >>
> > >> Hi Frieder,
> > >>
> > >> I am not in office this week. I will send another patch set to change in
> > >> both kernel and u-boot to fix the compatible issue.
> > >
> > > You already claimed that months ago, but nothing happened:
> > >
> > >> I will send patches for both kernel and u-boot to use legacy bch
> > >> scheme by default, and add some code to treat few MLC nand chips as
> > >> corner cases.
> > >
> > > Sean's U-Boot patch is effectively reverting the default behavior to use
> > > the "legacy" BCH scheme. So that's in line with what you want to do and
> > > you can base your work on top of this fix. But we should get the basic
> > > fix in regardless.
> > >
> > > Even more so because switching the layout in U-Boot by using
> > > fsl,legacy-bch-geometry in the devicetree requires CONFIG_DM_MTD=y,
> > > which causes the bootloader size to increase by around 250 KiB in my
> > > case which might not be an option for some boards.
> >
> > Ye's reply copied over to not break the thread:
> >
> > > The dt nand driver will check "fsl,legacy-bch-geometry" property to
> > > use legacy bch. If this can't work for you in case you don't use DM
> > > driver, I prefer adding a config to select the legacy bch not
> > > reverting the patch.
> >
> > I think you miss my point. I don't really care about your preferences.
> > But I do care about not introducing breaking changes. IMHO the "correct"
> > way to introduce the new BCH layout would have been:
> >
> > 1. Introduce the new layout in Linux and U-Boot behind a feature-flag
> > (e.g. DT property)
> > 2. Make all upstream board configurations and DTs in Linux and U-Boot
> > use the feature-flag.
> > 3. Drop the flag and make the new BCH layout the default.
> >
> > That way the change would be much more controlled and raise the
> > awareness of board maintainers that are affected.
> >
> > The current situation (layout changes applied in U-Boot without any
> > questioning, layout changes in Linux rejected for good reasons) leaves
> > everyone who uses the GPMI NAND on i.MX in a situation where they
> > probably will see failures and need to spend some hours of debugging
> > until they find out the reason is that someone carelessly introduced
> > breaking changes.
> >
> > And even with the procedure described above we break compatibility
> > between old and new versions of U-Boot and Linux and create a dependency
> > between the two which is what we should try to avoid wherever possible.
> >
> > Frieder
>
> Frieder,
>
> I agree that we need to get this fixed ASAP. Because of this IMX GPMI
> NAND UBI has been broken since v2020.07 (6 releases ago!) and it would
> be really nice to get this fixed in v2022.01 which releases in a
> couple of weeks. I'm surprised neither of us noticed this problem but
> likely we've both been so busy trying to keep up with forced DM
> migrations we haven't fully tested the 'little things' like booting to
> an actual OS. I know the boards I support using IMX GPMI NAND UBI are
> still using a 2017 U-Boot where quite honestly everything worked fine
> so there hasn't been a reason to push people to something new.
>
> That said, applying this patch does 'not' fix things for my boards.
> For my boards mxs_nand_set_geometry is called with:
> oobsize=224 ecc_str_ds=0 ecc_step_ds=0 modern=0
>
> and I still get ecc errors when mounting a UBI that worked fine with a
> v2020.04 U-Boot:
> Ventana > ubi part rootfs && ubifsmount ubi0:boot && ubifsls && ubifsumount
> ubi0: attaching mtd3
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes
> from PEB 0:0, read 64 bytes
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes
> from PEB 1:0, read 64 bytes
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes
> from PEB 2:0, read 64 bytes
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 4096
> bytes from PEB 2:4096, read 4096 bytes
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes
> from PEB 3:0, read 64 bytes
> ubi0 error: ubi_io_read: error -74 (ECC error) while reading 4096
> bytes from PEB 3:4096, read 4096 bytes
>
> The original offending commit 616f03dabacb ("mtd: gpmi: change the BCH
> layout setting for large oob NAND") no longer reverts and I haven't
> dug in to find out what I can do about that but i'm a little concerned
> I get different results than you do regarding the patch from this
> thread.
>
> Thank you for pursuing this issue!
>

It looks like for my board this patch on top of commit 51cdf83eea
("mtd: gpmi: provide the option to use legacy bch geometry") does
resolve the issue however on top of current 2022.04-rc4 there seems to
be a new problem for me.

Adding some debugging I find that I used to see the following:
mxs_nand_set_geometry legacy_bch_geometry=1 ecc_strength_ds=0
max_ecc_strength_supported=40
mxs_nand_legacy_calc_ecc_layout oobsize=224 ecc_chunk_count=8
ecc_chunk0_size=512 ecc_chunkn_size=512 ecc_strength=16

But now with this patch on top of 2022.04-rc4 I get:
mxs_nand_set_geometry legacy_bch_geometry=1 ecc_strength_ds=0
max_ecc_strength_supported=40
mxs_nand_legacy_calc_ecc_layout oobsize=128 ecc_chunk_count=8
ecc_chunk0_size=512 ecc_chunkn_size=512 ecc_strength=8
^^^ oobsize is wrong causing the wrong ecc strength (8 instead of the
correct 16)

I'm not sure yet what happened between 51cdf83eea and now that causes
oobsize to be wrong for my device.

Frieder, are you really able to run ok on 2022.04-rc4 with legacy mode selected?

Best Regards,

Tim

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
