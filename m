Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QwG9t-00034b-3i
	for linux-mtd@lists.infradead.org; Wed, 24 Aug 2011 16:18:29 +0000
From: David Wagner <david.wagner@free-electrons.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: [PATCH] document ubiblk's usage of the same ioctl magic as a part of
	UBI
Date: Wed, 24 Aug 2011 18:21:56 +0200
Message-Id: <1314202916-6982-1-git-send-email-david.wagner@free-electrons.com>
In-Reply-To: <1314202540-5562-1-git-send-email-david.wagner@free-electrons.com>
References: <1314202540-5562-1-git-send-email-david.wagner@free-electrons.com>
Cc: linux-embedded <linux-embedded@vger.kernel.org>,
	Artem Bityutskiy <dedekind1@gmail.com>,
	David Wagner <david.wagner@free-electrons.com>,
	lkml <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

---
 include/mtd/ubi-user.h |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 3c41097..7c8bfe3 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -188,6 +188,7 @@
 /* Set an UBI volume property */
 #define UBI_IOCSETVOLPROP _IOW(UBI_VOL_IOC_MAGIC, 6, \
 			       struct ubi_set_vol_prop_req)
+/* If you add ioctls here, please note that ubiblk uses 'O'/0x10-0x11 */
 
 /* Maximum MTD device name length supported by UBI */
 #define MAX_UBI_MTD_NAME_LEN 127
-- 
1.7.0.4
