Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LNUwl-0006Nz-Mf
	for linux-mtd@lists.infradead.org; Thu, 15 Jan 2009 16:19:58 +0000
Subject: [PATCH] UBI: add ioctl compatibility
From: Artem Bityutskiy <dedekind@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 15 Jan 2009 18:19:41 +0200
Message-Id: <1232036381.25068.10.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnd,

would you please glance if this patch all-right?



From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] UBI: add ioctl compatibility

UBI ioctl's do not work when running 64-bit kernel and 32-bit
user-land. Fix this by adding ioctl translation etries to
fs/compat_ioctl.c

Reported-by: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 fs/compat_ioctl.c |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/fs/compat_ioctl.c b/fs/compat_ioctl.c
index 5235c67..f1e00e1 100644
--- a/fs/compat_ioctl.c
+++ b/fs/compat_ioctl.c
@@ -95,6 +95,7 @@
 #include <linux/sonet.h>
 #include <linux/atm_suni.h>
 #include <linux/mtd/mtd.h>
+#include <mtd/ubi-user.h>
 
 #include <linux/usb.h>
 #include <linux/usbdevice_fs.h>
@@ -2423,6 +2424,19 @@ COMPATIBLE_IOCTL(MEMGETREGIONCOUNT)
 COMPATIBLE_IOCTL(MEMGETREGIONINFO)
 COMPATIBLE_IOCTL(MEMGETBADBLOCK)
 COMPATIBLE_IOCTL(MEMSETBADBLOCK)
+/* UBI */
+COMPATIBLE_IOCTL(UBI_IOCMKVOL)
+ULONG_IOCTL(UBI_IOCRMVOL)
+COMPATIBLE_IOCTL(UBI_IOCRSVOL)
+COMPATIBLE_IOCTL(UBI_IOCRNVOL)
+COMPATIBLE_IOCTL(UBI_IOCATT)
+ULONG_IOCTL(UBI_IOCDET)
+ULONG_IOCTL(UBI_IOCVOLUP)
+ULONG_IOCTL(UBI_IOCEBER)
+ULONG_IOCTL(UBI_IOCEBCH)
+ULONG_IOCTL(UBI_IOCEBMAP)
+ULONG_IOCTL(UBI_IOCEBUNMAP)
+ULONG_IOCTL(UBI_IOCEBISMAP)
 /* NBD */
 ULONG_IOCTL(NBD_SET_SOCK)
 ULONG_IOCTL(NBD_SET_BLKSIZE)
-- 
1.6.0.6

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
