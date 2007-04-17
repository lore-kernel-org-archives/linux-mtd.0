Received: from an-out-0708.google.com ([209.85.132.243])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hdldm-0002El-Qc
	for linux-mtd@lists.infradead.org; Tue, 17 Apr 2007 07:14:31 -0400
Received: by an-out-0708.google.com with SMTP id d40so1512502and
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Apr 2007 04:14:29 -0700 (PDT)
Message-ID: <fe810cf0704170414r59900903rc8ed2e52d22eb833@mail.gmail.com>
Date: Tue, 17 Apr 2007 15:14:29 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [JFFS2] Non-contiguous write bug fix (Sibley)
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Yes, the bug still exists. The patch fixes JFFS2 non-contiguous write
error on Sibley.

Signed-off-by: Alexander Belyakov <alexander.belyakov@intel.com>
---
diff -uNr a/fs/jffs2/wbuf.c b/fs/jffs2/wbuf.c
--- a/fs/jffs2/wbuf.c	2007-03-23 22:52:51.000000000 +0300
+++ b/fs/jffs2/wbuf.c	2007-04-06 14:06:16.000000000 +0400
@@ -755,6 +755,13 @@
 		memset(c->wbuf,0xff,c->wbuf_pagesize);
 	}

+	/* Fixup the wbuf if we are moving to a new eraseblock */
+	if (((c->wbuf_ofs % c->sector_size) == 0) && !c->wbuf_len) {
+		c->wbuf_ofs = PAGE_DIV(to);
+		c->wbuf_len = PAGE_MOD(to);
+		memset(c->wbuf,0xff,c->wbuf_pagesize);
+	}
+
 	/*
 	 * Sanity checks on target address.  It's permitted to write
 	 * at PAD(c->wbuf_len+c->wbuf_ofs), and it's permitted to
