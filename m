Received: from cmsrelay02.mx.net ([165.212.11.111])
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B40kv-0007Xf-Ar
	for linux-mtd@lists.infradead.org; Thu, 18 Mar 2004 16:52:29 +0000
Message-ID: <025201c40d09$61ae0dc0$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
Date: Thu, 18 Mar 2004 10:52:18 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: fix for Micron chips read mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sending this in again since I think it was missed.  From the CVS I pulled
yesterday (3/18), Micron chips still appear to break.  I took the change
from jedec_probe.c and added an extra comment.  The current CVS breaks
Micron Q-Flash part # MT28F128J3 , and the below patch seems to fix it
because Micron requires an 0xFF for read mode.

Is it possible to add this to CVS?

Thanks,

-Brian


--- chips/cfi_util.c.orig       Tue Feb 17 15:32:24 2004
+++ chips/cfi_util.c    Thu Mar 18 10:11:44 2004
@@ -68,6 +68,14 @@
        /* Make sure it's in read mode */
        cfi_send_gen_cmd(0xf0, 0, base, map, cfi, cfi->device_type, NULL);

+        /* Some misdesigned intel chips do not respond for 0xF0 for a
reset,
+         * so ensure we're in read mode.  Send both the Intel and the AMD
command
+         * for this.  Intel uses 0xff for this, AMD uses 0xff for NOP, so
+         * this should be safe. ALSO Some Intel's Specify 0xFF, and Micron
+         * REQUIRES it.
+         */
+        cfi_send_gen_cmd(0xFF, 0, base, map, cfi, cfi->device_type, NULL);
+
        return extp;
 }
