Received: from sycamore.mit.edu ([18.248.0.68] ident=[imWVmeeAwU/kZJTUru+Ubeq+Lp+acqMH])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175Yd3-0006Sp-00
	for <linux-mtd@lists.infradead.org>; Wed, 08 May 2002 22:05:41 +0100
Received: from sycamore.mit.edu (IDENT:qCCrMmcNJYpLwggaIySSnrNUfqQ1fIPi@sycamore.mit.edu [127.0.0.1])
	by sycamore.mit.edu (8.11.6/8.11.6) with ESMTP id g48L5eo14993
	for <linux-mtd@lists.infradead.org>; Wed, 8 May 2002 17:05:40 -0400
Subject: Jedec probe for strange 28F800B3 chips (patch)
From: Colin Cross <colin@mit.edu>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="=-fFDOV0fRTI+NyS0tcBaN"
Date: 08 May 2002 17:05:40 -0400
Message-Id: <1020891940.2172.32.camel@sycamore.mit.edu>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

--=-fFDOV0fRTI+NyS0tcBaN
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm working on an embedded system that has two Flash chips labeled
28F800B3-10BD.  The Intel datasheets say they should have an identifier
of 0x8893 (which matches jedec_probe.c), but they report an identifier
of 0x889D.  I found one errata datasheet that says the correct
identifier for these chips is in fact 0x889D.  However, the block map of
this chip is completely different from the one described in the
datasheets.  It has 1 16kB block, 2 8kB blocks, 1 96kB, and 7 128kB
blocks.  This matches the block map for some other random Intel 8Mb
flash chip, but I can't find any datasheets that give this block map and
identifier together.  I've added these chips to jedec_probe.c, and they
work fine once added, but I'm at a loss as to why these chips don't
agree with the datasheets.  Can anyone offer any insight?  Does anyone
have 28F800B3 chips that follow the datasheet?  I've attached a patch
that adds support for them, but I'm not sure what to call them (Intel
28F800B3B version 2? for now).

--=-fFDOV0fRTI+NyS0tcBaN
Content-Disposition: attachment; filename=jedec_probe_patch.txt
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=jedec_probe_patch.txt; charset=ISO-8859-1

--- /home/colin/src/arm/mtd/mtd/drivers/mtd/chips/jedec_probe.c	Thu Apr 25 =
08:03:18 2002
+++ jedec_probe.c	Mon Apr 29 21:39:54 2002
@@ -66,6 +66,8 @@
 #define I28F008B3B	0x00d3
 #define I28F800B3T	0x8892
 #define I28F800B3B	0x8893
+#define I28F800B3T2	0x889C
+#define I28F800B3B2	0x889D
 #define I28F016S3	0x00aa
 #define I28F016B3T	0x00d0
 #define I28F016B3B	0x00d1
@@ -441,6 +399,32 @@
 		}
 	}, {
 		mfr_id:			MANUFACTURER_INTEL,
+		dev_id:			I28F800B3B2,
+		name:			"Intel 28F800B3B version 2?",
+		DevSize:		SIZE_1MiB,
+		CmdSet:			P_ID_INTEL_STD,
+		NumEraseRegions:	4,
+		regions: {
+			ERASEINFO(0x04000, 1),
+			ERASEINFO(0x02000, 2),
+			ERASEINFO(0x18000, 1),
+			ERASEINFO(0x20000, 7),
+		}
+	}, {
+		mfr_id:			MANUFACTURER_INTEL,
+		dev_id:			I28F800B3T2,
+		name:			"Intel 28F800B3T version 2?",
+		DevSize:		SIZE_1MiB,
+		CmdSet:			P_ID_INTEL_STD,
+		NumEraseRegions:	4,
+		regions: {
+			ERASEINFO(0x20000, 7),
+			ERASEINFO(0x18000, 1),
+			ERASEINFO(0x02000, 2),
+			ERASEINFO(0x04000, 1),
+		}
+	}, {
+		mfr_id:			MANUFACTURER_INTEL,
 		dev_id:			I28F016B3B,
 		name:			"Intel 28F016B3B",
 		DevSize:		SIZE_2MiB,

--=-fFDOV0fRTI+NyS0tcBaN--
