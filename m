Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVNLw-0003wo-L4
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 00:27:49 -0400
Received: from holly.csn.ul.ie ([136.201.105.4])
	by pentafluge.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVNLu-0007hq-Hp
	for linux-mtd@lists.infradead.org; Wed, 02 Jun 2004 05:27:47 +0100
Date: Wed, 2 Jun 2004 05:22:40 +0100 (IST)
From: Dave Airlie <airlied@linux.ie>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.58.0406020454090.16424@skynet>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-kernel@vger.kernel.org
Subject: [patch] MTD: add st50fw040 to jedec probe
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,
	This is a patch vs 2.6.6 to add the ST50FW040, which is an ICH2
compatible firmware hub flash, datasheet at:

http://www.st.com/stonline/books/ascii/docs/7273.htm

From: Dave Airlie <airlied@linux.ie>

Dave.

p.s.
Dave Woodhouse, is there any plans to merge up your MTD tree to the kernel
soon? this is a fairly harmless change that would be useful for me in the
mainline, but I don't wish to step on any toes :-)

-- 
David Airlie, Software Engineer
http://www.skynet.ie/~airlied / airlied at skynet.ie
pam_smb / Linux DECstation / Linux VAX / ILUG person

--- /storage/2.6/linux-2.6.4/drivers/mtd/chips/jedec_probe.c	2004-03-15 14:15:30.000000000 +1100
+++ linux-2.6.6/drivers/mtd/chips/jedec_probe.c	2004-06-22 20:02:18.708945560 +1000
@@ -109,6 +109,7 @@
 #define M29W160DT	0x22C4
 #define M29W160DB	0x2249
 #define M29W040B	0x00E3
+#define M50FW040        0x002C

 /* SST */
 #define SST29EE512	0x005d
@@ -1234,6 +1235,19 @@
 		.regions	= {
 			ERASEINFO(0x10000,8),
 		}
+        }, {
+		.mfr_id		= MANUFACTURER_ST,
+		.dev_id		= M50FW040,
+		.name		= "ST M50FW040",
+		.uaddr		= {
+			[0] = MTD_UADDR_UNNECESSARY,    /* x8 */
+		},
+		.DevSize	= SIZE_512KiB,
+		.CmdSet		= P_ID_INTEL_EXT,
+		.NumEraseRegions= 1,
+		.regions	= {
+			ERASEINFO(0x10000,8),
+		}
 	}, {
 		.mfr_id		= MANUFACTURER_TOSHIBA,
 		.dev_id		= TC58FVT160,
