Received: from n58b.bullet.mail.sp1.yahoo.com ([98.136.45.31])
	by bombadil.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ogc8K-00060G-W0
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2010 11:27:41 +0000
Message-ID: <30519.93306.qm@web180312.mail.gq1.yahoo.com>
Date: Wed, 4 Aug 2010 04:27:38 -0700 (PDT)
From: David Brownell <david-b@pacbell.net>
Subject: RE: [PATCH 1/2] mtdpart: memory accessor interface for MTD layer
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1280920127.19499.20.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 'Bernd Schmidt' <bernd.schmidt@analog.com>,
	Sudhakar Rajashekhara <sudhakar.raj@ti.com>,
	'Nicolas Pitre' <nico@fluxnic.net>,
	'Kevin Hilman' <khilman@deeprootsystems.com>, linux-kernel@vger.kernel.org,
	'David Howells' <dhowells@redhat.com>,
	'David Brownell' <dbrownell@users.sourceforge.net>,
	linux-mtd@lists.infradead.org, 'Andrew Morton' <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



--- On Wed, 8/4/10, David Woodhouse <dwmw2@infradead.org> wrote:

> > Point is to ensure that enough of the right context
> > information is available to initialize correctly.
> > So the right data is extracted and passed on.


And also, ISTR, that the mechanism is general
enough to work with both MTD and EEPROM ...

> 
> Forgive me if I'm being dim (and in particular, please
> forgive me if I'm
> going over something that was already discussed; I know
> it's been a
> while).

I also am at risk of getting lost in a pile
of hypotheticals which have been left behind
earlier in these threads.

 But I don't see why it needs to be passed through
> the core MTD  code.
> 
> To take the simple case of an unpartitioned MTD device --
> why can't the
> map driver (or whatever) just call the maccessor setup
> function for
> itself, directly, right after calling add_mtd_device() with
> its newly-probed MTD device?

No idea, except that doing it once rather than
modifying every driver would seem healthier.
Surely changing all drivers is a Bad Thing.

> 
> And for partitions, why can't it do the same, on the
> appropriate partition.
> 
> OK, the answer to the latter question is that you don't
> actually *have*
> the pointers to each partition you register. But that's
> easily fixed.
> 
> If we make add_mtd_partitions() take an extra 'struct
> mtd_info **'
> argument and put pointers to the slave mtd 'devices' into
> that, it means
> that your board driver *can* reliably get the mtd pointer
> for the fourth
> partition, or whatever it needs. And can then just do the
> memory
> accessor setup for itself.
> 
> Isn't that enough?

Might be.  Not my patch though...  You asked why
the context was needed along with the partition
data (otherwise not available); I answered.

Still haven't seen a better patch though.
