Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1912qy-0001nL-Ig
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 12:25:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
In-Reply-To: <1049368506.32205.28.camel@spawn>
References: <004301c2f96b$0c111c20$1200a8c0@JOHNB>
	<1049368506.32205.28.camel@spawn>
Message-Id: <1049369136.14220.5.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 03 Apr 2003 12:25:37 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: tglx@linutronix.de
cc: Mtd <linux-mtd@lists.infradead.org>
cc: John Burch <jburch@vincisystems.com>
Subject: Re: Can mtd partition span multiple devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-04-03 at 12:15, Kenneth Johansson wrote:
> On Thu, 2003-04-03 at 02:58, Thomas Gleixner wrote:
> > On Thursday 03 April 2003 00:56, John Burch wrote:
> > > I'm wondering if a single mtd partition can span more than one physical
> > > flash device.  For example, if two flash devices span the following
> > > address ranges, 0x0-0x3FFFFF and 0x400000-0x7FFFFF, can an mtd partition
> > > be defined as follows?
> > >
> > > Name: spanning_partition
> > > Size: 0x200000
> > > Offset: 0x300000
> > >
> > > So this partition would span physical addresses 0x300000 - 0x3FFFFF
> > > (device 1) and 0x400000 - 0x4FFFFF (device 2).
> > 
> > Enable MTD concatenating support.
> > 
> 
> You mean MTD partitioning no need for concatenating with this layout. 

Probably true -- if the two physical devices are laid out such that a
single chip probe will find them together, they can be used as a single
MTD device even without mtdconcat just by setting your map to cover the
whole range 0->8M. You only really need mtdconcat for more complicated
setups.

-- 
dwmw2
