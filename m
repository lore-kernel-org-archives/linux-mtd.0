Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A48ECAAD5
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Sep 2022 13:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dO3Y4vMUvrhfI6El/vgOUBuQvfqH/zEn9ugi23uXebc=; b=lg1lKkuI2ITnMg
	MF1D/Sa5MNnK6+Iz+MioHVxDW966yfsuFfq/pMQrMftpBrKiEwnIGqNtQGT7ga9/0ti9MO7U2SOPF
	3UKcuqtqIxDxxwLNlHM33URLm07y+XiRnf/E+WpeiYjrgIvqHubxgJdVuH98f5Zxg7cHqADdakeYy
	rjdkyJZvfl/8GS8UbhsARKfXmtFE8QakH0QSoZDFE1EEX6+gQTdLu7T/BXzhieuR67UJM1sc3CU9b
	G0nKTJkXJ036W2y49mmTqtjp5YH4nWJQDyqEP2tV2ZRyGRjbhF/lECa0xvF2f03O3HY9cOs+g/OXS
	iRInZuJhMye/4qTqEeww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCXj-003cpN-A7; Mon, 05 Sep 2022 13:53:39 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV9l6-000ifM-CG; Mon, 05 Sep 2022 10:55:17 +0000
Received: by mail-qk1-x72f.google.com with SMTP id b2so6044110qkh.12;
        Mon, 05 Sep 2022 03:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=u5wXdybY4V4FdQrWKDhVN8YtAVKPzLButJ1sTRP8l1Y=;
        b=fN9ls9YPkyuUBAxr4wBmegmBCd5C9P/xaFPwXqy2FgkVzhIWNFNVR0bIehn1eXCf3d
         zobAQyMxj0Z6zjuSqQChSLqXx/lGBZnOoXZuh0swZ9USSGOks25+oXU6FAesXBD3v2DQ
         L68l4C/DyY0LtBFJIREWTz0QAYiKWOW4FJBp9fKNmjWxzb09XWs8F+aM06q4SUWIESBO
         xHTM6IpS/sM1qQMre3AApRlHWbfBdhbDuAOnnGrdzMosW5f0QYLusQvgZq38fCbtCj8+
         st+OCZ16eP1EI4yU9tRWvtbyzF+xtAD5mGA4eMQrLw3MtKQV7zXu1TtVJ7pKICr8G27y
         D+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=u5wXdybY4V4FdQrWKDhVN8YtAVKPzLButJ1sTRP8l1Y=;
        b=0Eh8GF1vig+zb7jes/qdVALCr+Rsylai8646rs7WGlDzEB0ra2Ov5gli6lu9W5xdQc
         A+GjOvVHKWPdmdXWIrqo784urcJ6zPtfSH6MnOzMMnCaUHODUOGVEovGW3Ne5l83J0d3
         B810869LYEp5zDlp8GDdX7emtBUJd3AhbX3miSH/ftMQEIXcciaxYDAjP1U3Q4LJt86F
         rl3zNYRWxYkdSwWm1Idc2AOgMXI8hyTvWPJcXdEinbbhWONh1V3BEWKtDjZMzw/gktQh
         HvEhPqw+VmtQX5/Ttx9xhdhlsAgkAJfae/F6O4CSa9TXtoNQpsV2yq6p/QFpH2C44L+3
         qH1g==
X-Gm-Message-State: ACgBeo1mMjA2cTBJnN16yWa2HGQrD+ZOiLR2Ic/yS6ABD5CYQqd+x5ck
	haxRmnOwlXxYIErQPHkSj3o37M0VvMTp5ji/xAg=
X-Google-Smtp-Source: AA6agR4kYjGXWf3gIvqIWbBUJGizexBviWISl//lL9gbx6ZDHQvEVsxtbzoy40VfO0zOsVmlCvX9hRiizwzJ1xcnYOU=
X-Received: by 2002:a05:620a:2987:b0:6ba:dc04:11ae with SMTP id
 r7-20020a05620a298700b006badc0411aemr31582222qkp.748.1662375311598; Mon, 05
 Sep 2022 03:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-1-b29adfb27a6c@gmail.com>
 <20220905071902.fv4uozrsttk3mosu@pali> <CAHp75Vf5R03nq6JmpVcVNX9L5CwM-uOmF39oHSZFP3QJe+GExQ@mail.gmail.com>
 <20220905105341.z2pjlpljitws3j6l@pali>
In-Reply-To: <20220905105341.z2pjlpljitws3j6l@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 5 Sep 2022 13:54:35 +0300
Message-ID: <CAHp75VedhWXbEG6kpObbpnyPE3M3dCM7nEyupJr+rwKj0kVC8w@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] PCI: tegra: switch to using devm_fwnode_gpiod_get
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Felipe Balbi <balbi@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Marc Zyngier <maz@kernel.org>, 
	Richard Weinberger <richard@nod.at>, David Airlie <airlied@linux.ie>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, USB <linux-usb@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>, 
	"open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_035516_611244_86C8D697 
X-CRM114-Status: GOOD (  12.90  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBTZXAgNSwgMjAyMiBhdCAxOjUzIFBNIFBhbGkgUm9ow6FyIDxwYWxpQGtlcm5lbC5v
cmc+IHdyb3RlOgo+IE9uIE1vbmRheSAwNSBTZXB0ZW1iZXIgMjAyMiAxMzo0OToyMSBBbmR5IFNo
ZXZjaGVua28gd3JvdGU6CgouLi4KCj4gPiBJdCdzIG5vdCB0aGUgc2FtZSBkZXYgYW5kIGl0cyBu
b2RlIGluIHRoaXMgY2FzZS4gVGhlcmUgaXMgb25lIHJlc2V0Cj4gPiBmb3IgX2FsbF8gcG9ydHMs
IGhlcmUgaXMgdGhlIHJlc2V0IG9uIF9wZXIgcG9ydF8gYmFzaXMuCj4KPiBhYXJkdmFyayBpcyBz
aW5nbGUgcG9ydCBjb250cm9sbGVyLiBTbyBpdCBpcyBiYXNpY2FsbHkgc2FtZS4KClllcCwganVz
dCByZXBsaWVkIHRvIG15IG1lc3NhZ2UuCgotLSAKV2l0aCBCZXN0IFJlZ2FyZHMsCkFuZHkgU2hl
dmNoZW5rbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
