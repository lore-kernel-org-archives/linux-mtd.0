Received: from ns3a.townisp.com ([216.195.0.136] helo=ns3.townisp.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D6cU6-0002eJ-EJ
	for linux-mtd@lists.infradead.org; Wed, 02 Mar 2005 17:38:27 -0500
Received: from gemini.home.net (dhcp-0-10-57-0-7-57.cpe.townisp.com
	[64.30.95.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by ns3.townisp.com (Postfix) with ESMTP id 25C3629948
	for <linux-mtd@lists.infradead.org>;
	Wed,  2 Mar 2005 17:38:23 -0500 (EST)
Date: Wed, 2 Mar 2005 17:38:24 -0500 (EST)
From: Jamie Guinan <guinan@bluebutton.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.60.0503021658180.25807@gemini.home.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [PATCH] Add SST 39VF1601
Reply-To: Jamie Guinan <guinan@bluebutton.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Patch against 2.6.11.  The "x8" bothers me since its a 16bit-only chip, 
but it breaks without it (various other chips seem to do similar).


--- drivers/mtd/chips/jedec_probe.c.ori	2005-03-02 17:00:53.317624680 -0800
+++ drivers/mtd/chips/jedec_probe.c	2005-03-02 17:02:20.508369672 -0800
@@ -148,6 +148,7 @@
 #define SST39LF040	0x00D7
 #define SST39SF010A	0x00B5
 #define SST39SF020A	0x00B6
+#define SST39VF1601	0x234b
 #define SST49LF004B	0x0060
 #define SST49LF008A	0x005a
 #define SST49LF030A	0x001C
@@ -1370,6 +1371,20 @@
 		}
 	}, {
 		.mfr_id		= MANUFACTURER_SST,
+		.dev_id		= SST39VF1601,
+		.name		= "SST 39VF1601",
+ 		.uaddr		= {
+			[0] = MTD_UADDR_0x5555_0x2AAA, /* x8 */
+			[1] = MTD_UADDR_0x5555_0x2AAA, /* x16 */
+		},
+		.DevSize	= SIZE_2MiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 1,
+		.regions	= {
+			ERASEINFO(0x01000,512)
+		}
+	}, {
+		.mfr_id		= MANUFACTURER_SST,
 		.dev_id		= SST49LF004B,
 		.name		= "SST 49LF004B",
  		.uaddr		= {
