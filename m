Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhPNa-0002Ap-Cd
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 21:25:23 +0000
Date: Sun, 12 Apr 2015 23:24:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
Message-ID: <20150412232448.13600654@bbrezillon>
In-Reply-To: <552ACD28.8000409@nod.at>
References: <1427631197-23610-1-git-send-email-richard@nod.at>
 <1427631197-23610-5-git-send-email-richard@nod.at>
 <20150412190119.7f0f7c64@bbrezillon> <552AA6B7.3070806@nod.at>
 <20150412212050.2949b6f5@bbrezillon> <552ACD28.8000409@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 12 Apr 2015 21:53:12 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am 12.04.2015 um 21:20 schrieb Boris Brezillon:
> > Unless I'm missing something, it should be pretty easy to implement:
> > adding the following lines at the end of bitrot_check_worker() should do
> > the trick
> > 
> > 	if (e->pnum + 1 < ubi->peb_count) {
> > 		wl_wrk->e = ubi->lookuptbl[e->pnum + 1];
> > 		__schedule_ubi_work(ubi, wl_wrk);
> > 	} else {
> > 		atomic_dec(&ubi->bit_rot_work);
> > 	}
> > 	
> 
> It will suffer from the same race issue as my current approach.
> While e is scheduled another worker could free it in case of an fatal
> error.

Right, I guess grabing wl_lock before retrieving ->e (and iterating
over the lookuptbl until it's != NULL) would partly solve the problem.
But I'm not sure how you would handle this sequence (not sure it can
happen though):
1/ schedule bitrot check on PEB X
2/ execute some operation on PEB x that might free PEB X entry in the
   lookuptbl
3/ execute bitrot check on PEB X

In this case the ->e is invalid (pointing to a freed memory region) at
the time bitrot check is executed.

Of course, if you're guaranteed that ubi_work are executed in the
correct order (FIFO) this should never happen, because the scheduled
operation messing up with lookuptbl entry could have been detected
before bitrot work insertion.

> 
> >> I'd like to avoid works which schedule again other works.
> >> In the current way it is clear where the work is scheduled and how much.
> > 
> > Yes, but the memory consumption induced by this approach can be pretty
> > big on modern NAND chips (on 32 bit platforms, ubi_work is 32 octets
> > large, and on modern NANDs you often have 4096 blocks, so a UBI device
> > of 4000 block is pretty common => 4000 * 32 = 125 KiB).
> 
> While I agree that consuming memory is not very nice I don't think that 125KiB
> is a big deal.

Hm, a few weeks ago, when I suggested to store information about PEBs in
order to better choose the next block to be checked for bitrot, one of
your argument to reject that approach was the memory consumption of
such a design.
In my case the only thing I needed was the following structure (one
instance per PEB):

struct ubi_peb_statistics {
	struct list_head node;
	int pnum;
	int bitflips;
	int last_full_read; /* in seconds */
	int last_partial_write; /* in seconds */
};

which is 24 bytes large.

I definitely understand the memory consumption argument, but that's not
something you can change depending on who's proposing the solution :-).

> 
> > For standard wear leveling requests, using a ubi_work per request is
> > sensible since you can't know in advance which block will be queued for
> > wear-leveling operation next time.
> > In your case, you're scanning all blocks in ascending order, which
> > makes it a good candidate for this 'one work for all bitrot checks'
> > approach.
> 
> The good news is that I have an idea to solve both problems the race and
> the memory issue. It should be pretty easy to implement.
> Patches will materialize in a few days.

Great!

Best Regards,

Boris


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
