Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWspF-0004lz-0P
	for linux-mtd@lists.infradead.org; Thu, 08 Jul 2010 15:15:45 +0000
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'David Brownell'" <david-b@pacbell.net>,
	"'David Woodhouse'" <dwmw2@infradead.org>,
	"'Kevin Hilman'" <khilman@deeprootsystems.com>
References: <012f01cb1dc3$09584880$1c08d980$@raj@ti.com>
	<54038.80733.qm@web180305.mail.gq1.yahoo.com>
In-Reply-To: <54038.80733.qm@web180305.mail.gq1.yahoo.com>
Subject: RE: [PATCH 1/2] mtdpart: memory accessor interface for MTD layer
Date: Thu, 8 Jul 2010 20:40:09 +0530
Message-ID: <027001cb1eaf$a7dc64e0$f7952ea0$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
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

Hi Dave,

On Wed, Jul 07, 2010 at 16:38:54, David Brownell wrote:
> 
> > > > This patch adds two new members to the
> > mtd_partition structure,
> > > > a function handler which will be
> > > > called during setup of the
> > > > partition and an argument to be passed to this
> > setup function.
> > > 
> > > Ick.
> > > 
> > > I don't mind providing the mtd_macc_{read,write}
> > helper functions,
> > > although they should work on generic MTD
> > > >devices not just on partitions.
> > > But do we really have to do the callout to
> > > arbitrary functions from
> > > _within_ the core MTD code... why can't we
> > > do that in the board driver?
> 
> I think the short answer is that the callout is
> what provides the board drivers enough information
> to make the correct calls.
> 

If you agree to what the patch is doing, then can you Ack it?

Thanks,
Sudhakar
