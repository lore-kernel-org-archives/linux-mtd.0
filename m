Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JzU3Y-0006mr-GD
	for linux-mtd@lists.infradead.org; Fri, 23 May 2008 09:59:25 +0000
Date: Fri, 23 May 2008 11:59:15 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Alex Dubov <oakad@yahoo.com>
Subject: Re: Support of removable MTD devices and other advanced features
	(follow-up from lkml)
Message-ID: <20080523095914.GA21487@logfs.org>
References: <20080523055005.GA20264@logfs.org>
	<806030.2681.qm@web36706.mail.mud.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <806030.2681.qm@web36706.mail.mud.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 May 2008 02:33:30 -0700, Alex Dubov wrote:
> 
> The question is: do you really think something like this is needed at all?
> Block device layer uses all kinds of assumptions irrelevant to MTD:
> 
> 1. Most backends are very (NCQ) intelligent and very fast.
> 2. Failure rates are diminishingly small and mostly handled in hardware.
> 
> On the MTD side:
> 
> 1. Backends are dumb.
> 2. Protocols are even dumber.
> 3. Failures happen all the time.
> 4. Fully zero-copy approach is not possible (because of the occasional
> read-merge-erase-write).
> 
> That's why MTD will hardly benefit from request queues or fancy IO management
> schemes.

I have a need to spread reads/writes over N chips, with N approaching
large numbers.  And I would like to deal with such a beast as a single
mtd entity, not have a filesystem on 12odd devices at once.  So this
device should do something similar to mtdconcat and support having at
least as many outstanding requests as there are chips.

For read requests there can be literally thousands outstanding, as the
read path in a filesystem should be either lockless or extremely
fine-grained.  The only throtteling mechanisms are data dependencies,
which depend on your workload and the total amount of memory in the
system.  Or the number of threads, if reads are blocking.

An elevator is clearly pointless.  But fairness may well become and
issue, so some sort of scheduler may even make sense.  Once you think
about several gigabytes of storage attached through mtd, the
similarities to the block device layer increase.  In spite of all your
arguments being valid. :)

> There's nothing wrong with backend busy waiting to complete request. Maximum,
> your audio will jump here and there. Just don't use that driver for mp3 player
> project.

:)

> (That's why I put as a requirement that new requests must be advertised
> asynchronously, by firing a tasklet in the backend, for example. I'm following
> this approach in my xd_card driver).

I guess anything reading/writing more than 512 bytes at once can take
longer than two schedule events.  Flash may be fast compared to spinning
rust, but it's still horribly slow when compared to the cpu or even RAM.

Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
