Received: from mms3.broadcom.com ([216.31.210.19])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QWGgR-0006CW-VE
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2011 23:36:40 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 6/6] nanddump: warn about future default --nooob
Date: Mon, 13 Jun 2011 16:32:03 -0700
Message-ID: <1308007923-6820-6-git-send-email-computersforpeace@gmail.com>
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

To work as a proper inverse to nandwrite, nanddump must not dump OOB data by
default. This patch prints a warning regarding the future change.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 feature-removal-schedule.txt |    8 ++++++++
 nanddump.c                   |    3 +++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index 0f1f5c5..0bb5cb2 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -65,3 +65,11 @@ Transition summary table:
  --omitbad      --bb=omitbad               dump flash data, substituting nothing for any bad blocks
 
 ---------------------------
+
+5. nanddump will not dump OOB by default
+
+In 1.4.6, nanddump will not dump OOB by default. To dump OOB, you will have to
+explicitly use the option '-o' or '--oob'. For now, there is simply a warning
+every time you use nanddump.
+
+---------------------------
diff --git a/nanddump.c b/nanddump.c
index 211f8ae..9c2e326 100644
--- a/nanddump.c
+++ b/nanddump.c
@@ -355,6 +355,9 @@ int main(int argc, char * const argv[])
 
 	process_options(argc, argv);
 
+	fprintf(stderr, "Warning: in next release, nanddump will not dump OOB"
+			" by default.\n");
+
 	/* Initialize libmtd */
 	mtd_desc = libmtd_open();
 	if (!mtd_desc)
-- 
1.7.0.4
