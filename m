Received: from webmail.frequentis.com ([213.47.210.151])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K1eSE-0000Lv-9D
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 09:29:50 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: [PATCH][JFFS2] Reschedule during scan of partly empty eraseblock
Date: Thu, 29 May 2008 11:29:43 +0200
Message-ID: <B80D0E83691CB840ACE9714151F863850157100C@VIECLEX01.frequentis.frq>
From: "Nielsen David Marqvar" <David.Nielsen@frequentis.com>
To: <linux-mtd@lists.infradead.org>,
	<dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds rescheduling to the loop that scans an empty area of an
eraseblock.

Rationale:
When scanning the an empty area of an eraseblock no scheduling occurs. =
But
this scan may take significantly long to complete depending on the size =
of=20
the empty space within the eraseblock and the speed of the flash (on my
system
it could theoretically be up to 100 ms).
The patch will add a call to cond_resched() for each 2 KiB scanned =
(while the
first check may be done before 2 KiB the code is simple and fast).

The patch has been tested and running on our systems for a month now.


Signed-off-by: David Marqvar Nielsen <david.nielsen@frequentis.com>
---
diff --git a/fs/jffs2/scan.c b/fs/jffs2/scan.c
index 1d437de..044a4a1 100644
--- a/fs/jffs2/scan.c
+++ b/fs/jffs2/scan.c
@@ -654,6 +654,10 @@ scan_more:
                                        goto scan_more;
                                }

+                               /* check for resched - searching an
eraseblock may take several ms */
+                               if ( (ofs & 0x7ff /* for each 2KiB */) =
=3D=3D 0)
+                                       cond_resched();
+
                                inbuf_ofs+=3D4;
                                ofs +=3D 4;
                        }
