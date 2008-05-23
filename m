Received: from web36706.mail.mud.yahoo.com ([209.191.85.40])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JzWiT-0007Sr-PJ
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 12:49:50 +0000
Date: Fri, 23 May 2008 05:49:48 -0700 (PDT)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
To: "Jörn" Engel <joern@logfs.org>
In-Reply-To: <20080523095914.GA21487@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <115582.37719.qm@web36706.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--- Jörn Engel <joern@logfs.org> wrote:

> On Fri, 23 May 2008 02:33:30 -0700, Alex Dubov wrote:
> > 
> > The question is: do you really think something like this is needed at all?
> > Block device layer uses all kinds of assumptions irrelevant to MTD:
> > 
> > 1. Most backends are very (NCQ) intelligent and very fast.
> > 2. Failure rates are diminishingly small and mostly handled in hardware.
> > 
> > On the MTD side:
> > 
> > 1. Backends are dumb.
> > 2. Protocols are even dumber.
> > 3. Failures happen all the time.
> > 4. Fully zero-copy approach is not possible (because of the occasional
> > read-merge-erase-write).
> > 
> > That's why MTD will hardly benefit from request queues or fancy IO
> management
> > schemes.
> 
> I have a need to spread reads/writes over N chips, with N approaching
> large numbers.  And I would like to deal with such a beast as a single
> mtd entity, not have a filesystem on 12odd devices at once.  So this
> device should do something similar to mtdconcat and support having at
> least as many outstanding requests as there are chips.
> 
> For read requests there can be literally thousands outstanding, as the
> read path in a filesystem should be either lockless or extremely
> fine-grained.  The only throtteling mechanisms are data dependencies,
> which depend on your workload and the total amount of memory in the
> system.  Or the number of threads, if reads are blocking.
> 
> An elevator is clearly pointless.  But fairness may well become and
> issue, so some sort of scheduler may even make sense.  Once you think
> about several gigabytes of storage attached through mtd, the
> similarities to the block device layer increase.  In spite of all your
> arguments being valid. :)
> 

We are talking about somewhat different things here. Userspace visible devices
(highest layer in mtd stack) must support something complex. Lower levers in
the mtd stack - not necessarily so.

Highest level "raw mtd" devices can be normal block devices with support for
custom commands. Intermediate and low level modules can do with simple
interface.

Then, there should be a layer akin to "md" that will allow creation of flash
raids. After all, we are not limited in number of intermediate devices present
in the kernel. We don't have to create userspace visible nodes for them.



      
