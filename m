Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUah9-0002JN-76
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 08:34:27 +0000
Received: by wwb39 with SMTP id 39so1057706wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 01:34:25 -0700 (PDT)
Date: Thu, 9 Jun 2011 12:34:19 +0400
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Question reg. parsing of mtd partitions
Message-ID: <20110609083419.GA23553@doriath.ww600.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello, colleagues,

While doing MTD partitions cleanup I noticed one strange thing.
parse_mtd_partitions function bears one extra argument (origin)
which isn't clearly described, set to non-zero only by ixp4xx.c
driver and then read by redboot partition table handling. I wander if we
can add some other way to handle this situation and drop this extra 0
argument from lots of drivers/handlers/etc.

Could you please check it?

-- 
With best wishes
Dmitry
