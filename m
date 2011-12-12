Date: Sun, 11 Dec 2011 21:00:22 -0800
From: Jonathan McDowell <noodles@earth.li>
To: Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>
Subject: Re: [PATCH 00/10] ARM: OMAP1: ams-delta: replace custom I/O with GPIO
Message-ID: <20111212050022.GI16333@earth.li>
References: <1323634328-856-1-git-send-email-jkrzyszt@tis.icnet.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1323634328-856-1-git-send-email-jkrzyszt@tis.icnet.pl>
Cc: linux-fbdev@vger.kernel.org,
 Mark Brown <broonie@opensource.wolfsonmicro.com>,
 Tony Lindgren <tony@atomide.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Grant Likely <grant.likely@secretlab.ca>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-arm-kernel@lists.infradead.org,
 linux-input@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Liam Girdwood <lrg@ti.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 11, 2011 at 09:11:58PM +0100, Janusz Krzysztofik wrote:
> The Amstrad Delta board has two extra output ports used for driving
> input lines of different on-board devices. Those ports are now
> controlled with custom functions, provided by the board arch code and
> used by several device drivers.
> 
> The idea behind the series is to replace those custom I/O functions
> with gpiolib API. This way, existing drivers can be made less platform
> dependent, and some of them perhaps even superseded with generic GPIO
> based drivers after the board platform device descriptions are
> converted. Moreover, should a new driver for the on-board Smart Card
> controller ever be created, it could be designed as a generic GPIO
> based driver, not a custom one.

Nice work; moving ams-delta over to gpiolib has been on my todo list for
a while (albeit quite low down).

J.

-- 
I just Fedexed my soul to hell. I'm *real* clever.
