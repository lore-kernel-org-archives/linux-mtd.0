Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RWXCE-0000hc-E7
 for linux-mtd@lists.infradead.org; Fri, 02 Dec 2011 17:46:51 +0000
Received: by iadk27 with SMTP id k27so5304847iad.36
 for <linux-mtd@lists.infradead.org>; Fri, 02 Dec 2011 09:46:49 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH v2] nandtest: seed random generator with time
Date: Fri,  2 Dec 2011 09:46:12 -0800
Message-Id: <1322847972-26504-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1322730350.2332.28.camel@koala>
References: <1322730350.2332.28.camel@koala>
Cc: Jan Weitzel <j.weitzel@phytec.de>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If a seed is not provided via --seed, we use the default rand() values,
which produces the same sequence of values every run. Since this is
undesirable, we should choose a random seed via the current time().

Note that this patch moves the srand() until after all the initial
options processing.

Cc: Jan Weitzel <j.weitzel@phytec.de>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
rebased on top of Jan's patch

 nandtest.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index b3aacaf..0187b87 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -140,6 +140,8 @@ int main(int argc, char **argv)
 	uint32_t offset = 0;
 	uint32_t length = -1;
 
+	seed = time(NULL);
+
 	for (;;) {
 		static const char *short_options="hkl:mo:p:s:";
 		static const struct option long_options[] = {
@@ -173,7 +175,6 @@ int main(int argc, char **argv)
 
 		case 's':
 			seed = atol(optarg);
-			srand(seed);
 			break;
 
 		case 'p':
@@ -244,6 +245,8 @@ int main(int argc, char **argv)
 	printf("Bad blocks     : %d\n", oldstats.badblocks);
 	printf("BBT blocks     : %d\n", oldstats.bbtblocks);
 
+	srand(seed);
+
 	for (pass = 0; pass < nr_passes; pass++) {
 		loff_t test_ofs;
 
-- 
1.7.5.4
