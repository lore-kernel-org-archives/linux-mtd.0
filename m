Received: from [81.2.110.250] (helo=lxorguk.ukuu.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JrvVN-0008UF-RR
	for linux-mtd@lists.infradead.org; Fri, 02 May 2008 13:40:55 +0000
Date: Fri, 2 May 2008 14:32:40 +0100
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH] jffs2: Correct language use
Message-ID: <20080502143240.163e0819@core>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dwmw2 will appreciate this I am sure

The verb form of journal is "to journalise" not "to journal". Verified
with the OED and querying the British Computer Society. The s/z is
debatable but as the US prefers the s and the BCS prefers the s (and
Dwmw2 is in Cambridge which favours 's' over the Oxford 'z' ;)) we'll use
the s form.

No code changes included

Signed-off-by: Alan Cox <alan@redhat.com>

diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/acl.c linux-2.6.25-mm1/fs/jffs2/acl.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/acl.c	2008-04-28 11:36:44.000000000 +=
0100
+++ linux-2.6.25-mm1/fs/jffs2/acl.c	2008-05-02 13:40:27.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2006  NEC Corporation
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/acl.h linux-2.6.25-mm1/fs/jffs2/acl.h
--- linux.vanilla-2.6.25-mm1/fs/jffs2/acl.h	2008-04-28 11:36:44.000000000 +=
0100
+++ linux-2.6.25-mm1/fs/jffs2/acl.h	2008-05-02 13:51:21.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2006  NEC Corporation
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/background.c linux-2.6.25-mm1/fs/jffs2/background.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/background.c	2008-04-28 11:35:17.0000=
00000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/background.c	2008-05-02 13:40:48.000000000 +0=
100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/build.c linux-2.6.25-mm1/fs/jffs2/build.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/build.c	2008-04-28 11:35:17.000000000=
 +0100
+++ linux-2.6.25-mm1/fs/jffs2/build.c	2008-05-02 13:40:53.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/compr.c linux-2.6.25-mm1/fs/jffs2/compr.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/compr.c	2008-04-28 11:35:17.000000000=
 +0100
+++ linux-2.6.25-mm1/fs/jffs2/compr.c	2008-05-02 13:40:55.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  * Created by Arjan van de Ven <arjanv@redhat.com>
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/compr.h linux-2.6.25-mm1/fs/jffs2/compr.h
--- linux.vanilla-2.6.25-mm1/fs/jffs2/compr.h	2008-04-28 11:35:17.000000000=
 +0100
+++ linux-2.6.25-mm1/fs/jffs2/compr.h	2008-05-02 13:51:24.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2004   Ferenc Havasi <havasi@inf.u-szeged.hu>,
  *		      University of Szeged, Hungary
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/compr_lzo.c linux-2.6.25-mm1/fs/jffs2/compr_lzo.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/compr_lzo.c	2008-04-28 11:35:17.00000=
0000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/compr_lzo.c	2008-05-02 13:40:59.000000000 +01=
00
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2007 Nokia Corporation. All rights reserved.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/compr_rtime.c linux-2.6.25-mm1/fs/jffs2/compr_rtime.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/compr_rtime.c	2008-04-28 11:35:17.000=
000000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/compr_rtime.c	2008-05-02 13:41:01.000000000 +=
0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/compr_rubin.c linux-2.6.25-mm1/fs/jffs2/compr_rubin.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/compr_rubin.c	2008-04-28 11:35:17.000=
000000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/compr_rubin.c	2008-05-02 13:41:04.000000000 +=
0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/compr_zlib.c linux-2.6.25-mm1/fs/jffs2/compr_zlib.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/compr_zlib.c	2008-04-28 11:35:17.0000=
00000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/compr_zlib.c	2008-05-02 13:41:07.000000000 +0=
100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/debug.c linux-2.6.25-mm1/fs/jffs2/debug.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/debug.c	2008-04-28 11:35:17.000000000=
 +0100
+++ linux-2.6.25-mm1/fs/jffs2/debug.c	2008-05-02 13:41:10.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/debug.h linux-2.6.25-mm1/fs/jffs2/debug.h
--- linux.vanilla-2.6.25-mm1/fs/jffs2/debug.h	2008-04-28 11:36:50.000000000=
 +0100
+++ linux-2.6.25-mm1/fs/jffs2/debug.h	2008-05-02 13:51:28.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/dir.c linux-2.6.25-mm1/fs/jffs2/dir.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/dir.c	2008-04-28 11:36:44.000000000 +=
0100
+++ linux-2.6.25-mm1/fs/jffs2/dir.c	2008-05-02 13:41:13.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/erase.c linux-2.6.25-mm1/fs/jffs2/erase.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/erase.c	2008-04-28 11:35:17.000000000=
 +0100
+++ linux-2.6.25-mm1/fs/jffs2/erase.c	2008-05-02 13:41:15.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/file.c linux-2.6.25-mm1/fs/jffs2/file.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/file.c	2008-04-28 11:36:44.000000000 =
+0100
+++ linux-2.6.25-mm1/fs/jffs2/file.c	2008-05-02 13:41:19.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/fs.c linux-2.6.25-mm1/fs/jffs2/fs.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/fs.c	2008-04-28 11:36:50.000000000 +0=
100
+++ linux-2.6.25-mm1/fs/jffs2/fs.c	2008-05-02 13:41:22.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/gc.c linux-2.6.25-mm1/fs/jffs2/gc.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/gc.c	2008-04-28 11:36:50.000000000 +0=
100
+++ linux-2.6.25-mm1/fs/jffs2/gc.c	2008-05-02 13:41:24.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/ioctl.c linux-2.6.25-mm1/fs/jffs2/ioctl.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/ioctl.c	2008-04-28 11:36:50.000000000=
 +0100
+++ linux-2.6.25-mm1/fs/jffs2/ioctl.c	2008-05-02 13:41:27.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/jffs2_fs_i.h linux-2.6.25-mm1/fs/jffs2/jffs2_fs_i.h
--- linux.vanilla-2.6.25-mm1/fs/jffs2/jffs2_fs_i.h	2008-04-28 11:35:17.0000=
00000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/jffs2_fs_i.h	2008-05-02 13:51:31.000000000 +0=
100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/jffs2_fs_sb.h linux-2.6.25-mm1/fs/jffs2/jffs2_fs_sb.h
--- linux.vanilla-2.6.25-mm1/fs/jffs2/jffs2_fs_sb.h	2008-04-28 11:35:17.000=
000000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/jffs2_fs_sb.h	2008-05-02 13:51:34.000000000 +=
0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/malloc.c linux-2.6.25-mm1/fs/jffs2/malloc.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/malloc.c	2008-04-28 11:35:17.00000000=
0 +0100
+++ linux-2.6.25-mm1/fs/jffs2/malloc.c	2008-05-02 13:41:34.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/nodelist.c linux-2.6.25-mm1/fs/jffs2/nodelist.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/nodelist.c	2008-04-28 11:36:44.000000=
000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/nodelist.c	2008-05-02 13:41:37.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/nodelist.h linux-2.6.25-mm1/fs/jffs2/nodelist.h
--- linux.vanilla-2.6.25-mm1/fs/jffs2/nodelist.h	2008-04-28 11:35:17.000000=
000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/nodelist.h	2008-05-02 13:51:36.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/nodemgmt.c linux-2.6.25-mm1/fs/jffs2/nodemgmt.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/nodemgmt.c	2008-04-28 11:36:50.000000=
000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/nodemgmt.c	2008-05-02 13:41:40.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/os-linux.h linux-2.6.25-mm1/fs/jffs2/os-linux.h
--- linux.vanilla-2.6.25-mm1/fs/jffs2/os-linux.h	2008-04-28 11:36:44.000000=
000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/os-linux.h	2008-05-02 13:51:39.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/read.c linux-2.6.25-mm1/fs/jffs2/read.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/read.c	2008-04-28 11:35:17.000000000 =
+0100
+++ linux-2.6.25-mm1/fs/jffs2/read.c	2008-05-02 13:41:42.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/readinode.c linux-2.6.25-mm1/fs/jffs2/readinode.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/readinode.c	2008-04-28 11:36:44.00000=
0000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/readinode.c	2008-05-02 13:41:45.000000000 +01=
00
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/scan.c linux-2.6.25-mm1/fs/jffs2/scan.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/scan.c	2008-04-28 11:35:17.000000000 =
+0100
+++ linux-2.6.25-mm1/fs/jffs2/scan.c	2008-05-02 13:41:47.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/security.c linux-2.6.25-mm1/fs/jffs2/security.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/security.c	2008-04-28 11:35:17.000000=
000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/security.c	2008-05-02 13:41:51.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2006  NEC Corporation
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/summary.c linux-2.6.25-mm1/fs/jffs2/summary.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/summary.c	2008-04-28 11:36:50.0000000=
00 +0100
+++ linux-2.6.25-mm1/fs/jffs2/summary.c	2008-05-02 13:41:54.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2004  Ferenc Havasi <havasi@inf.u-szeged.hu>,
  *		     Zoltan Sogor <weth@inf.u-szeged.hu>,
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/summary.h linux-2.6.25-mm1/fs/jffs2/summary.h
--- linux.vanilla-2.6.25-mm1/fs/jffs2/summary.h	2008-04-28 11:35:17.0000000=
00 +0100
+++ linux-2.6.25-mm1/fs/jffs2/summary.h	2008-05-02 13:51:42.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2004  Ferenc Havasi <havasi@inf.u-szeged.hu>,
  *		     Zoltan Sogor <weth@inf.u-szeged.hu>,
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/super.c linux-2.6.25-mm1/fs/jffs2/super.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/super.c	2008-04-28 11:36:50.000000000=
 +0100
+++ linux-2.6.25-mm1/fs/jffs2/super.c	2008-05-02 13:43:35.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
@@ -236,7 +236,7 @@
 module_init(init_jffs2_fs);
 module_exit(exit_jffs2_fs);
=20
-MODULE_DESCRIPTION("The Journalling Flash File System, v2");
+MODULE_DESCRIPTION("The Journalising Flash File System, v2");
 MODULE_AUTHOR("Red Hat, Inc.");
 MODULE_LICENSE("GPL"); // Actually dual-licensed, but it doesn't matter for
 		       // the sake of this tag. It's Free Software.
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/symlink.c linux-2.6.25-mm1/fs/jffs2/symlink.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/symlink.c	2008-04-28 11:35:17.0000000=
00 +0100
+++ linux-2.6.25-mm1/fs/jffs2/symlink.c	2008-05-02 13:42:00.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/wbuf.c linux-2.6.25-mm1/fs/jffs2/wbuf.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/wbuf.c	2008-04-28 11:36:50.000000000 =
+0100
+++ linux-2.6.25-mm1/fs/jffs2/wbuf.c	2008-05-02 13:42:02.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  * Copyright =C2=A9 2004 Thomas Gleixner <tglx@linutronix.de>
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/write.c linux-2.6.25-mm1/fs/jffs2/write.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/write.c	2008-04-28 11:36:50.000000000=
 +0100
+++ linux-2.6.25-mm1/fs/jffs2/write.c	2008-05-02 13:42:05.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/writev.c linux-2.6.25-mm1/fs/jffs2/writev.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/writev.c	2008-04-28 11:35:17.00000000=
0 +0100
+++ linux-2.6.25-mm1/fs/jffs2/writev.c	2008-05-02 13:42:09.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2001-2007 Red Hat, Inc.
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/xattr.c linux-2.6.25-mm1/fs/jffs2/xattr.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/xattr.c	2008-04-28 11:36:50.000000000=
 +0100
+++ linux-2.6.25-mm1/fs/jffs2/xattr.c	2008-05-02 13:42:11.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2006  NEC Corporation
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/xattr.h linux-2.6.25-mm1/fs/jffs2/xattr.h
--- linux.vanilla-2.6.25-mm1/fs/jffs2/xattr.h	2008-04-28 11:35:17.000000000=
 +0100
+++ linux-2.6.25-mm1/fs/jffs2/xattr.h	2008-05-02 13:51:45.000000000 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2006  NEC Corporation
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/xattr_trusted.c linux-2.6.25-mm1/fs/jffs2/xattr_trust=
ed.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/xattr_trusted.c	2008-04-28 11:35:17.0=
00000000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/xattr_trusted.c	2008-05-02 13:40:40.000000000=
 +0100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2006  NEC Corporation
  *
diff -u --new-file --recursive --exclude-from /usr/src/exclude linux.vanill=
a-2.6.25-mm1/fs/jffs2/xattr_user.c linux-2.6.25-mm1/fs/jffs2/xattr_user.c
--- linux.vanilla-2.6.25-mm1/fs/jffs2/xattr_user.c	2008-04-28 11:35:17.0000=
00000 +0100
+++ linux-2.6.25-mm1/fs/jffs2/xattr_user.c	2008-05-02 13:40:43.000000000 +0=
100
@@ -1,5 +1,5 @@
 /*
- * JFFS2 -- Journalling Flash File System, Version 2.
+ * JFFS2 -- Journalising Flash File System, Version 2.
  *
  * Copyright =C2=A9 2006  NEC Corporation
  *
