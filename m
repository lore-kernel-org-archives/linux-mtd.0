Received: from smtp.gentoo.org ([140.211.166.183])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTxwO-0005DY-F0
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 15:11:36 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
	by smtp.gentoo.org (Postfix) with ESMTP id 1F9641B402A
	for <linux-mtd@lists.infradead.org>;
	Tue,  7 Jun 2011 15:11:35 +0000 (UTC)
From: Mike Frysinger <vapier@gentoo.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2] flash_info: deprecate
Date: Tue,  7 Jun 2011 11:11:37 -0400
Message-Id: <1307459497-2226-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <1307427548-29306-6-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-6-git-send-email-vapier@gentoo.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- just deprecate for now rather than straight up removal

 feature-removal-schedule.txt |    7 +++++++
 flash_info.c                 |    2 ++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/feature-removal-schedule.txt b/feature-removal-schedule.txt
index 6e2bfc9..a5980f7 100644
--- a/feature-removal-schedule.txt
+++ b/feature-removal-schedule.txt
@@ -32,4 +32,11 @@ We cannot assume that mtd device names follow the "/dev/mtd%d" pattern,
 because it is up to udev rules to name the devices. So we are removing
 the -m option. For now, we just have a warning, but the option will be
 removed in release 1.4.6.
+
+---------------------------
+3. flash_info utility
+
+This is duplicating behavior with the mtdinfo utility.  Now the util
+warns when people use it, but it'll be removed in release 1.4.6.
+
 ---------------------------
diff --git a/flash_info.c b/flash_info.c
index b710034..b15e0a9 100644
--- a/flash_info.c
+++ b/flash_info.c
@@ -73,6 +73,8 @@ int main(int argc, char *argv[])
 {
 	int fd, i, regcount;
 
+	warnmsg("this is deprecated in favor of `mtdinfo`");
+
 	if (argc < 2)
 		usage(1);
 	if (!strcmp(argv[1], "-h") || !strcmp(argv[1], "--help"))
-- 
1.7.5.3
