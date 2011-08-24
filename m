Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qw1AP-00082j-UB
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 00:18:02 +0000
Received: by gyh20 with SMTP id 20so646448gyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 23 Aug 2011 17:17:59 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH 3/5] mtd: remove MEMSETOOBSEL macro definition
Date: Tue, 23 Aug 2011 17:17:34 -0700
Message-Id: <1314145056-5233-3-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
References: <1314145056-5233-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

MEMSETOOBSEL is completely unused and useless. Remove the definition.

Note: it's probably best not to use this ioctl number in the future for
MTD, since that may cause conflicts between old kernels and new user
software (or new kernels and old user software). This shouldn't be much
problem.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 include/mtd/mtd-abi.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 2f7d45b..f0e8027 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -112,7 +112,7 @@ struct otp_info {
 #define MEMUNLOCK		_IOW('M', 6, struct erase_info_user)
 #define MEMGETREGIONCOUNT	_IOR('M', 7, int)
 #define MEMGETREGIONINFO	_IOWR('M', 8, struct region_info_user)
-#define MEMSETOOBSEL		_IOW('M', 9, struct nand_oobinfo)
+
 #define MEMGETOOBSEL		_IOR('M', 10, struct nand_oobinfo)
 #define MEMGETBADBLOCK		_IOW('M', 11, __kernel_loff_t)
 #define MEMSETBADBLOCK		_IOW('M', 12, __kernel_loff_t)
-- 
1.7.5.4
