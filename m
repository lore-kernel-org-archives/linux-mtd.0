Received: from cantor.suse.de ([195.135.220.2] helo=mx1.suse.de)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OJ8Ll-0007jH-I2
	for linux-mtd@lists.infradead.org; Mon, 31 May 2010 17:00:30 +0000
Date: Mon, 31 May 2010 09:54:52 -0700
From: Greg KH <gregkh@suse.de>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] drivers: remove all i2c_set_clientdata(client, NULL)
Message-ID: <20100531165452.GA14066@suse.de>
References: <1275310552-14685-1-git-send-email-w.sang@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1275310552-14685-1-git-send-email-w.sang@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	linux-i2c@vger.kernel.org, devel@driverdev.osuosl.org,
	Samuel Ortiz <sameo@linux.intel.com>, lm-sensors@lm-sensors.org,
	linux-input@vger.kernel.org, linux-media@vger.kernel.org,
	Paul Gortmaker <p_gortmaker@yahoo.com>,
	Riku Voipio <riku.voipio@iki.fi>, rtc-linux@googlegroups.com,
	Alessandro Rubini <rubini@ipvvis.unipv.it>,
	Mauro Carvalho Chehab <mchehab@infradead.org>,
	Jean Delvare <khali@linux-fr.org>,
	"Ben Dooks \(embedded platforms\)" <ben-linux@fluff.org>,
	Liam Girdwood <lrg@slimlogic.co.uk>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Guillaume Ligneul <guillaume.ligneul@gmail.com>,
	George Joseph <george.joseph@fairview5.com>,
	Mark Brown <broonie@opensource.wolfsonmicro.com>,
	linux-kernel@vger.kernel.org, Colin Leroy <colin@colino.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 31, 2010 at 02:55:48PM +0200, Wolfram Sang wrote:
> I2C-drivers can use the clientdata-pointer to point to private data. As I2C
> devices are not really unregistered, but merely detached from their driver, it
> used to be the drivers obligation to clear this pointer during remove() or a
> failed probe(). As a couple of drivers forgot to do this, it was agreed that it
> was cleaner if the i2c-core does this clearance when appropriate, as there is
> no guarantee for the lifetime of the clientdata-pointer after remove() anyhow.
> This feature was added to the core with commit
> e4a7b9b04de15f6b63da5ccdd373ffa3057a3681 to fix the faulty drivers.
> 
> As there is no need anymore to clear the clientdata-pointer, remove all current
> occurrences in the drivers to simplify the code and prevent confusion.
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> Cc: Jean Delvare <khali@linux-fr.org>

Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
