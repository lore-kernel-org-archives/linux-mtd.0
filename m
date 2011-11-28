Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RV5hR-0007ay-QM
 for linux-mtd@lists.infradead.org; Mon, 28 Nov 2011 18:13:06 +0000
Received: by ghrr19 with SMTP id r19so4394789ghr.36
 for <linux-mtd@lists.infradead.org>; Mon, 28 Nov 2011 10:13:04 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] nandtest: seed random generator properly
Date: Mon, 28 Nov 2011 10:11:52 -0800
Message-Id: <1322503912-8221-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <CAN8TOE-rh_yh_0hi+unXe3Q5zV9tdBW6rhomRG-h3za5A4ROrg@mail.gmail.com>
References: <CAN8TOE-rh_yh_0hi+unXe3Q5zV9tdBW6rhomRG-h3za5A4ROrg@mail.gmail.com>
Cc: Jan Weitzel <j.weitzel@phytec.de>,
 Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch fixes two problems in nandtest:

(1) if a seed is provided it is actually not used. First call is
    "seed = rand()" killing the given seed.
    Credit: Jan Weitzel <j.weitzel@phytec.de>

(2) if a seed is not provided, we use the default rand() values, which
    produces the same sequence of values every run. It makes more sense
    to seed with the time to produce more random sequences.

Cc: Jan Weitzel <j.weitzel@phytec.de>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
Jan: This is an amendment to your patch. Feel free to add a
"Signed-off-by" if this works for you.

 nandtest.c |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/nandtest.c b/nandtest.c
index dc28d09..8cdc816 100644
--- a/nandtest.c
+++ b/nandtest.c
@@ -35,7 +35,7 @@ struct mtd_info_user meminfo;
 struct mtd_ecc_stats oldstats, newstats;
 int fd;
 int markbad=0;
-int seed;
+int seed = -1;
 
 int erase_and_write(loff_t ofs, unsigned char *data, unsigned char *rbuf)
 {
@@ -192,6 +192,10 @@ int main(int argc, char **argv)
 	if (argc - optind != 1)
 		usage();
 
+	if (seed < 0)
+		seed = time(NULL);
+	srand(seed);
+
 	fd = open(argv[optind], O_RDWR);
 	if (fd < 0) {
 		perror("open");
-- 
1.7.5.4
