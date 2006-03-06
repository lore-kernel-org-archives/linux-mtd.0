Received: from [66.174.85.155] (helo=txslsmtp1.vzwmail.net)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FGJtQ-0006Q1-3U
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2006 12:53:14 -0500
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: <linux-mtd@lists.infradead.org>
Date: Mon, 6 Mar 2006 12:38:46 -0500
Message-ID: <IIEEICKJLNEPBBDJICNGIEIAKDAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: 
Subject: [MTD] cmdlineparts.c: fix to allow partition offset zero for any
	partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here is the patch I sent earlier today (that email is pending moderator
approval) in the MTD-approved patch format.  Sorry I didn't see this MTD
patch format earlier.

[MTD] cmdlineparts.c: fix to allow partition offset zero for any partition

The cmdlinepart.c logic treats a partition offset that has been explicitly
specified as zero the same as an unspecified offset.  This causes the
partitioning logic to fail if your partition that starts at 0x0 is not the
first partition listed in your cmdline partitions.

For example, if you have several partitions, and you want the third partition
to be an all-encompassing partition covering the whole device, then you
would give it offset 0x0.  The cmdlinepart.c logic treats this the same as
if you had not specified an offset, and instead tries to start the third
partition after the end of your second partition.  This is because the logic
uses zero as the "unspecified offset" value.  However, zero is not a good
choice for "unspecified offset" -- it is quite valid as a "specified" offset.

The attached patch defines the "unspecified offset" value as 0xffffffff and
makes the changes needed to support partitions that explicitly start at
offset 0x0, but are not necessarily listed first on the cmdline.

From: Chuck Meade <chuckmeade@mindspring.com>
Signed-off-by: Chuck Meade <chuckmeade@mindspring.com>

--- cmdlinepart.c.ORIG	2006-03-05 19:34:43.000000000 -0500
+++ cmdlinepart.c	2006-03-06 10:17:15.063475104 -0500
@@ -40,6 +40,10 @@
 #define dbg(x)
 #endif
 
+/* indicates that the offset for a partition was not specified, so start at
+ * end of previous partition.
+ */
+#define OFFSET_UNSPECIFIED 0xffffffff
 
 /* special size referring to all the remaining space in a partition */
 #define SIZE_REMAINING 0xffffffff
@@ -75,7 +79,7 @@ static struct mtd_partition * newpart(ch
 {
 	struct mtd_partition *parts;
 	unsigned long size;
-	unsigned long offset = 0;
+	unsigned long offset = OFFSET_UNSPECIFIED;
 	char *name;
 	int name_len;
 	unsigned char *extra_mem;
@@ -314,7 +318,7 @@ static int parse_cmdline_partitions(stru
 		{
 			for(i = 0, offset = 0; i < part->num_parts; i++)
 			{
-				if (!part->parts[i].offset)
+				if (part->parts[i].offset == OFFSET_UNSPECIFIED)
 				  part->parts[i].offset = offset;
 				else
 				  offset = part->parts[i].offset;
