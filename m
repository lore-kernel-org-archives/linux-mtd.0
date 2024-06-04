Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 679D5C25B75
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2024 01:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CDHVRjIcsOnEG2GYwclIqIBTA/7FZGk9qcVkXuz6BMo=; b=sfH2y4rU7t3U66D9iHFYiGEfTl
	dp3Y078qeN4QpimhDr5/E9r74G6rJQUtWbGDdeAxE1UEXumW2fYYdNzEqD5DwIHj8yvhz62bDhDsB
	tNEt6sVf3qqz/LdDMiZTZwIQTUEEBqEfl4XbguRFbfBuUYWxGVWT624lU2+VItP6z0FWTGaTx/kIF
	xWPdo6UmcNbD5g8gv+3N7L1LjKFCfDpLbWOSP+J+mIcsLYnT0y+o/UwxIk/GDwOJ0+3EyW87eVjkb
	1kxzjxgzPWuXB0wO/aiGqEnMFpsrV/pv1bQ6VtaCsXVdH3XszdTMXLkIxeVpXCVDFczL+pEKYZzqb
	JzAqogxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJ88-00000000psH-0MZh;
	Tue, 04 Jun 2024 01:38:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEJ83-00000000ppP-2LDX;
	Tue, 04 Jun 2024 01:38:25 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VtY6M5szWzwRV0;
	Tue,  4 Jun 2024 09:34:19 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C016180069;
	Tue,  4 Jun 2024 09:38:14 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 09:38:02 +0800
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, Allen Pais
	<apais@linux.microsoft.com>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, Perry Yuan <perry.yuan@amd.com>, Giovanni
 Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>, Guenter Roeck
	<linux@roeck-us.net>, Randy Dunlap <rdunlap@infradead.org>, Andi Shyti
	<andi.shyti@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones
	<lee@kernel.org>, Samuel Holland <samuel@sholland.org>, Elad Nachman
	<enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Johannes
 Berg <johannes.berg@intel.com>, Gregory Greenman
	<gregory.greenman@intel.com>, Benjamin Berg <benjamin.berg@intel.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>, Vinod Koul
	<vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Linus Walleij
	<linus.walleij@linaro.org>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>, Nikita
 Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Srinivas
 Pandruvada <srinivas.pandruvada@linux.intel.com>, Stanley Chang
	<stanley_chang@realtek.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, Abdel Alkuor <abdelalkuor@geotab.com>,
	Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers
	<ebiggers@google.com>, Kees Cook <keescook@chromium.org>, Ingo Molnar
	<mingo@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, Daniel
 Bristot de Oliveira <bristot@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, Abel Wu
	<wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>, Mimi
 Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>, Roberto
 Sassu <roberto.sassu@huawei.com>, Eric Snowberg <eric.snowberg@oracle.com>,
	Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Mark Brown
	<broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-ide@vger.kernel.org>,
	<openipmi-developer@lists.sourceforge.net>, <linux-clk@vger.kernel.org>,
	<linux-rpi-kernel@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<qat-linux@intel.com>, <dri-devel@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-omap@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-usb@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
	<linux-bcachefs@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<cgroups@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <apparmor@lists.ubuntu.com>,
	<linux-security-module@vger.kernel.org>, <linux-integrity@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
CC: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Daniel Scally <djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mario Limonciello <mario.limonciello@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Tony Lindgren <tony@atomide.com>, Adrian Hunter <adrian.hunter@intel.com>, Hu Ziji <huziji@marvell.com>, Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Potnuri Bharat Teja <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Miri Korenblit <miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, JC Kuo <jckuo@nvidia.com>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sebastian Reichel <sre@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Helge Deller <deller@gmx.de>, Brian Foster <bfoster@redhat.com>, Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a6cff4d3-821a-3723-b261-3699053b5a51@huawei.com>
Date: Tue, 4 Jun 2024 09:37:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
X-Originating-IP: [10.174.178.46]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_183823_966897_A79F7275 
X-CRM114-Status: GOOD (  18.75  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

1NogMjAyNC82LzIgMjM6NTcsIEFuZHkgU2hldmNoZW5rbyDQtLXAOgo+IE1ha2UgdHdvIEFQSXMg
bG9vayBzaW1pbGFyLiBIZW5jZSBjb252ZXJ0IG1hdGNoX3N0cmluZygpIHRvIGJlCj4gYSAyLWFy
Z3VtZW50IG1hY3JvLiBJbiBvcmRlciB0byBhdm9pZCB1bm5lZWRlZCBjaHVybiwgY29udmVydAo+
IGFsbCB1c2VycyBhcyB3ZWxsLiBUaGVyZSBpcyBubyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRl
ZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtv
QGxpbnV4LmludGVsLmNvbT4KPiAtLS0KPiAKPiBDb21waWxlIHRlc3RlZCB3aXRoIGBtYWtlIGFs
bHllc2NvbmZpZ2AgYW5kIGBtYWtlIGFsbG1vZGNvbmZpZ2AKPiBvbiB4ODZfNjQsIGFybSwgYWFy
Y2g2NCwgcG93ZXJwYzY0ICg4IGJ1aWxkcyB0b3RhbCkuCj4gCgpbLi4uXQo+IGRpZmYgLS1naXQg
YS9mcy91Ymlmcy9hdXRoLmMgYi9mcy91Ymlmcy9hdXRoLmMKPiBpbmRleCBhNGEwMTU4ZjcxMmQu
LmZjMGRhMThiZmE2NSAxMDA2NDQKPiAtLS0gYS9mcy91Ymlmcy9hdXRoLmMKPiArKysgYi9mcy91
Ymlmcy9hdXRoLmMKPiBAQCAtMjY0LDEzICsyNjQsMTMgQEAgaW50IHViaWZzX2luaXRfYXV0aGVu
dGljYXRpb24oc3RydWN0IHViaWZzX2luZm8gKmMpCj4gICAJCXJldHVybiAtRUlOVkFMOwo+ICAg
CX0KPiAgIAo+IC0JYy0+YXV0aF9oYXNoX2FsZ28gPSBtYXRjaF9zdHJpbmcoaGFzaF9hbGdvX25h
bWUsIEhBU0hfQUxHT19fTEFTVCwKPiAtCQkJCQkgYy0+YXV0aF9oYXNoX25hbWUpOwo+IC0JaWYg
KChpbnQpYy0+YXV0aF9oYXNoX2FsZ28gPCAwKSB7Cj4gKwllcnIgPSBfX21hdGNoX3N0cmluZyho
YXNoX2FsZ29fbmFtZSwgSEFTSF9BTEdPX19MQVNULCBjLT5hdXRoX2hhc2hfbmFtZSk7Cj4gKwlp
ZiAoZXJyIDwgMCkgewo+ICAgCQl1Ymlmc19lcnIoYywgIlVua25vd24gaGFzaCBhbGdvICVzIHNw
ZWNpZmllZCIsCj4gICAJCQkgIGMtPmF1dGhfaGFzaF9uYW1lKTsKPiAtCQlyZXR1cm4gLUVJTlZB
TDsKPiArCQlyZXR1cm4gZXJyOwo+ICAgCX0KPiArCWMtPmF1dGhfaGFzaF9hbGdvID0gZXJyOwo+
ICAgCj4gICAJc25wcmludGYoaG1hY19uYW1lLCBDUllQVE9fTUFYX0FMR19OQU1FLCAiaG1hYygl
cykiLAo+ICAgCQkgYy0+YXV0aF9oYXNoX25hbWUpOwoKUmV2aWV3ZWQtYnk6IFpoaWhhbyBDaGVu
ZyA8Y2hlbmd6aGloYW8xQGh1YXdlaS5jb20+ICAjIGZzL3ViaWZzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
