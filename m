Received: from beta.dmz-eu.st.com ([164.129.1.35])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18axHA-0002F8-00
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2003 12:13:08 +0000
Received: from zeta.dmz-eu.st.com (ns2.st.com [164.129.230.9])
	by beta.dmz-eu.st.com (STMicroelectronics) with SMTP id 44FEC48DF
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2003 12:43:34 +0000 (GMT)
Received: from agx002.agr.st.com (localhost [127.0.0.1])
	by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1DA91849
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2003 12:43:33 +0000 (GMT)
Received: from st.com (neural57.rdd.agr.st.com [164.130.35.120])
	by agx002.agr.st.com (8.9.3 (PHNE_24419)/8.9.3) with ESMTP id NAA10923
	for <linux-mtd@lists.infradead.org>; Tue, 21 Jan 2003 13:43:33 +0100 (MET)
Message-ID: <3E2D39A9.2168ABDA@st.com>
Date: Tue, 21 Jan 2003 13:14:33 +0100
From: Alessandro Bolgia <alessandro.bolgia@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: linux-mtd digest, Vol 1 #756 - 2 msgs
References: <20030121120011.8555.4319.Mailman@pentafluge.infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

linux-mtd-request@lists.infradead.org wrote:

> Send linux-mtd mailing list submissions to
>         linux-mtd@lists.infradead.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         http://lists.infradead.org/mailman/listinfo/linux-mtd
> or, via email, send a message with subject or body 'help' to
>         linux-mtd-request@lists.infradead.org
>
> You can reach the person managing the list at
>         linux-mtd-admin@lists.infradead.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of linux-mtd digest..."
>
> Today's Topics:
>
>    1. Re: About flash chip writing/erasing, reading chip status. (Steve Wahl)
>    2. Re: About flash chip writing/erasing, reading chip status. (Darren Freeman)
>
> --__--__--
>
> Message: 1
> Date: Mon, 20 Jan 2003 11:28:10 -0600
> From: Steve Wahl <swahl@brecis.com>
> To: Linux MTD mailing list <linux-mtd@lists.infradead.org>
> Subject: Re: About flash chip writing/erasing, reading chip status.
>
> Dear MTD folk,
>
> Hmm.  5 days and no replies.  That seems unusual for this list.  Or am
> I confusing it with the jffs2 developers list?
>
> I don't want to be a pest.  But I did expect to see some kind of
> interest...
>
> * Was I to wordy?
>
> * Did I send to the wrong place?
>
> * Is there a low-level chip "expert" who happens to be away from
>   email, who usually replies to stuff like this?
>
> I want to be a good member of the commuity.  I'd love to make the code
> we ship match CVS 100% for ease of future maintenance.  And I'd love
> to save someone else the trouble of finding this minor "bug".
>
> How can I do better at this?
>
> --> Steve Wahl, Brecis Communications
>
> On Wed, Jan 15, 2003 at 11:37:05AM -0600, Steve Wahl wrote:
> > I'm trying to place MTD and JFFS2 on our board, and I'm getting
> > occasional messages like "Warning: DQ5 raised while erase operation
> > was in progress, but erase completed OK" messages.
> >
> > I think the general method for polling the status of the chips is just
> > a bit wrong, or in other words, this warning is NORMAL operation and
> > should not be printed.
> >
> > If I understand things correctly, you start an operation like erasing
> > a block, then you get the status by performing a read to that block.
> > If the operation is in progress, data bit 6 toggles, and data bit 5
> > stays 0.  If the operation succeeds, data bits 6 and 5 return the data
> > at that address (bit 6 stops toggling).  If the operation fails, bit 6
> > keeps toggling and bit 5 goes to 1.
> >
> > The general algorithm used in mtd (recent CVS, cfi_cmdset_0002.c,v
> > 1.61 2002/11/17 13:10:34 spse) goes something like this (timeout
> > condition left out of the loop for brevity)
> >
> > ------------------------------------------------------------
> >       /* oldstatus and status are two reads from the same address */
> >       /* in each place it occurs in this code */
> >
> >       read oldstatus;
> >       read status;
> >
> >       while ( ((status & bit6) != (oldstatus & bit6))
> >               && ((status & bit5) == 0) )
> >       {
> >               read oldstatus;
> >               read status;
> >       }
> >
> >       if ( (status & bit6) != (oldstatus & bit6) )
> >       {
> >               /* still toggling, but exited loop. Why? */
> >
> >               if ( status & bit5 != 0 )
> >               {
> >                       /* bit5 went high. */
> >                       /* are we still toggling? */
> >                       read oldstatus;
> >                       read status;
> >
> >                       if (status == oldstatus)
> >                       {
> >                               /* no longer toggling, operation done */
> >                               printk("Warning: DQ5 raised while ...") ;
> >                       }
> >                       else
> >                       {
> >                               /* DQ5 went active, reset the chip */
> >                               ...
> >                       }
> >               }
> >
> >       }
> > ------------------------------------------------------------
> >
> > [ In the real code, there are some extra reads in the while loop that
> > make the condition I'm about to describe less likely, but it can still
> > happen.  ]
> >
> > Let's say we're looking at an erase operation (the one I seem to run
> > into).  Say we manage to just get lucky, and within the while loop,
> > the read of oldstatus returns the last status register value, and
> > status gets the actual data because the chip has returned to read
> > mode.  Status's value will be 0xFF, the erased value.  Furthermore,
> > suppose we get lucky and the toggle bit's value in the read of
> > oldstatus was a '0' (so in binary, oldstatus would have been
> > 'x00x-xxxx').  So the toggle bit is seen as still toggling in the
> > while loop, but bit5 suddenly goes from 0 to 1.
> >
> > This will end up printing the warning message erroneously.
> >
> > I think the "correct" thing to do would be to examine bit 5 from
> > oldstatus, so you're only looking at bit 5 from an earlier read, where
> > you know bit 6 has since toggled.  Like this:
> >
> >       read oldstatus;
> >       read status;
> >
> >       while ( ((status & bit6) != (oldstatus & bit6))
> >               && ((oldstatus & bit5) == 0) )
> >       {
> >               read oldstatus;
> >               read status;
> >       }
> >
> >       if ( (status & bit6) != (oldstatus & bit6) )
> >       {
> >               /* still toggling, but exited loop. Why? */
> >
> >               if ( oldstatus & bit5 != 0 )
> >               {
> >                       /* bit5 went high. */
> >                       /* NOTE: NO NEED TO CHECK IF WE'RE STILL TOGGLING. */
> >                       /* we know we are, because we checked bit5 in the */
> >                       /* previous read, and a read after it had bit6 */
> >                       /* different. */
> >                               /* DQ5 went active, reset the chip */
> >                               ...
> >               }
> >
> >       }
> >
> > I also think there's another error in the original code.  The original
> > code sets
> >
> >       dq5 = CMD(1<<5);
> >
> > which, if I understand things, sets up a word the correct width, with
> > a bit in EACH bit 5 position if you have interleaved chips.  Yet the
> > check for bit 5 being set (not being set in this case) is stated as
> >
> >       ((status & dq5) != dq5)
> >
> > which will only trigger when ALL bit5's are set.  I think it should
> > instead be
> >
> >       ((status & dq5) == 0)
> >
> > which triggers when ANY bit5 gets set.  Similarly, tests for
> >
> >       ((status & dq5) == dq5)
> >
> > should instead be
> >
> >       ((status & dq5) != 0)
> >
> > I've attached a patch file that changes both these things.  Please let
> > me know what you think.
> >
> > --> Steve Wahl,  Brecis Communications.
> >
> >
>
> > --- cfi_cmdset_0002.c.orig    Wed Jan 15 11:13:11 2003
> > +++ cfi_cmdset_0002.c Wed Jan 15 11:25:29 2003
> > @@ -520,7 +520,7 @@
> >       status = cfi_read(map, adr);
> >
> >       while( (status & dq6) != (oldstatus & dq6) &&
> > -            (status & dq5) != dq5 &&
> > +            (oldstatus & dq5) == 0 &&
> >              !time_after(jiffies, timeo) ) {
> >
> >               if (need_resched()) {
> > @@ -536,20 +536,17 @@
> >
> >       if( (status & dq6) != (oldstatus & dq6) ) {
> >               /* The erasing didn't stop?? */
> > -             if( (status & dq5) == dq5 ) {
> > -                     /* When DQ5 raises, we must check once again
> > -                        if DQ6 is toggling.  If not, the erase has been
> > -                        completed OK.  If not, reset chip. */
> > -                     oldstatus = cfi_read(map, adr);
> > -                     status = cfi_read(map, adr);
> > -
> > -                     if ( (oldstatus & 0x00FF) == (status & 0x00FF) ) {
> > -                             printk(KERN_WARNING "Warning: DQ5 raised while program operation was in progress, however operation completed OK\n" );
> > -                     } else {
> > -                             /* DQ5 is active so we can do a reset and stop the erase */
> > -                             cfi_write(map, CMD(0xF0), chip->start);
> > -                             printk(KERN_WARNING "Internal flash device timeout occurred or write operation was performed while flash was programming.\n" );
> > -                     }
> > +             if( (status & dq5) != 0 ) {
> > +
> > +                     /* one or more bit5's set. */
> > +
> > +                     /* no need to re-check if bit 6 is toggling, as */
> > +                     /* we've already seen bit 6 toggle after bit 5 */
> > +                     /* was set. */
> > +
> > +                     /* DQ5 is active so we can do a reset and stop the erase */
> > +                     cfi_write(map, CMD(0xF0), chip->start);
> > +                     printk(KERN_WARNING "Internal flash device timeout occurred or write operation was performed while flash was programming.\n" );
> >               } else {
> >                       printk(KERN_WARNING "Waiting for write to complete timed out in do_write_oneword.");
> >
> > @@ -773,7 +770,7 @@
> >       oldstatus = cfi_read(map, adr);
> >       status = cfi_read(map, adr);
> >       while( ((status & dq6) != (oldstatus & dq6)) &&
> > -             ((status & dq5) != dq5) &&
> > +             ((oldstatus & dq5) == 0) &&
> >               !time_after(jiffies, timeo)) {
> >               int wait_reps;
> >
> > @@ -805,7 +802,7 @@
> >               for(wait_reps = 0;
> >                       (wait_reps < 100) &&
> >                       ((status & dq6) != (oldstatus & dq6)) &&
> > -                     ((status & dq5) != dq5);
> > +                     ((oldstatus & dq5) == 0);
> >                       wait_reps++) {
> >
> >                       /* Latency issues. Drop the lock, wait a while and retry */
> > @@ -822,7 +819,7 @@
> >       }
> >       if ((status & dq6) != (oldstatus & dq6)) {
> >               /* The erasing didn't stop?? */
> > -             if ((status & dq5) == dq5) {
> > +             if ((oldstatus & dq5) != 0) {
> >                       /* dq5 is active so we can do a reset and stop the erase */
> >                       cfi_write(map, CMD(0xF0), chip->start);
> >               }
> > @@ -897,7 +894,7 @@
> >       oldstatus = cfi_read(map, adr);
> >       status = cfi_read(map, adr);
> >       while( ((status & dq6) != (oldstatus & dq6)) &&
> > -             ((status & dq5) != dq5) &&
> > +             ((oldstatus & dq5) == 0) &&
> >               !time_after(jiffies, timeo)) {
> >               int wait_reps;
> >
> > @@ -929,7 +926,7 @@
> >               for(wait_reps = 0;
> >                       (wait_reps < 100) &&
> >                       ((status & dq6) != (oldstatus & dq6)) &&
> > -                     ((status & dq5) != dq5);
> > +                     ((oldstatus & dq5) == 0);
> >                       wait_reps++) {
> >
> >                       /* Latency issues. Drop the lock, wait a while and retry */
> > @@ -947,34 +944,28 @@
> >       if( (status & dq6) != (oldstatus & dq6) )
> >       {
> >               /* The erasing didn't stop?? */
> > -             if( ( status & dq5 ) == dq5 )
> > +             if( ( oldstatus & dq5 ) != 0 )
> >               {
> > -                     /* When DQ5 raises, we must check once again if DQ6 is toggling.
> > -               If not, the erase has been completed OK.  If not, reset chip. */
> > -                 oldstatus   = cfi_read( map, adr );
> > -                 status      = cfi_read( map, adr );
> > -
> > -                 if( ( oldstatus & 0x00FF ) == ( status & 0x00FF ) )
> > -                 {
> > -                printk( "Warning: DQ5 raised while erase operation was in progress, but erase completed OK\n" );
> > -                 }
> > -                     else
> > -            {
> > -                         /* DQ5 is active so we can do a reset and stop the erase */
> > -                             cfi_write(map, CMD(0xF0), chip->start);
> > -                printk( KERN_WARNING "Internal flash device timeout occured or write operation was performed while flash was erasing\n" );
> > -                     }
> > +                     /* one or more bit5's set. */
> > +
> > +                     /* no need to re-check if bit 6 is toggling, as */
> > +                     /* we've already seen bit 6 toggle after bit 5 */
> > +                     /* was set. */
> > +
> > +                     /* DQ5 is active so we can do a reset and stop the erase */
> > +                     cfi_write(map, CMD(0xF0), chip->start);
> > +                     printk( KERN_WARNING "Internal flash device timeout occured or write operation was performed while flash was erasing\n" );
> >               }
> > -        else
> > -        {
> > -                 printk( "Waiting for erase to complete timed out in do_erase_oneblock.");
> > +             else
> > +             {
> > +                     printk( "Waiting for erase to complete timed out in do_erase_oneblock.");
> >
> > -             chip->state = FL_READY;
> > -             wake_up(&chip->wq);
> > -             cfi_spin_unlock(chip->mutex);
> > -             DISABLE_VPP(map);
> > -             return -EIO;
> > -     }
> > +                     chip->state = FL_READY;
> > +                     wake_up(&chip->wq);
> > +                     cfi_spin_unlock(chip->mutex);
> > +                     DISABLE_VPP(map);
> > +                     return -EIO;
> > +             }
> >       }
> >
> >       DISABLE_VPP(map);
>
> --__--__--
>
> Message: 2
> Subject: Re: About flash chip writing/erasing, reading chip status.
> From: Darren Freeman <free0076@infoeng.flinders.edu.au>
> Reply-To: dfreeman@ieee.org
> To: Steve Wahl <swahl@brecis.com>
> Cc: Linux MTD List <linux-mtd@lists.infradead.org>
> Organization:
> Date: 21 Jan 2003 05:31:27 +1030
>
> On Tue, 2003-01-21 at 03:58, Steve Wahl wrote:
> > Dear MTD folk,
> >
> > Hmm.  5 days and no replies.  That seems unusual for this list.  Or am
> > I confusing it with the jffs2 developers list?
>
> > How can I do better at this?
>
> Keep waiting ;)
>
> > --> Steve Wahl, Brecis Communications
>
> Have fun,
> Darren
>
> --__--__--
>
> ______________________________________________________
> Linux MTD discussion mailing list digest
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
> End of linux-mtd Digest
