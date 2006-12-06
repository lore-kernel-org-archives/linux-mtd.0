Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Grlmr-00055x-D7
	for linux-mtd@lists.infradead.org; Tue, 05 Dec 2006 20:41:33 -0500
Received: from out1.internal (unknown [10.202.2.149])
	by out1.messagingengine.com (Postfix) with ESMTP id C084F4AF06
	for <linux-mtd@lists.infradead.org>;
	Tue,  5 Dec 2006 20:41:27 -0500 (EST)
Received: from [192.168.0.11] (CPE-58-160-130-105.sa.bigpond.net.au
	[58.160.130.105])
	by mail.messagingengine.com (Postfix) with ESMTP id C49F217D7A
	for <linux-mtd@lists.infradead.org>;
	Tue,  5 Dec 2006 20:41:26 -0500 (EST)
Message-ID: <45761FBB.1000504@whitby.id.au>
Date: Wed, 06 Dec 2006 12:11:15 +1030
From: Rod Whitby <rod@whitby.id.au>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] [MTD] Support combined RedBoot FIS directory and configuration
	area
Content-Type: multipart/mixed; boundary="------------090303070006050307070401"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090303070006050307070401
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

RedBoot supports storing the FIS directory and the RedBoot
configuration area in the same block of flash memory.  This is
not the most common RedBoot configuration, but it is used on
commercially available boards supported by the kernel.

A recent patch to mtd/redboot.c (http://lkml.org/lkml/2006/3/20/410)
which corrected the skipping of deleted table entries has exposed the
latent problem of the kernel redboot parser running off the end of the
FIS directory and interpreting the RedBoot configuration information
as table entries.

This patch terminates the table parsing when the first truly empty
entry is found (table entry deletion only clears the first byte of the
name, so two cleared bytes in a row indicates the end of the table),
thereby supporting the combined redboot FIS directory and RedBoot
configuration information flash layout scenario.

Signed-off-by: Rod Whitby <rod@whitby.id.au>
--





--------------090303070006050307070401
Content-Type: text/plain;
 name="05-mtdpart-redboot-partition-truncate.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename="05-mtdpart-redboot-partition-truncate.patch"

Index: linux-2.6.19/drivers/mtd/redboot.c
===================================================================
--- linux-2.6.19.orig/drivers/mtd/redboot.c
+++ linux-2.6.19/drivers/mtd/redboot.c
@@ -96,7 +96,19 @@ static int parse_redboot_partitions(stru
 			 */
 			if (swab32(buf[i].size) == master->erasesize) {
 				int j;
-				for (j = 0; j < numslots && buf[j].name[0] != 0xff; ++j) {
+				for (j = 0; j < numslots; ++j) {
+
+					/* A single 0xff denotes a deleted entry.
+					 * Two of them in a row is the end of the table.
+					 */
+					if (buf[j].name[0] == 0xff) {
+				  		if (buf[j].name[1] == 0xff) {
+							break;
+						} else {
+							continue;
+						}
+					}
+
 					/* The unsigned long fields were written with the
 					 * wrong byte sex, name and pad have no byte sex.
 					 */
@@ -123,8 +135,13 @@ static int parse_redboot_partitions(stru
 	for (i = 0; i < numslots; i++) {
 		struct fis_list *new_fl, **prev;
 
-		if (buf[i].name[0] == 0xff)
-			continue;
+		if (buf[i].name[0] == 0xff) {
+			if (buf[i].name[1] == 0xff) {
+				break;
+			} else {
+				continue;
+			}
+		}
 		if (!redboot_checksum(&buf[i]))
 			break;
 



--------------090303070006050307070401--
