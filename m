Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pho3i-0003ga-Lx
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2011 18:56:07 +0000
In-Reply-To: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
References: <16826B66-31FE-41AD-A6EF-E668A45AF1FE@prograde.net>
Subject: Re: Numonyx NOR and chip->mutex bug?
To: Michael Cashwell <mboards@prograde.net>
Message-ID: <OF6FB39892.8BB946B6-ONC1257823.006654EE-C1257823.006801B7@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 25 Jan 2011 19:56:01 +0100
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
> Greetings All.
>
> I've been working on a 2.6.35.7-based ARM kernel for the Gumstix VerdexPro-XL6P hardware. (Our software; their hardware.) Previous boards had a Numonyx 256Mbit NOR flash marked 2003. The latest batch has an F in the part number (indicating a change from 130nm to 65nm) and a 2008 copyright. (The
part is a 256PF30TF).
>
> With this new part I'm seeing MTD errors that I think I've traced to cfi_cmdset_0001.c that I'd like to ask about.
>
> The error manifests when I write hard to a UBIFS file system on this NOR flash. What I see is a "NOR Flash: buffer write error" and then either "(block locked)" or "(Bad VPP)"

I think chip hw error(s). These chips has some strange chip errors so you better check
the errata for your chip. We have seen similar problems with these newer 65Nm Numonyx chips.

>
> Through a lot of tracing (which I can describe if anyone cares) I've determined that the problem is that while waiting for the write-completion command to finish the part mysteriously goes back into array mode. (The variations in the error message above stem from array data being seen as status
bits.)
>
> But how could that happen given the use of the chip->mutex? I think the answer is that the chip->mutex code is broken.
>
> The (non-XIP) wait function inval_cache_and_wait_for_operation() that waits for completion of the buffer program confirm command has several places where it drops and then retakes the chip->mutex. While dropped it does various cache-flush, msleep(), cond_reshed(), and schedule() calls. Exactly
which of these it calls depends on the absolute length of the operation underway.
>
> Interestingly, this new FLASH part has a write buffer of 512 words while the previous part was 32 words. Thus the write times (and time outs) have also increased by a similar x16 factor. I think this is why this has not been seen before.

Should not the write time be about the same? What is the point with a bigger buffer otherwise?

>
> I also think UBI is important in seeing the problem. If I just flash_erase and dd into an MTD partition it works fine. But those programs are single-threaded where improper mutex use won't matter. By contrast, UBI is heavily multi-threaded.
>
> But my confusion is how can dropping that mutex ever be correct? Isn't its purpose to prevent other threads from calling down into the MTD code for the same devices while a lengthy operation is underway? How can it ever be correct to then allow such concurrency in the middle of the operation?
>
> If I comment out all of those unlock/lock calls on chip->mutex in inval_cache_and_wait_for_operation() all the errors vanish. In fact, everything seems to work fine though I'm not doing suspend/resume.
>
> Am I wildly confused in all this? When is dropping the chip->mutex while waiting for lengthy commands needed? Scheduling

When you want to suspend an erase to do a read for example. You don't want be be without
erase suspend, trust me :)

> while holding a spinlock is bad, but we're not dealing with a spinlock but rather a mutex.
>
> Input welcome.

It is unlikely there is a locking problem I think. You only need to lock when testing/changing the
chip->state.
