Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCXow-0006wF-LC
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 20:19:07 +0000
Date: Thu, 1 Dec 2016 21:00:27 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Steve Longerbeam <steve_longerbeam@mentor.com>
cc: Brian Norris <computersforpeace@gmail.com>,
 Jim Baxter <jim_baxter@mentor.com>, Sandeep Jain <Sandeep_Jain@mentor.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, kbuild-all@01.org
Subject: [mtd-next:master 11/11] drivers/mtd/mtdcore.c:1786:29-32: ERROR:
 reference preceded by free on line 1784 (fwd)
Message-ID: <alpine.DEB.2.20.1612012058000.2068@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's a false positive from Coccinelle, but I wonder if it's really worth
it.  Perhaps the code would be simpler with if (ret) { kfree(bdi); return
ERR_PTR(ret); } return bdi;

julia



tree:   git://git.infradead.org/linux-mtd-next.git master
head:   445caaa20c4d6da74f426464f90513b81157ad77
commit: 445caaa20c4d6da74f426464f90513b81157ad77 [11/11] mtd: Allocate bdi objects dynamically
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago

>> drivers/mtd/mtdcore.c:1786:29-32: ERROR: reference preceded by free on line 1784

git remote add mtd-next git://git.infradead.org/linux-mtd-next.git
git remote update mtd-next
git checkout 445caaa20c4d6da74f426464f90513b81157ad77
vim +1786 drivers/mtd/mtdcore.c

445caaa2 Steve Longerbeam 2016-08-04  1778  	bdi = kzalloc(sizeof(*bdi), GFP_KERNEL);
445caaa2 Steve Longerbeam 2016-08-04  1779  	if (!bdi)
445caaa2 Steve Longerbeam 2016-08-04  1780  		return ERR_PTR(-ENOMEM);
0661b1ac Jens Axboe       2010-04-27  1781
445caaa2 Steve Longerbeam 2016-08-04  1782  	ret = bdi_setup_and_register(bdi, name);
0661b1ac Jens Axboe       2010-04-27  1783  	if (ret)
445caaa2 Steve Longerbeam 2016-08-04 @1784  		kfree(bdi);
0661b1ac Jens Axboe       2010-04-27  1785
445caaa2 Steve Longerbeam 2016-08-04 @1786  	return ret ? ERR_PTR(ret) : bdi;
694bb7fc Kevin Cernekee   2009-04-03  1787  }
0661b1ac Jens Axboe       2010-04-27  1788
93e56214 Artem Bityutskiy 2013-03-15  1789  static struct proc_dir_entry *proc_mtd;

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
