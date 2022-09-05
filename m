Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C09FECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 13:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxgCgTVNjOGstufSQwC+Y6UNelU0w0YntnZl+dV9FIM=; b=gaoRRKqj8u4wxQ
	NHpJ4P+j7tknAMT5IC+gCxz131C1DHLyql89Ys1CupQx4MSGBy/3mRYmLZejabmIsKCZbvBFvlrrB
	h7CLqmkwtuQJzTgemOsNiwiXLeIRpSDF2d/TaPEvTrR9YHomygkmabXHx1Wo8uMyiKhvePmRSrQ8m
	pPKkphYmcGX7KNZQ9P4i5SiI/ucOTU4DYcuncxElR//wy9nLfd1Nsgt/veIUD7Zjs7HbeLmJWOORs
	g7U5I18jMRL66jLaIj4sXDZOoXb0AMyKdOWrvo/pnMlMfb8V0W3c/nOJlPAqKUWXkSvsGH8Xqsx7P
	GlsxdmNjyJZkDEXvb3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCDA-003F3P-46; Mon, 05 Sep 2022 13:32:24 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9XR-000Wq9-3v
	for linux-mtd@lists.infradead.org; Mon, 05 Sep 2022 10:41:11 +0000
Received: by mail-ej1-x62b.google.com with SMTP id u9so16225454ejy.5
        for <linux-mtd@lists.infradead.org>; Mon, 05 Sep 2022 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=9xdYuu62zn6DTVuFLIdNqNTZMNwzsKHXEqC14OZNWNU=;
        b=FtboF37GSOE63UVBPDmVZNlKbNYdyQQTJ+s3UhSQJVLQL/lfTP9LWjRJrI2IirL10P
         RMbzluYFwNJzfe1PcgqLCwlKFYldMq9paXhxYn0sYX271CaSDJZHidZ5q96JxBOSW2zn
         lOaTLbWVAi26m6UIISjWArsPGILqnhZGi9fcT8kQksgDAK0cglTE62X2uT7bK8xfV6Jn
         69jfdmKiWiZCu5sVLeXkE7kdKvJZrfswHvHuNhGjcoCD973h5vcRXPGP0giAbPSsgah9
         jm2PSTYF7H/HxnDS4XHxekgDOaHjJVatxbEhAECSvMHM/cKDnbe76RrHLb0Ztl/YmXn8
         00eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=9xdYuu62zn6DTVuFLIdNqNTZMNwzsKHXEqC14OZNWNU=;
        b=ZTwe/8Br9AO/PUqof0GYzm9gBiSQGyBCBCsY0a3YcdzEfP988R0NaFhufeF/BsMhs4
         5fn4uDTTsP51ZwLYSIxjJRYk8kvRRh50f3crlKQkr1ZpTFhjCv3oQ1Ipcj2FxUFHeGPi
         K7lJAeWoDGYddlGHwFjqmrssecmk+MZkfqnIBTvDZSqlpbBaQtjEoXW0TKQRw0K0zcAj
         VyAasYnKKwJ3LLk5BzB0P22GGuGNw4J8IqZK00LOWynoIVeKdgHxSoAGN99DsVtK/C6O
         6BkgTziGEtvk1scQTXpd715D0b36XmmaeN1CXuaVxWvkuObuNiIkD7mESwsyUUOAg8CM
         DMIQ==
X-Gm-Message-State: ACgBeo3lCus/za1DeKvcxjXmSzydICnzTr77Ddz3IMXXY1zOPD8GcoiQ
	FNiGLCT417456e9DwqUc3kXvjXvclxgiFhuHmYIZYg==
X-Google-Smtp-Source: AA6agR5WFwFd/TQ7W2jnfHYcXDAkiN6tuxUzvxuNvMwW96MkN6StF/cPpx6O6HJW2jg3g8odW82qLRa+WoEMj2LUhdw=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr35853646ejs.190.1662374466240; Mon, 05
 Sep 2022 03:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-11-b29adfb27a6c@gmail.com>
In-Reply-To: <20220903-gpiod_get_from_of_node-remove-v1-11-b29adfb27a6c@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 5 Sep 2022 12:40:55 +0200
Message-ID: <CACRpkdbYc3vbgq26cXz4FYdzgDp-ro3fq=JGmuj9=cq+Zu13PQ@mail.gmail.com>
Subject: Re: [PATCH v1 11/11] gpiolib: of: remove [devm_]gpiod_get_from_of_node()
 APIs
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Felipe Balbi <balbi@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Marc Zyngier <maz@kernel.org>, 
	Richard Weinberger <richard@nod.at>, David Airlie <airlied@linux.ie>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_034109_203387_B70F9C58 
X-CRM114-Status: GOOD (  12.42  )
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

On Mon, Sep 5, 2022 at 8:31 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Now that everyone is using [devm_]fwnode_gpiod_get[_index]() APIs, we no
> longer need to expose OF-specific [devm_]gpiod_get_from_of_node().
>
> Note that we are keeping gpiod_get_from_of_node() but only as a private
> to gpiolib function.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
