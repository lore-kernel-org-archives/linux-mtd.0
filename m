Date: Tue, 31 Jul 2007 11:35:47 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
To: linux-mtd@lists.infradead.org
Subject: Unlocking with Intel J3 series flash
Message-ID: <20070731153547.GA24705@marvin.netwinder.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

When using Intel J3 flash, unlocking operations are horribly slow.
The reason for this is that the J3 has "Flexible Block-locking" feature
(to quote that data sheet) which "allows blocks to be individually
locked and simultaneously unlocked".

Unlike other flash chips which power up either locked or unlocked,
the J3 series stores lock status in the flash itself (non-volatile).
Locking is reasonably fast (~64us) and can be done per-block, but
unlocking is very slow (~0.5s) and does the whole chip at once.

Current MTD code makes the situation much worse, because the
unlock() operation goes via cfi_varsize_frob() and iterates over
the block lists.  This is of course correct behaviour when the
cells are indivudually un-lockable, however it results in minute-long
delays and many needeless erase cycles for the J3 series.

I am looking for ideas on how to deal with this.  One idea would be
to introduce a cousin to the existing MTD_STUPID_LOCK, perhaps one
called MTD_STUPID_UNLOCK, which would then be used to ensure that
unlocking does not iterate over all flash blocks.

-R
