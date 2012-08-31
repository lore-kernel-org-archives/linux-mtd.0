Received: from mail-wg0-f41.google.com ([74.125.82.41])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T7SY9-0001EP-94
 for linux-mtd@lists.infradead.org; Fri, 31 Aug 2012 14:50:22 +0000
Received: by wgbds1 with SMTP id ds1so805098wgb.0
 for <linux-mtd@lists.infradead.org>; Fri, 31 Aug 2012 07:50:18 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] ubirmvol: correct missing space on usage
Date: Fri, 31 Aug 2012 16:50:05 +0200
Message-Id: <1346424605-17466-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 ubi-utils/ubirmvol.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/ubirmvol.c b/ubi-utils/ubirmvol.c
index 464f05d..3370aff 100644
--- a/ubi-utils/ubirmvol.c
+++ b/ubi-utils/ubirmvol.c
@@ -57,9 +57,9 @@ static const char optionsstr[] =
 static const char usage[] =
 "Usage: " PROGRAM_NAME " <UBI device node file name> [-n <volume id>] [--vol_id=<volume id>]\n\n"
 "         [-N <volume name>] [--name=<volume name>] [-h] [--help]\n\n"
-"Example: " PROGRAM_NAME "/dev/ubi0 -n 1 - remove UBI volume 1 from UBI device corresponding\n"
+"Example: " PROGRAM_NAME " /dev/ubi0 -n 1 - remove UBI volume 1 from UBI device corresponding\n"
 "         to /dev/ubi0\n"
-"         " PROGRAM_NAME "/dev/ubi0 -N my_vol - remove UBI named \"my_vol\" from UBI device\n"
+"         " PROGRAM_NAME " /dev/ubi0 -N my_vol - remove UBI named \"my_vol\" from UBI device\n"
 "         corresponding to /dev/ubi0";
 
 static const struct option long_options[] = {
-- 
1.7.2.5
