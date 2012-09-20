Date: Wed, 19 Sep 2012 21:16:31 -0400
From: Mark Brown <broonie@opensource.wolfsonmicro.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 04/29] ARM: OMAP1: Move board-ams-delta.h from plat to mach
Message-ID: <20120920011630.GB17666@opensource.wolfsonmicro.com>
References: <20120919205732.28074.43697.stgit@muffinssi>
 <20120919210543.28074.10214.stgit@muffinssi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120919210543.28074.10214.stgit@muffinssi>
Cc: linux-fbdev@vger.kernel.org, Janusz Krzysztofik <jkrzyszt@tis.icnet.pl>,
 Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, alsa-devel@alsa-project.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-mtd@lists.infradead.org, linux-input@vger.kernel.org,
 linux-omap@vger.kernel.org, Liam Girdwood <lrg@ti.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 19, 2012 at 02:05:43PM -0700, Tony Lindgren wrote:
> This is only used by omap1.
> 
> And to fix things properly, this should not be included
> from the drivers at all.

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

or I can apply it if that's easier.
