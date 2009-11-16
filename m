Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NA0TX-0008RY-FU
	for linux-mtd@lists.infradead.org; Mon, 16 Nov 2009 12:14:36 +0000
In-Reply-To: <4B012D0D.4080500@aimvalley.nl>
References: <4B012D0D.4080500@aimvalley.nl>
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
To: "N. van Bolhuis" <nvbolhuis@aimvalley.nl>
Message-ID: <OF98F7568F.B01A3D19-ONC1257670.00420398-C1257670.0043096A@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 16 Nov 2009 13:12:13 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



"N. van Bolhuis" <nvbolhuis@aimvalley.nl> wrote on 16/11/2009 11:44:29:
>
>
> > Fair enough. However, this is not UBI/UBIFS which blocks everything.
> > This MTD chip lock that locks everything and is contended at. The right
> > fix would be improve MTD/CFI and teach them to be asynchronous and drop
> > the chip lock while the eraseing is in progress, allowing other tasks to
> > do I/O on other blocks. However, I do not know is it possible at all.
> >
> > I mean, how UBI/UBIFS can help when:
> >
> > 1. Erase takes long time (how long? 0.2-0.5 sec?)
> > 2. There are huge number of eraseblocks to erase in the queue.
> > 3. All I/O is contended on one locks, and everything block while one
> >    eraseblock is erased.
> >
> > How can UBI/UBIFS make things really fly fast?
> >
>
> true, UBI/UBIFS can't really fix this.
> Btw. the sector erase time for our NOR flash (S29GL01GP) is
> 0.7-0.8 seconds.
>
> > The only way to help from UBI side I see is to lessen the UBI background
> > thread's priority - you could try this. Or for the background
> > formatting, have a 'yield()' call in the UBI background thread.
> >
> > Or we could have a 'nor_erase_quirk()' in the UBI background thread,
> > which would call yield() if the previous operation was "erase", and the
> > next one is also "erase". You could try this.
> >
> > Do you have any other suggestions?
>
> No. Let's try the 'nor_erase_quirk()' solution.
> yield() will send the current process to expired list
> which means the other processes will be activated for sure, right ?
> I think this will work fine.
> It sounds like you already have an idea how to implement this,
> can you send a patch ? I will test it.
>
>
> The best solution is to use erase-suspend (if your chip supports it).
> Our chip supports read+write erase-suspend (cfip->EraseSuspend = 0x2).
> But as Joakim already mentioned cfi_cmdset_0002.c disables erase-suspend
> for writing. Maybe this is because of line 710 in the below code:
>
>   703                 if (mode == FL_WRITING) /* FIXME:
> Erase-suspend-program appears broken. */
>   704                         goto sleep;
>   705
>   706                 if (!(   mode == FL_READY
>   707                       || mode == FL_POINT
>   708                       || !cfip
>   709                       || (mode == FL_WRITING &&
> (cfip->EraseSuspend & 0x2))
>   710                       || (mode == FL_WRITING &&
> (cfip->EraseSuspend & 0x1)
>   711                     )))
>   712                         goto sleep;
>   713
>   714                 /* We could check to see if we're trying to access
> the sector
>
>
> As has been mentioned earlier line 710 should probably be removed.
> Erase-suspend shouldn't be done if read-only erase-suspend is supported
> (cfip->EraseSuspend = 0x1).
>
> I can remove line 703-705 + 710 and test this.
> I wonder though, if this works, is this enough "solid ground" to enable
> erase-suspend for cmdset_002 ?

The test on line 706 is broken, I posted a semi complete patch
correcting this:
if (!cfip || !(cfip->EraseSuspend & (0x1|0x2)) ||
    !(mode == FL_READY || mode == FL_POINT ||
     (mode == FL_WRITING && (cfip->EraseSuspend & 0x2))))

Then remove the
  if (mode == FL_WRITING) /* FIXME: Erase-suspend-program appears broken. */
       goto sleep;
to enable Erase-suspend-program

Find in the archives heading "don't suspend erase for erase in cfi_cmdset_0002"
for details.

       Jocke
