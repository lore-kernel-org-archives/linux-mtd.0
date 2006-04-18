Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FVo4o-0006rk-F1
	for linux-mtd@lists.infradead.org; Tue, 18 Apr 2006 07:09:09 -0400
Received: from localhost ([127.0.0.1] helo=eos.fwall.u-szeged.hu)
	by eos.fwall.u-szeged.hu with smtp (Exim 4.51) id 1FVo4a-0002w5-Qe
	for linux-mtd@lists.infradead.org; Tue, 18 Apr 2006 13:08:44 +0200
Received: from eos.fwall.u-szeged.hu ([127.0.0.1])
	by eos.fwall.u-szeged.hu (SMSSMTP 4.1.9.35) with SMTP id
	M2006041813084415838
	for <linux-mtd@lists.infradead.org>; Tue, 18 Apr 2006 13:08:44 +0200
Received: from zsofi.inf.u-szeged.hu ([160.114.37.199]
	helo=mail.inf.u-szeged.hu)
	by eos.fwall.u-szeged.hu with esmtp (Exim 4.51) id 1FVo4a-0002wN-NG
	for linux-mtd@lists.infradead.org; Tue, 18 Apr 2006 13:08:44 +0200
Received: from [160.114.36.214] (kpax.inf.u-szeged.hu [160.114.36.214])
	by mail.inf.u-szeged.hu (Postfix) with ESMTP id 9C4A323969
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Apr 2006 13:08:44 +0200 (CEST)
Message-ID: <4444C8FD.1070406@inf.u-szeged.hu>
Date: Tue, 18 Apr 2006 13:09:49 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Subject: A JFFS2 optimization related to syslog
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear All,

If JFFS2 is used as root filesystem, syslogd/klogd can cause problems,
because every log line are written out individually, so the log file
will contain a lot of small nodes. Because a log file can be very large
(over 30M in our case) it can cause large memory consuption and can make
the system very slow, especially at opening it after next reboot
(becauseof the large frag-tree). Unforunatelly garbage collecting also
does not help, because none of the nodes is obsocalated.

The small patch below can help a lot. The idea behind it is very simple:
if there is a write request to write out the end of a page (4K) it will
write out the full page, not only the last part of it. The result of it
will be:
- small nodes will be obscolated
- garbage collector will be able to delete them
- after next reboot, when the file is under opening only this "large"
node will be read, the small node will not be parts of the frag tree
(thanks to Artem's improvement)

We think it can be usefull not only for us, and now we don't know about
any drawback.

May we commit it into CVS?

Regards,
Ferenc



diff -Narup Mtd-orig/fs/jffs2/file.c mtd/fs/jffs2/file.c
--- Mtd-orig/fs/jffs2/file.c    2005-11-07 12:14:39.000000000 +0100
+++ mtd/fs/jffs2/file.c    2006-04-11 16:35:15.000000000 +0200
@@ -221,6 +221,9 @@ static int jffs2_commit_write (struct fi
            page up to date, to prevent page_cache_read() from
            trying to re-lock it. */
         SetPageUptodate(pg);
+    } else if (end == PAGE_CACHE_SIZE) {
+        start = 0;
+        aligned_start = 0;
     }
 
     ri = jffs2_alloc_raw_inode();
