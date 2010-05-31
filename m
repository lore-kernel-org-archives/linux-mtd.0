Received: from mail-pz0-f185.google.com ([209.85.222.185])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJAMU-0002ME-4I
	for linux-mtd@lists.infradead.org; Mon, 31 May 2010 19:09:23 +0000
Received: by pzk15 with SMTP id 15so978507pzk.15
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 May 2010 12:09:19 -0700 (PDT)
Date: Mon, 31 May 2010 12:09:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] drivers: remove all i2c_set_clientdata(client, NULL)
Message-ID: <20100531190911.GC30712@core.coreip.homeip.net>
References: <1275310552-14685-1-git-send-email-w.sang@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1275310552-14685-1-git-send-email-w.sang@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@suse.de>,
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

Hi Wolfram,

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
> ---
> 
> Some more notes:
> 
> I waited for rc1 as I knew there were some drivers/patches coming along which
> needed to be processed, too.
> 
> I'd suggest that this goes via the i2c-tree, so we get rid of all occurences at
> once.
> 

Frankly I'd prefer taking input stuff through my tree with the goal of
.36 merge window just to minimize potential merge issues. This is a
simple cleanup patch that has no dependencies, so there is little gain
from doing it all in one go.

Thanks.

-- 
Dmitry
