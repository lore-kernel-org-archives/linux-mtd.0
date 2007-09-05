Received: from nf-out-0910.google.com ([64.233.182.190])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ISrIG-0006oD-6m
	for linux-mtd@lists.infradead.org; Wed, 05 Sep 2007 05:35:31 -0400
Received: by nf-out-0910.google.com with SMTP id h3so1843381nfh
	for <linux-mtd@lists.infradead.org>;
	Wed, 05 Sep 2007 02:35:26 -0700 (PDT)
Message-ID: <fe810cf0709050235r47986ba4u2683917550169083@mail.gmail.com>
Date: Wed, 5 Sep 2007 13:35:25 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
	"Linux MTD mailing list" <linux-mtd@lists.infradead.org>
Subject: [PATCH] [JFFS2] Sibley non-contiguous write bug fix
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

some time ago we have fixed one Sibley non-contiguous write bug:
http://git.infradead.org/?p=mtd-2.6.git;a=commit;h=3fddb6c985e3823c991399840d2d5ef5940e1b60

But it seems there is the same bug in another place.
jffs2_flash_writev() sets 'wbuf_ofs' to the first page in block
causing a BUG(). Please look at this patch.



Don't leave the wbuf 'offset' field pointing at the start of the next
physical eraseblock. This is causing a BUG() on NOR-ECC (Sibley)
flash.

Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>
---
diff -uNr a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
--- a/fs/jffs2/wbuf.c	2007-07-09 03:32:17.000000000 +0400
+++ b/fs/jffs2/wbuf.c	2007-07-09 16:55:29.000000000 +0400
@@ -846,6 +846,10 @@
 		donelen += wbuf_retlen;
 	}

+	/* adjust write buffer offset, else we get a non contiguous write bug */
+	if (!(c->wbuf_ofs % c->sector_size) && !c->wbuf_len)
+		c->wbuf_ofs = 0xffffffff;
+
 	/*
 	 * If there's a remainder in the wbuf and it's a non-GC write,
 	 * remember that the wbuf affects this ino
