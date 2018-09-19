Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g2Xsu-0003uw-D3
 for linux-mtd@lists.infradead.org; Wed, 19 Sep 2018 08:30:58 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Chris.Packham@alliedtelesis.co.nz, xiaolei.li@mediatek.com,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH] libmtd: don't print an error message for devices without ecc
 support
Date: Wed, 19 Sep 2018 10:29:36 +0200
Message-Id: <20180919082936.4011-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The libmtd library tries to obtain the available OOB size via the sysfs
with a fallback to the ECCGETLAYOUT ioctl. For some devices (e.g. plat-ram),
the fallback path is always taken and prints an error message to stderr
since the ioctl fails.

This patch fixes the fallback path by suppressing the error message if
errno is set to EOPNOTSUPP (i.e. the device simply doesn't support that).

Fixes: a10353584f93 ("libmtd: Add support to access OOB available size")
Reported-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 lib/libmtd_legacy.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/libmtd_legacy.c b/lib/libmtd_legacy.c
index 97fef04..2b7f65f 100644
--- a/lib/libmtd_legacy.c
+++ b/lib/libmtd_legacy.c
@@ -235,6 +235,8 @@ int legacy_get_mtd_oobavail(const char *node)
 
 	ret = ioctl(fd, ECCGETLAYOUT, &usrlay);
 	if (ret < 0) {
+		if (errno == EOPNOTSUPP)
+			goto out_close;
 		sys_errmsg("ECCGETLAYOUT ioctl request failed");
 		goto out_close;
 	}
-- 
2.17.1
