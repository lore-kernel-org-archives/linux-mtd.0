From: swahl@brecis.com (Steve Wahl)
Date: Wed, 12 Mar 2003 15:43:16 -0600
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <002701c2e8ba$8690e8c0$1200a8c0@JOHNB>; from jburch@vincisystems.com on Wed, Mar 12, 2003 at 12:12:12PM -0500
References: <20030312102735.U1745@brecis.com> <002701c2e8ba$8690e8c0$1200a8c0@JOHNB>
Message-ID: <20030312154316.X1745@brecis.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Wed, Mar 12, 2003 at 12:12:12PM -0500, John Burch wrote:
> AMD's own method from code they provide is shown below...
> 
> By the way, AMD specifically mentions having to check DQ6/7 again
> after DQ5=1 because of the possibility that DQ5=1 simultaneous with
> toggling stopping.  The app note I referred to before (attached this
> time) describes this in some detail.  

I agree with this.

> The status register (including DQ5) won't reflect actual data until
> a reset command is issued,

This I think is a misunderstanding or misstatement on your part.  The
reads WILL return to actual data without a reset upon successful
completion of the operation.  Only on a failure does software need to
issue the reset to return to reading data!

The app note you attached agrees with me on this.

> so I think the concern about DQ5=1 because erased data (0xff) is
> read instead of status is not valid.

I disagree.  This concern is indeed valid, and is the primary reason
you must check for toggling AFTER noticing DQ5=1 in the first place.

Note that cfiflash below does not handle interleave nor bit
endianness, so you can't adopt it directly.

--> Steve

> John
> 
> >From AMD's cfiflash.c:
> 
> /*********************************************************************/
> /* Flash_status utilizes the DQ6, DQ5, and DQ3 polling algorithms    */
> /* described in the flash data book.  It can quickly ascertain the   */
> /* operational status of the flash device, and return an             */
> /* appropriate status code (defined in flash.h)                      */
> /*********************************************************************/
>  
> int flash_status(word far *fp)
> {
> 	 unsigned char d, t;
> 	 int retry = 1;
> 
> again:
> 
> 	 d = *fp;        /* read data */
> 	 t = d ^ *fp;    /* read it again and see what toggled */
> 
> 	 if (t == 0) {           /* no toggles, nothing's happening */
> 		return STATUS_READY;
> 	 }
> 	 else if (t == 0x04) { /* erase-suspend */
> 		if (retry--) goto again;    /* may have been write
> completion */
> 		return STATUS_ERSUSP;
> 	 }
> 	 else if (t & 0x40) {
> 		if (d & 0x20) {     /* timeout */
> 		  return STATUS_TIMEOUT;
> 		}
> 		else {
> 		  return STATUS_BUSY;
> 		}
> 	 }
> 
> 	 if (retry--) goto again;    /* may have been write completion
> */
> 
> 	 return STATUS_ERROR;
> }
> 
> 
> 
> > -----Original Message-----
> > From: linux-mtd-admin at lists.infradead.org 
> > [mailto:linux-mtd-admin at lists.infradead.org] On Behalf Of Steve Wahl
> > Sent: Wednesday, March 12, 2003 11:28 AM
> > To: Thayne Harbaugh
> > Cc: linux-mtd at lists.infradead.org
> > Subject: Re: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy 
> > Queen 5 warning)
> > 
> > 
> > Thayne, 
> > 
> > I have a patch that I was given permission to check in, but 
> > never got around to it, that covers a similar "DQ5 raised" problem.
> > 
> > I would wager you are running into the same problem I did, 
> > and that your chips compatibly support DQ5, if not as a 
> > watchdog, at least by holding it low while programming.
> > 
> > Can you look at my previous posts on this, try my patch (if 
> > you don't have interleaved chips -- contact me if you do), 
> > and see if it works for you?
> > 
> > http://lists.infradead.org/pipermail/linux-mtd/2003-January/00
> > 6780.html
> > 
> > --> Steve
> > 
> > 
> > On Tue, Mar 11, 2003 at 05:25:15PM -0700, Thayne Harbaugh wrote:
> > > For some reason I am confused: I get the feeling that what 
> > I'm trying 
> > > to understand is obvious - I just can't see the forest for 
> > the trees.  
> > > Will someone help me understand?
> > > 
> > > cfi_cmdset_0002.c has several functions that use dq5 and dq6 for 
> > > monitoring the status of erase and write operations:
> > > 
> > > dq6 = CMD(1<<6);
> > > dq5 = CMD(1<<5);
> > > 
> > > Apparently, from the code dq6 toggles during erase/read 
> > operations and 
> > > dq5 is low until the erase/read operation times out and 
> > then goes high 
> > > (somewhat like a watchdog bit).
> > > 
> > > My understanding, at least for the SST 49LF040 and PMC Pm49L004 is 
> > > that dq6 toggles during erase/write and dq7 is inverted until the 
> > > erase/write operation completes.  This causes me to expect 
> > to see the 
> > > following code rather than what is written above (not to 
> > mention that 
> > > most everything in do_write_one_word() should be adapted for dq7 
> > > invert):
> > > 
> > > dq7 = CMD(1<<7); /* invert */
> > > dq6 = CMD(1<<6); /* toggle */
> > > 
> > > The differences give me the feeling that there really are two 
> > > different classes of cfi_cmdset_0002 - those devices that 
> > have a dq5 
> > > watchdog and those devices that don't have the watchdog, but have a 
> > > bit inverter on dq7.
> > > 
> > > Am I not understanding what happens on bits 0-5 during an 
> > erase/write 
> > > operation?  The PMC and SST chips don't mention a thing about dq5 
> > > behavior.  If they don't have the dq5 watchdog timer then they will 
> > > behave in an undefined way (depending on the state of bit 5 in the 
> > > written word) with the current dq5 checking.  This explains 
> > the many 
> > > warnings I see with the SST and PMC chips in do_write_oneword(),
> > > 
> > > "Warning: DQ5 raised while program operation was in 
> > progress, however 
> > > operation completed OK"
> > > 
> > > Around here we refer to this as the "Dairy Queen 5" warning.
> > > 
> > > Obviosly, during an erase that completes prior to dq5 being 
> > read-back, 
> > > dq5 will be high and the current algorithm is erroneously correct.  
> > > This can explain why I have not seen the same message in 
> > > do_erase_oneblock().
> > > 
> > > Furthermore, the SST documentation on page 10 refers to "spurios 
> > > rejection" of good writes - differentiating between a write that 
> > > succeeds that appears to fail and a write that fails.  It 
> > says that a 
> > > write that appears to fail needs to be read back two more times 
> > > successfully to filter out spurious rejection.
> > > 
> > > Comments?  What should change to improve the operation completion 
> > > check?  Should cfi_cmdset_0002 be adapted to handle 
> > multiple types of 
> > > polling or should another command set be written?
> > > 
> > > --
> > > Thayne Harbaugh
> > > Linux Networx
> > 
> > 
> > 
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 
