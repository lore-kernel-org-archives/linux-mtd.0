Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MvuCh-00064P-Va
	for linux-mtd@lists.infradead.org; Thu, 08 Oct 2009 14:42:57 +0000
Date: Thu, 8 Oct 2009 16:42:43 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 0/3]: mtdoops fixes and improvements
Message-ID: <20091008164243.2344df24@marrow.netinsight.se>
In-Reply-To: <20091002160510.191ef5a4@marrow.netinsight.se>
References: <20091002160510.191ef5a4@marrow.netinsight.se>
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

The patches here are:

1. Keep track of mtdoops page cleanliness in an array. This allows
   mtdoops_inc_counter to be called during panic (which fails in my
   case, although I believe this is MTD-driver dependent).

2. Make page size configurable to support longer messages. Mainly
   needed for patch 3, but also allows longer messages to be stored
   during panics (when the next oops area cannot be erased).

3. Store all kernel messages in a circular buffer. This changes the
   behavior of mtdoops a bit by constantly recording messages (not only
   on oopses), which are written out on oopses and panics.

   The code is changed to register a panic handler which calls the
   write function, and on normal oopses scheduling a write work to
   store the buffer.

ChangeLog from last submit:

* Patches have been reordered to keep the least controversial (?) first.

* Implement Artems suggestion to keep cleanliness in an array

* Use Aaros patch to fix the panic_on_oops problem

// Simon
