Received: from arrows.demon.co.uk ([83.105.72.193])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I9nSi-0007jX-Gt
	for linux-mtd@lists.infradead.org; Sat, 14 Jul 2007 15:39:30 -0400
Date: Sat, 14 Jul 2007 19:08:11 +0100 (BST)
From: John Smith <john@arrows.demon.co.uk>
To: <linux-mtd@lists.infradead.org>
Subject: UBI: Incorrect initial value for ubi->avail_pebs
Message-ID: <Pine.LNX.4.33.0707141836500.19907-100000@arrows.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I suggest that the initial calculation of ubi->avail_pebs
is incorrect. But perhaps it is intentionally done this way.

A number of erase blocks, controlled by CONFIG_MTD_UBI_BEB_RESERVE,
are reserved for handling bad blocks. The number of actual bad blocks
are also reserved. I think it would be better if the actual bad blocks
were taken from the CONFIG_MTD_UBI_BEB_RESERVE allocation.

In more detail, during scan time the calculation of ubi->avail_pebs
goes roughly:

  /* in attach_by_scanning() */
  ubi->good_peb_count = ubi->peb_count - ubi->bad_peb_count;

  /* in ubi_read_volume_table() */
  ubi->avail_pebs = ubi->good_peb_count;

  /* in init_volumes() */
  reserved_pebs =  sum of volume sizes
  reserved_pebs += size of layout volume
  ubi->avail_pebs -= reserved_pebs

  /* in ubi_wl_init_scan() */
  #define WL_RESERVED_PEBS 1
  ubi->avail_pebs -= WL_RESERVED_PEBS

  /* In calculate_reserved() */
  ubi->beb_rsvd_level = ubi->good_peb_count/100;
  ubi->beb_rsvd_level *= CONFIG_MTD_UBI_BEB_RESERVE;

  /* in ubi_eba_init_scan() */
  ubi->beb_rsvd_pebs = min(ubi->beb_rsvd_level, ubi->avail_pebs)
  ubi->avail_pebs -= ubi->beb_rsvd_pebs;

The effect is that existing bad blocks on the device are allocated
from the budget of blocks for data rather than from the budget of
blocks for bad blocks.

To fix, I suggest that in ubi_read_volume_table() in vtbl.c the
initial value of ubi->avail_pebs should be set by

    ubi->avail_pebs = ubi->peb_count ;

and for consistancy, the beb_rsvd_level should come from

  ubi->beb_rsvd_level = ubi->peb_count/100;
  ubi->beb_rsvd_level *= CONFIG_MTD_UBI_BEB_RESERVE;

But I accept that one could argue that the current implementation is
correct.

Regards,
John

John Smith
Blackburn, England.
