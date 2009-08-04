Received: from n11.bullet.mail.mud.yahoo.com ([209.191.125.210])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYURr-0000q9-LB
	for linux-mtd@lists.infradead.org; Wed, 05 Aug 2009 00:33:47 +0000
From: David Brownell <david-b@pacbell.net>
To: avorontsov@ru.mvista.com
Subject: Re: [PATCH 0/7] Device table matching for SPI subsystem
Date: Mon, 3 Aug 2009 19:16:02 -0700
References: <20090729170345.GA26787@oksana.dev.rtsoft.ru>
In-Reply-To: <20090729170345.GA26787@oksana.dev.rtsoft.ru>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200908031916.02880.david-b@pacbell.net>
Cc: David Brownell <dbrownell@users.sourceforge.net>,
	linux-kernel@vger.kernel.org, lm-sensors@lm-sensors.org,
	Grant Likely <grant.likely@secretlab.ca>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Jean Delvare <khali@linux-fr.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 29 July 2009, Anton Vorontsov wrote:
> 	platform_data is overkill for m25p80 chips, the
> driver only needs to know exact chip model, and that's what device
> tables are for.

To be fair, the platform_data also supports partitioning
and labeling e.g. for cmdlinepart ... though I'd tend to
agree that most SPI flash chips are kind of small (so
they're mostly just one smallish partition).
