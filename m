Received: from mail1.cray.com ([136.162.0.111])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B9C7z-0002Dm-TV
	for linux-mtd@lists.infradead.org; Fri, 02 Apr 2004 01:01:44 +0100
Received: from relaya.us.cray.com (relaya.us.cray.com [192.168.252.144])
	i3201VFj010765	for <linux-mtd@lists.infradead.org>;
	Thu, 1 Apr 2004 18:01:32 -0600 (CST)
Received: from orchid.us.cray.com (orchid.us.cray.com [172.30.27.91])
	i3201TkI029420	for <linux-mtd@lists.infradead.org>;
	Thu, 1 Apr 2004 18:01:29 -0600 (CST)
Received: from cray.com (troll [192.168.250.5])i3201S6W4731876
	for <linux-mtd@lists.infradead.org>;
	Thu, 1 Apr 2004 18:01:28 -0600 (CST)
Message-ID: <406CAD57.40004@cray.com>
Date: Thu, 01 Apr 2004 18:01:27 -0600
From: David Updegraff <dave@cray.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <Pine.LNX.4.44.0404011658150.6508-100000@kiire.colleduc.ee>
	<1080830176.24117.1858.camel@hades.cambridge.redhat.com>
In-Reply-To: <1080830176.24117.1858.camel@hades.cambridge.redhat.com>
Content-Type: multipart/mixed;
 boundary="------------000400010406020601070505"
Subject: patch for AMD am29dl800b
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------000400010406020601070505
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi.

I have a gadget with this amd chip on it.  Whose id and layout dfn. is 
not in the jedec_probe tables.  Unfortuanately, they have _SIX_ (6) 
erase regions.  Anyone know of a reason expanding the regions[] array to 
6 is a bad idea?  Or why dealing with this chip in general is a bad idea?

-dbu.

--------------000400010406020601070505
Content-Type: text/x-patch;
 name="am29dl800b.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="am29dl800b.patch"

--- drivers/mtd/chips/jedec_probe.c.orig	2004-04-01 17:27:18.267578712 -0600
+++ drivers/mtd/chips/jedec_probe.c	2004-04-01 17:59:06.562473792 -0600
@@ -38,6 +38,9 @@
 
 
 /* AMD */
+#define AM29DL800BB	0x22C8
+#define AM29DL800BT	0x224A
+
 #define AM29F800BB	0x2258
 #define AM29F800BT	0x22D6
 #define AM29LV400BB	0x22BA
@@ -222,7 +225,7 @@
 	const int NumEraseRegions;
 	const int CmdSet;
 	const __u8 uaddr[4];		/* unlock addrs for 8, 16, 32, 64 */
-	const ulong regions[4];
+	const ulong regions[6];
 };
 
 #define ERASEINFO(size,blocks) (size<<8)|(blocks-1)
@@ -342,6 +345,45 @@
 			ERASEINFO(0x10000,15),
 		}
 	}, {
+/* add DL */
+		.mfr_id		= MANUFACTURER_AMD,
+		.dev_id		= AM29DL800BB,
+		.name		= "AMD AM29DL800BB",
+		.uaddr		= {
+			[0] = MTD_UADDR_0x0AAA_0x0555,  /* x8 */
+			[1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
+		},
+		.DevSize	= SIZE_1MiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 6,
+		.regions	= {
+			ERASEINFO(0x04000,1),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x02000,4),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x04000,1),
+			ERASEINFO(0x10000,14)
+		}
+	}, {
+		.mfr_id		= MANUFACTURER_AMD,
+		.dev_id		= AM29DL800BT,
+		.name		= "AMD AM29DL800BT",
+		.uaddr		= {
+			[0] = MTD_UADDR_0x0AAA_0x0555,  /* x8 */
+			[1] = MTD_UADDR_0x0555_0x02AA,  /* x16 */
+		},
+		.DevSize	= SIZE_1MiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 6,
+		.regions	= {
+			ERASEINFO(0x10000,14),
+			ERASEINFO(0x04000,1),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x02000,4),
+			ERASEINFO(0x08000,1),
+			ERASEINFO(0x04000,1)
+		}
+	}, {
 		.mfr_id		= MANUFACTURER_AMD,
 		.dev_id		= AM29F800BB,
 		.name		= "AMD AM29F800BB",

--------------000400010406020601070505--
