Received: from motgate8.mot.com ([129.188.136.8])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CSfht-0003QP-8z
	for linux-mtd@lists.infradead.org; Fri, 12 Nov 2004 12:59:36 -0500
Received: from az33exr01.mot.com (az33exr01.mot.com [10.64.251.231])
	by motgate8.mot.com (Motorola/Motgate8) with ESMTP id iACI103B011735
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Nov 2004 11:01:01 -0700 (MST)
Received: from pa06exm02.e1.bcs.mot.com (pa06exm02.e1.bcs.mot.com
	[168.84.156.53])
	by az33exr01.mot.com (Motorola/az33exr01) with ESMTP id iACHpP6l006738
	for <linux-mtd@lists.infradead.org>; Fri, 12 Nov 2004 11:51:26 -0600
Message-ID: <852DAFF1FD3BD611B68000D0B76FE77409F47A28@pa06exm01.e1.bcs.mot.com>
From: Mar James-MGIA2172 <MGIA2172@motorola.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Fri, 12 Nov 2004 12:59:27 -0500
MIME-Version: 1.0
Content-Type: text/plain
Subject: Bug in map.h
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While debugging 2.6.9, I found the following apparent bug in
include/linux/mtd/map.h

diff -u -r1.1 map.h
--- map.h       3 Nov 2004 23:11:01 -0000       1.1
+++ map.h       10 Nov 2004 22:12:50 -0000
@@ -316,7 +316,7 @@
                        bitpos = (map_bankwidth(map)-1-i)*8;
 #endif
                        orig.x[0] &= ~(0xff << bitpos);
-                       orig.x[0] |= buf[i] << bitpos;
+                       orig.x[0] |= buf[i-start] << bitpos;
                }
        }
        return orig;

Jim
