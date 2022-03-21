Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F34AC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Mar 2022 19:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1hKdygB9rBmdQD7qJmW2Q4QBnDX3ckPu9m+lv28aYYk=; b=mHDvA/5xrKIHMB
	+8mnCi2p7CKbg+gmv6eryk3iLEottGoa9FJkmFQmFjzu2bjGkb7Oh12LbA3FuHQP0FUCB37qF5FIc
	C6lVefjULgRoBKg3C0QXl0HOyZl3QaHiTlFMYA26CMXXcYdSoWjNv+hTaQDSohep/c5PKRIDVbxuw
	3ksnjy7UFQFHK0HkLXg1a9BvaUKBUQBfyMnS2Bo7AV6WczMGdOKNJ2q1jdghdqMiLAec8LCx6Ymcv
	B5U89S9BSQJDzRHjzrJqSc4x6HQEHph5QnmIaGt8EnuFal4WW9ze4Jryb5oDDyF3ZwW+Daf5Fnv8H
	bkObm9tH1061zMrvV5QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWNvX-008s2F-8z; Mon, 21 Mar 2022 19:42:51 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWNvU-008s1R-4o
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2022 19:42:49 +0000
Received: by mail-pl1-x636.google.com with SMTP id x2so113259plm.7
 for <linux-mtd@lists.infradead.org>; Mon, 21 Mar 2022 12:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gateworks-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RwqJ249Zz5S8gk4pvmMun4QSrJFksvDyKJ69SDNeyU8=;
 b=RU20xxEGXcSXQQR4wEl0Y1uXODr28WyaTKwBZL4IXqsoOa9eAaTWzeKJGNxojyOI4X
 gjFvn96N1jeKWICILSFqiIywraMhTbbJ5GgGhbGGOxKUW8NzZtbtq6Suoj/UHbiQrrRt
 GFXlxAS+D6b5miSt2zpgHBiSWK3TzHUg/q0igQZ43oPoUacEv2VyJpWAQyBN4M4/urP1
 6rLvsVVhl22NdBaqBHMojE3849DuwGlHKxMv9GF9v5m+y2mmfOPlULa0yJdvt5a1DXmS
 B+zxaoGI3HLTK4P7kMjQnohrC5EagB5pwCstA8Hty7FjWqmg/ojVWJ0kQ2xSVSGxi0ac
 C6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RwqJ249Zz5S8gk4pvmMun4QSrJFksvDyKJ69SDNeyU8=;
 b=bO/5htXsU2aUEM78Rflmnf0TDXrxDK6HHc7GCj6vD7RPjEJtWsRjfe9VXiywojgq+C
 WZ7fu5JVBl4NHJRZ0KTHO0ZmL6eGFLPRER7wjAR6dOhc1xMOiDlgKY/cfHf6wnoZALU5
 YOihtdYRPyk+N5cL/6DRwttceGSOpZXcwN6HVLOgJH7+1KIm8L1PbCTXH+B6Uwlq8h9c
 fovOEJtYBscKh4XybAX0LWEE1KmZAwVvMbDXoLbXizy345T54ZBRGETL+4DawOicnIEt
 HUBmynirSYI9txzNlC0jZavtjrzlKlnomXwLOQnbwbe8/LrbIqIGTnPgfPijdFRCD5wU
 Yn5Q==
X-Gm-Message-State: AOAM533i8mR8iNtVFuj/CeGqpFXJqkrr3WEr20vvWXmszp2m+Yrr624W
 EkUhr5u7hVrNOnvg636Xrbj+PWX33tYXWDxR+YYM5g==
X-Google-Smtp-Source: ABdhPJx2yYrcktufXddJ/gmjD0ujj/vUjFNsvAi+rD1LFR/+wqNWENoajJhR6xwU9709z7IT/W7j4D4UZE5ZI7o+rCA=
X-Received: by 2002:a17:90a:1db:b0:1bf:711d:267a with SMTP id
 27-20020a17090a01db00b001bf711d267amr745727pjd.155.1647891763697; Mon, 21 Mar
 2022 12:42:43 -0700 (PDT)
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
In-Reply-To: <8eba4158-3a1e-a159-df3d-b89dc4aabadf@kontron.de>
From: Tim Harvey <tharvey@gateworks.com>
Date: Mon, 21 Mar 2022 12:42:31 -0700
Message-ID: <CAJ+vNU0sVtoyiU2U0hZiNPbzMJDBGxgdRoFFpZ=_cQVKZK3P4w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220321_124248_280157_C6625F3E 
X-CRM114-Status: GOOD (  53.25  )
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

On Mon, Mar 21, 2022 at 1:34 AM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Ye,
>
> Am 17.03.22 um 14:54 schrieb Frieder Schrempf:
> > Hi Han,
> >
> > Am 17.03.22 um 14:33 schrieb Han Xu:
> >>
> >>
> >> On Thu, Mar 17, 2022 at 8:27 AM Frieder Schrempf
> >> <frieder.schrempf@kontron.de <mailto:frieder.schrempf@kontron.de>> wrote:
> >>
> >>     Hi Stefano,
> >>
> >>     this old patch was delegated to you in patchwork. If you're not the
> >>     correct maintainer to address, please let me know. As the NAND layer
> >>     seems to be unmaintained at the moment, I'm not sure whom to ask.
> >>
> >>     This patch fixes a regression that was introduced by 616f03dabacb ("
> >>     mtd: gpmi: change the BCH layout setting for large oob NAND") which
> >>     alters the BCH layout in a way that doesn't match with the
> >>     implementation in the Linux kernel.
> >>
> >>     This causes failures when loading an UBI image in U-Boot that was
> >>     flashed by Linux or vice versa (see [1]).
> >>
> >>     There has been an approach to fix this through an optional devicetree
> >>     property in 51cdf83eea ("mtd: gpmi: provide the option to use legacy bch
> >>     geometry"), but this is not acceptable. The "legacy" BCH layout
> >>     compatible with Linux should be used by default.
> >>
> >>     The approach to upstream the "new" layout to the kernel [2] seems to be
> >>     stalled and even if it would succeed, it would break systems that use an
> >>     old U-Boot and a new kernel, which is again not really acceptable in my
> >>     opinion.
> >>
> >>
> >> Hi Frieder,
> >>
> >> I am not in office this week. I will send another patch set to change in
> >> both kernel and u-boot to fix the compatible issue.
> >
> > You already claimed that months ago, but nothing happened:
> >
> >> I will send patches for both kernel and u-boot to use legacy bch
> >> scheme by default, and add some code to treat few MLC nand chips as
> >> corner cases.
> >
> > Sean's U-Boot patch is effectively reverting the default behavior to use
> > the "legacy" BCH scheme. So that's in line with what you want to do and
> > you can base your work on top of this fix. But we should get the basic
> > fix in regardless.
> >
> > Even more so because switching the layout in U-Boot by using
> > fsl,legacy-bch-geometry in the devicetree requires CONFIG_DM_MTD=y,
> > which causes the bootloader size to increase by around 250 KiB in my
> > case which might not be an option for some boards.
>
> Ye's reply copied over to not break the thread:
>
> > The dt nand driver will check "fsl,legacy-bch-geometry" property to
> > use legacy bch. If this can't work for you in case you don't use DM
> > driver, I prefer adding a config to select the legacy bch not
> > reverting the patch.
>
> I think you miss my point. I don't really care about your preferences.
> But I do care about not introducing breaking changes. IMHO the "correct"
> way to introduce the new BCH layout would have been:
>
> 1. Introduce the new layout in Linux and U-Boot behind a feature-flag
> (e.g. DT property)
> 2. Make all upstream board configurations and DTs in Linux and U-Boot
> use the feature-flag.
> 3. Drop the flag and make the new BCH layout the default.
>
> That way the change would be much more controlled and raise the
> awareness of board maintainers that are affected.
>
> The current situation (layout changes applied in U-Boot without any
> questioning, layout changes in Linux rejected for good reasons) leaves
> everyone who uses the GPMI NAND on i.MX in a situation where they
> probably will see failures and need to spend some hours of debugging
> until they find out the reason is that someone carelessly introduced
> breaking changes.
>
> And even with the procedure described above we break compatibility
> between old and new versions of U-Boot and Linux and create a dependency
> between the two which is what we should try to avoid wherever possible.
>
> Frieder

Frieder,

I agree that we need to get this fixed ASAP. Because of this IMX GPMI
NAND UBI has been broken since v2020.07 (6 releases ago!) and it would
be really nice to get this fixed in v2022.01 which releases in a
couple of weeks. I'm surprised neither of us noticed this problem but
likely we've both been so busy trying to keep up with forced DM
migrations we haven't fully tested the 'little things' like booting to
an actual OS. I know the boards I support using IMX GPMI NAND UBI are
still using a 2017 U-Boot where quite honestly everything worked fine
so there hasn't been a reason to push people to something new.

That said, applying this patch does 'not' fix things for my boards.
For my boards mxs_nand_set_geometry is called with:
oobsize=224 ecc_str_ds=0 ecc_step_ds=0 modern=0

and I still get ecc errors when mounting a UBI that worked fine with a
v2020.04 U-Boot:
Ventana > ubi part rootfs && ubifsmount ubi0:boot && ubifsls && ubifsumount
ubi0: attaching mtd3
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes
from PEB 0:0, read 64 bytes
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes
from PEB 1:0, read 64 bytes
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes
from PEB 2:0, read 64 bytes
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 4096
bytes from PEB 2:4096, read 4096 bytes
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 64 bytes
from PEB 3:0, read 64 bytes
ubi0 error: ubi_io_read: error -74 (ECC error) while reading 4096
bytes from PEB 3:4096, read 4096 bytes

The original offending commit 616f03dabacb ("mtd: gpmi: change the BCH
layout setting for large oob NAND") no longer reverts and I haven't
dug in to find out what I can do about that but i'm a little concerned
I get different results than you do regarding the patch from this
thread.

Thank you for pursuing this issue!

Best Regards,

Tim



Best Regards,

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
