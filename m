Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14uZHF-0005Ay-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 13:29:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200105011155.f41BtTN448532@pachyderm.pa.dec.com> 
References: <200105011155.f41BtTN448532@pachyderm.pa.dec.com> 
To: jg@pa.dec.com (Jim Gettys)
Cc: Tim Riker <Tim@Rikers.org>, mtd <linux-mtd@lists.infradead.org>,
    jffs-dev <jffs-dev@axis.com>
Subject: Re: Wear Leveling in JFFS2 NOT working!(?) 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 01 May 2001 13:29:15 +0100
Message-ID: <3130.988720155@redhat.com>
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

jg@pa.dec.com said:
> If you have some way to remember how far you got the last time,
> (approximately), then you could restart at the same place, rather than
> at the beginning.

> This has the same desired effect as starting randomly....

> Of course, this may be just reducing the problem to the previously
> unsolved problem, potentially...

It is, but the previously unsolved problem in question is one which we
_might_ need to solve anyway for checkpointing - if we decide that mounts
are slow enough that we actually need checkpointing, that is. 

If that's the case, I suppose we just have a block counter which we stick 
in the erase marker at the beginning of each block, and on scan we order 
the blocks such that the oldest blocks are recycled first. We need 
something like that for checking that blocks still contain the same data as 
the checkpoint tells us, anyway.

But I'm hoping to avoid having to implement checkpointing. We don't have to 
use the blocks strictly in order - just try to make sure we start in a 
different place each time.

--
dwmw2
