Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CTdCB-0003IN-Dj
	for linux-mtd@lists.infradead.org; Mon, 15 Nov 2004 04:30:48 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1100508552.8015.61.camel@localhost.localdomain>
References: <41986D89.4060308@oktetlabs.ru>
	<1100508552.8015.61.camel@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 15 Nov 2004 10:22:09 +0100
Message-Id: <1100510529.5074.119.camel@thomas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dedekind@oktetlabs.ru, linux-mtd@lists.infradead.org
Subject: Re: NAND pages cache?
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-11-15 at 08:49 +0000, David Woodhouse wrote:
> On Mon, 2004-11-15 at 11:49 +0300, Artem Bityuckiy wrote:
> > So, the obvious idea how to avoid this is to introduce something like 
> > NAND pages cache. The cache will keep several NAND pages which were last 
> > accessed.
> > 
> > I don not know is it good to do this only in JFFS2 or on the MTD NAND layer?
> 
> I thought we already did this in the MTD NAND layer, since we had to
> read whole pages there to do ECC anyway. Thomas?

We do caching only if a page is read partially. If we read a full page
we read directly into the fs buffer.

The partial reads happen when we read nodes. The full page reads happen
when we read data. That's sufficient and captures most of the double
reads on the same page.

tglx
