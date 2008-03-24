Received: from mk-filter-2-a-1.mail.uk.tiscali.com ([212.74.100.53]
	helo=mk-filter-2-a-4.mail.uk.tiscali.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jdoy5-0004AR-SI
	for linux-mtd@lists.infradead.org; Mon, 24 Mar 2008 15:52:14 +0000
Subject: Re: [PATCH] 3/3 maple: update bus driver to support Dreamcast VMU
From: Adrian McMenamin <adrian@newgolddream.dyndns.info>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080324152952.GF2899@logfs.org>
References: <1206207805.6324.13.camel@localhost.localdomain>
	<1206209786.6324.41.camel@localhost.localdomain>
	<20080324033344.GB15872@linux-sh.org> <20080324144647.GC2899@logfs.org>
	<1206371178.6283.37.camel@localhost.localdomain>
	<20080324152952.GF2899@logfs.org>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2008 15:51:40 +0000
Message-Id: <1206373900.6283.39.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Andrew Morton <akpm@osdl.org>, linux-sh <linux-sh@vger.kernel.org>,
	Greg KH <greg@kroah.com>, LKML <linux-kernel@vger.kernel.org>,
	Paul Mundt <lethal@linux-sh.org>,
	MTD <linux-mtd@lists.infradead.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2008-03-24 at 16:29 +0100, Jörn Engel wrote:
> On Mon, 24 March 2008 15:06:18 +0000, Adrian McMenamin wrote:
> > 
> > I don't think I have any alternative here. The problem is that the bus
> > checks periodically (every HZ ticks but that could be changed) if a
> > device remains connected to the system by queueing a status command. (If
> > the status command is replied to with a "No response" then that
> > indicates to the bus that the device has been removed.
> 
> Where does this queueing happen?  Somewhere in the kernel where we can
> control it or in hardware?

Well, the queuing of the status command is under software control.
