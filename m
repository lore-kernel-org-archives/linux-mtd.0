Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CAbGG-0002rB-4f
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2004 17:36:21 -0400
To: Ben Dooks <ben-mtd@fluff.org>
References: <20040920234450.GA17169@home.fluff.org>
	<m3brfxycuf.fsf@maxwell.lnxi.com>
	<20040923210150.GF25491@home.fluff.org>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 23 Sep 2004 15:36:17 -0600
In-Reply-To: <20040923210150.GF25491@home.fluff.org>
Message-ID: <m3r7ossm5q.fsf@maxwell.lnxi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: "Eric W. Biederman" <eric@lnxi.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Fix to jedec_probe unlock addresses
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben Dooks <ben-mtd@fluff.org> writes:

> I took the jedec_probe alterations as I was unsure wether I was going
> to damage anything else by changing the cfi cmdset 0002 code.

Your patch is broken with respect to interleaving.  The interleave
gets applied twice.  Once in jedec_probe, and then again in
cfi_send_gen_cmd.


The bottom line is that we need to be consistent with how we do this.
Either we have magic addresses specified in terms as byte addresses
or we have magic addresses specified as device visible addresses.

Right now cfi_cmdset_0002 is the only place that does not use the
device width.

A 16bit device should not even be able to see a non-16bit 
aligned address, and we have to play games with the address
on the bus to handle interleaving so I don't see a reason
why we would want to disable multiplying by device size.

So it looks like the TODO item is to just look up what cfi standard
says are the unlock addresses for cfi command set 2. And make certain
the cfi hard codes are correct and nothing should be broken.

But even without that I would rather see cfi_cmdset_0002 fixed
then seeing this disagreement about how we should pass parameters
to cfi_cmdset_0002.  At least if we agree on conventions the broken
cases can be incrementally fixed until the code works properly for
everyone.

It is nice to see that this problem has nothing to do with
interleaving so that anyone with a 16bit or wider device can test
this.

Eric
