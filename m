Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CvdUx-0006sc-Of
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2005 10:29:57 -0500
Date: Mon, 31 Jan 2005 16:29:43 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20050131152943.GF6694@wohnheim.fh-wedel.de>
References: <1106946232.7542.33.camel@windu.rchland.ibm.com>
	<1106998793.17802.3.camel@sauron.oktetlabs.ru>
	<1107013860.10670.5.camel@windu.rchland.ibm.com>
	<20050131125613.GA6345@wohnheim.fh-wedel.de>
	<1107184238.7567.17.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1107184238.7567.17.camel@windu.rchland.ibm.com>
Cc: haverkam@de.ibm.com, linux-mtd@lists.infradead.org
Subject: Re: NAND partitioning
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 31 January 2005 09:10:38 -0600, Josh Boyer wrote:
> On Mon, 2005-01-31 at 13:56 +0100, Jörn Engel wrote:
> > 
> > Problem would be trivial to solve, if said blocks were not scattered
> > across the device.  Do you have a good reason to need this?
> 
> If said blocks were not scattered across the device, then they could be
> in a static partition and there would be nothing to discuss :).  We just
> got done discussing this on IRC, so I'll try and summarize.
> 
> The main reason to not have static partitions is the concern of bad
> blocks on NAND and the effects that can have on the available space for
> updates, etc of binary data.  If a majority of a partition is bad
> blocks, either from the factory or from eventual wear, then you don't
> have much room for updating, etc.

Not sure if there really is a problem that needs solving.

Your concern is that you need R blocks for the raw data, pick an
arbitrary number A of blocks, but notice that A-R is less than B, the
number of bad blocks in the area.  Sure.

So now you simply pick a sufficiently large A.  Let's say that your
flashes have 5% bad blocks on average.  I'm too lazy to do the math
properly, but if you pick A = 1.2*R, then well over 99% of all flash
chips should have less than 20% bad blocks in you boot partition.

And for the remaining 0.something%, you are the one to argue why those
chips have a sufficient quality to hit the field.  I'd be scared.

Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
