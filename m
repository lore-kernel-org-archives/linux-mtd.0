Received: from hermes.iil.intel.com ([192.198.152.99])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19dUHz-0002Bo-Pe
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jul 2003 13:24:44 +0100
Received: from petasus.iil.intel.com (petasus.iil.intel.com [143.185.77.3])
	2003/05/22 21:17:36 rfjohns1 Exp $) with ESMTP id h6ICJHT12096
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jul 2003 12:19:17 GMT
Received: from hasmsxvs01.iil.intel.com (hasmsxvs01.iil.intel.com
	[143.185.63.58])
	2003/05/22 21:18:01 rfjohns1 Exp $) with SMTP id h6ICRJS13354
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jul 2003 12:27:19 GMT
Received: from hasmsx331.ger.corp.intel.com ([143.185.63.144])
	M2003071815310630413
	for <linux-mtd@lists.infradead.org>; Fri, 18 Jul 2003 15:31:06 +0300
content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 18 Jul 2003 13:24:14 +0100
Message-ID: <ED688E0C6B23DC46861D0B6ED6C19C629CFEB4@swsmsx403>
From: "Mialkowski, Andrzej" <Andrzej.Mialkowski@intel.com>
To: <linux-mtd@lists.infradead.org>
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: hardcoded maximum number of CFI chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Have a problem with limit of 8 CFI chips, my board has currently 10. It
would be nice to allow specify this in (advanced) configuration. Patch
proposal below.
Andrzej

diff -Nru --minimal prev/drivers/mtd/chips/Config.in
linux/drivers/mtd/chips/Config.in
--- prev/drivers/mtd/chips/Config.in	Fri Mar 14 17:21:15 2003
+++ linux/drivers/mtd/chips/Config.in	Thu Jul 17 16:27:10 2003
@@ -40,6 +40,7 @@
        bool '    Support 4-chip flash interleave' CONFIG_MTD_CFI_I4
        bool '    Support 8-chip flash interleave' CONFIG_MTD_CFI_I8
      fi
+     int '  Maximum number of flash chips' CONFIG_MTD_CFI_MAX_CHIPS 8 1
256
   fi
 fi
 dep_tristate '  Support for Intel/Sharp flash chips'
CONFIG_MTD_CFI_INTELEXT $CONFIG_MTD_GEN_PROBE
diff -Nru --minimal prev/include/linux/mtd/cfi.h
linux/include/linux/mtd/cfi.h
--- prev/include/linux/mtd/cfi.h	Fri Mar 14 17:05:39 2003
+++ linux/include/linux/mtd/cfi.h	Fri Jul 18 09:46:24 2003
@@ -306,7 +306,7 @@
 	struct flchip chips[0];  /* per-chip data structure for each
chip */
 };
=20
-#define MAX_CFI_CHIPS 8 /* Entirely arbitrary to avoid realloc() */
+#define MAX_CFI_CHIPS CONFIG_MTD_CFI_MAX_CHIPS
=20
 /*
  * Returns the command address according to the given geometry.
