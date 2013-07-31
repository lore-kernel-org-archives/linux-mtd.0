Received: from a10-78.smtp-out.amazonses.com ([54.240.10.78])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V4YAQ-0002NE-FW
 for linux-mtd@lists.infradead.org; Wed, 31 Jul 2013 15:18:24 +0000
Date: Wed, 31 Jul 2013 15:17:56 +0000
From: Christoph Lameter <cl@gentwo.org>
To: Wladislav Wiebe <wladislav.kw@gmail.com>
Subject: Re: mm/slab: ppc: ubi: kmalloc_slab WARNING / PPC + UBI driver
In-Reply-To: <alpine.DEB.2.02.1307310858150.30572@gentwo.org>
Message-ID: <00000140354e9118-9bafa70a-cb37-40a5-a6f3-4d39581f4942-000000@email.amazonses.com>
References: <51F8F827.6020108@gmail.com>
 <alpine.DEB.2.02.1307310858150.30572@gentwo.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: dedekind1@gmail.com, Mel Gorman <mel@csn.ul.ie>, dwmw2@infradead.org,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch will suppress the warnings by using the page allocator wrappers
of the slab allocators. These are page sized allocs after all.


Subject: seq_file: Use kmalloc_large for page sized allocation

There is no point in using the slab allocation functions for large page
order allocation. Use the kmalloc_large() wrappers which will cause calls
to the page alocator instead.

This fixes the warning about large allocs but it will still cause
high order allocs to occur that could fail because of memory
fragmentation. Maybe switch to vmalloc if we really want to allocate multi
megabyte buffers for proc fs?

Signed-off-by: Christoph Lameter <cl@linux.com>

Index: linux/fs/seq_file.c
===================================================================
--- linux.orig/fs/seq_file.c	2013-07-10 14:03:15.367134544 -0500
+++ linux/fs/seq_file.c	2013-07-31 10:11:42.671736131 -0500
@@ -96,7 +96,7 @@ static int traverse(struct seq_file *m,
 		return 0;
 	}
 	if (!m->buf) {
-		m->buf = kmalloc(m->size = PAGE_SIZE, GFP_KERNEL);
+		m->buf = kmalloc_large(m->size = PAGE_SIZE, GFP_KERNEL);
 		if (!m->buf)
 			return -ENOMEM;
 	}
@@ -136,7 +136,7 @@ static int traverse(struct seq_file *m,
 Eoverflow:
 	m->op->stop(m, p);
 	kfree(m->buf);
-	m->buf = kmalloc(m->size <<= 1, GFP_KERNEL);
+	m->buf = kmalloc_large(m->size <<= 1, GFP_KERNEL);
 	return !m->buf ? -ENOMEM : -EAGAIN;
 }

@@ -191,7 +191,7 @@ ssize_t seq_read(struct file *file, char

 	/* grab buffer if we didn't have one */
 	if (!m->buf) {
-		m->buf = kmalloc(m->size = PAGE_SIZE, GFP_KERNEL);
+		m->buf = kmalloc_large(m->size = PAGE_SIZE, GFP_KERNEL);
 		if (!m->buf)
 			goto Enomem;
 	}
@@ -232,7 +232,7 @@ ssize_t seq_read(struct file *file, char
 			goto Fill;
 		m->op->stop(m, p);
 		kfree(m->buf);
-		m->buf = kmalloc(m->size <<= 1, GFP_KERNEL);
+		m->buf = kmalloc_large(m->size <<= 1, GFP_KERNEL);
 		if (!m->buf)
 			goto Enomem;
 		m->count = 0;
