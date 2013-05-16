Message-ID: <5195257F.3060309@wwwdotorg.org>
Date: Thu, 16 May 2013 12:29:19 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
To: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 00/33] devm improvement series, part 1, take 2
References: <1368702961-4325-1-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1368702961-4325-1-git-send-email-wsa@the-dreams.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, Matt Mackall <mpm@selenic.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, linux-ide@vger.kernel.org,
 Wim Van Sebroeck <wim@iguana.be>, netdev@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Evgeniy Polyakov <zbr@ioremap.net>, Wan ZongShun <mcuos.com@gmail.com>,
 ac100@lists.launchpad.net, devel@driverdev.osuosl.org,
 Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Marc Dietrich <marvin24@gmx.de>, "Rafael J. Wysocki" <rjw@sisk.pl>,
 cpufreq@vger.kernel.org, Eduardo Valentin <eduardo.valentin@ti.com>,
 David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Alan Stern <stern@rowland.harvard.edu>, Grant Likely <grant.likely@linaro.org>,
 Zhang Rui <rui.zhang@intel.com>,
 Thierry Reding <thierry.reding@avionic-design.de>,
 Deepak Saxena <dsaxena@plexity.net>, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 Julian Andres Klode <jak@jak-linux.org>, Inki Dae <inki.dae@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
 Barry Song <baohua.song@csr.com>, linux-tegra@vger.kernel.org,
 rtc-linux@googlegroups.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 spi-devel-general@lists.sourceforge.net,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Felipe Balbi <balbi@ti.com>, Tony Prisk <linux@prisktech.co.nz>,
 Vinod Koul <vinod.koul@intel.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 Dan Williams <djbw@fb.com>, Tejun Heo <tj@kernel.org>,
 Samuel Ortiz <sameo@linux.intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Paul Zimmerman <paulz@synopsys.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/16/2013 05:15 AM, Wolfram Sang wrote:
> Lately, I have been experimenting how to improve the devm interface to make
> writing device drivers easier and less error prone while also getting rid of
> its subtle issues. I think it has more potential but still needs work and
> definately conistency, especiall in its usage.
...

The Tegra parts in patches 4, 5, 8, 15, 16, 17, 29 all,
Acked-by: Stephen Warren <swarren@nvidia.com>
