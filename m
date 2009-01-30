Received: from mailbox-us-s-12.mailhostingserver.com ([75.125.101.9])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LSwTY-0003lF-CU
	for linux-mtd@lists.infradead.org; Fri, 30 Jan 2009 16:44:19 +0000
Date: Fri, 30 Jan 2009 17:44:12 +0100
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [BUG] physmap_flash_probe() frees memory still in use
Message-ID: <20090130164412.GC16711@traven>
References: <20090130134317.GV9390@traven>
	<20090131.005250.95064457.anemo@mba.ocn.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090131.005250.95064457.anemo@mba.ocn.ne.jp>
Cc: akpm@linux-foundation.org, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com, vapier.adi@gmail.com,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

El Sat, Jan 31, 2009 at 12:52:50AM +0900 Atsushi Nemoto ha dit:

> On Fri, 30 Jan 2009 14:43:18 +0100, Matthias Kaehlcke <matthias@kaehlcke.net> wrote:
> > as i reported earlier in this month
> > (http://lkml.org/lkml/2009/1/12/141) MTD partition names are screwed
> > up in 2.6.29-rcX.
> > 
> > commit 176bf2e0f10ecf1d20a97db3bd5bb2e6ba0b5668 deals with a memory
> > leak and frees the pointer array of mtd_partition after the call to
> > add_mtd_partitions(). the problem is that mtd_table[x]->name still
> > points to the freed memory.
> 
> Oh Yes, I had missed that point.  And looking at physmap driver again,
> I found that del_mtd_partition() and del_mtd_device() are abused.
> Though these APIs are robust enough, deleting right things in right
> order would be better.
> 
> Could you test this patch?  I cannot test it until Monday.

looks good!

Tested-By: Matthias Kaehlcke <matthias@kaehlcke.net>

-- 
Matthias Kaehlcke
Embedded Linux Engineer
Barcelona

                If you don't know where you are going,
               you will probably end up somewhere else
                         (Laurence J. Peter)
                                                                 .''`.
    using free software / Debian GNU/Linux | http://debian.org  : :'  :
                                                                `. `'`
gpg --keyserver pgp.mit.edu --recv-keys 47D8E5D4                  `-
