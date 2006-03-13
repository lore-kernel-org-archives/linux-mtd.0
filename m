Received: from [66.174.76.156] (helo=njbrsmtp2.vzwmail.net)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FInFG-00047n-8g
	for linux-mtd@lists.infradead.org; Mon, 13 Mar 2006 08:38:07 -0500
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Date: Mon, 13 Mar 2006 08:17:39 -0500
Message-ID: <IIEEICKJLNEPBBDJICNGGELBKEAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-reply-to: <20060313103326.GA11768@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: RE: cmdlinepart.c patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Can you send me his patch then?  Preferrably inline in the mail.
>
> Jörn

Hi Jörn,

Yes.  I have included his patch inline below.  I got it from this
link that he sent:
http://kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.16-rc5/2.6.16-rc5-mm3/broken-out/mtd-cmdlinepart-allow-zero-offset-va
lue.patch

You may also be interested in this comment he made about this patch:

> I sent same fix to LKML (CC: David Woodhouse, Andrew Morton) on 29
> January.  And it has been in -mm tree since 2.6.16-rc1-mm4...

So just FYI this patch is already in -mm.

Below my signature is the inline version of the patch found at the
above link.

Thanks,
Chuck
----------------------------------------------------------------

From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

Current cmdlinepart.c uses offset value 0 to specify a continuous
partition.  This prevents creating a second partition starting at 0.

For example, I can split 4MB device using "mtdparts=id:2M,2M", but I can
not do "mtdparts=id:2M@2M,2M@0" to swap mtd0 and mtd1.

This patch introduces special OFFSET_CONTINUOUS value for a continuous
partition and allows 0 for offset value.

Also this patch replaces 0xffffffff with UINT_MAX for SIZE_REMAINING.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Andrew Morton <akpm@osdl.org>
---

 drivers/mtd/cmdlinepart.c |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff -puN drivers/mtd/cmdlinepart.c~mtd-cmdlinepart-allow-zero-offset-value drivers/mtd/cmdlinepart.c
--- 25/drivers/mtd/cmdlinepart.c~mtd-cmdlinepart-allow-zero-offset-value	Wed Feb 22 15:25:21 2006
+++ 25-akpm/drivers/mtd/cmdlinepart.c	Wed Feb 22 15:25:21 2006
@@ -42,7 +42,8 @@


 /* special size referring to all the remaining space in a partition */
-#define SIZE_REMAINING 0xffffffff
+#define SIZE_REMAINING UINT_MAX
+#define OFFSET_CONTINUOUS UINT_MAX

 struct cmdline_mtd_partition {
 	struct cmdline_mtd_partition *next;
@@ -75,7 +76,7 @@ static struct mtd_partition * newpart(ch
 {
 	struct mtd_partition *parts;
 	unsigned long size;
-	unsigned long offset = 0;
+	unsigned long offset = OFFSET_CONTINUOUS;
 	char *name;
 	int name_len;
 	unsigned char *extra_mem;
@@ -314,7 +315,7 @@ static int parse_cmdline_partitions(stru
 		{
 			for(i = 0, offset = 0; i < part->num_parts; i++)
 			{
-				if (!part->parts[i].offset)
+				if (part->parts[i].offset == OFFSET_CONTINUOUS)
 				  part->parts[i].offset = offset;
 				else
 				  offset = part->parts[i].offset;
_
