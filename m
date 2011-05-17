Received: from caramon.arm.linux.org.uk ([78.32.30.218])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QMEwv-0004rw-0L
	for linux-mtd@lists.infradead.org; Tue, 17 May 2011 07:44:14 +0000
Date: Tue, 17 May 2011 08:43:48 +0100
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v5 1/8] MTD: Add integrator-flash feature to physmap
Message-ID: <20110517074348.GA26669@n2100.arm.linux.org.uk>
References: <1305557977-16871-1-git-send-email-marc.zyngier@arm.com>
	<1305557977-16871-2-git-send-email-marc.zyngier@arm.com>
	<1305610643.2630.15.camel@localhost>
	<1305611178.2630.21.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1305611178.2630.21.camel@localhost>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Marc Zyngier <marc.zyngier@arm.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 17, 2011 at 08:46:18AM +0300, Artem Bityutskiy wrote:
> On Tue, 2011-05-17 at 08:37 +0300, Artem Bityutskiy wrote:
> > Sorry if this sounds like an attack, it is not. I just think that we
> > carry crap for too long and should start forcing people to clean it up
> > by not accepting changes :-)
> 
> Sorry, I forgot to note that I do not insist that you have to re-work
> MTD partitions support - you already do a very good thing by killing a
> redundant driver, and delaying this would be counter-productive. But I
> anyway wanted to express my thoughts.

So, what's happening with this patch set?  I'd like to have an ack from
the MTD people for the set.
