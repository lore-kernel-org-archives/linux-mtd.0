Received: from smtp-1.hut.fi ([130.233.228.91] ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 177BNV-00074E-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 May 2002 09:40:22 +0100
Date: Mon, 13 May 2002 11:40:08 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Jarkko Lavinen <jlavi@iki.fi>, MTD List <linux-mtd@lists.infradead.org>,
   jffs-dev@axis.com
Subject: Re: Benchmarking JFFS2
Message-ID: <20020513114008.A3267@kosh.hut.fi>
References: <13211.1020346858@redhat.com> <20020502155602.A8801@kosh.hut.fi> <13211.1020346858@redhat.com> <912.1021230283@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <912.1021230283@redhat.com>; from dwmw2@infradead.org on Sun, May 12, 2002 at 08:04:43PM +0100
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

> order of dirty space, then in jffs2_find_gc_block just pick the block 
> number $N in that list, where N is exponentially distributed -- high 
> chance of being '1', small but non-negligible chance of being near the end 
> of the list.
...
> Does anyone have any ideas on how we'd generate the random number N for 
> jffs2_find_gc_block() though?

Starting from the list head, one could produce random numbers x, 0 <= x < 1,
and proceed to the next node only if the x is below a ratio r, 0 < r < 1. One 
could repeat the same procedure n times. The probabilities to reach first few
nodes would be p1 = r, p2 = r*(1 - r), p3 = r*(1 - r)^2 and pi = r*(1 - r)^i. 
Probability to reach the last node n would be pn = (1 - r)^(n - 1).

For example, if r were 0.9 and the list length 4, p1 = 0.9, p2 = 0.09, 
p3 = 0.009 and p4 = 0.001.

Is this too naive approach? This relies perhaps too much on the randomness of 
semi-random numbers and might mean only first few nodes are ever picked up 
and never nodes from the tail.

Jarkko Lavinen
