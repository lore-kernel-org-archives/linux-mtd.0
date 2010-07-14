Received: from mail.solarflare.com ([216.237.3.220]
	helo=exchange.solarflare.com)
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OZ5k1-00008w-N4
	for linux-mtd@lists.infradead.org; Wed, 14 Jul 2010 17:27:30 +0000
Subject: Re: mtd: blktrans: Hotplug fixes
From: Ben Hutchings <bhutchings@solarflare.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain
Message-Id: <1279127694.2084.17.camel@achroite.uk.solarflarecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 14 Jul 2010 17:27:30 -0000

commit 048d87199566663e4edc4880df3703c04bcf41d9 "mtd: blktrans: Hotplug
fixes" causes the MTD and the MTD driver module's ref-counts to be
bumped for each block device that is created, whether or not it's
actually in use.

This means that before removing an MTD or driver module one must first
remove all the associated block devices.  But normally the block devices
will be removed only when the MTDs themselves are removed.  This mutual
dependency can't even be resolved by poking at 'unbind' files in sysfs,
because block-translation drivers don't appear in the driver model!

Unless I'm missing something, this does not fix hotplug but completely
breaks it.  Please revert it and find a better way to fix locking in the
block-translation layer.

Ben.

-- 
Ben Hutchings, Senior Software Engineer, Solarflare Communications
Not speaking for my employer; that's the marketing department's job.
They asked us to note that Solarflare product names are trademarked.
