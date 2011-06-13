Received: from mms2.broadcom.com ([216.31.210.18])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QWGfx-00066L-H8
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2011 23:36:11 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 5/6] feature-removal-schedule: describe nanddump changes
Date: Mon, 13 Jun 2011 16:32:02 -0700
Message-ID: <1308007923-6820-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1308007923-6820-1-git-send-email-computersforpeace@gmail.com>
References: <1308007923-6820-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Include a few notes about the edited options and new default options in
nanddump.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 feature-removal-schedule.txt |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index a5980f7..0f1f5c5 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -40,3 +40,28 @@ This is duplicating behavior with the mtdinfo utility.  Now the util
 warns when people use it, but it'll be removed in release 1.4.6.
 
 ---------------------------
+
+4. Rename --omitbad and --noskipbad options for nanddump, change default
+
+These and a few other bad block handling methods are getting disorganized. They
+will be replaced by a series of --bb=METHOD options (see 'nanddump --help').
+
+In addition, the previous default bad block behavior was to dump 0xFF in place
+of bad blocks. This was not a good "inverse operation" of nandwrite. Thus, the
+current default behavior has become the (new) option --bb=padbad, and in 1.4.6,
+the default will be --bb=skipbad.
+
+All of these changes will occur in 1.4.6. For now, there are appropriate
+deprecation warning messages and an alert telling about the soon-to-be-default
+options.
+
+Transition summary table:
+-----------------------------------------------------------------------------------------------------------
+ Old option     New option                 Comment
+-----------------------------------------------------------------------------------------------------------
+ <default>      --bb=padbad                dump flash data, substituting 0xFF for any bad blocks
+ --noskipbad    --bb=dumpbad               dump flash data, including any bad blocks
+ --skipbad      --bb=skipbad, <default>    dump good data, completely skipping any bad blocks (new default)
+ --omitbad      --bb=omitbad               dump flash data, substituting nothing for any bad blocks
+
+---------------------------
-- 
1.7.0.4
