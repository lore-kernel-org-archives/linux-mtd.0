Received: from mail.dev.rtsoft.ru ([213.79.90.226])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYUxT-000113-5C
	for linux-mtd@lists.infradead.org; Wed, 05 Aug 2009 01:06:27 +0000
Date: Wed, 5 Aug 2009 05:06:20 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 1/7] spi: Add support for device table matching
Message-ID: <20090805010620.GB14451@oksana.dev.rtsoft.ru>
References: <20090729170345.GA26787@oksana.dev.rtsoft.ru>
	<20090729170457.GA4803@oksana.dev.rtsoft.ru>
	<20090729214446.GB1728@fluff.org.uk>
	<200908031921.23126.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200908031921.23126.david-b@pacbell.net>
Cc: linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Ben Dooks <ben-linux@fluff.org>, Jean Delvare <khali@linux-fr.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: avorontsov@ru.mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 03, 2009 at 07:21:22PM -0700, David Brownell wrote:
> On Wednesday 29 July 2009, Ben Dooks wrote:
> > >  struct spi_driver {
> > > +     const struct spi_device_id *id_table;
> > > +     int                     (*probe_id)(struct spi_device *spi,
> > > +                                         const struct spi_device_id *id);
> > 
> > how about leaving it at just probe and have either a call or a field
> > in the device that you can look at to see if this was a new style of
> > call?
> > 
> > >       int                     (*probe)(struct spi_device *spi);
> 
> For the record, if this is going to happen I think the
> appropriate long-term solution is to have probe() take
> the device_id just as it does with other busses.

Just curious. Why you prefer another argument in the probe()
instead of calling some helper function? Most drivers don't
need the "id" argument, so why spend memory and cpu cycles
for it?

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
