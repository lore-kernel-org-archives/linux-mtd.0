Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqqYl-00084M-Qr
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 18:30:04 +0000
Received: by pbdx9 with SMTP id x9so2270703pbd.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 10:30:02 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] mtdinfo: fix `--all' for non-consecutive device numbers
Date: Fri, 27 Jan 2012 10:30:46 -0800
Message-Id: <1327689046-1450-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1327689046-1450-1-git-send-email-computersforpeace@gmail.com>
References: <1327689046-1450-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When we have assigned non-consecutive device numbers to our MTD devices,
then we run `mtdinfo --all', we get errors once mtdinfo tries to process
the devices in the "hole". For instance, suppose that at boot time, we have
one MTD (/dev/mtd0) then perform a sequence like the following:

 # modprobe mtdram
 # modprobe nandsim
 # rmmod mtdram

Then at this point, we have should have devices 0 and 2 without 1. Then:

 # mtdinfo --all
 ...
 mtdinfo: error!: mtd1 does not correspond to any existing MTD device

We add a check to first see if device is present, then continue to the next
ID if it doesn't exist.

Reported-by: Brian Foster <brian.foster@maxim-ic.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 ubi-utils/mtdinfo.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index ead4bce..d25595a 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -378,6 +378,8 @@ static int print_general_info(libmtd_t libmtd, const struct mtd_info *mtd_info,
 
 	for (i = mtd_info->lowest_mtd_num;
 	     i <= mtd_info->highest_mtd_num; i++) {
+		if (!mtd_dev_present(libmtd, i))
+			continue;
 		err = print_dev_info(libmtd, mtd_info, i);
 		if (err)
 			return err;
-- 
1.7.5.4
