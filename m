Received: from 64-166-72-137.ayrnetworks.com ([64.166.72.137] helo=ayrnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nCjU-0003HX-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 06:04:28 +0000
Received: (from wjhun@localhost)
	by  ayrnetworks.com (8.11.2/8.11.2) id g2J6EoX16611
	for linux-mtd@lists.infradead.org; Mon, 18 Mar 2002 22:14:50 -0800
Date: Mon, 18 Mar 2002 22:14:49 -0800
From: William Jhun <wjhun@ayrnetworks.com>
To: linux-mtd@lists.infradead.org
Subject: Initialization ordering problem
Message-ID: <20020318221449.L6821@ayrnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hello,

Since mtd chip drivers (cfi_probe.c, etc) register their presence during
module (or __initcall) initialization, an attempt to probe for flash
devices before all mtd components have initialized may fail. Our
platform-specific code (which in turn calls do_map_probe() in chipreg.c)
just happens to get linked in before the mtd code. Resultingly, all
probes fail as the required chip drivers are not present. Is there a
better solution for this than changing the link order? Had the chip
drivers been available as modules and CONFIG_KMOD set, they would have
been loaded and initialized on-demand. However, when linking everything
statically, this fails miserably. I could work up some kludge to make
our platform-specific flash initialization code link in after the mtd
code, but this would be ugly.

Any ideas?

Thanks,
Will
