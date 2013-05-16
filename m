Received: from mail-oa0-f53.google.com ([209.85.219.53])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ucxj3-0003Nm-Ek
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 12:56:06 +0000
Received: by mail-oa0-f53.google.com with SMTP id g12so3636216oah.26
 for <linux-mtd@lists.infradead.org>; Thu, 16 May 2013 05:55:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1368705452.15764.217.camel@sauron.fi.intel.com>
References: <1368702961-4325-1-git-send-email-wsa@the-dreams.de>
 <1368705452.15764.217.camel@sauron.fi.intel.com>
Date: Thu, 16 May 2013 18:25:42 +0530
Message-ID: <CAKohpokUy7QfvKkzGH025Zs5VkUhr8zRLeo3caG3LAnLfptzww@mail.gmail.com>
Subject: Re: [PATCH 00/33] devm improvement series, part 1, take 2
From: Viresh Kumar <viresh.kumar@linaro.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mips@linux-mips.org, alsa-devel@alsa-project.org,
 Alessandro Zummo <a.zummo@towertech.it>, Wolfram Sang <wsa@the-dreams.de>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@avionic-design.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 linux-ide@vger.kernel.org, Wim Van Sebroeck <wim@iguana.be>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Evgeniy Polyakov <zbr@ioremap.net>, ac100@lists.launchpad.net,
 devel@driverdev.osuosl.org, Kukjin Kim <kgene.kim@samsung.com>,
 Russell King <linux@arm.linux.org.uk>,
 Herbert Xu <herbert@gondor.apana.org.au>, Samuel Ortiz <sameo@linux.intel.com>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Vinod Koul <vinod.koul@intel.com>, linux-pm@vger.kernel.org,
 cpufreq@vger.kernel.org, Eduardo Valentin <eduardo.valentin@ti.com>,
 David Airlie <airlied@linux.ie>, linux-omap@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Alan Stern <stern@rowland.harvard.edu>,
 Felipe Balbi <balbi@ti.com>, Grant Likely <grant.likely@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Deepak Saxena <dsaxena@plexity.net>, linux-watchdog@vger.kernel.org,
 Wan ZongShun <mcuos.com@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>,
 Julian Andres Klode <jak@jak-linux.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Dan Williams <djbw@fb.com>, "Rafael J. Wysocki" <rjw@sisk.pl>,
 linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
 Matt Mackall <mpm@selenic.com>, linux-tegra@vger.kernel.org,
 rtc-linux@googlegroups.com, Marc Dietrich <marvin24@gmx.de>,
 linux-arm-kernel@lists.infradead.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Inki Dae <inki.dae@samsung.com>, netdev@vger.kernel.org,
 Takashi Iwai <tiwai@suse.de>, linux-usb@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Tony Prisk <linux@prisktech.co.nz>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Barry Song <baohua.song@csr.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
 spi-devel-general@lists.sourceforge.net,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Paul Zimmerman <paulz@synopsys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 May 2013 17:27, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2013-05-16 at 13:15 +0200, Wolfram Sang wrote:
>> Despite various architectures and platform dependencies, I managed to
>> compile
>> test 45 out of 57 modified files locally using heuristics and
>> defconfigs.
>> If somebody knows how to create a minimal .config with a certain
>> kconfig symbol
>> (and its dependencies) set, I'd love to hear about it.
>
> If you find this out, please, share!

Are you guys looking for "make savedefconfig" ??
