Received: from [65.200.49.156] (helo=zipcode.az.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I1A13-0007l8-Kn
	for linux-mtd@lists.infradead.org; Thu, 21 Jun 2007 00:55:15 +0100
Date: Wed, 20 Jun 2007 16:52:45 -0700
From: "Mark A. Greer" <mgreer@mvista.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH][MTD] Add COMPATIBLE_IOCTL() for MEMGETOOBSEL
Message-ID: <20070620235245.GA12800@mag.az.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The flash_eraseall MTD utility uses the MEMGETOOBSEL so add a
COMPATIBLE_IOCTL() entry for it.

Signed-off-by: Mark A. Greer <mgreer@mvista.com>
---
I know MEMGETOOBSEL is supposed to be obsolete but flash_eraseall uses
it so...

Also, MEMSETOOBSEL is used by nandwrite.c but that ioctl doesn't appear
to be implemented so I didn't add it.  My util source is
http://ftp.linux.org.uk/pub/people/dwmw2/mtd/cvs/mtd/util/
in case I'm looking at old source.

 include/linux/compat_ioctl.h |    1 +
 1 file changed, 1 insertion(+)


diff --git a/include/linux/compat_ioctl.h b/include/linux/compat_ioctl.h
index c26c3ad..3f7d6ab 100644
--- a/include/linux/compat_ioctl.h
+++ b/include/linux/compat_ioctl.h
@@ -694,6 +694,7 @@ COMPATIBLE_IOCTL(MEMLOCK)
 COMPATIBLE_IOCTL(MEMUNLOCK)
 COMPATIBLE_IOCTL(MEMGETREGIONCOUNT)
 COMPATIBLE_IOCTL(MEMGETREGIONINFO)
+COMPATIBLE_IOCTL(MEMGETOOBSEL)
 COMPATIBLE_IOCTL(MEMGETBADBLOCK)
 COMPATIBLE_IOCTL(MEMSETBADBLOCK)
 /* NBD */
