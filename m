Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QSCQx-00026G-Ig
	for linux-mtd@lists.infradead.org; Thu, 02 Jun 2011 18:15:52 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [RFC] nanddump: skip bad blocks, print full length with
 --omitbad
Date: Thu, 2 Jun 2011 11:15:11 -0700
Message-ID: <1307038511-5968-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm not sure the original intended use of nanddump's '--omitbad' option,
but as described below, it doesn't seem to make the most sense to me.
I'm curiouse whether this change should be implemented as yet another
new nanddump option (perhaps a '--skipbad' vs. '--omitbad'? this starts
getting confusing) or if we can simply modify the old behavior of
'--omitbad'.

Brian

----

If, for example, the following is executed on a device with a bad block
at block 0, we get an empty file:
    $ nanddump --length=131072 --omitbad --file=/tmp/foo /dev/mtd0

This does not make intuitive sense. Instead, nanddump should skip the
bad block and continue to dump good data from the next good block.

This patch adds an informative warning to let the user know that a bad
block was skipped to aid with those who may be used to the old method,
where we omit the bad block and simply dump nothing in its place.

---
 nanddump.c |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/nanddump.c b/nanddump.c
index 214fb12..e19e16a 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -403,8 +403,15 @@ int main(int argc, char * const argv[])
 		}
 
 		if (badblock) {
-			if (omitbad)
+			if (omitbad) {
+				/* skip bad block, increase end_addr */
+				fprintf(stderr, "Skipping bad block at 0x%08llx\n", ofs);
+				end_addr += mtd.eb_size;
+				ofs += mtd.eb_size - bs;
+				if (end_addr > mtd.size)
+					end_addr = mtd.size;
 				continue;
+			}
 			memset(readbuf, 0xff, bs);
 		} else {
 			/* Read page data and exit on failure */
-- 
1.7.0.4
