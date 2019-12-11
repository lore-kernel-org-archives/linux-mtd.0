Return-Path: <SRS0=irXt=2B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B94C43603
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 05:34:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A459208C3
	for <linux-mtd@archiver.kernel.org>; Wed, 11 Dec 2019 05:34:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KQ6XOP8n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="mgu6WfR0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A459208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1JzwHhyetpKkRriUeHjrR43RiwKT6ewFmsrACQlRDI=; b=KQ6XOP8nbKaUrB
	X3rCZAkXD9yLI7J7WWfM4xrRdSgn3ZhCan31S4phUVOz5HiWT10Dyo+SGorwdG4UM5/Bp0s8UecpI
	TM/alFE4YBXhiyXgt/GcGWUGDnzb2GMpE1j9UQG3n7ij/5DQNPnvn1Cv0MjIss8Wt/2cbNNt9lV9Y
	zrnOZOVNJs9Oxy/urh3+Hl9vcR4ogdPJxpJsezkfFGOK0XyF5+TIv6/+8FkhaIxpOeRAd1OsKEKed
	iH6Bc9hiJQFQRxCnzrFV+NKT8zLSh7+N1ZSfJFVWI3P1eHvOjVtuX6D0UvsxZUrzkQeM0/E7z5f4b
	zT+FdlEis0eb4ojPZQDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieudZ-0000IH-JJ; Wed, 11 Dec 2019 05:34:13 +0000
Received: from conssluserg-05.nifty.com ([210.131.2.90])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieudV-0000Hu-Jo
 for linux-mtd@lists.infradead.org; Wed, 11 Dec 2019 05:34:11 +0000
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id xBB5XhX7016639
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2019 14:33:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com xBB5XhX7016639
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1576042424;
 bh=69MyOS9aB1VcMJQYBz4dgojoS/Cbyu8xTjZZlTo6P5s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mgu6WfR0mgo5KyWtmdw5tLsuYQv4aDvzYvAYL/FF6aKwitb+xpd2Iccpnpy4qfOx2
 G3ymr5lmhl9TigDpw+HUoZfEKUmfsCNXZ5I/lSK8vkg5n73qmKmAmhRLzxpsSx75U2
 3S4+0labv7jYO48OzAhz7YZf5pxn+yoYKWXkvsSN0w4+7lobN2fMk610fFy8j/1tok
 N5DUIBLWFyapuODtcjscxnidwWWJ3C0ZjfgDcIl9meS4hyLUvxZ9Y6FOZfUJBLA0dX
 M1Pv3ZHLpe2GaCZ/LvC9+ZAaQc5mVbPsaEmrfDgwIg+hG/niR5emvFKJc4YggsN7gl
 35epSYACyPcgw==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id g15so14931927vsf.1
 for <linux-mtd@lists.infradead.org>; Tue, 10 Dec 2019 21:33:44 -0800 (PST)
X-Gm-Message-State: APjAAAWZn23yfw/Du+Gw/vWVIoCUME/FpQ4+G8yq+OcybQik+HFJFwTf
 CHgPnt/0NE9znXqEaTvTs2jiZP5dmmhm+H2pDzA=
X-Google-Smtp-Source: APXvYqzYoHUVIlV/XW+Q2IY7Q2C/pTURAM6hfqTX45LYS7ruzZE+8z43DRnEhuY1r5s7UGS385e2a0eKXf67N6ShWA8=
X-Received: by 2002:a67:7ac4:: with SMTP id v187mr1028357vsc.181.1576042422892; 
 Tue, 10 Dec 2019 21:33:42 -0800 (PST)
MIME-Version: 1.0
References: <20191210091453.26346-1-yamada.masahiro@socionext.com>
 <MN2PR11MB4509B418D54E8DC7D3BE7DD2CC5A0@MN2PR11MB4509.namprd11.prod.outlook.com>
In-Reply-To: <MN2PR11MB4509B418D54E8DC7D3BE7DD2CC5A0@MN2PR11MB4509.namprd11.prod.outlook.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 11 Dec 2019 14:33:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQnuR0fv6Nv5y=GxHxv8nhDB5K32TyG4G-WyOtJqyh0mg@mail.gmail.com>
Message-ID: <CAK7LNAQnuR0fv6Nv5y=GxHxv8nhDB5K32TyG4G-WyOtJqyh0mg@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: denali: add reset controlling
To: "Tan, Ley Foon" <ley.foon.tan@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_213409_866252_A0397681 
X-CRM114-Status: GOOD (  28.56  )
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
Cc: Marek Vasut <marex@denx.de>, Mark Rutland <mark.rutland@arm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Dec 11, 2019 at 2:23 PM Tan, Ley Foon <ley.foon.tan@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Sent: Tuesday, December 10, 2019 5:15 PM
> > To: linux-mtd@lists.infradead.org
> > Cc: Dinh Nguyen <dinguyen@kernel.org>; Marek Vasut <marex@denx.de>;
> > Tan, Ley Foon <ley.foon.tan@intel.com>; Masahiro Yamada
> > <yamada.masahiro@socionext.com>; Mark Rutland
> > <mark.rutland@arm.com>; Miquel Raynal <miquel.raynal@bootlin.com>;
> > Philipp Zabel <p.zabel@pengutronix.de>; Richard Weinberger
> > <richard@nod.at>; Rob Herring <robh+dt@kernel.org>; Vignesh
> > Raghavendra <vigneshr@ti.com>; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org
> > Subject: [PATCH] mtd: rawnand: denali: add reset controlling
> >
> > According to the Denali User's Guide, this IP has two reset signals.
> >
> >   rst_n:     reset most of FFs in the controller core
> >   reg_rst_n: reset all FFs in the register interface, and in the
> >              initialization sequence
> >
> > This commit supports controlling those reset signals, although they might be
> > often tied up together in actual SoC integration.
> >
> > One thing that should be kept in mind is the automated initialization
> > sequence (a.k.a. 'bootstrap' process) is kicked off when reg_rst_n is
> > deasserted.
> >
> > When the reset is deasserted, the controller issues a RESET command to the
> > chip select 0, and attempts to read out the chip ID, and further more, ONFI
> > parameters if it is an ONFI-compliant device. Then, the controller sets up the
> > relevant registers based on the detected device parameters.
> >
> > This process is just redundant for Linux because nand_scan_ident() probes
> > devices and sets up parameters accordingly. Rather, this hardware feature is
> > annoying because it ends up with misdetection due to bugs.
> >
> > So, commit 0615e7ad5d52 ("mtd: nand: denali: remove Toshiba and Hynix
> > specific fixup code") changed the driver to not rely on it.
> >
> > However, there is no way to prevent it from running. The IP provides the
> > 'bootstrap_inhibit_init' port to suppress this sequence, but it is usually out of
> > software control, and dependent on SoC implementation.
> > As for the Socionext UniPhier platform, LD4 always enables it. For the later
> > SoCs, the bootstrap sequence runs depending on the boot mode.
> >
> > I added usleep_range() to make the driver wait until the sequence finishes.
> > Otherwise, the driver would fail to detect the chip due to the race between
> > the driver and hardware-controlled sequence.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  .../devicetree/bindings/mtd/denali-nand.txt   |  7 ++++
> >  drivers/mtd/nand/raw/denali_dt.c              | 40 ++++++++++++++++++-
> >  2 files changed, 46 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> > b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> > index b32aed1db46d..a48b17fb969a 100644
> > --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> > @@ -14,6 +14,11 @@ Required properties:
> >      interface clock, and the ECC circuit clock.
> >    - clock-names: should contain "nand", "nand_x", "ecc"
> >
> > +Optional properties:
> > +  - resets: may contain phandles to the controller core reset, the
> > +register  reset
> > +  - reset-names: may contain "nand", "reg"
> > +
> >  Sub-nodes:
> >    Sub-nodes represent available NAND chips.
> >
> > @@ -46,6 +51,8 @@ nand: nand@ff900000 {
> >       reg-names = "nand_data", "denali_reg";
> >       clocks = <&nand_clk>, <&nand_x_clk>, <&nand_ecc_clk>;
> >       clock-names = "nand", "nand_x", "ecc";
> > +     resets = <&nand_rst>, <&nand_reg_rst>;
> > +     reset-names = "nand", "reg";
> >       interrupts = <0 144 4>;
> >
> >       nand@0 {
> > diff --git a/drivers/mtd/nand/raw/denali_dt.c
> > b/drivers/mtd/nand/raw/denali_dt.c
> > index 8b779a899dcf..132bc6cc066c 100644
> > --- a/drivers/mtd/nand/raw/denali_dt.c
> > +++ b/drivers/mtd/nand/raw/denali_dt.c
> > @@ -6,6 +6,7 @@
> >   */
> >
> >  #include <linux/clk.h>
> > +#include <linux/delay.h>
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> >  #include <linux/ioport.h>
> > @@ -14,6 +15,7 @@
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/reset.h>
> >
> >  #include "denali.h"
> >
> > @@ -22,6 +24,8 @@ struct denali_dt {
> >       struct clk *clk;        /* core clock */
> >       struct clk *clk_x;      /* bus interface clock */
> >       struct clk *clk_ecc;    /* ECC circuit clock */
> > +     struct reset_control *rst;      /* core reset */
> > +     struct reset_control *rst_reg;  /* register reset */
> >  };
> >
> >  struct denali_dt_data {
> > @@ -151,6 +155,14 @@ static int denali_dt_probe(struct platform_device
> > *pdev)
> >       if (IS_ERR(dt->clk_ecc))
> >               return PTR_ERR(dt->clk_ecc);
> >
> > +     dt->rst = devm_reset_control_get_optional_shared(dev, "nand");
> > +     if (IS_ERR(dt->rst))
> > +             return PTR_ERR(dt->rst);
> > +
> > +     dt->rst_reg = devm_reset_control_get_optional_shared(dev, "reg");
> > +     if (IS_ERR(dt->rst_reg))
> > +             return PTR_ERR(dt->rst_reg);
> Will it trigger error if dts doesn't have "nand" or "reg" for reset-name?
> SOCFPGA dts doesn't have this.


No.
These are optional resets.

If they are not found in DT,
the driver will skip the reset controlling.

Of course, you can add them to your DT later
if you want the driver to take care of the resets.



Best Regards
Masahiro Yamada

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
