Received: from wa-out-1112.google.com ([209.85.146.179])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JmunU-0002rN-Qk
	for linux-mtd@lists.infradead.org; Fri, 18 Apr 2008 17:54:53 +0000
Received: by wa-out-1112.google.com with SMTP id v33so919257wah.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 18 Apr 2008 10:54:50 -0700 (PDT)
Message-ID: <6934efce0804181054y5887c6b4kc1129deec2d3a2eb@mail.gmail.com>
Date: Fri, 18 Apr 2008 10:54:50 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Alexey Korolev" <akorolev@infradead.org>,
	"=?UTF-8?Q?Anders_Grafstr=C3=B6m?=" <grfstrm@users.sourceforge.net>,
	"Linux-MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: Re: cfi_cmdset_0001.c: Excessive erase suspends
In-Reply-To: <20080418163536.GD31520@shareable.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4807B552.7090501@users.sourceforge.net>
	<Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>
	<20080418163536.GD31520@shareable.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anders,
Just to make sure we aren't overlooking an easier problem:

1) the original report is a JFFS2 error, not direct observation of the
mtd partition.

2) Did you check that the MTD is configured to treat this flash with
the correct bus width?  I've been burned trying to figure out why a
16bit configuration was missing half the data, turned out I had it
configured for 32bit MTD accesses.

3) I'd like to see that you can't use flash_eraseall and hexdump
/dev/mtdX to see this behavior.  Or maybe you could try to create a
simple test that would suspend an erase 10K times and verify the erase
looking for errors.

Before we go off implement solutions lets verify that we understand
the problem by implementing some kind a repeatable test condition to
trigger this.  However, if there is a problem with excessive
suspending...

>   - Do other chip docs say how many cycles are acceptable?
>     Is there a count we can assume is safe for all devices of this
>     type - like say 100?

A number like that would probably serve to punish many devices while
failing to be safe for "all devices".  I'm not a big fan of this
approach.

>   - Does the time spent in erase suspend matter?  E.g. if it was
>     suspended for 1 minute due to lots of pending writes, restarted,
>     and then suspended _again_ for 1 minute, etc. does that reduce the
>     number of safe suspend-resume cycles due to the unstable
>     partially-erased physical state?

I'm pretty sure that any difficultly with suspends is more about the
time between suspends rather than the time _in_ suspend.  Rather than
minimizing the time in suspend, maximize the time out of suspend.
Think of the erase being suspended as a process being context
switched.  If you context switch to quickly all you do is the
switching, no real work in the process.  You keep that up to long, you
_could_ have a problem.  A solution might be an small delay before a
write suspends the erase.

>   - Is it worth reading a block after erasing it, to verify that it's
>     wiped - and mark blocks which have experienced >threshold suspend
>     cycles as needing verification and re-erase, rather than meaning
>     it's a bad block? ( Verification could be done lazily, on each part
>     of the block just before writing. )  But is this good physically,
>     or does too many suspends put the block into an unreliable state
>     even if it does pass verification, so that it's important to limit
>     the suspends rather than allow many and verify afterwards?

Similar to what you are thinking, I believe that even _if_  you can
put a block in a funky state by excessive suspending the part would
still read cleanly.  I don't think this is worth much.

Excessive suspending is much more likely to trigger a failed erase,
with an error condition being reported by the chip.  The MTD will
return an error in that case so you don't really need to look for an
error.  It's kind of in your face.  I'd be very surprised if can you
can get a consistent behavior like what you describe just by
suspending.
