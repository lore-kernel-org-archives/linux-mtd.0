Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMhwm-0006VE-Kj
 for linux-mtd@lists.infradead.org; Tue, 24 Apr 2012 15:46:33 +0000
Received: by dadn15 with SMTP id n15so1413467dad.16
 for <linux-mtd@lists.infradead.org>; Tue, 24 Apr 2012 08:46:30 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 24 Apr 2012 17:46:30 +0200
Message-ID: <CAHea38Td0PrZSr2c8g12UvVgOsTdKi_-sXhbnizzyEG+U91sVg@mail.gmail.com>
Subject: UBIFS switched to read-only mode after make_reservation warnings
From: Matteo Mattei <matteo.mattei@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,

continuing the tests on UBI/UBIFS and power cyclings I have the
following errors (dumping dmesg):

UBIFS warning (pid 776): make_reservation: too many space allocation
re-tries (123)
UBIFS warning (pid 776): make_reservation: too many space allocation
re-tries (124)
UBIFS warning (pid 776): make_reservation: too many space allocation
re-tries (125)
UBIFS warning (pid 776): make_reservation: too many space allocation
re-tries (126)
UBIFS warning (pid 776): make_reservation: too many space allocation
re-tries (127)
UBIFS warning (pid 776): make_reservation: too many space allocation
re-tries (128)
UBIFS error (pid 776): make_reservation: stuck in space allocation
UBIFS error (pid 776): make_reservation: cannot reserve 4144 bytes in
jhead 2, error -28
UBIFS error (pid 776): do_writepage: cannot write page 2075 of inode
80294, error -28
UBIFS warning (pid 776): ubifs_ro_mode: switched to read-only mode, error -28

It seems that there is not enough space for the journal...

This is the software and environment used:
- linux kernel 2.6.32 (from TI)
- ubifs backport (from git://git.infradead.org/~dedekind/ubifs-v2.6.32.git).
- 8-bit BCH.
- UBIFS mounted with no compression.
- usage of ubiformat instead of flash_eraseall for the first
filesystem initialization.

This is the hardware used:
- CPU: OMAP3530.
- NAND chips: Micron MT29F4G08ABBDAH4-IT.


Do you have any idea on what happened and how to fix this?
Which are the conditions that lead this behavior?

Thanks,

Matteo
