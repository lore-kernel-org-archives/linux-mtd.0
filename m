Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15u8A4-0005az-00
	for <linux-mtd@lists.infradead.org>; Thu, 18 Oct 2001 09:04:17 +0100
Date: Thu, 18 Oct 2001 10:13:28 +0200
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Eric <ebrower@usa.net>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [MTD partitioning rewrite]
Message-ID: <20011018101328.A13663@wohnheim.fh-wedel.de>
References: <20011017175322.3246.qmail@cpdvg201.cms.usa.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20011017175322.3246.qmail@cpdvg201.cms.usa.net>; from ebrower@usa.net on Wed, Oct 17, 2001 at 10:53:21AM -0700
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

> > [ ... ] might even grow into a complete rewrite of the central 
> > MTD code. We will see, how much is needed...
> 
> I applaud your decision to modify the partitioning scheme, and in
> a few areas the central code could use spring-cleaning; however, 
> a re-write of the central code is scary business unless you have
> a lot of hardware with which to test and folks here aggressively 
> audit the work.  I have yet to see "re-writes" that did not impact
> the codebase stability.

A valid point. "Rewrite" in my case often means typing off Davids
code, thereby adjusting it to the new data structures. This increases
my understanding but often does little more, than c&p.
But I still have no grand plan, only a pretty good idea that is
evolving over time. The project might grow or shrink.

> > - An MTD device will be the equivalent of a hard drive. There will be
> > several, named mtda, mtdb, mtdc,...
> 
> Hooray!  This would be a welcome change.  Perhaps we can also eliminate
> the restriction of 16 char device maximum (yes, it does affect me in a
> non-academic way).

With 256 minor numbers, the sane solution appears to be 16 devices
with up to 15 partitions each. Does this still limit you?

> > - The partitioning should stay out of the mapping drivers as much as
> > possible. The mapping driver only supplies a pointer to the partition
> > table parser. When the device is registered, the partitioning will
> > automatically be read.
> 
> I'd like more implementation details, but the separation is welcome.
> It does seem a bit silly to re-write the mapping driver just for a
> new partitioning scheme.  Perhaps we can treat it like a disk in 
> this regard and "scan" it for a partition table.

That is the idea. I added two new functions:
int add_mtd_part_device (struct mtd_info *mtd, partition_parser pars);
int add_mtd_part_device_at (struct mtd_info *mtd, partition_parser
                            pars, unsigned int index)

There is an empty partition_parser that renders add_mtd_part_device()
semantically into add_mtd_device(). add_mtd_device() is now considered
deprecated and simply calls add_mtd_part_device() with the empty
parser.

Thus the mapping can decide whether to use Redhat's, Compaq's, Arm's
or my parser, it can use no parser and leave the device unpartitioned
or it can use a wrapper that tries every parser and uses the first
that can make some sense from the disk information.

> Sounds like a worthy plan to me.  I'd suggest holding-off on the 
> "complete rewrite" until after this new functionality has been
> added, though :)

I'll try to, in general, but might ignore that advice in detail.

Joern
