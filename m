Received: from [213.79.90.228] (helo=buildserver.ru.mvista.com)
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYUla-00056v-Mm
	for linux-mtd@lists.infradead.org; Wed, 05 Aug 2009 00:54:10 +0000
Date: Wed, 5 Aug 2009 04:54:04 +0400
From: Anton Vorontsov <avorontsov@ru.mvista.com>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [PATCH 0/7] Device table matching for SPI subsystem
Message-ID: <20090805005404.GA14451@oksana.dev.rtsoft.ru>
References: <20090729170345.GA26787@oksana.dev.rtsoft.ru>
	<200908031916.02880.david-b@pacbell.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <200908031916.02880.david-b@pacbell.net>
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

On Mon, Aug 03, 2009 at 07:16:02PM -0700, David Brownell wrote:
> On Wednesday 29 July 2009, Anton Vorontsov wrote:
> > 	platform_data is overkill for m25p80 chips, the
> > driver only needs to know exact chip model, and that's what device
> > tables are for.
> 
> To be fair, the platform_data also supports partitioning
> and labeling e.g. for cmdlinepart ...

With OF we do partitioning and labling via drivers/mtd/ofpart.c.

Though, so far there is no support for OF partitions in the m25p80
driver. I think we'd better put the OF partitions probing into
parse_mtd_partitions(), and avoid calling of_mtd_parse_partitons()
directly...

Thanks,

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
