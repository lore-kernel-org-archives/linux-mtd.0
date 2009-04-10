Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LsIUC-0007hF-G3
	for linux-mtd@lists.infradead.org; Fri, 10 Apr 2009 15:17:51 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Apr 2009 18:17:32 +0300
Message-Id: <1239376652.3390.49.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Urs Muff <urs_muff@Trimble.com>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, 2009-04-10 at 08:27 -0600, Eric Holmberg wrote:
> Test setup:
>  * Using U-Boot 1.3.0
>  * Write buffering enabled
>  * S29GL256F 256Mbit NOR flash w/ 32-word write buffer
>  * Test software that performs read/erase/write operations
>  * JTAG debugger that randomly resets the board
> 
> Reset during write (unexpected test pattern written after un-programmed
> values):
> 
> 30352240  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
> 30352250  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
> 30352260  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
> 30352270  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
> 30352280  ffffffff ffffffff ffffffff ffffffff
> 30352290  ffffffff ffffffff ffffffff ffffffff
> 303522a0  ffffffff ffffffff ffffffff ffffffff
> 303522b0  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
> 303522c0  ffffffff ffffffff ffffffff ffffffff
> 303522d0  ffffffff ffffffff ffffffff ffffffff
> 303522e0  ffffffff ffffffff ffffffff ffffffff

Yeah, I think the recovery assumes that if you cut power during
writing than:

1. The min. I/O unit which has been written to at the moment power
   cut happened will contain garbage.
2. But the next min. I/O unit will contain 0xFFs.

We have been working only with NAND flash, and min. I/O unit
for NAND is one NAND page (usually 2KiB). We have never worked
with NOR flash. We only tested UBIFS several times on the mtdram
NOR flash emulator.

In case of NOR, UBIFS assumes min. I/O unit size is 8 bytes. Well,
it is actually 1 byte, but because UBIFS aligns all its on-flash
data structures to 8-byte boundaries, we used 8 for NOR, because
it was easier implementation-wise.

Thus, UBIFS will panic when it meets the above pattern. And UBIFS
would need some changes to make it understand this type of
corruptions. All the recovery logic is in recovery.c. It should
not be very difficult to change this.

You may ask - if while scanning you meet a corrupted node - why do
you keep checking the rest of the node, and want to see 0xFFs there?

The reason why we do this check is that if we meet a corrupted node,
we want to figure out the nature of the corruption - is this a
non-finished write or a physical corruption, e.g. due to radiation,
worn-out flash, etc. UBIFS writes eraseblocks from the beginning,
to the end - always. So if the corrupted node is the last, this
is harmless corruption because of power-cut, and we recover. But
if the corruption is in a middle, this is something serious and
we panic.

So in your case, UBIFS decides that it met a corrupted node in
the middle, and panics.

> Reset during erase (unexpected - 1's change to zeros during erase):
> 
> 30249930  aa55aa02 aa55aa02 aa55aa02 aa55aa02
> 30249940  aa55aa02 aa55aa02 aa55aa02 aa55aa02
> 30249950  8a51aa02 aa55aa02 a855aa02 aa55aa02
> 30249960  00000000 00000000 00000000 00000000
> 30249970  00000000 00000000 00000000 00000000
> 30249980  00000000 00000000 00000000 00000000
> 30249990  00000000 00000000 00000000 00000000
> 302499a0  00000000 00000000 00000000 80000000
> 302499b0  02000001 00000000 00000000 00000000
> 302499c0  00040000 00000000 00000000 80000000
> 
> Reset during erase (expected erase behavior - 0 not yet changed to 1):
> 30248ed0  ffffffff ffffffff ffffffff ffffffff
> 30248ee0  ffffffef ffffffff ffffffff ffffffff
> 30248ef0  ffffffff ffffffff ffffffff ffffffff
> 
> 
> Questions
> ---------
> How are interrupted writes or erase cycles handled in UBI / UBIFS for
> NOR flash?  Are the unexpected PEB values that I am seeing properly
> handled by the UBI/UBIFS error recovery process?

I thing I answered on this question above.

> Are erase and write
> operations journaled to allow restarting the process upon boot-up?

Writes go to the journal. The journal is re-played on mount.

Erases are handled at UBI layer, not UBIFS. I think what you see WRT to
erases should be handled by UBI just fine. UBI uses the following logic:

1. It scans flash by reading the beginning of each erasebloc, where it
   expects to see at least EC header, or both EC and VID header.
2. If there is no EC header, the eraseblock will be erased, and EC
   header will be written.

So, all these corrupted/half-erase EBs will be erased again.

> As a side note, MTD_BIT_WRITEABLE is not set for the NOR flash.  Is this
> to be expected?  Do I need to set this in the partition table?  The NOR
> flash does support programming a 1 to a 0, which is what I'm assuming
> MTD_BIT_WRITEABLE means.

We do not use this property, because it does not exists on NAND. We
wrote UBIFS mostly for NANDS. And when it works on NOR, it uses it
more or less like NAND with NAND page = 8 bytes.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
