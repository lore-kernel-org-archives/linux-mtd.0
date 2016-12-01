Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cCZHL-00021I-1N
 for linux-mtd@lists.infradead.org; Thu, 01 Dec 2016 21:52:32 +0000
Received: by mail-pf0-x242.google.com with SMTP id c4so12440660pfb.3
 for <linux-mtd@lists.infradead.org>; Thu, 01 Dec 2016 13:52:10 -0800 (PST)
Date: Thu, 1 Dec 2016 13:52:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Steve Longerbeam <steve_longerbeam@mentor.com>,
 Jim Baxter <jim_baxter@mentor.com>, Sandeep Jain <Sandeep_Jain@mentor.com>,
 Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 kbuild-all@01.org
Subject: Re: [mtd-next:master 11/11] drivers/mtd/mtdcore.c:1786:29-32: ERROR:
 reference preceded by free on line 1784 (fwd)
Message-ID: <20161201215206.GA9130@google.com>
References: <alpine.DEB.2.20.1612012058000.2068@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.20.1612012058000.2068@hadrien>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 01, 2016 at 09:00:27PM +0100, Julia Lawall wrote:
> It's a false positive from Coccinelle, but I wonder if it's really worth
> it.  Perhaps the code would be simpler with if (ret) { kfree(bdi); return
> ERR_PTR(ret); } return bdi;

I ran your coccinelle scripts before merging, noticed the false
positive, and decided to ignore. But feel free to send the above patch
-- it's probably clearer anyway.

Thanks,
Brian

> julia
> 
> 
> 
> tree:   git://git.infradead.org/linux-mtd-next.git master
> head:   445caaa20c4d6da74f426464f90513b81157ad77
> commit: 445caaa20c4d6da74f426464f90513b81157ad77 [11/11] mtd: Allocate bdi objects dynamically
> :::::: branch date: 2 hours ago
> :::::: commit date: 2 hours ago
> 
> >> drivers/mtd/mtdcore.c:1786:29-32: ERROR: reference preceded by free on line 1784
> 
> git remote add mtd-next git://git.infradead.org/linux-mtd-next.git
> git remote update mtd-next
> git checkout 445caaa20c4d6da74f426464f90513b81157ad77
> vim +1786 drivers/mtd/mtdcore.c
> 
> 445caaa2 Steve Longerbeam 2016-08-04  1778  	bdi = kzalloc(sizeof(*bdi), GFP_KERNEL);
> 445caaa2 Steve Longerbeam 2016-08-04  1779  	if (!bdi)
> 445caaa2 Steve Longerbeam 2016-08-04  1780  		return ERR_PTR(-ENOMEM);
> 0661b1ac Jens Axboe       2010-04-27  1781
> 445caaa2 Steve Longerbeam 2016-08-04  1782  	ret = bdi_setup_and_register(bdi, name);
> 0661b1ac Jens Axboe       2010-04-27  1783  	if (ret)
> 445caaa2 Steve Longerbeam 2016-08-04 @1784  		kfree(bdi);
> 0661b1ac Jens Axboe       2010-04-27  1785
> 445caaa2 Steve Longerbeam 2016-08-04 @1786  	return ret ? ERR_PTR(ret) : bdi;
> 694bb7fc Kevin Cernekee   2009-04-03  1787  }
> 0661b1ac Jens Axboe       2010-04-27  1788
> 93e56214 Artem Bityutskiy 2013-03-15  1789  static struct proc_dir_entry *proc_mtd;
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
