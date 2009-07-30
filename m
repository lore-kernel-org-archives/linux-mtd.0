Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MWL8X-0007fM-Ix
	for linux-mtd@lists.infradead.org; Thu, 30 Jul 2009 02:12:57 +0000
Date: Thu, 30 Jul 2009 06:12:50 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 1/7] spi: Add support for device table matching
Message-ID: <20090730021250.GA12001@oksana.dev.rtsoft.ru>
References: <20090729170345.GA26787@oksana.dev.rtsoft.ru>
	<20090729170457.GA4803@oksana.dev.rtsoft.ru>
	<20090729214446.GB1728@fluff.org.uk>
	<20090729223223.GA15280@oksana.dev.rtsoft.ru>
	<20090729224050.GA17902@oksana.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20090729224050.GA17902@oksana.dev.rtsoft.ru>
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

On Thu, Jul 30, 2009 at 02:40:50AM +0400, Anton Vorontsov wrote:
[...]
> - If you don't store "id" in the device struct, you'll have
>   to look up the device table twice (at first during bus->match(),
>   and second time in drivers' probe() hook, i.e.
>   probe(struct bus_dev *dev) {
>   	id = bus_get_devid(dev); /* here */
>   }

Hm... actually, we're doing this anyway, but in spi core.

So, doing something like spi_get_device_id() might be a good
idea.

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
