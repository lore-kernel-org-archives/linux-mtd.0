Received: from mail.nanometrics.ca ([206.191.47.130])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKl8v-0003xa-0X
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 18:10:54 -0400
To: linux-mtd@lists.infradead.org
Message-ID: <OFF3D1B3E9.33E9B550-ON85256F34.00792064-85256F34.0079E65D@nanometrics.ca>
From: David Ho <DavidHo@nanometrics.ca>
Date: Thu, 21 Oct 2004 18:11:28 -0400
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Subject: [patch] unaligned word write bug
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>





Hi all,

This was causing my u-boot fw_setenv utility to fail.
As far as I can tell the latest CVS snapshot still have the bug. The
function involved is map_word_load_partial.

Regards,
David Ho


--- mtd-cvs-20040921/include/linux/mtd/map.h    2004-09-17
18:00:20.000000000 -0400
+++ linuxppc-2.4-bootstrap/include/linux/mtd/map.h      2004-10-21
17:58:35.000000000 -0400
@@ -317,7 +317,7 @@
                        bitpos = (map_bankwidth(map)-1-i)*8;
 #endif
                        orig.x[0] &= ~(0xff << bitpos);
-                       orig.x[0] |= buf[i] << bitpos;
+                       orig.x[0] |= buf[i-start] << bitpos;
                }
        }
        return orig;
