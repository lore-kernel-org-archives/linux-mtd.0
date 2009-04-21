Subject: [PATCH] Kill jffs2-user.h
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Apr 2009 09:17:23 +0300
Message-Id: <1240294643.14298.20.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is also available from:
	git://git.infradead.org/users/dedekind/mtd-2.6.git

--
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] Kill jffs2-user.h

This file does not define any kernel-userspace API, all
it does it defines few helpers for userspace. Instead,
userspace should have a private copy of this file.

The main (if not the only) user is the mtd-utils package, but
it already has a private copy of this file.

This patch also removes references to 'jffs2-user.h' from
'Kbuild' and MAINTAINERS' files.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 MAINTAINERS              |    1 -
 include/mtd/Kbuild       |    1 -
 include/mtd/jffs2-user.h |   34 ----------------------------------
 3 files changed, 0 insertions(+), 36 deletions(-)
 delete mode 100644 include/mtd/jffs2-user.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cb20d8..7e67f3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3101,7 +3101,6 @@ W:	http://www.linux-mtd.infradead.org/doc/jffs2.html
 S:	Maintained
 F:	fs/jffs2/
 F:	include/linux/jffs2.h
-F:	include/mtd/jffs2-user.h
 
 JOURNALLING LAYER FOR BLOCK DEVICES (JBD)
 P:	Stephen Tweedie
diff --git a/include/mtd/Kbuild b/include/mtd/Kbuild
index 8eb018f..192f8fb 100644
--- a/include/mtd/Kbuild
+++ b/include/mtd/Kbuild
@@ -1,5 +1,4 @@
 header-y += inftl-user.h
-header-y += jffs2-user.h
 header-y += mtd-abi.h
 header-y += mtd-user.h
 header-y += nftl-user.h
diff --git a/include/mtd/jffs2-user.h b/include/mtd/jffs2-user.h
deleted file mode 100644
index fa94b0e..0000000
--- a/include/mtd/jffs2-user.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/*
- * JFFS2 definitions for use in user space only
- */
-
-#ifndef __JFFS2_USER_H__
-#define __JFFS2_USER_H__
-
-/* This file is blessed for inclusion by userspace */
-#include <linux/jffs2.h>
-#include <linux/types.h>
-#include <endian.h>
-#include <byteswap.h>
-
-#undef cpu_to_je16
-#undef cpu_to_je32
-#undef cpu_to_jemode
-#undef je16_to_cpu
-#undef je32_to_cpu
-#undef jemode_to_cpu
-
-extern int target_endian;
-
-#define t16(x) ({ __u16 __b = (x); (target_endian==__BYTE_ORDER)?__b:bswap_16(__b); })
-#define t32(x) ({ __u32 __b = (x); (target_endian==__BYTE_ORDER)?__b:bswap_32(__b); })
-
-#define cpu_to_je16(x) ((jint16_t){t16(x)})
-#define cpu_to_je32(x) ((jint32_t){t32(x)})
-#define cpu_to_jemode(x) ((jmode_t){t32(x)})
-
-#define je16_to_cpu(x) (t16((x).v16))
-#define je32_to_cpu(x) (t32((x).v32))
-#define jemode_to_cpu(x) (t32((x).m))
-
-#endif /* __JFFS2_USER_H__ */
-- 
1.6.0.6

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
