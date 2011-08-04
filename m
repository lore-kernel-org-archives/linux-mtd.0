Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1Qp21r-0003Vu-P5
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2011 17:48:20 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH] mtdinfo: don't open NULL pointer when getting
	region_info with `-a'
Date: Thu, 4 Aug 2011 10:47:31 -0700
Message-ID: <1312480051-19208-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Cc: brian.foster@maxim-ic.com, Mike Frysinger <vapier@gentoo.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This "fixes" a regression found in:
  commit 266061ebd5d72391f0a0e831b018e8fc7fea68a1
  mtdinfo: add regioninfo/eraseblock map display

On certain flash (NOR flash that have eraseblock region info),
`mtdinfo -a' tries to open the MTD node file, for use with the ioctl
MEMGETREGIONINFO; however, we didn't supply a device node path to
`mtdinfo -a', so it's using NULL, resulting in errors like:

  mtdinfo: error!: couldn't open MTD dev: (null)
           error 14 (Bad address)

For now, we can just skip dumping region_info with the `-a' flag. If
we find a better way to do this (e.g., export via sysfs, find device
nodes via automatic routines, etc.), then we can kill the workaround
and this FIXME should be removed.

The regression was first reported at:

  http://lists.infradead.org/pipermail/linux-mtd/2011-July/037232.html

Reported-by: Brian Foster <brian.foster@maxim-ic.com>
CC: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 ubi-utils/mtdinfo.c |   10 ++++++++--
 1 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index e72d69e..f2fcd38 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -239,8 +239,14 @@ static void print_region_info(const struct mtd_dev_info *mtd)
 	region_info_t reginfo;
 	int r, fd;
 
-	/* If we don't have any region info, just return */
-	if (!args.map && mtd->region_cnt == 0)
+	/*
+	 * If we don't have any region info, just return
+	 *
+	 * FIXME: We can't get region_info (via ioctl) without having the MTD
+	 *        node path. This is a problem for `mtdinfo -a', for example,
+	 *        since it doesn't provide any filepath information.
+	 */
+	if (!args.node || !args.map && mtd->region_cnt == 0)
 		return;
 
 	/* First open the device so we can query it */
-- 
1.7.0.4
