Received: from krakowiak.inetia.pl ([195.114.181.203])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19eaLQ-0001hr-II
	for <linux-mtd@lists.infradead.org>; Mon, 21 Jul 2003 14:04:48 +0100
Received: from www.n1.pl (www.n1.pl [195.114.173.151])
	sims.4.0.2000.10.12.16.25.p8)
	with ESMTP id <0HID00F0OLO3KR@krakowiak.inetia.pl> for
	linux-mtd@lists.infradead.org;
	Mon, 21 Jul 2003 15:04:51 +0200 (MET DST)
Date: Mon, 21 Jul 2003 15:04:51 +0200
From: andrzej.mialkowski@inetia.pl
To: =?iso-8859-2?b?SvZybg==?= Engel <joern@wohnheim.fh-wedel.de>
Message-id: <1058792691.3f1be4f31ca98@imail.internetia.pl>
MIME-version: 1.0
Content-type: text/plain; charset=ISO-8859-2
Content-transfer-encoding: 8BIT
cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: hardcoded maximum number of CFI chips - continued
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Due to e-mail configuration problems I'm not able to continue on previous 
thread.

Jörn,
  You of course right that limit proposed in patch too high. With current 
typical stack size (8K) and structure size (36 bytes - on ARM) it is safe to 
handle this way about 160 chips. This is much more what can be expected in 
resonable designs (and what I need). On the other hand placing kmalloc for 
chips structure effectively leeds to solution with realloc. Drawback of this 
will be creation of heap fragment, it also still has problem with the constant 
limit.
For me attractive are two solutions:
1) Cleaned previous proposal, becuse it is simple and solves problem probably 
fits for all designs.
2) Rewrite genprobe_ident_chips to use realloc emulation to allow expansion 
structure and handling any number of chips.

Andrzej

diff -Nru --minimal prev/drivers/mtd/chips/Config.in 
linux/drivers/mtd/chips/Config.in
--- prev/drivers/mtd/chips/Config.in	Fri Mar 14 17:21:15 2003
+++ linux/drivers/mtd/chips/Config.in	Mon Jul 21 14:23:49 2003
@@ -40,6 +40,7 @@
        bool '    Support 4-chip flash interleave' CONFIG_MTD_CFI_I4
        bool '    Support 8-chip flash interleave' CONFIG_MTD_CFI_I8
      fi
+     int '  Maximum number of flash chips' CONFIG_MTD_CFI_MAX_CHIPS 8 1 32
   fi
 fi
 dep_tristate '  Support for Intel/Sharp flash chips' CONFIG_MTD_CFI_INTELEXT 
$CONFIG_MTD_GEN_PROBE
diff -Nru --minimal prev/include/linux/mtd/cfi.h linux/include/linux/mtd/cfi.h
--- prev/include/linux/mtd/cfi.h	Fri Mar 14 17:05:39 2003
+++ linux/include/linux/mtd/cfi.h	Mon Jul 21 14:22:38 2003
@@ -306,7 +306,11 @@
 	struct flchip chips[0];  /* per-chip data structure for each chip */
 };
 
+#ifndef CONFIG_MTD_CFI_MAX_CHIPS
 #define MAX_CFI_CHIPS 8 /* Entirely arbitrary to avoid realloc() */
+#else
+#define MAX_CFI_CHIPS CONFIG_MTD_CFI_MAX_CHIPS
+#endif
 
 /*
  * Returns the command address according to the given geometry. 
