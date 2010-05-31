Received: from poutre.ipv6.nerim.net ([2001:7a8:1:1::124]
	helo=poutre.nerim.net)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJC3d-0001KG-AR
	for linux-mtd@lists.infradead.org; Mon, 31 May 2010 20:58:02 +0000
Date: Mon, 31 May 2010 22:57:50 +0200
From: Jean Delvare <khali@linux-fr.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] drivers: remove all i2c_set_clientdata(client, NULL)
Message-ID: <20100531225750.0dc18950@hyperion.delvare>
In-Reply-To: <20100531190911.GC30712@core.coreip.homeip.net>
References: <1275310552-14685-1-git-send-email-w.sang@pengutronix.de>
	<20100531190911.GC30712@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Greg Kroah-Hartman <gregkh@suse.de>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org,
	linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
	devel@driverdev.osuosl.org, Samuel Ortiz <sameo@linux.intel.com>,
	lm-sensors@lm-sensors.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, Paul Gortmaker <p_gortmaker@yahoo.com>,
	Riku Voipio <riku.voipio@iki.fi>, rtc-linux@googlegroups.com,
	Alessandro Rubini <rubini@ipvvis.unipv.it>,
	Mauro Carvalho Chehab <mchehab@infradead.org>, "Ben Dooks \(embedded
	platforms\)" <ben-linux@fluff.org>, Liam Girdwood <lrg@slimlogic.co.uk>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Guillaume Ligneul <guillaume.ligneul@gmail.com>,
	George Joseph <george.joseph@fairview5.com>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	Wolfram Sang <w.sang@pengutronix.de>, Colin Leroy <colin@colino.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dmitry,

On Mon, 31 May 2010 12:09:12 -0700, Dmitry Torokhov wrote:
> Frankly I'd prefer taking input stuff through my tree with the goal of
> .36 merge window just to minimize potential merge issues. This is a
> simple cleanup patch that has no dependencies, so there is little gain
> from doing it all in one go.

If I take the patch in my i2c tree, the aim is to merge it upstream
immediately, so merge issues won't exist.

-- 
Jean Delvare
