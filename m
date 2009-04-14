Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LtkpS-0003f9-SE
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 15:45:50 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB70305BEFB@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305BEFB@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Apr 2009 18:45:24 +0300
Message-Id: <1239723924.3390.136.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@Trimble.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-04-14 at 09:09 -0600, Eric Holmberg wrote:
> The write-buffer command is part of the CFI standard, but the size of
> the buffer is up to the chip manufacturer.  For example, we have two NOR
> Flash chips on our board and one has a write buffer size of 1 word (2
> bytes) and the other is 32 words (64 bytes).  CFI auto-detects the
> maximum write-buffer size and places the value in the structure element
> cfi_ident::MaxBufWriteSize (located in mtd/cfi.h).  That could always be
> used to determine the size of writes to flash, but maybe a UBI
> configuration value that is set manually would be a better option?

I wonder how do I determine that the flash is flash is CFI flash...
UBI uses struct mtd_info, and uses the ->type field, if it is
MTD_NORFLASH, then it assumes the flash is NOR. But it has not
idea if it is a CFI flash or not...

I think adding an UBI option is not very good because it adds
yet another complication users would have to understand. It is
nicer to hide it from user.

Do you know what is the maximum possible buffer size? If it is 64,
we may just teach UBI assume 64 for all NORs. This should be good
enough.

> I ran a corruption test on 3 different boards which used an application
> that writes to the flash continuously (doing read, write, and rename
> operations on a UBIFS root file system) and then a script would randomly
> remove power.

OK.

> Here are the results for NOR flash with a block-size of 64 bytes -- the
> data currently points to the block write size of 64 bytes being the
> issue since changing it to 1 eliminated the corruption.  I'm going to
> run one more test where I force it to 8 bytes (based upon your comment
> that UBIFS allows up to 8-bytes to be garbage).  If fails, then there is
> a different issue causing the problem.

OK, let's see.

> Test #1 - FORCE_WORD_WRITE = 1
> ----------------------------------------------
> cfi_cmdset_0002.c FORCE_WORD_WRITE is 1 (true) which disables block
> writes to the NOR flash.  This fixed the problem as no corruption has
> occurred after 96 hours of power cycling (over 6000 power cycles). 

Good!

> Test #2 - Corrupt Empty Block Recovery
> -------------------------------------------------
> cfi_cmdset_0002.c FORCE_WORD_WRITE is 0 (false) and added the code that
> you graciously provided to correct the corrupt-empty space LEB.  This
> worked great for recovery of the corrupt empty space, but then
> additional corruption occurred at which point it looks like the
> super-block got changed to an orphan node (type 11) - see below.

Hmm, sounds familiar. I saw an error like this. Did you pull
the latest UBIFS changes from the UBIFS git tree? Please, pull
them from
git://git.infradead.org/~dedekind/ubifs-v2.6.27.git
(you use 2.6.27, AFAIK).

But may be there is a yet another place we need to change.

> Corruption occurred after approximately 2 hours of operation
> (approximately 130 power cycles).
> 
> [42949375.790000] UBIFS error (pid 1): ubifs_read_node: bad node type
> (11 but expected 6)
> [42949375.800000] UBIFS error (pid 1): ubifs_read_node: bad node at LEB
> 0:0

How about enabling debugging (no debugging messages, just debugging).
See
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
item 3.

And please, try to boot with "ignore_loglevel" option in your command
line. This makes sure you see _all_ UBIFS messages on your console,
when it fails. There will be more useful info, e.g., stack dump
and node dump (see fs/ubifs/io.c, 'ubifs_read_node()').

> Test #3 - Control
> -------------------------------------------------
> Stock kernel 2.6.27.  Corrupt empty-space failure occurred within 2
> hours of running.
> 
> [42949375.720000] UBIFS: recovery needed
> [42949375.780000] UBIFS error (pid 1): ubifs_scan: corrupt empty space
> at LEB 6:14912, expected 0xFF, got 0x0
> [42949375.790000] UBIFS error (pid 1): ubifs_scanned_corruption:
> corrupted data at LEB 6:14912
> [42949375.810000] UBIFS error (pid 1): ubifs_scan: LEB 6 scanning failed
> [42949375.850000] UBIFS error (pid 1): ubifs_recover_leb: corrupt empty
> space at LEB 6:224
> [42949375.860000] UBIFS error (pid 1): ubifs_scanned_corruption:
> corrupted data at LEB 6:224
> [42949375.890000] UBIFS error (pid 1): ubifs_recover_leb: LEB 6 scanning
> failed

Similar. Please, pull the latest fixes. And next time attach
_all_ UBIFS messages, which you should get when you have
"ignore_loglevel".

> Next Steps
> ----------
> I'm going to run a test with the write-buffer size set to 8 bytes.  If
> that works, then I think the next task is to see how to add the
> CFI/NOR-awareness to UBIFS.

Yes, makes sense, lets see.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
