Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWHhB-0008Im-AR
	for linux-mtd@lists.infradead.org; Wed, 29 Jul 2009 22:32:29 +0000
Date: Thu, 30 Jul 2009 02:32:23 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 1/7] spi: Add support for device table matching
Message-ID: <20090729223223.GA15280@oksana.dev.rtsoft.ru>
References: <20090729170345.GA26787@oksana.dev.rtsoft.ru>
	<20090729170457.GA4803@oksana.dev.rtsoft.ru>
	<20090729214446.GB1728@fluff.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20090729214446.GB1728@fluff.org.uk>
Cc: David Brownell <dbrownell@users.sourceforge.net>,
	linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Jean Delvare <khali@linux-fr.org>,
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

On Wed, Jul 29, 2009 at 10:44:46PM +0100, Ben Dooks wrote:
[...]
> > +	const struct spi_device_id *id_table;
> > +	int			(*probe_id)(struct spi_device *spi,
> > +					    const struct spi_device_id *id);
> 
> how about leaving it at just probe and have either a call or a field
> in the device that you can look at to see if this was a new style of
> call?

There are no technical difficulties with that, but it would be
inconsitent wrt other "device table"-aware buses (i2c, pci, of).

Note that I'm getting rid of probe_id function in patch 5/7, as a
cleanup step. I want to keep "new features" and "api cleanups"
separate. That way it's easier to review the changes.

Thanks!

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
