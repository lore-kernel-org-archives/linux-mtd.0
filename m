Date: Thu, 16 May 2013 18:13:58 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 00/33] devm improvement series, part 1, take 2
Message-ID: <20130516161355.GA3032@katana>
References: <1368702961-4325-1-git-send-email-wsa@the-dreams.de>
 <1368705452.15764.217.camel@sauron.fi.intel.com>
 <CAKohpokUy7QfvKkzGH025Zs5VkUhr8zRLeo3caG3LAnLfptzww@mail.gmail.com>
 <1368709862.15764.224.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1368709862.15764.224.camel@sauron.fi.intel.com>
Cc: linux-mips@linux-mips.org, alsa-devel@alsa-project.org,
 Alessandro Zummo <a.zummo@towertech.it>, Liam Girdwood <lgirdwood@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
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
 Julian Andres Klode <jak@jak-linux.org>, Dan Williams <djbw@fb.com>,
 "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org,
 Ben Dooks <ben-linux@fluff.org>, Matt Mackall <mpm@selenic.com>,
 linux-tegra@vger.kernel.org, rtc-linux@googlegroups.com,
 Marc Dietrich <marvin24@gmx.de>, linux-arm-kernel@lists.infradead.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>,
 netdev@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
 linux-usb@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Tony Prisk <linux@prisktech.co.nz>, Kyungmin Park <kyungmin.park@samsung.com>,
 Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Barry Song <baohua.song@csr.com>,
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


> I need a defconfig which would have this driver enabled. 

My wish would be a minimal config. Right now, I try to build the driver
with the current config and when that fails I grep through the
(uncompressed) defconfigs for the symbol needed. Gives me 45/57 success
rate on this series. Not perfect, but the best I could come up with
without writing a .config-generator myself.
