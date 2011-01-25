Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Phs0j-0005C2-Or
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2011 23:09:18 +0000
In-Reply-To: <F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>	<OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>
	<F4EC0B87-B4D8-4577-A36B-64E1723634BC@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OF669CD6B0.87299771-ONC1257823.007EE3A7-C1257823.007F2FD2@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 26 Jan 2011 00:09:13 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> On Jan 25, 2011, at 1:56 PM, Joakim Tjernlund wrote:
>
> > On Jan 25, 2011, at 1:14 PM, Michael Cashwell wrote:
> >
> >> With this new part I'm seeing MTD errors that I think I've traced to cfi_cmdset_0001.c that I'd like to ask about.
> >>
> >> The error manifests when I write hard to a UBIFS file system on this NOR flash. What I see is a "NOR Flash: buffer write error" and then either "(block locked)" or "(Bad VPP)"
> >
> > I think chip hw error(s). These chips has some strange chip errors so you better check the errata for your chip. We have seen similar problems with these newer 65Nm Numonyx chips.
>
> The latest spec update for these is dated Nov 2009. It lists an issue with block lock/unlock (which I've handled separately) but nothing related to buffered programming.

Just check that you didn't get some old samples. We did.

>
> >> Interestingly, this new FLASH part has a write buffer of 512 words while the previous part was 32 words. Thus the write times (and time outs) have also increased by a similar x16 factor. I think this is why this has not been seen before.
> >
> > Should not the write time be about the same? What is the point with a bigger buffer otherwise?
>
> It seems the answer is between "the same" and "linear". The 32-word part had a max buffered write time of 880us. The 512-word part's is 4096us. So the timeout increases by 4.65 not 16. That yields faster writes but also the potential for different code paths in inval_cache_and_wait_for_operation
().

Yes

>
> >> Am I wildly confused in all this? When is dropping the chip->mutex while waiting for lengthy commands needed?
> >
> > When you want to suspend an erase to do a read for example. You don't want be be without erase suspend, trust me :)
>
> I believe that. But in that case there's an active command sent to suspend the in-process erase via writing 0xB0 at line 785.
>
> For non-XIP there is no suspension of buffered writes. Yet somehow, in the middle of one, the part goes back to array mode unexpectedly.
>
> >> Input welcome.
> >
> > It is unlikely there is a locking problem I think. You only need to lock when testing/changing the chip->state.
>
> Quite possible. This could just be a hardware bug in the chip. But I'm suspicious of that easy answer. We know these parts have longer write times and we know that makes the wait function more likely to schedule than with the older chips.

Right.

>
> The fact that the errors stop if I comment out the chip->mutex calls while waiting suggests to me that there's a reentrancy problem. It doesn't mean the locks are wrong or that doing that is a real fix.

Oh, I misread earlier. I figured you held the lock for all ops.

>
> I'm going to explore this on Wed. If I find a problem I'll report back.

Yes, seems like a good idea.
