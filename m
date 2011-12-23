Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Re9Ym-0005Bz-LE
 for linux-mtd@lists.infradead.org; Fri, 23 Dec 2011 18:09:37 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 00/28] introduce wrappers for mtd interfaces
Date: Fri, 23 Dec 2011 20:10:52 +0200
Message-Id: <1324663880-22477-1-git-send-email-dedekind1@gmail.com>
Cc: Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

this patch-series introduce a bunch of wrappers for mtd interfaces, e.g.:
* mtd_read() for mtd->read()
* mtd_write() for mtd->write()
* mtd_is_locked() form mtd->is_locked()

and so forth for all interfaces found in 'struct mtd_info'.

The motivation is to help Mike Dunn to improve MTD bit-flips handling. He
needs to distinguish between 1,2,3, etc bit-flips. Currently MTD just returns
-EUCLEAN on any amount of bit-flips, which is too coarse for modern NANDs.
E.g., for modern NANDs we do not want UBI to scrub on 1 bit-flip because in
this case it will scrub all the time and will wear the flash out quickly.

So Mike wants to add a new parameter to mtdcore which either the driver
can set or the user can set/override via sysfs: the scrub level - this is
the bit-flip level which is considered dangerous and at which the eraseblock
have to be scrubbed. This depends on the flash HW and ECC, primarily, as well
as on user's reliability requirements.

Anyway wants to return -EUCLEAN only if the bit-flip level is higher or
equivalent to the scrub level. To implement this, he needs to have a place
common for all drivers to inject his code to. Currently it is impossible
because MTD users call directly the driver's functions. With these wrappers
it will become possible.

Additionally, the wrappers will give a possibility to implement input
parameters checking once in the wrapper and to avoid duplicating this in
many places.

This patch-set only substitutes 'mtd->func()' with 'mtd_func()', I used spatch
to do this. But we'd need to do some more work:
 1 Find places like
	if (mtd->block_isbad)
		mtd_block_isbad(...)
   and nicify them (possibly move the "if" check to the wrapper)
 2 Rename all the function pointers in 'struct mtd_info' in order to
   make sure every driver has switched to the wrappers.
 3 Move the common input parameters checking to the wrappers

However, these are independent tasks which can be done a bit later, and
I am planning to do this. But I'd like to merge this patch-set during
this merge window. If we have them already upstream by the time we start
doing item 3, it will be way easier to handle build breakages and to do
the interface change smoothly.

Artem.
