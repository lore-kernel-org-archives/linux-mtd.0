Received: from [74.93.104.97] (helo=sunset.davemloft.net)
	by pentafluge.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JowM6-0000dO-Ta
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 07:58:59 +0000
Date: Thu, 24 Apr 2008 00:58:23 -0700 (PDT)
Message-Id: <20080424.005823.19184500.davem@davemloft.net>
To: dwmw2@infradead.org
Subject: Re: physmap and "request_module: runaway loop modprobe net-pf-1"
From: David Miller <davem@davemloft.net>
In-Reply-To: <1209021852.9212.936.camel@pmac.infradead.org>
References: <1209021399.9212.927.camel@pmac.infradead.org>
	<20080424.002038.201593352.davem@davemloft.net>
	<1209021852.9212.936.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: netdev@vger.kernel.org, akpm@linux-foundation.org,
	gordonfarquharson@gmail.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 24 Apr 2008 08:24:12 +0100

> On Thu, 2008-04-24 at 00:20 -0700, David Miller wrote:
> > But won't the request_module() for AF_UNIX spit out that warning too?
> 
> Yes. If you build AF_UNIX as a module, it will. Just once though, before
> loading it (assuming it's available).
> 
> > Actually, I think I need a clarification.  It is the modular loader
> > utility in userspace which is trying to open up AF_UNIX sockets,
> > right?
> 
> Yes. Or probably libc.

Ok, I'll apply your patch, but really this all feels like a jumble
of hacks to me :-)
