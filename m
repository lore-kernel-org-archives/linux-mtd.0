From: swahl@brecis.com (Steve Wahl)
Date: Mon, 17 Mar 2003 10:19:28 -0600
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <1047916461.11517.85.camel@tubarao>; from tharbaugh@lnxi.com on Mon, Mar 17, 2003 at 08:54:21AM -0700
References: <20030312102735.U1745@brecis.com> <002701c2e8ba$8690e8c0$1200a8c0@JOHNB> <20030312154316.X1745@brecis.com> <1047916461.11517.85.camel@tubarao>
Message-ID: <20030317101928.J1745@brecis.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, Mar 17, 2003 at 08:54:21AM -0700, Thayne Harbaugh wrote:
> On Wed, 2003-03-12 at 14:43, Steve Wahl wrote:
> > On Wed, Mar 12, 2003 at 12:12:12PM -0500, John Burch wrote:
> 
> <snip>
> 
> > > The status register (including DQ5) won't reflect actual data until
> > > a reset command is issued,
> > 
> > This I think is a misunderstanding or misstatement on your part.  The
> > reads WILL return to actual data without a reset upon successful
> > completion of the operation.  Only on a failure does software need to
> > issue the reset to return to reading data!
> 
> Big question: how is it know if status bits are being read or the real
> data that was written to an address?  I have read many data sheets and I
> don't recall any of them discussing this concern.

Easy, at least in theory.  If two consecutive reads are the same, then
the DQ6 isn't toggling any longer, therfore you are reading data.

Only if the two consecutive reads are different can you assume that
you read the status register -- and you can only assume the FIRST read
was a status register, because the second read could have been after
changing to data mode.

But, outside of easy theories, there's a couple of gotchas in there.

I've read at least one data sheet that suggested that the switch from
the status register to the data "register" happens asyncronously to
processor reads, so it is possible, though very unlikely, to get some
bits from the status register and some bits from the actual data
within a single read -- if the read happens at the exact instance that
the chip is switching from one mode to the other.

I have never seen any code that takes this into account -- sample
code, data sheet flow charts, etc.  I think this may, however, have
something to do with what you wrote: "I do know, however, that several
manufactures recommend that the final status should be checked an
additional two times before a success is reported."  I'd be interested
to see specific data sheets or application notes that do this.


--> Steve
