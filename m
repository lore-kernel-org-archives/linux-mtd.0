Received: from smtp-4.hut.fi ([130.233.228.94])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 168uPX-0005Wz-00
	for <linux-mtd@lists.infradead.org>; Wed, 28 Nov 2001 02:25:19 +0000
Received: from kosh.hut.fi (jlavi@kosh.hut.fi [130.233.228.10])
	by smtp-4.hut.fi (8.9.3/8.9.3) with ESMTP id OAA64682
	for <linux-mtd@lists.infradead.org>; Tue, 27 Nov 2001 14:13:57 +0200 (EET)
Received: (from jlavi@localhost)
	by kosh.hut.fi (8.9.3/8.9.3) id OAA02739
	for linux-mtd@lists.infradead.org; Tue, 27 Nov 2001 14:13:57 +0200 (EET)
Date: Tue, 27 Nov 2001 14:13:57 +0200
From: Jarkko Lavinen <jlavi@iki.fi>
To: MTD List <linux-mtd@lists.infradead.org>
Subject: CFI driver & flash banks
Message-ID: <20011127141357.A29578@kosh.hut.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Currently there is no concept of banks (planes, or partition regions)
within the CFI driver.  The whole chip has one single state regardless
of what is going on inside various regions in the chip.  With multiple
banks on chips this can lead to erroneous operation and less than
optimal performance.

Structure fi_private contains an array of cñhips of type flchip. The
flchip structure contains the global state of the chip.

What is needed is more fine granularity in chip state control. The
driver should be able to know the state of each bank in the chip
independently of other banks. The driver should be able to read from
another bank while writing or erasing another. The driver should be
able to understand that difference between only one bank changing its
state versus all banks changing their state together.

What kind of state transitions there are?

  - With chip reset, all banks are set to FL_READY (read array).

  - When entering status query, only one bank is put into FL_STATUS state.

  - With programming or erasing, only one bank is set to FL_WRITING or
    FL_ERASING. This requires no other bank is in erasing, programing,
    or in erase suspend. Other banks will be typically in FL_READY or
    FL_STATUS state.

  - When entering erase suspend, the bank returns to read array mode
    but no other bank can start erase or programming. The old state
    FL_ERASING is remembered,

It would make good for JFFS2 performance if writing in one sector
would block only one bank from reads, not the whole chip. The need for
suspending erase would be reduced.

My question is, how to implement this functionality in the CFI driver
in backward compliant way?

Instead of accessing chip->state, should one also be able to access
each banks like state chip->banks[bank].state ?

Or perhaps one should always query the chip state from the chip
itself? How about the old status when doing erase suspend?

Or should the status be a method that would cache the banks' status
and would read the status from the chiu only when crossing the bank
boundary?

Jarkko Lavinen
