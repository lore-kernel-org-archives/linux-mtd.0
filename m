Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhNwo-00040g-BC
 for linux-mtd@lists.infradead.org; Sun, 12 Apr 2015 19:53:39 +0000
Message-ID: <552ACD28.8000409@nod.at>
Date: Sun, 12 Apr 2015 21:53:12 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 4/4] UBI: Implement bitrot checking
References: <1427631197-23610-1-git-send-email-richard@nod.at>	<1427631197-23610-5-git-send-email-richard@nod.at>	<20150412190119.7f0f7c64@bbrezillon>	<552AA6B7.3070806@nod.at>
 <20150412212050.2949b6f5@bbrezillon>
In-Reply-To: <20150412212050.2949b6f5@bbrezillon>
Content-Type: text/plain; charset=windows-1252
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

Am 12.04.2015 um 21:20 schrieb Boris Brezillon:
> Unless I'm missing something, it should be pretty easy to implement:
> adding the following lines at the end of bitrot_check_worker() should do
> the trick
> 
> 	if (e->pnum + 1 < ubi->peb_count) {
> 		wl_wrk->e = ubi->lookuptbl[e->pnum + 1];
> 		__schedule_ubi_work(ubi, wl_wrk);
> 	} else {
> 		atomic_dec(&ubi->bit_rot_work);
> 	}
> 	

It will suffer from the same race issue as my current approach.
While e is scheduled another worker could free it in case of an fatal
error.

>> I'd like to avoid works which schedule again other works.
>> In the current way it is clear where the work is scheduled and how much.
> 
> Yes, but the memory consumption induced by this approach can be pretty
> big on modern NAND chips (on 32 bit platforms, ubi_work is 32 octets
> large, and on modern NANDs you often have 4096 blocks, so a UBI device
> of 4000 block is pretty common => 4000 * 32 = 125 KiB).

While I agree that consuming memory is not very nice I don't think that 125KiB
is a big deal.

> For standard wear leveling requests, using a ubi_work per request is
> sensible since you can't know in advance which block will be queued for
> wear-leveling operation next time.
> In your case, you're scanning all blocks in ascending order, which
> makes it a good candidate for this 'one work for all bitrot checks'
> approach.

The good news is that I have an idea to solve both problems the race and
the memory issue. It should be pretty easy to implement.
Patches will materialize in a few days.

Thanks,
//richard
