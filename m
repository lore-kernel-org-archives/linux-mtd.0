Received: from mail.solarflare.com ([216.237.3.220]
	helo=exchange.solarflare.com)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oci8S-0001K1-TE
	for linux-mtd@lists.infradead.org; Sat, 24 Jul 2010 17:03:41 +0000
Subject: Re: [PATCH 2.6.35] mtd: blktrans: Move device and module
	ref-counting  back to open/release
From: Ben Hutchings <bhutchings@solarflare.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <AANLkTi=Aw=yFCsz4PArNoMVOpOU567ffzUHooVvXKQtF@mail.gmail.com>
References: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
	<1279820660.2104.27.camel@achroite.uk.solarflarecom.com>
	<AANLkTi=Aw=yFCsz4PArNoMVOpOU567ffzUHooVvXKQtF@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 24 Jul 2010 18:03:28 +0100
Message-ID: <1279991008.4915.7.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2010-07-24 at 19:07 +0300, Maxim Levitsky wrote:
> This is done on purpose.
> 
> Otherwise, as soon as someone registers mtd translation layer with partitions,
> the add_gendisk will scan partitions and thus call blktrans_open()
> and mtd_table_mutex is already held.

OK, I get it.  Maybe that should be deferred to a work item.

> Here I can unload both mtd and blktrans driver after mtd driver
> removes mtd device (that happens when I remove the xD card)
> While card is inserted its indeed not possible to remove nether mtd
> nor translation layer driver.

This only works if the MTD itself is hotplugged, and not if the MTD's
parent is hotplugged.  In fixing one case you have broken the other.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
