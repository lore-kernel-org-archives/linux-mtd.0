Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6991C05027
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5SUlx7P5/euLEDVFQBMi9s+vR6Scxect4GNqJhfR/Q=; b=by/Sj25gS0fk9L
	ik8gk7aRFCD9WfijDqHvGy6+1p4aTWgFloP1TJcWUc4ti6Eynm95Ys/YQDY3ZYNfs0f8a/nQCR/O0
	kcMfjCaTrfHxNJQCVXy0+C+u3PCKR8XOdtWjVtonLpmEKjCijCRBiqLeKfB9voQPcMzEEIvCA007+
	SUuuD2+7E+utl8e3RXaAsVUi3CrgZRLv+Ka1dSgakqOOIXQwFAIVoJRQU7Qu7U3g2J3Ay5h6mHkWT
	blruKLmwx13FeFDlmPh161z114pzIKpplLLi3ZtHQtOZa8bKklKZT5yLBRZg/qB7PLRQheRJwXIQ+
	IGaHj9o5ZFbUAi/Ufv6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfEK-00EUcx-E9; Wed, 08 Feb 2023 07:51:00 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPfE9-00EUZh-3Y; Wed, 08 Feb 2023 07:50:50 +0000
Received: by mail-ot1-f47.google.com with SMTP id n25-20020a9d7119000000b0068bd8c1e836so4960185otj.3;
        Tue, 07 Feb 2023 23:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mVnPAd0AxN2Xeetse6ostcKuisaMZaCTAVRb6pMiOQ=;
        b=aA5k3EtzpC/ZNNuc9fmJNY6FfQUmLCokLCVZe/1jacgaoU7wWwcNXf/Pm3k0LFRYhU
         pxEJkkLagamDqQizaCE3iy3LF6HZf2bNMSYjB7TjTSNKuI+VBMkWk+W9AaQQqveVEdct
         kn5+oV63/b78GPn6o5HpjIuCwq0yNsRak2koaKWPEyCssJiLFoNWaxkMdjuQACIdSaEW
         7vAR/lAX8p2KmUe2VhLFmXd6YO8qC+TqoGe2hSHdBBFs22Wm2SwAOD7uSS4m4rE3MO/i
         DGpQiDKxNN8yWwTQb33UhEmKXO1+00MF7wjWdh8ui2lptDpv0xc0Jn0oqqJgUnKLlqsJ
         Ng1w==
X-Gm-Message-State: AO0yUKXSLJ+wcUUx8U/8wmWPXiVDuh2dyhcC0xKRnfjg0qoKmf7TOek1
	moY/Ua0ZZmPEP3RZXZJxoQQTqJwqp8WT/w==
X-Google-Smtp-Source: AK7set9Y8e0MIj61/1UgMnVh59VqbNXztKJx3x0q49jGVVwtlofFShI4Pu/VsXCnI0THcpjIPy4TOQ==
X-Received: by 2002:a9d:65d6:0:b0:68b:ca3e:ffb5 with SMTP id z22-20020a9d65d6000000b0068bca3effb5mr3014812oth.24.1675842645469;
        Tue, 07 Feb 2023 23:50:45 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id w10-20020a9d638a000000b0068d6ed06b73sm6503616otk.18.2023.02.07.23.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 23:50:45 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id e12-20020a0568301e4c00b0068bc93e7e34so4954154otj.4;
        Tue, 07 Feb 2023 23:50:45 -0800 (PST)
X-Received: by 2002:a5b:24c:0:b0:87a:68fd:181a with SMTP id
 g12-20020a5b024c000000b0087a68fd181amr839537ybp.36.1675842634268; Tue, 07 Feb
 2023 23:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
 <20230207014207.1678715-10-saravanak@google.com> <CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com>
 <Y+NQUVR9P3hmqFcL@kroah.com>
In-Reply-To: <Y+NQUVR9P3hmqFcL@kroah.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Feb 2023 08:50:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyeU=HP6XVYuXrkjQ8JF53kEW-6mvthCwfL+u3Efuk1A@mail.gmail.com>
Message-ID: <CAMuHMdXyeU=HP6XVYuXrkjQ8JF53kEW-6mvthCwfL+u3Efuk1A@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] of: property: Simplify of_link_to_phandle()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saravana Kannan <saravanak@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20230207_235049_165666_2FDAB904 
X-CRM114-Status: GOOD (  37.16  )
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

Hi Greg,

On Wed, Feb 8, 2023 at 8:33 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Feb 07, 2023 at 09:57:14PM +0100, Geert Uytterhoeven wrote:
> > On Tue, Feb 7, 2023 at 2:42 AM Saravana Kannan <saravanak@google.com> wrote:
> > > The driver core now:
> > > - Has the parent device of a supplier pick up the consumers if the
> > >   supplier never has a device created for it.
> > > - Ignores a supplier if the supplier has no parent device and will never
> > >   be probed by a driver
> > >
> > > And already prevents creating a device link with the consumer as a
> > > supplier of a parent.
> > >
> > > So, we no longer need to find the "compatible" node of the supplier or
> > > do any other checks in of_link_to_phandle(). We simply need to make sure
> > > that the supplier is available in DT.
> > >
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> >
> > Thanks for your patch!
> >
> > This patch introduces a regression when dynamically loading DT overlays.
> > Unfortunately this happens when using the out-of-tree OF configfs,
> > which is not supported upstream.  Still, there may be (obscure)
> > in-tree users.
>
> As we can't do anything about out-of-tree code, why does this matter?

Because the actual DT overlay mechanism is upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
