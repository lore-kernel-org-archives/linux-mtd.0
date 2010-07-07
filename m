Received: from n5-vm0.bullet.mail.gq1.yahoo.com ([67.195.8.62])
	by bombadil.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OWSUs-0003v3-QW
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2010 11:08:59 +0000
Message-ID: <54038.80733.qm@web180305.mail.gq1.yahoo.com>
Date: Wed, 7 Jul 2010 04:08:54 -0700 (PDT)
From: David Brownell <david-b@pacbell.net>
Subject: RE: [PATCH 1/2] mtdpart: memory accessor interface for MTD layer
To: 'David Woodhouse' <dwmw2@infradead.org>,
	'Kevin Hilman' <khilman@deeprootsystems.com>,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>
In-Reply-To: <012f01cb1dc3$09584880$1c08d980$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 'Bernd Schmidt' <bernd.schmidt@analog.com>,
	'David Brownell' <dbrownell@users.sourceforge.net>,
	'Nicolas Pitre' <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
	'David Howells' <dhowells@redhat.com>, linux-mtd@lists.infradead.org,
	'Andrew Morton' <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > > This patch adds two new members to the
> mtd_partition structure,
> > > a function handler which will be
> > > called during setup of the
> > > partition and an argument to be passed to this
> setup function.
> > 
> > Ick.
> > 
> > I don't mind providing the mtd_macc_{read,write}
> helper functions,
> > although they should work on generic MTD
> > >devices not just on partitions.
> > But do we really have to do the callout to
> > arbitrary functions from
> > _within_ the core MTD code... why can't we
> > do that in the board driver?

I think the short answer is that the callout is
what provides the board drivers enough information
to make the correct calls.
