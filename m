Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MyKxO-00053L-Rv
	for linux-mtd@lists.infradead.org; Thu, 15 Oct 2009 07:41:11 +0000
Date: Thu, 15 Oct 2009 09:40:57 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd
	<linux-mtd@lists.infradead.org>, David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v7 0/5]: mtdoops: fixes and improvements
Message-ID: <20091015094057.7298e0d7@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

(I'm taking the most of the discussion back to the mtd-list since most
of it is now pure mtdoops stuff).

Here are a couple of patches to mtdoops which I've been working on for
a while and which were recently discussed on the MTD list. They are
applied on top of Artems tree,

  http://git.infradead.org/users/dedekind/l2-mtd-2.6.git

which apart from the mainline tree contains a panic fix from Aaro and
Artems mtdoops style cleanup patch.


Now, I'd like to warn sensitive readers that patch 5 *does* contain work
queue elements. However, I believe there is a good reason for this: The
mtd->write call is not good to call while oopsing, and mtd->panic_write
is sort of a last resort. Now, if we panic anyhow, mtd->panic_write
will be called, so the oops will still be written and the scheduled
work won't run anyway.


The patches are:

1. Avoid erasing already empty areas (the area would be erased at each
   module load otherwise)

2. Keep track of mtdoops page cleanliness in an array. This allows
   mtdoops_inc_counter to be called during panic (which fails in my
   case with the current code in mtd->read, although I believe this is
   MTD-driver dependent).

3. Make page size configurable to support longer messages. Mainly
   needed for patch 4, but also allows longer messages to be stored
   during panics (when the next oops area cannot be erased).

4. (kernel/printk.c) Add a kmsg_dumper as per Linus suggestion which
   includes a dump_kmsg function which dumps the kernel log buffer to
   registered devices.

5. Refactor mtdoops as a kmsg_dumper device instead of a console device.

ChangeLog:

v2:
  * Patches have been reordered to keep the least controversial (?) first.
  * Implement Artems suggestion to keep cleanliness in an array
  * Use Aaros patch to fix the panic_on_oops problem

v3:
  * Correct checkpatch issues

v4: Review corrections
  * Rebase on top of "[PATCH] mtd: mtdoops: several minor cleanups"
  * Patch 1 has been added
  * Use 1 bit per oops page, and rename clean/dirty unused/used
  * Don't initialize oops_page_dirty (it's a global structure anyway so
    it will be cleared together with the rest of BSS)
  * Rename mtdoops_page_size record_size (although only for the page
    size setting)

v5: Corrections after panic_on_oops discussion
  * Add dump_device
  * Refactor mtdoops as a dump device.

v6: More corrections (panic_on_oops and Anders Grafstr=C3=B6m, my room-mate=
 at work)
  * Patches 2-5 modified
  * Use set_bit/clear_bit primitives in patch 2
  * Set permissions for mtdoops arguments correct in patch 3 and 5
  * Rename files and structures after Linus suggestions in patch 4
  * Correct output under some conditions in patch 5

v7: Even more corrections:
  * Patches 4-5 modified
  * Remove the priv pointer from the kmsg_dumper structure
  * Add Kconfig description of how to use mtdoops
  * Fix kfree bug

// Simon
