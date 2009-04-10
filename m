Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LsIzd-0002uc-QJ
	for linux-mtd@lists.infradead.org; Fri, 10 Apr 2009 15:50:20 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <1239376652.3390.49.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 10 Apr 2009 18:49:42 +0300
Message-Id: <1239378582.3390.66.camel@localhost.localdomain>
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

On Fri, 2009-04-10 at 18:17 +0300, Artem Bityutskiy wrote:
> Hi,
> 
> On Fri, 2009-04-10 at 08:27 -0600, Eric Holmberg wrote:
> > Test setup:
> >  * Using U-Boot 1.3.0
> >  * Write buffering enabled
> >  * S29GL256F 256Mbit NOR flash w/ 32-word write buffer
> >  * Test software that performs read/erase/write operations
> >  * JTAG debugger that randomly resets the board
> > 
> > Reset during write (unexpected test pattern written after un-programmed
> > values):
> > 
> > 30352240  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
> > 30352250  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
> > 30352260  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
> > 30352270  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
> > 30352280  ffffffff ffffffff ffffffff ffffffff
> > 30352290  ffffffff ffffffff ffffffff ffffffff
> > 303522a0  ffffffff ffffffff ffffffff ffffffff
> > 303522b0  aa55aa0a aa55aa0a aa55aa0a aa55aa0a
> > 303522c0  ffffffff ffffffff ffffffff ffffffff
> > 303522d0  ffffffff ffffffff ffffffff ffffffff
> > 303522e0  ffffffff ffffffff ffffffff ffffffff
> 
> Yeah, I think the recovery assumes that if you cut power during
> writing than:
> 
> 1. The min. I/O unit which has been written to at the moment power
>    cut happened will contain garbage.
> 2. But the next min. I/O unit will contain 0xFFs.
> 
> We have been working only with NAND flash, and min. I/O unit
> for NAND is one NAND page (usually 2KiB). We have never worked
> with NOR flash. We only tested UBIFS several times on the mtdram
> NOR flash emulator.
> 
> In case of NOR, UBIFS assumes min. I/O unit size is 8 bytes. Well,
> it is actually 1 byte, but because UBIFS aligns all its on-flash
> data structures to 8-byte boundaries, we used 8 for NOR, because
> it was easier implementation-wise.
> 
> Thus, UBIFS will panic when it meets the above pattern. And UBIFS
> would need some changes to make it understand this type of
> corruptions. All the recovery logic is in recovery.c. It should
> not be very difficult to change this.
> 
> You may ask - if while scanning you meet a corrupted node - why do
> you keep checking the rest of the node, and want to see 0xFFs there?
> 
> The reason why we do this check is that if we meet a corrupted node,
> we want to figure out the nature of the corruption - is this a
> non-finished write or a physical corruption, e.g. due to radiation,
> worn-out flash, etc. UBIFS writes eraseblocks from the beginning,
> to the end - always. So if the corrupted node is the last, this
> is harmless corruption because of power-cut, and we recover. But
> if the corruption is in a middle, this is something serious and
> we panic.
> 
> So in your case, UBIFS decides that it met a corrupted node in
> the middle, and panics.

So you need to play with ubifs_recover_leb() function.

There is the following code:

        if (!empty_chkd && !is_empty(buf, len)) {
                if (is_last_write(c, buf, offs)) {
                        clean_buf(c, &buf, lnum, &offs, &len);
                        need_clean = 1;
                } else {
                        ubifs_err("corrupt empty space at LEB %d:%d",
                                  lnum, offs);
                        goto corrupted;
                }
        }

So in your case "is_last_write()" returns zero, and UBIFS prints
cryptic "corrupt empty space" and panics.

I would try to hack the code and remove that panic part, and see
what happens. UBIFS should probably successfully recover the LEB.
This is done in 'fix_unclean_leb()'. What this function will do
it will:

1. Read all _good_ nodes from this LEB (ubi_read())
2. Atomically change the corrupted LEB (ubi_leb_change())

Atomic LEB change is UBI operation, read here about it:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_lebchange

In few words, on the physical flash level it will do:

1. Write the good nodes to a new, erased physical eraseblock
2. Erase the current physical eraseblock.

So, try the suggested hack out (inlined below). See what happens,
may be you discover other problems. After you played with recovery
code and have some success, we may push some nice solution to
UBIFS, e.g.

1. Introduce a mount option which tells UBIFS to assume that power-cuts
   during writing may disturb not only the current min_io_unit, but
   also the next ones.
2. Assume this if the flash type is NOR. May be there is some limit
   we may assume?

diff --git a/fs/ubifs/recovery.c b/fs/ubifs/recovery.c
index 1066297..9afa056 100644
--- a/fs/ubifs/recovery.c
+++ b/fs/ubifs/recovery.c
@@ -675,9 +675,10 @@ struct ubifs_scan_leb *ubifs_recover_leb(struct ubifs_info *c, int lnum,
 			clean_buf(c, &buf, lnum, &offs, &len);
 			need_clean = 1;
 		} else {
-			ubifs_err("corrupt empty space at LEB %d:%d",
-				  lnum, offs);
-			goto corrupted;
+			ubifs_warn("ignore corrupt empty space at LEB %d:%d",
+				   lnum, offs);
+			clean_buf(c, &buf, lnum, &offs, &len);
+			need_clean = 1;
 		}
 	}
 
-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
