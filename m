Received: from relay.2ka.mipt.ru ([194.85.82.65] helo=2ka.mipt.ru)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hok4J-0005sR-G6
	for linux-mtd@lists.infradead.org; Thu, 17 May 2007 13:47:22 -0400
Date: Thu, 17 May 2007 21:45:33 +0400
From: Evgeniy Polyakov <johnpol@2ka.mipt.ru>
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070517174532.GA26827@2ka.mipt.ru>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515133759.9ee434a2.akpm@linux-foundation.org>
	<20070516000630.GD1220@lazybastard.org>
	<Pine.LNX.4.61.0705171920330.3231@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0705171920330.3231@yvahk01.tjqt.qr>
Cc: Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 17, 2007 at 07:26:07PM +0200, Jan Engelhardt (jengelh@linux01.gwdg.de) wrote:
> >My plan was to move this code to lib/ sooner or later.  If you consider
> >it useful in its current state, I can do it immediatly.  And if someone
> >else merged a superior btree library I'd happily remove mine and use the
> >new one instead.
> >
> >Opinions?
> 
> Why would we need another btree, when there is lib/rbtree.c?
> Or does yours do something fundamentally different?

It is not red-black tree, it is b+ tree.

> 	Jan

-- 
	Evgeniy Polyakov
