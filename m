Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D48CC636CC
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 23:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XO31CCsw0CDqjYgAZG+kzrZ3O4zMthjLx2/HCAoS6w=; b=DcF91G4f8bj6g+
	LvkluaOKxe/xY61EegPxm38HLtLXGAAgPSxHmv8JxLmOsi6e2tJQeNNnZlEyF3vSx75fnZ8Hri/QE
	rZ69zMrXNGpNmA+qo9F1LwhwiCRaIF5fBr2Cdy22w1RvS/CwoBlc6Dyehn1UyNgs7qsxxCanmiPLd
	wcXiumaRBbC3uKTTRBRFMoIVmAE+nECJNJbWXC7qJHtkCyAyoBtj5ww/JqmBYzW9T/plahauAuAz/
	gjQ2jypANjynKR/QdWIEvPf0PU+miuhhSvqRf3j8Y6BaNE8DoGR/1gtQ3bpJnKPcm7a6Li+EQG6cZ
	kCoeBd2a6giBTpnErGWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPX9c-00DdRr-W2; Tue, 07 Feb 2023 23:13:37 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPX9a-00DdR4-Ns
	for linux-mtd@lists.infradead.org; Tue, 07 Feb 2023 23:13:36 +0000
Received: by mail-pg1-x531.google.com with SMTP id r18so11496847pgr.12
        for <linux-mtd@lists.infradead.org>; Tue, 07 Feb 2023 15:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8AFMKctRHnvie2TeWTzee4bAAZ/B9stjtKlQ5Rg5dBE=;
        b=j0Tge9KuUGleo3rmNMVG+QsSsd4faRAZpuEp3rGxHGDhY+lkA3+0DCnxR8aegHCge6
         cO0TbwUtPTs8ITGXBDCSAQO6ScEpLgHfJe89u3fO0OELaPM6cQ25W1Z/2mhyPFAPxErT
         +Vnksrfba3xmk4ITm4jRjvKIHCMA28JBC/RrLHhBq5DBHqKA0VH6Gpw731c3AqZwyECo
         pwNMur97GJ6HKq7cdIQGVdW7MAUtD26fewkxsrZk9OaJ62gxASiMh8lVnw1t3Kh9BETZ
         h8KDDmNeGAhEvA+25IuTB5zo2BvvpA65MrykazQgkAcxj9Jtc8eKN3ah2/+Ap7D87cyY
         erKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AFMKctRHnvie2TeWTzee4bAAZ/B9stjtKlQ5Rg5dBE=;
        b=uV8VwB3y18FXVJ0u4aiQasOXqOFDTRhpI3t8m8DS+4qzZYMBMfG3pTBAquZ+Z2aVrz
         gnE7exzPDAD4my1K9ncJsDsIIx9L37s56kFHwSeRyBPIDcEiHT6RjIXK8NsAOQS4NJWh
         Lyc1bOfAasHwk+1fMA2+eLul6lEhqNb3cJfJ/fvPnTEakVOohc+J+FCW3JDUcrt3QmdA
         zRDsV/NCRCsNiX6ixTk1qoBck9oc1duhljTZi3ZrXKt/kdTUs1PIj1lf15h0E6a8ke8h
         cR2KEFyXez+QsMpwLWiektVyKVhOpzVGoc1MWClhAHKnW5RNgnZ6wsH6DCUkKluzEJdG
         6yFw==
X-Gm-Message-State: AO0yUKWxum5NmBcImPUGzGlakbQoCOYXLC7WklzcjrQG1ey97syjlqq8
	Mi7wADxtG+DPWMwinaUOPSV0ihrLjKAFLp9Klg1BSQ==
X-Google-Smtp-Source: AK7set82dqdysAxpE84w5h03BnoQzNzUIi4BxGlTnJGDsUP2gPvZIr2q53Al8msJwacCdnSqWBN5d7cF28SdbrlA7dA=
X-Received: by 2002:aa7:8ede:0:b0:590:7829:f566 with SMTP id
 b30-20020aa78ede000000b005907829f566mr1202351pfr.50.1675811613191; Tue, 07
 Feb 2023 15:13:33 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com> <CAMuHMdWWc6pbrxCETL+VcXiwesfpUE7r2xc9U9ti5aTietqzDQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWWc6pbrxCETL+VcXiwesfpUE7r2xc9U9ti5aTietqzDQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 7 Feb 2023 15:12:56 -0800
Message-ID: <CAGETcx-VmYRO6Qw4cJ_=QQXzOJbOUS8B+mesqm8n2NrT2d54Cg@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] fw_devlink improvements
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Len Brown <lenb@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Abel Vesa <abel.vesa@linaro.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Tony Lindgren <tony@atomide.com>, John Stultz <jstultz@google.com>, 
	Doug Anderson <dianders@chromium.org>, Guenter Roeck <linux@roeck-us.net>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maxim Kiselev <bigunclemax@gmail.com>, 
	Maxim Kochetkov <fido_max@inbox.ru>, Luca Weiss <luca.weiss@fairphone.com>, 
	Colin Foster <colin.foster@in-advantage.com>, 
	Martin Kepplinger <martin.kepplinger@puri.sm>, Jean-Philippe Brucker <jpb@kernel.org>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-acpi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_151334_813246_34C677C4 
X-CRM114-Status: GOOD (  14.51  )
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

On Tue, Feb 7, 2023 at 1:36 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> On Tue, Feb 7, 2023 at 2:42 AM Saravana Kannan <saravanak@google.com> wrote:
> > Naresh, Tony, Abel, Geert, Dmitry, Maxim(s), Miquel, Luca, Doug, Martin,
> > Jean-Philippe,
> >
> > Can I get your Tested-by's for this v3 series please?
>
> I have tested this on a variety of Renesas arm32/arm64 platforms,
> and on several RISC-V platforms.
> Apart from the regression related to dynamic overlays caused by
> "[PATCH v3 09/12] of: property: Simplify of_link_to_phandle()"
> (which you may decide to ignore for now ;-)
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks a lot for the extensive testing Geert!

I'll take a look at that issue with the out of tree code separately.

-Saravana


-Saravana

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
