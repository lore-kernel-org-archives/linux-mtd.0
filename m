Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N9wiW-0008Oa-Nr
	for linux-mtd@lists.infradead.org; Mon, 16 Nov 2009 08:13:49 +0000
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
From: Artem Bityutskiy <dedekind1@gmail.com>
To: nvbolhuis@aimsys.nl
In-Reply-To: <34637.10.10.0.184.1258202287.squirrel@intranet.aimsys.nl>
References: <34637.10.10.0.184.1258202287.squirrel@intranet.aimsys.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 16 Nov 2009 10:13:05 +0200
Message-Id: <1258359185.21596.1285.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-11-14 at 13:38 +0100, nvbolhuis@aimsys.nl wrote:
> > The only reason I see why it would do this is because you attach an
> > empty flash to UBI. In this case, UBI has to format it. And it is doing
> > the formatting asynchronously, in the background thread.
> >
> > The idea was that we can allow using the UBI volume even if it is not
> > fully formatted, and format in parallel. For NAND with its fast erase it
> > works fine. With NOR it appears to be not so goot.
> >
> > Please, attach UBI, then wait until the UBI background thread is done,
> > and then mount and start using UBIFS.
> >
> > The other option is to format the flash _properly_ before attaching it
> > to UBI. In this case the background thread will not have to do that job.
> > Use ubiformat for this:
> >
> >
> 
> The slow NOR erase is exactly my point. I don't want to ubiformat
> the entire NOR flash first. This takes 15-20 mins (for our 156 MB
> NOR partition).
> Time is very costly when our system becomes operational for the
> first time. This is because it happens at manufacturing
> (which performs some system wide tests). I don't want
> manufacturing to wait for the entire NOR flash to be fully
> formatted for each system to be produced.
> I know UBI will format in parallel and I consider it a feature.
> I just didn't expect it to block user-space applications.

Fair enough. However, this is not UBI/UBIFS which blocks everything.
This MTD chip lock that locks everything and is contended at. The right
fix would be improve MTD/CFI and teach them to be asynchronous and drop
the chip lock while the eraseing is in progress, allowing other tasks to
do I/O on other blocks. However, I do not know is it possible at all.

I mean, how UBI/UBIFS can help when:

1. Erase takes long time (how long? 0.2-0.5 sec?)
2. There are huge number of eraseblocks to erase in the queue.
3. All I/O is contended on one locks, and everything block while one
   eraseblock is erased.

How can UBI/UBIFS make things really fly fast?

The only way to help from UBI side I see is to lessen the UBI background
thread's priority - you could try this. Or for the background
formatting, have a 'yield()' call in the UBI background thread.

Or we could have a 'nor_erase_quirk()' in the UBI background thread,
which would call yield() if the previous operation was "erase", and the
next one is also "erase". You could try this.

Do you have any other suggestions?

> Won't user-space applications also be blocked whenever UBI needs
> to erase several NOR PEBs for other reasons than the initial
> parallel format. I'm thinking about replacing large files when UBIFS
> is almost fully occupied.

True. As Joakim pointed, this can happen if you delete many files.

> I don't see why the "parallel format" (for NOR) needs to be done so
> actively so soon at current high priority.

Well, we did not put any extra code to be "active". We just have a
thread and a queue of works to be done, and the thread simply performs
the works one-by-one. Try to lessen the thread's priority. Find a way
which works for you, and then we can add a 'nor_priority_quirk()' to
UBI.

>  If the system reboots
> (soft or hard) UBI will continue parallel formatting where it left,
> right ?

Correct.

> Btw. does UBI really need to erase the already empty=erased NOR PEBs.
> Can't it just somehow detect empty PEBs and then only program it with
> the UBI headers.

The reason is that it is not easy to find out whether an eraseblock is
erased or not. We would need to read all eraseblocks and compare the
contents with 0xFF. And even this would be unreliable because unclean
reboots often lead to bitflips, so you may read an eraseblock as all
0xFF at first, and then when you read it the second time, you can find
that on or few bits are set to 0 there. This is why we need to re-erase
non-formatted eraseblocks (non-formatted = no erase counter).

But if you need, you can extend the mtd UBI_IOCATT ioctl with a flag
that tells UBI that the flash is for sure empty and does not require
re-erasing. Then if you are mistaken, you'll end up with nasty subtle
problems.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
