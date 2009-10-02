Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mtil5-0003gJ-Fv
	for linux-mtd@lists.infradead.org; Fri, 02 Oct 2009 14:05:24 +0000
Date: Fri, 2 Oct 2009 16:05:10 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>, Aaro Koskinen
	<aaro.koskinen@nokia.com>, Artem.Bityutskiy@nokia.com
Subject: [PATCH 0/3]: mtdoops fixes and improvements
Message-ID: <20091002160510.191ef5a4@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Here are a couple of patches to mtdoops which I've been working on for
a while. The patches are:

1. Make page size configurable (to support longer messages)

2. Use panic_write if panic_on_oops is set. This is essentially the
   same as Aaro sent earlier today (funny coincidence!), but contains
   some other fixes around the same area. This unbreaks the case when
   panic_on_oops is set.

3. Store all kernel messages in a circular buffer. This changes the
   behavior of mtdoops a bit by constantly recording messages (not only
   on oopses), which are written out on oopses and panics.

   The code is changed to register a panic handler which calls the
   write function.

// Simon
