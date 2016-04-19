Received: from smtp.gentoo.org ([140.211.166.183])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asOb2-0005UE-6u
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2016 05:53:12 +0000
From: Mike Frysinger <vapier@gentoo.org>
To: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: linux-mtd@lists.infradead.org, libc-alpha@sourceware.org,
 linux-man@vger.kernel.org
Subject: [PATCH] makedev(3): point people at sys/sysmacros.h
Date: Tue, 19 Apr 2016 01:52:43 -0400
Message-Id: <1461045163-21248-1-git-send-email-vapier@gentoo.org>
In-Reply-To: <20160418164908.GR5369@vapier.lan>
References: <20160418164908.GR5369@vapier.lan>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Defining these functions via sys/types.h violates POSIX namespace
requirements, so we want to disentangle it from that header.  Since
glibc has basically always used this header, update the docs to have
people include that instead.

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 man3/makedev.3 | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/man3/makedev.3 b/man3/makedev.3
index f91f4b5..3d26d15 100644
--- a/man3/makedev.3
+++ b/man3/makedev.3
@@ -28,23 +28,13 @@
 makedev, major, minor \- manage a device number
 .SH SYNOPSIS
 .nf
-.B #include <sys/types.h>
+.B #include <sys/sysmacros.h>
 
 .BI "dev_t makedev(unsigned int " maj ", unsigned int " min );
 
 .BI "unsigned int major(dev_t " dev );
 .BI "unsigned int minor(dev_t " dev );
 .fi
-.sp
-.BR makedev (),
-.BR major (),
-.BR minor ():
-.nf
-    Since glibc 2.19:
-        _DEFAULT_SOURCE
-    In glibc up to and including 2.19:
-        _BSD_SOURCE
-.fi
 .SH DESCRIPTION
 A device ID consists of two parts:
 a major ID, identifying the class of the device,
@@ -90,7 +80,9 @@ and
 .BR minor ()
 functions are not specified in POSIX.1,
 but are present on many other systems.
-.\" The BSDs, HP-UX, Solaris, AIX, Irix
+.\" The BSDs, HP-UX, Solaris, AIX, Irix.
+.\" The header location is inconsistent:
+.\" Could be sys/mkdev.h, sys/sysmacros.h, or sys/types.h.
 .SH NOTES
 These interfaces are defined as macros.
 Since glibc 2.3.3,
-- 
2.7.4
