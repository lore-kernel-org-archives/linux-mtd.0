Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QaAlZ-0000lj-0g
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 18:06:05 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 5/6] feature-removal: remove completed tasks
Date: Fri, 24 Jun 2011 11:03:13 -0700
Message-ID: <1308938594-20486-6-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1308938594-20486-1-git-send-email-computersforpeace@gmail.com>
References: <1308938594-20486-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 feature-removal-schedule.txt |   37 -------------------------------------
 1 files changed, 0 insertions(+), 37 deletions(-)

diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index 338bc08..a5980f7 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -40,40 +40,3 @@ This is duplicating behavior with the mtdinfo utility.  Now the util
 warns when people use it, but it'll be removed in release 1.4.6.
 
 ---------------------------
-
-4. Rename --noskipbad option, kill --omitbad, change default BB method for nanddump
-
-Our bad block handling methods are getting disorganized. They will be replaced
-by a series of --bb=METHOD options (see `nanddump --help').
-
-In addition, the previous default bad block behavior was to dump 0xFF in place
-of bad blocks. This was not a good "inverse operation" of nandwrite. Thus, the
-current default behavior has become the (new) option --bb=padbad, and in 1.4.6,
-the default will be --bb=skipbad.
-
-The new `--bb=METHOD' options are included in this release, but all feature
-removals and changed defaults will occur in 1.4.6. For now, there are
-appropriate deprecation warning messages and an alert telling about the
-soon-to-be-default settings.
-
-Transition summary table:
------------------------------------------------------------------------------------------------------------
- Old option     New option                 Comment
------------------------------------------------------------------------------------------------------------
- <default>      --bb=padbad                dump flash data, substituting 0xFF for any bad blocks
- --noskipbad    --bb=dumpbad               dump flash data, including any bad blocks
- --skipbad      --bb=skipbad, <default>    dump good data, completely skipping any bad blocks (new default)
- --omitbad      N/A                        very similar to `skipbad', will be removed soon
-
----------------------------
-
-5. nanddump will not dump OOB by default
-
-In 1.4.6, nanddump will not dump OOB by default. To dump OOB, you will have to
-explicitly use the option `--oob'. For now, there is simply a warning every
-time you use nanddump without explicitly choosing `--oob' or `--omitoob'.
-
-Note that `-o' will no longer stand for `--omitoob'. To unify with nandwrite,
-it will stand for `--oob' (Dump OOB data).
-
----------------------------
-- 
1.7.0.4
