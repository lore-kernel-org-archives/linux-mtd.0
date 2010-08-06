Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OhGoY-0006kf-UE
	for linux-mtd@lists.infradead.org; Fri, 06 Aug 2010 06:53:59 +0000
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
	"'David Brownell'" <david-b@pacbell.net>
References: <350720.60481.qm@web180309.mail.gq1.yahoo.com>
	<1280920127.19499.20.camel@localhost>
In-Reply-To: <1280920127.19499.20.camel@localhost>
Subject: RE: [PATCH 1/2] mtdpart: memory accessor interface for MTD layer
Date: Fri, 6 Aug 2010 12:18:22 +0530
Message-ID: <000401cb3533$5c982470$15c86d50$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: 'Bernd Schmidt' <bernd.schmidt@analog.com>,
	'David Brownell' <dbrownell@users.sourceforge.net>,
	'Nicolas Pitre' <nico@fluxnic.net>,
	'Kevin Hilman' <khilman@deeprootsystems.com>, linux-kernel@vger.kernel.org,
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

Hi,

On Wed, Aug 04, 2010 at 16:38:47, David Woodhouse wrote:
> On Wed, 2010-08-04 at 03:31 -0700, David Brownell wrote:
> > Point is to ensure that enough of the right context
> > information is available to initialize correctly.
> > So the right data is extracted and passed on.
> 
> Forgive me if I'm being dim (and in particular, please forgive me if I'm
> going over something that was already discussed; I know it's been a
> while). But I don't see why it needs to be passed through the core MTD
> code.
> 
> To take the simple case of an unpartitioned MTD device -- why can't the
> map driver (or whatever) just call the maccessor setup function for
> itself, directly, right after calling add_mtd_device() with its
> newly-probed MTD device?
> 
> And for partitions, why can't it do the same, on the appropriate
> partition.
> 
> OK, the answer to the latter question is that you don't actually *have*
> the pointers to each partition you register. But that's easily fixed.
> 
> If we make add_mtd_partitions() take an extra 'struct mtd_info **'
> argument and put pointers to the slave mtd 'devices' into that, it means
> that your board driver *can* reliably get the mtd pointer for the fourth
> partition, or whatever it needs. And can then just do the memory
> accessor setup for itself.
> 
> Isn't that enough?
> 

Thanks for the feedback. I'll be re-working on this patch and will re-post
the updated patch soon.

Regards,
Sudhakar
