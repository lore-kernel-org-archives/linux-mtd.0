Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OirH7-000748-Ez
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 16:02:02 +0000
Received: by bwz19 with SMTP id 19so2749402bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Aug 2010 09:02:00 -0700 (PDT)
Date: Tue, 10 Aug 2010 20:01:57 +0400
From: Anton Vorontsov <cbouatmailru@gmail.com>
To: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [spi-devel-general] [PATCH v2 3/6] mtd: m25p80: add support to
	parse the SPI flash's partitions
Message-ID: <20100810160157.GA24553@oksana.dev.rtsoft.ru>
References: <AANLkTik9cy+at2n28U+Mut4RD6_cJ9uRZzjf+H86d-rp@mail.gmail.com>
	<796604.30863.qm@web180307.mail.gq1.yahoo.com>
	<AANLkTi=FGf9gbWDkO4qs01Z+qkip+Zm11=Jc4wHu3G8b@mail.gmail.com>
	<OF0D24DC16.E1FE65D2-ONC125777B.002E544A-C125777B.002EA7C2@transmode.se>
	<AANLkTinYYTj+dR6ckPoShHKZTUmENEA1O-DYP9mjnWrs@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AANLkTinYYTj+dR6ckPoShHKZTUmENEA1O-DYP9mjnWrs@mail.gmail.com>
Cc: Joakim Tjernlund <joakim.tjernlund@transmode.se>, kumar.gala@freescale.com,
	David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	spi-devel-general@lists.sourceforge.net,
	"linuxppc-dev@ozlabs.org Mingkai Hu" <Mingkai.hu@freescale.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 10, 2010 at 08:56:42AM -0600, Grant Likely wrote:
[...] 
> The suggestion has been raised to use something like bus notifiers to
> get a hook onto the device registration before the driver is probed so
> that the platform_data can be translated in an separate chuck of code,
> but down that path lies insanity.  There are all kinds of ordering
> issues (like making sure the translation code is called before the
> driver probe code), and it is a lot of complexity for what is really a
> simple thing.

There's another option: platform data handlers (they could be
chained, in case if we want to use several methods of obtaining
platform data, i.e. "try raw data, then ACPI, then OF").

See include/linux/spi/mmc_spi.h (mmc_spi_get_pdata)
and drivers/mmc/host/of_mmc_spi.c.

I think we might implement some library to make these handlers
more generic, but even the simple implementation as in mmc_spi
case proves that it is possible to separate OF/ACPI/DMI/whatever
handling from the generic code.

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
