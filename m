Received: from smtp.gentoo.org ([140.211.166.183])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZUIl-0006dJ-8y
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 22:54:35 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 by smtp.gentoo.org (Postfix) with ESMTP id 9047A33DFC0
 for <linux-mtd@lists.infradead.org>; Mon,  6 May 2013 22:54:03 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubinize: fix usage text
Date: Mon,  6 May 2013 18:54:07 -0400
Message-Id: <1367880847-4157-1-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drop duplicate "and the", and tweak grammar slightly.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 ubi-utils/ubinize.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/ubinize.c b/ubi-utils/ubinize.c
index 3d19a02..34f465a 100644
--- a/ubi-utils/ubinize.c
+++ b/ubi-utils/ubinize.c
@@ -42,11 +42,11 @@
 static const char doc[] = PROGRAM_NAME " version " VERSION
 " - a tool to generate UBI images. An UBI image may contain one or more UBI "
 "volumes which have to be defined in the input configuration ini-file. The "
-"ini file defines all the UBI volumes - their characteristics and the and the "
+"ini file defines all the UBI volumes - their characteristics and the "
 "contents, but it does not define the characteristics of the flash the UBI "
 "image is generated for. Instead, the flash characteristics are defined via "
 "the command-line options. Note, if not sure about some of the command-line "
-"parameters, do not specify them and let the utility to use default values.";
+"parameters, do not specify them and let the utility use default values.";
 
 static const char optionsstr[] =
 "-o, --output=<file name>     output file name\n"
-- 
1.8.2.1
