Received: from main.gmane.org ([80.91.224.249])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AvClu-0006ZE-7Y
	for linux-mtd@lists.infradead.org; Mon, 23 Feb 2004 09:53:06 +0000
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1AvCls-0005Lx-00
	for <linux-mtd@lists.infradead.org>; Mon, 23 Feb 2004 10:53:04 +0100
Received: from mail.cambridgetechgroup.com ([80.177.250.58])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-mtd@lists.infradead.org>; Mon Feb 23 09:53:04 2004
Received: from john-news2 by mail.cambridgetechgroup.com with local (Gmexim
	0.1 (Debian))        id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon Feb 23 09:53:04 2004
To: linux-mtd@lists.infradead.org
From: "John Hall" <john-news2@cambridgetechgroup.com>
Date: Mon, 23 Feb 2004 09:33:09 -0000
Message-ID: <19f8.4039c8d5.82028@irwin2.crw.uk.net>
Sender: news <news@sea.gmane.org>
Subject: Patch: trivial fix to sa1100-flash.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I found a trivial off-by-one bug in the exit code of sa1100-flash.c. I only
found it because I cut and pasted some of the code when debugging elsewhere.

Regards,
John

--- mtd/drivers/mtd/maps/sa1100-flash.c Wed Feb 11 10:04:01 2004
+++ mtd-jdh/drivers/mtd/maps/sa1100-flash.c Fri Feb 20 16:32:44 2004
@@ -1027,7 +1027,7 @@
   mtd_concat_destroy(mtd);
 #endif

- for (i = NR_SUBMTD; i >= 0; i--) {
+ for (i = NR_SUBMTD - 1; i >= 0; i--) {
   if (sa[i].mtd)
    map_destroy(sa[i].mtd);
   if (sa[i].vbase)
