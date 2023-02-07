Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EC9C636CC
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Feb 2023 21:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S79vs4hWmsNfEJWfwnx0Lfb4qxIWzR4vfFCMe+uifrA=; b=MdGzQoGyA4wHHa
	qlytWTpcQ+SjRHL1ASbElDM+PpSjj25aFEoxcCixHPsrO8PGzPUWhGCdeYewMie+OAudkiZr37aEH
	lkjkuoOeGE3zPw8axwD4Nqw0TrokuSGMa44RbGPpZWx4Wzisuz5PKkQw3XSEaZSxzPf53ociMLgPO
	xycQLUgfbBCVRu3hwhXPOzMgTUxahHYCGcmvqTDMKI3149E9WoteDZ/SiK414LwR0wzBRAFyUrQfj
	o39fzLhDMF3ADgtr/w9Q08szU5l1HICuSFWwW+ueJDNGskK/SJP4/NSFMqEi/6wvyeK0TuubCP/7d
	Cq2YtGDDYmsDwP+pYagA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPVdd-00DVHN-86; Tue, 07 Feb 2023 21:36:29 +0000
Received: from mail-qt1-f178.google.com ([209.85.160.178])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPVdT-00DVFz-9j; Tue, 07 Feb 2023 21:36:20 +0000
Received: by mail-qt1-f178.google.com with SMTP id h24so18530922qtr.0;
        Tue, 07 Feb 2023 13:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lg0sHUTSECVWWUA2U2vv5V8YfzjLBhdgpAqAGOEck8k=;
        b=xTjNkAjYrhAXQ9JaVJv2MgXoWT54IWn9Ou84xR7FTyIYLeqWKQF17S4t17ghk2q0nq
         LaXmyMSx7flFnymIEvkrDgcJ0iQwpEQ5O7TrflvEfkKy8/gsknz25NWJFdpCUYRHngkF
         rpNZffI9is3UTOL54dE7NWsLcWoR9IdYE7m7D2YemMi7eNpFb2yoapUiSm0xBGzkNdeP
         9EJD/kYVLjmb/BNUUy0MG8F1nSA84aepAMc7s4vARO9TWiDAbNTKnQq6OXXjd7/8L56F
         VnFU+4LGXt0rBfkEVXg8/S1CtAwbQUJ1BnOV7m7IO2jfk7470SWJyoLAvyp+7UEuvKR9
         nqQQ==
X-Gm-Message-State: AO0yUKXRCNZRg/ad/wAum9r1lHN4ZTn2nGJAjDcDV4MVxcB9ftnmwgF6
	368kw0qX+Yq4P8JuGjTuMcy3UIhy6TKpVQ==
X-Google-Smtp-Source: AK7set8rkR8VoOqKpbeUAdoA/fSXExDEwkbEKVlympW4JWhxysG11J31vzTa01hz2g8evoRIIp0jJA==
X-Received: by 2002:a05:622a:292:b0:3b9:a42e:cb80 with SMTP id z18-20020a05622a029200b003b9a42ecb80mr8343767qtw.40.1675805775491;
        Tue, 07 Feb 2023 13:36:15 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id k6-20020ac80206000000b003b9bd163403sm5238822qtg.4.2023.02.07.13.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 13:36:15 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id u7so4220687ybi.6;
        Tue, 07 Feb 2023 13:36:15 -0800 (PST)
X-Received: by 2002:a5b:508:0:b0:8a3:59a4:340e with SMTP id
 o8-20020a5b0508000000b008a359a4340emr532033ybp.604.1675805764091; Tue, 07 Feb
 2023 13:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
In-Reply-To: <20230207014207.1678715-1-saravanak@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Feb 2023 22:35:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWc6pbrxCETL+VcXiwesfpUE7r2xc9U9ti5aTietqzDQ@mail.gmail.com>
Message-ID: <CAMuHMdWWc6pbrxCETL+VcXiwesfpUE7r2xc9U9ti5aTietqzDQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] fw_devlink improvements
To: Saravana Kannan <saravanak@google.com>
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
X-CRM114-CacheID: sfid-20230207_133619_359515_C795F499 
X-CRM114-Status: GOOD (  19.10  )
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

Hi Saravana,

On Tue, Feb 7, 2023 at 2:42 AM Saravana Kannan <saravanak@google.com> wrote:
> Naresh, Tony, Abel, Geert, Dmitry, Maxim(s), Miquel, Luca, Doug, Martin,
> Jean-Philippe,
>
> Can I get your Tested-by's for this v3 series please?

I have tested this on a variety of Renesas arm32/arm64 platforms,
and on several RISC-V platforms.
Apart from the regression related to dynamic overlays caused by
"[PATCH v3 09/12] of: property: Simplify of_link_to_phandle()"
(which you may decide to ignore for now ;-)
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
