Received: from comal.ext.ti.com ([198.47.26.152])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWSNV-0002Xh-8i
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2010 11:01:22 +0000
From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>,
	"'Kevin Hilman'" <khilman@deeprootsystems.com>
References: <1268772081-6534-1-git-send-email-khilman@deeprootsystems.com>
	<1273794629.9999.412.camel@macbook.infradead.org>
In-Reply-To: <1273794629.9999.412.camel@macbook.infradead.org>
Subject: RE: [PATCH 1/2] mtdpart: memory accessor interface for MTD layer
Date: Wed, 7 Jul 2010 16:26:22 +0530
Message-ID: <012f01cb1dc3$09584880$1c08d980$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: 'Bernd Schmidt' <bernd.schmidt@analog.com>,
	'David Howells' <dhowells@redhat.com>,
	'David Brownell' <dbrownell@users.sourceforge.net>,
	'Nicolas Pitre' <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
	'David Brownell' <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	'Andrew Morton' <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On Fri, May 14, 2010 at 05:20:29, David Woodhouse wrote:
> On Tue, 2010-03-16 at 13:41 -0700, Kevin Hilman wrote:
> > From: Sudhakar Rajashekhara <sudhakar....@ti.com>
> > 
> > This patch implements memory accessor interface in the MTD
> > layer which enables the kernel to access flash data.
> > 
> > This patch adds two new members to the mtd_partition structure,
> > a function handler which will be called during setup of the
> > partition and an argument to be passed to this setup function.
> 
> Ick.
> 
> I don't mind providing the mtd_macc_{read,write} helper functions,
> although they should work on generic MTD devices not just on partitions.
> But do we really have to do the callout to arbitrary functions from
> _within_ the core MTD code... why can't we do that in the board driver?
> 

First of all apologies for replying to this thread *very* late.

This thread started in response to the patch at
http://lkml.org/lkml/2010/3/16/380. I think you are OK with the
mtd_macc_{read,write} functions being provided within the MTD core but
you are objecting to the extra ->setup method in struct mtd_partition.
Without adding the setup method in mtd_parition structure, the MTD
memory accessor interface users will not knowing when to call the
mtd_macc_{read,write} functions. These functions should be called after
the MTD partitions are set up. If the ->setup method is moved to the
board driver, I'll get into the initialization sequence problem, which
I want to avoid.

Thanks,
Sudhakar
