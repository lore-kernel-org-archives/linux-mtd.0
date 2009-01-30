Received: from mailbox-us-s-12.mailhostingserver.com ([75.125.101.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LSteY-0004g9-1q
	for linux-mtd@lists.infradead.org; Fri, 30 Jan 2009 13:43:29 +0000
Date: Fri, 30 Jan 2009 14:43:18 +0100
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: [BUG] physmap_flash_probe() frees memory still in use
Message-ID: <20090130134317.GV9390@traven>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org,
	David Woodhouse <David.Woodhouse@intel.com>,
	Mike Frysinger <vapier.adi@gmail.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

as i reported earlier in this month
(http://lkml.org/lkml/2009/1/12/141) MTD partition names are screwed
up in 2.6.29-rcX.

commit 176bf2e0f10ecf1d20a97db3bd5bb2e6ba0b5668 deals with a memory
leak and frees the pointer array of mtd_partition after the call to
add_mtd_partitions(). the problem is that mtd_table[x]->name still
points to the freed memory.

-- 
Matthias Kaehlcke
Embedded Linux Engineer
Barcelona

               For to be free is not merely to cast off
               one's chains, but to live in a way that
              respects and enhances the freedom of others
                           (Nelson Mandela)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
