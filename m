Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N9xLg-0007qv-CK
	for linux-mtd@lists.infradead.org; Mon, 16 Nov 2009 08:54:17 +0000
In-Reply-To: <1258359185.21596.1285.camel@localhost>
References: <34637.10.10.0.184.1258202287.squirrel@intranet.aimsys.nl>
	<1258359185.21596.1285.camel@localhost>
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
To: dedekind1@gmail.com
Message-ID: <OF4EAF98D9.8FAE2E28-ONC1257670.00302441-C1257670.0030D73E@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 16 Nov 2009 09:53:28 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	nvbolhuis@aimsys.nl
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> On Sat, 2009-11-14 at 13:38 +0100, nvbolhuis@aimsys.nl wrote:
> > > The only reason I see why it would do this is because you attach an
> > > empty flash to UBI. In this case, UBI has to format it. And it is doing
> > > the formatting asynchronously, in the background thread.
> > >
> > > The idea was that we can allow using the UBI volume even if it is not
> > > fully formatted, and format in parallel. For NAND with its fast erase it
> > > works fine. With NOR it appears to be not so goot.
> > >
> > > Please, attach UBI, then wait until the UBI background thread is done,
> > > and then mount and start using UBIFS.
> > >
> > > The other option is to format the flash _properly_ before attaching it
> > > to UBI. In this case the background thread will not have to do that job.
> > > Use ubiformat for this:
> > >
> > >
> >
> > The slow NOR erase is exactly my point. I don't want to ubiformat
> > the entire NOR flash first. This takes 15-20 mins (for our 156 MB
> > NOR partition).
> > Time is very costly when our system becomes operational for the
> > first time. This is because it happens at manufacturing
> > (which performs some system wide tests). I don't want
> > manufacturing to wait for the entire NOR flash to be fully
> > formatted for each system to be produced.
> > I know UBI will format in parallel and I consider it a feature.
> > I just didn't expect it to block user-space applications.
>
> Fair enough. However, this is not UBI/UBIFS which blocks everything.
> This MTD chip lock that locks everything and is contended at. The right
> fix would be improve MTD/CFI and teach them to be asynchronous and drop
> the chip lock while the eraseing is in progress, allowing other tasks to
> do I/O on other blocks. However, I do not know is it possible at all.
>
> I mean, how UBI/UBIFS can help when:
>
> 1. Erase takes long time (how long? 0.2-0.5 sec?)
> 2. There are huge number of eraseblocks to erase in the queue.
> 3. All I/O is contended on one locks, and everything block while one
>    eraseblock is erased.
>
> How can UBI/UBIFS make things really fly fast?
>
> The only way to help from UBI side I see is to lessen the UBI background
> thread's priority - you could try this. Or for the background
> formatting, have a 'yield()' call in the UBI background thread.
>
> Or we could have a 'nor_erase_quirk()' in the UBI background thread,
> which would call yield() if the previous operation was "erase", and the
> next one is also "erase". You could try this.
>
> Do you have any other suggestions?
>
> > Won't user-space applications also be blocked whenever UBI needs
> > to erase several NOR PEBs for other reasons than the initial
> > parallel format. I'm thinking about replacing large files when UBIFS
> > is almost fully occupied.
>
> True. As Joakim pointed, this can happen if you delete many files.

I only noticed a problem with deleting big files and then a reboot.
if you don't reboot, the system will work. Perhaps this is due
to the actual CFI driver? I am using cmdset_0001 and it is a bit more
evolved than the others. My NOR flash also supports erase suspend.
If you are using cmdset_0002 you should consider fixing it.
As I recall, erase suspend is disabled. There was a thread about it
a while ago were I noticed a bug in the driver which may be the reason
for erase suspend being disabled. I even posted some
fixes for this but I don't think anyone bothered to test them.

     Jocke
