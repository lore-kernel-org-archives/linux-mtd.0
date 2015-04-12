Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhNRU-00007d-BI
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 19:21:17 +0000
Date: Sun, 12 Apr 2015 21:20:50 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
Message-ID: <20150412212050.2949b6f5@bbrezillon>
In-Reply-To: <552AA6B7.3070806@nod.at>
References: <1427631197-23610-1-git-send-email-richard@nod.at>
 <1427631197-23610-5-git-send-email-richard@nod.at>
 <20150412190119.7f0f7c64@bbrezillon> <552AA6B7.3070806@nod.at>
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

On Sun, 12 Apr 2015 19:09:11 +0200
Richard Weinberger <richard@nod.at> wrote:

> Am 12.04.2015 um 19:01 schrieb Boris Brezillon:
> > Hi Richard,
> > 
> > After the 'coding style related'/'useless' comments, now comes a real
> > question related to the approach you've taken :-).
> > 
> > On Sun, 29 Mar 2015 14:13:17 +0200
> > Richard Weinberger <richard@nod.at> wrote:
> > 
> > [...]
> >> +
> >> +/**
> >> + * ubi_wl_trigger_bitrot_check - triggers a re-read of all physical erase
> >> + * blocks.
> >> + * @ubi: UBI device description object
> >> + */
> >> +void ubi_wl_trigger_bitrot_check(struct ubi_device *ubi)
> >> +{
> >> +	int i;
> >> +	struct ubi_wl_entry *e;
> >> +
> >> +	ubi_msg(ubi, "Running a full read check");
> >> +
> >> +	for (i = 0; i < ubi->peb_count; i++) {
> >> +		spin_lock(&ubi->wl_lock);
> >> +		e = ubi->lookuptbl[i];
> >> +		spin_unlock(&ubi->wl_lock);
> >> +		if (e) {
> >> +			atomic_inc(&ubi->bit_rot_work);
> >> +			schedule_bitrot_check(ubi, e);
> >> +		}
> >> +	}
> > 
> > Do we really need to create a ubi_work per PEB ?
> > Couldn't we create a single work being rescheduled inside the worker
> > function (after updating the ubi_wl_entry of course).
> 
> Currently the UBI worker thread handles one PEB per ubi_work. I didn't wanted
> to break that pattern. The downside of that approach is that we need more memory.
> A few KiB per run.
> 
> I'm not sure if I understood your idea. You mean that we schedule one check for
> PEB N and this work will re-schedule again a work for PEB N+1?

That's exactly what I meant.

> Using that approach we can safe memory, yes. But is it worth the hassle?

Unless I'm missing something, it should be pretty easy to implement:
adding the following lines at the end of bitrot_check_worker() should do
the trick

	if (e->pnum + 1 < ubi->peb_count) {
		wl_wrk->e = ubi->lookuptbl[e->pnum + 1];
		__schedule_ubi_work(ubi, wl_wrk);
	} else {
		atomic_dec(&ubi->bit_rot_work);
	}
	

> I'd like to avoid works which schedule again other works.
> In the current way it is clear where the work is scheduled and how much.

Yes, but the memory consumption induced by this approach can be pretty
big on modern NAND chips (on 32 bit platforms, ubi_work is 32 octets
large, and on modern NANDs you often have 4096 blocks, so a UBI device
of 4000 block is pretty common => 4000 * 32 = 125 KiB).

For standard wear leveling requests, using a ubi_work per request is
sensible since you can't know in advance which block will be queued for
wear-leveling operation next time.
In your case, you're scanning all blocks in ascending order, which
makes it a good candidate for this 'one work for all bitrot checks'
approach.



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
