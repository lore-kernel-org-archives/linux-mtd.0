Date: Wed, 30 Apr 2014 23:07:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/5] ARM: defconfigs: add MTD_SPI_NOR (new dependency for
 M25P80)
Message-ID: <20140501060739.GH2497@norris-Latitude-E6410>
References: <1397719309-2022-1-git-send-email-computersforpeace@gmail.com>
 <1397719309-2022-2-git-send-email-computersforpeace@gmail.com>
 <535A8FC9.8040707@wwwdotorg.org>
 <20140429190603.GB9418@norris-Latitude-E6410>
 <536000BA.4000101@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <536000BA.4000101@wwwdotorg.org>
Cc: Marek Vasut <marex@denx.de>, Russell King <linux@arm.linux.org.uk>,
 "arm@kernel.org" <arm@kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 29, 2014 at 01:42:50PM -0600, Stephen Warren wrote:
> I guess you could also just see if arm-soc (arm@kernel.org) will take
> this patch, and deal with any merge conflicts that arise when they merge
> all the sub-arch defconfig changes. I CC'd them to find out if they
> think that's a better idea.

I'm preparing a split patch series and should send v2 shortly. A few of
the unaccounted platforms + the multi-platform are lumped together for
direct inclusion in arm-soc (?).

What is this arm@kernel.org you speak of? My Google-fu doesn't turn up a
separate arm-soc email / mailing list, and it's not in MAINTAINERS.

Brian
