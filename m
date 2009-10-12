Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MxIjh-00027M-Fy
	for linux-mtd@lists.infradead.org; Mon, 12 Oct 2009 11:06:46 +0000
Date: Mon, 12 Oct 2009 13:06:35 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 0/3]: mtdoops fixes and improvements
Message-ID: <20091012130635.45b76b34@marrow.netinsight.se>
In-Reply-To: <20091008172516.64b5c462@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
	<20091008172516.64b5c462@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, Aaro Koskinen <aaro.koskinen@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Here are a couple of patches to mtdoops which I've been working on for
a while. They should be applied on top of Aaros fix for panic_on_oops.
That one technically breaks building mtdoops as a module, so I sent a
patch to LKML which exports panic_on_oops:

  http://patchwork.kernel.org/patch/52505/

(Artem has also sent the same patch). The patches here are:

1. Avoid erasing already empty areas (the area would be erased at each
   module load otherwise)

2. Keep track of mtdoops page cleanliness in an array. This allows
   mtdoops_inc_counter to be called during panic (which fails in my
   case, although I believe this is MTD-driver dependent).

3. Make page size configurable to support longer messages. Mainly
   needed for patch 3, but also allows longer messages to be stored
   during panics (when the next oops area cannot be erased).

4. Store all kernel messages in a circular buffer. This changes the
   behavior of mtdoops a bit by constantly recording messages (not only
   on oopses), which are written out on oopses and panics.

   The code is changed to register a panic handler which calls the
   write function, and on normal oopses scheduling a write work to
   store the buffer.

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
