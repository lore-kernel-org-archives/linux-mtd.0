Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SNmEe-0000SV-BD
 for linux-mtd@lists.infradead.org; Fri, 27 Apr 2012 14:33:25 +0000
Date: Fri, 27 Apr 2012 16:33:17 +0200
From: Ivan Djelic <ivan.djelic@parrot.com>
To: Matteo Mattei <matteo.mattei@gmail.com>
Subject: Re: UBIFS switched to read-only mode after make_reservation warnings
Message-ID: <20120427143317.GC2044@parrot.com>
References: <CAHea38Td0PrZSr2c8g12UvVgOsTdKi_-sXhbnizzyEG+U91sVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHea38Td0PrZSr2c8g12UvVgOsTdKi_-sXhbnizzyEG+U91sVg@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 24, 2012 at 04:46:30PM +0100, Matteo Mattei wrote:
> Hi guys,
> 
> continuing the tests on UBI/UBIFS and power cyclings I have the
> following errors (dumping dmesg):
> 
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (123)
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (124)
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (125)
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (126)
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (127)
> UBIFS warning (pid 776): make_reservation: too many space allocation
> re-tries (128)
> UBIFS error (pid 776): make_reservation: stuck in space allocation
> UBIFS error (pid 776): make_reservation: cannot reserve 4144 bytes in
> jhead 2, error -28
> UBIFS error (pid 776): do_writepage: cannot write page 2075 of inode
> 80294, error -28
> UBIFS warning (pid 776): ubifs_ro_mode: switched to read-only mode, error -28
> 
> It seems that there is not enough space for the journal...
> 
> This is the software and environment used:
> - linux kernel 2.6.32 (from TI)
> - ubifs backport (from git://git.infradead.org/~dedekind/ubifs-v2.6.32.git).
> - 8-bit BCH.
> - UBIFS mounted with no compression.
> - usage of ubiformat instead of flash_eraseall for the first
> filesystem initialization.
> 
> This is the hardware used:
> - CPU: OMAP3530.
> - NAND chips: Micron MT29F4G08ABBDAH4-IT.
> 
> 
> Do you have any idea on what happened and how to fix this?
> Which are the conditions that lead this behavior?

Hello Matteo,

Your trace only shows the end of the story; the interesting part is what happens
before: have blocks been marked bad, e.g. after a UBI torture ? What are MTD/UBI/UBIFS saying ?

If you are running power cycling tests, I suggest you keep a full log of the system
(from the initial boot with a pristine flash till the end of the test).

You could also analyze your target NAND flash, especially how many bad blocks and empty
blocks it currently has.

BTW, have you been able to run tests using my patch ?

BR,
-- 
Ivan
