Received: from [212.177.102.39] (helo=www.logitron.it)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BayWP-0005b9-Ut
	for linux-mtd@lists.infradead.org; Thu, 17 Jun 2004 11:09:47 -0400
To: linux-mtd@lists.infradead.org
From: andrea.tarani@gilbarco.com
Date: Thu, 17 Jun 2004 17:09:38 +0200
Message-ID: <OF77935382.F1EA090B-ONC1256EB6.00526020@logitron.it>
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: Memory leak in compr.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If compression are enabled and the current block can't be compressed the
allocated buffer
aren't released.


--- /home/anta/mtd/fs/jffs2/compr.c      2004-05-28 12:50:54.000000000 +0200
+++ /cygdrive/z/linux-2.4.x/fs/jffs2/compr.c  2004-06-17 15:56:14.000000000 +0200
@@ -168,6 +168,7 @@
             *datalen = *cdatalen;
                 none_stat_compr_blocks++;
                 none_stat_compr_size += *datalen;
+                JFFS2_FREE(output_buf);
         }
         else {
                 *cpage_out = output_buf;
