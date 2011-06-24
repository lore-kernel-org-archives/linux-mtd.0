Received: from mms1.broadcom.com ([216.31.210.17])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QaAld-0000lj-OL
	for linux-mtd@lists.infradead.org; Fri, 24 Jun 2011 18:06:13 +0000
From: "Brian Norris" <computersforpeace@gmail.com>
To: "Artem Bityutskiy" <dedekind1@gmail.com>
Subject: [PATCH 6/6] integck: fix build error (MS_DIRSYNC, MS_RELATIME)
Date: Fri, 24 Jun 2011 11:03:14 -0700
Message-ID: <1308938594-20486-7-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1308938594-20486-1-git-send-email-computersforpeace@gmail.com>
References: <1308938594-20486-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Need to include <linux/fs.h>, at least for my build system. Otherwise,
you can't build the 'tests'.

integck.c: In function =E2=80=98parse_mount_options=E2=80=99:
integck.c:2862: error: =E2=80=98MS_DIRSYNC=E2=80=99 undeclared (first use i=
n this
function)
integck.c:2862: error: (Each undeclared identifier is reported only once
integck.c:2862: error: for each function it appears in.)
integck.c:2872: error: =E2=80=98MS_RELATIME=E2=80=99 undeclared (first use =
in this
function)

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 tests/fs-tests/integrity/integck.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/tests/fs-tests/integrity/integck.c b/tests/fs-tests/integrity/=
integck.c
index 54e5ddc..30322cd 100644
--- a/tests/fs-tests/integrity/integck.c
+++ b/tests/fs-tests/integrity/integck.c
@@ -36,6 +36,7 @@
 #include <sys/vfs.h>
 #include <sys/mount.h>
 #include <sys/statvfs.h>
+#include <linux/fs.h>
=20
 #define PROGRAM_VERSION "1.1"
 #define PROGRAM_NAME "integck"
--=20
1.7.0.4
