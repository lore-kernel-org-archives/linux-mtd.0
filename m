Received: from mailserv.intranet.gr ([146.124.14.106])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C6oYv-0005Na-JQ
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2004 07:00:02 -0400
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.13.1/8.13.1) with ESMTP id i8DAxeaR028469
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2004 13:59:40 +0300 (EEST)
Received: from ifaistos.intranet.gr (ifaistos.intranet.GR [146.124.20.203])
	by mailserv.intranet.gr (8.13.1/8.13.1) with ESMTP id i8DAxbMO028439
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2004 13:59:37 +0300 (EEST)
Received: from [146.124.120.118] (voipkopsias.intranet.GR [146.124.120.118])
	by ifaistos.intranet.gr (8.11.7p1+Sun/8.11.7) with ESMTP id
	i8DAssl29029 for <linux-mtd@lists.infradead.org>;
	Mon, 13 Sep 2004 13:54:55 +0300 (EEST)
Message-ID: <41457C48.8040100@intracom.gr>
Date: Mon, 13 Sep 2004 13:54:00 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary="------------010206010309040101030801"
Subject: [PATCH] Support Macronix MX29LV040C
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010206010309040101030801
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello

The following patch adds support for the Macronix MX29LV040C to
jedec_probe chip driver.

Please apply.

Regards

Pantelis


--------------010206010309040101030801
Content-Type: text/x-patch;
 name="micronix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="micronix.patch"

===== drivers/mtd/chips/jedec_probe.c 1.14 vs edited =====
--- 1.14/drivers/mtd/chips/jedec_probe.c	2004-08-25 12:01:59 +03:00
+++ edited/drivers/mtd/chips/jedec_probe.c	2004-09-13 13:48:28 +03:00
@@ -113,6 +113,7 @@
 #define MX29F002T	0x00B0
 #define MX29F004T	0x0045
 #define MX29F004B	0x0046
+#define MX29LV040C	0x004F
 
 /* PMC */
 #define PM49FL002	0x006D
@@ -502,6 +503,19 @@
 		.mfr_id		= MANUFACTURER_AMD,
 		.dev_id		= AM29LV040B,
 		.name		= "AMD AM29LV040B",
+		.uaddr		= {
+			[0] = MTD_UADDR_0x0555_0x02AA /* x8 */
+		},
+		.DevSize	= SIZE_512KiB,
+		.CmdSet		= P_ID_AMD_STD,
+		.NumEraseRegions= 1,
+		.regions	= {
+			ERASEINFO(0x10000,8),
+		}
+	}, {
+		.mfr_id		= MANUFACTURER_MACRONIX,
+		.dev_id		= MX29LV040C,
+		.name		= "Macronix MX29LV040C",
 		.uaddr		= {
 			[0] = MTD_UADDR_0x0555_0x02AA /* x8 */
 		},

--------------010206010309040101030801--
