Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QN8rT-0008Mh-Hl
	for linux-mtd@lists.infradead.org; Thu, 19 May 2011 19:26:21 +0000
Date: Thu, 19 May 2011 20:25:52 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v5 1/8] MTD: Add integrator-flash feature to physmap
Message-ID: <20110519192551.GA7445@n2100.arm.linux.org.uk>
References: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
	<1305557977-16871-2-git-send-email-marc.zyngier@arm.com>
	<1305610643.2630.15.camel@localhost>
	<1305611178.2630.21.camel@localhost>
	<20110517074348.GA26669@n2100.arm.linux.org.uk>
	<1305619989.2630.31.camel@localhost>
	<1305622141.30788.30.camel@e102391-lin.cambridge.arm.com>
	<1305803618.2630.63.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1305803618.2630.63.camel@localhost>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Marc Zyngier <Marc.Zyngier@arm.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 19, 2011 at 02:13:38PM +0300, Artem Bityutskiy wrote:
> On Tue, 2011-05-17 at 09:49 +0100, Marc Zyngier wrote:
> > On Tue, 2011-05-17 at 11:13 +0300, Artem Bityutskiy wrote:
> > > On Tue, 2011-05-17 at 08:43 +0100, Russell King - ARM Linux wrote:
> > > > On Tue, May 17, 2011 at 08:46:18AM +0300, Artem Bityutskiy wrote:
> > > > > On Tue, 2011-05-17 at 08:37 +0300, Artem Bityutskiy wrote:
> > > > > > Sorry if this sounds like an attack, it is not. I just think that we
> > > > > > carry crap for too long and should start forcing people to clean it up
> > > > > > by not accepting changes :-)
> > > > > 
> > > > > Sorry, I forgot to note that I do not insist that you have to re-work
> > > > > MTD partitions support - you already do a very good thing by killing a
> > > > > redundant driver, and delaying this would be counter-productive. But I
> > > > > anyway wanted to express my thoughts.
> > > > 
> > > > So, what's happening with this patch set?  I'd like to have an ack from
> > > > the MTD people for the set.
> > > 
> > > David should answer, but from my POW the patches are OK. The "#ifdef
> > > CONFIG_MTD_AFS_PARTS" is ugly. I think it can be just killed, it just
> > > needs an additional patch to silence the kernel (completely untested,
> > > Marc, could you please check it?):
> > 
> > Looks OK to me, as long as people don't miss the information (could make
> > the "where's my partition gone?" question harder to answer...).
> 
> I've pushed my patch to my l2-mtd-2.6.git tree, if dwmw2 accepts it
> it'll go upstream.

I've also committed them to my tree too.
