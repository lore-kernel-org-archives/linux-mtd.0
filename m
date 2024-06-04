Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A610BC25B78
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 19:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z/QZTNfiLLmPWywKpXnON0H3Br3ra6PFtY4wi3MIG8Y=; b=tF+tb/7MPWa2KH
	Fy8bdv6nj8BkxFb53+Hgp+pSDTxU1vER7CCQllDE5ZvVbOPR09oYumwP8GLd0xAZGrPlzt8689Cr3
	QPet9hkymcMMseXty5siBXlrQxHoOXlSXFaa8O8X8LuWw9Jw71G8SNiollFqqoGn+74towFCVBHcA
	RmHe/pOccth6nC6lH6ffMmxoDm+FhyQiRVxrwA+hRU1c8a+a48lFupvvjAepbEK4wfw3BM+77BtEd
	RjeL5BI5sUm0DhGeP6JzT4iKxG7Lz8O0fEMj8oo9y4SxAQpGKVV+QBP8GFNFXQVEwAZUruMLqd6TZ
	WKYyfFDFOvYXaT2qLFeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEZXB-00000003YDr-39oH;
	Tue, 04 Jun 2024 19:09:25 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEZX8-00000003YCF-2BjT
	for linux-mtd@lists.infradead.org;
	Tue, 04 Jun 2024 19:09:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-57a44c2ce80so4138385a12.0
        for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2024 12:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1717528159; x=1718132959; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Iay1wNfKZ5p2yKYQUB8UE9csohQVR6x64V5CAu9ZDo=;
        b=A0P6vH5lVzjwlwjCDEVFG6yT0rAl+TJr6Ing36vDJdMCQ5UkmGLN68B0AcW11EAy73
         6CPAof2aGxPD6vASbfkjbSPiwU3ZWk5VsElkqVK49lKJDLyfb2ZSREwgiAWM/M+Nydde
         ci3NvVHy7zfGaIeKmsLsVTMgA3ENrE82tNN1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717528159; x=1718132959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Iay1wNfKZ5p2yKYQUB8UE9csohQVR6x64V5CAu9ZDo=;
        b=QKzP3GkRKt6W5PC4/Yyc6Uf9AVXdA9pCNhJcXAWcZS7NZ6343jk0B49uMdlKRJRVPz
         wBLi+vUAR+HXdAO9WwRIQxTPFD2gpb4f93b5BRHSeJeJgCcj1hlaD/yEXprVf7Hea0SP
         VqlCpQqx8075Ir1eeUa0WB8D1mAC+cG9CRfZxAlyfdUNXUu2LqD2pA1r2qM3r3rYM6Ke
         uue8Q+UuFJRrId/9DU770hexAWHwjxoHpPzi0yGxdl9Vv1R/LC2i370RnB4t41EgYNR8
         jFouBfStI8M7FL3jG+oLldDxKaD99KQw3tro1JjtPVDAZvZEDZBiPq8/iMwNylGa9wXm
         NaFw==
X-Forwarded-Encrypted: i=1; AJvYcCUIRQOeVhPNvc3D+Xa6PBXoQV+iraPzgNaQdGm+mpUNqk1+zQxmYLEYzob42SVrdLoJe5YMHbFt/Ed2tZIWqjFegZJEct9WnlCHUTYrmw==
X-Gm-Message-State: AOJu0Yykcykur3HGjVEkJHR+bc7VrBDdLCJtbjLEXukFStNJ2BFVeHOG
	ICX+q7VN82/D3qaQtf7kIkqCMOwXbAh/XdAZXRnlv/07xW+yJjO9YWM0+jw6sqMcMChsPJ1tJYT
	7J2xrHyJi
X-Google-Smtp-Source: AGHT+IHSIcecHdZ40fkMJxyIM84YPJDp2z4roxPXlqrC9iVYIk83llWi8HhgizGThxbYTZ8lD3Lvdw==
X-Received: by 2002:a50:9b5b:0:b0:57a:76d4:d890 with SMTP id 4fb4d7f45d1cf-57a8bcbaf14mr251642a12.41.1717528159504;
        Tue, 04 Jun 2024 12:09:19 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a86a6a5d3sm1138049a12.65.2024.06.04.12.09.19
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 12:09:19 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4213485697fso34353215e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2024 12:09:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3qNKoQqUfw6eNZ3iNB0rpHt+SBw13XbH32J3T+hgKmfMcEhqH3EAjLUVKIwjW09JQBocaHFwrbpYYjPxiLVuX8rMyy8qGZKZlJMo+3g==
X-Received: by 2002:a17:906:54b:b0:a62:2cae:c02 with SMTP id
 a640c23a62f3a-a69a024ce40mr20818866b.61.1717526574326; Tue, 04 Jun 2024
 11:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com> <Zl9b_Wh_Lx7Aln1q@intel.com>
In-Reply-To: <Zl9b_Wh_Lx7Aln1q@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 4 Jun 2024 11:42:36 -0700
X-Gmail-Original-Message-ID: <CAHk-=whAnzrovfD8MtpRwfbkVxi-W61CqKxYdX+94r_uJeCT7w@mail.gmail.com>
Message-ID: <CAHk-=whAnzrovfD8MtpRwfbkVxi-W61CqKxYdX+94r_uJeCT7w@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with sysfs_match_string()
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, Allen Pais <apais@linux.microsoft.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, Perry Yuan <perry.yuan@amd.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu <herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>, Randy Dunlap <rdunlap@infradead.org>, Andi Shyti <andi.shyti@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>, Samuel Holland <samuel@sholland.org>, Elad Nachman <enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Johannes Berg <johannes.berg@intel.com>, Gregory Greenman <gregory.greenman@intel.com>, Benjamin Berg <benjamin.berg@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>, Vinod Koul <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Nikita Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Stanley Chang <stanley_chang@realtek.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Abdel Alkuor <abdelalkuor@geotab.com>, Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers <ebiggers@google.com>, Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, Abel Wu <wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>, Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, Eric Snowberg <eric.snowberg@oracle.com>, Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Mark Brown <broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, qat-linux@intel.com, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-bcachefs@vger.kernel.org, linux-hardening@vger.kernel.org, cgroups@vger.kernel.org, linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sergey Shtylyov <s.shtylyov@omp.ru>, Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Daniel Scally <djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Tony Lindgren <tony@atomide.com>, Adrian Hunter <adrian.hunter@intel.com>, Hu Ziji <huziji@marvell.com>, Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Potnuri Bharat Teja <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Miri Korenblit <miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, JC Kuo <jckuo@nvidia.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sebastian Reichel <sre@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Helge Deller <deller@gmx.de>, Brian Foster <bfoster@redhat.com>, Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_120922_577517_D68AF25F 
X-CRM114-Status: GOOD (  16.87  )
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

On Tue, 4 Jun 2024 at 11:25, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>
> (I believe that the new _match_string(str1, size, str2) deserves a better name,
> but since I'm bad with naming stuff, I don't have any good suggestion)

I hated the enormous cc list, so I didn't reply to all. But clearly
everybody else is just doing so.

Anyway, here's my NAK for this patch with explanation:

    https://lore.kernel.org/all/CAHk-=wg5F99-GZPETsasJd0JB0JGcdmmPeHRxCtT4_i83h8avg@mail.gmail.com/

and part of it was the naming, but there were other oddities there too.

           Linus

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
