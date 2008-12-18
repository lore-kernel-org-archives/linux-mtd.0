Received: from yw-out-1718.google.com ([74.125.46.153])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDJgL-00058N-QD
	for linux-mtd@lists.infradead.org; Thu, 18 Dec 2008 14:16:54 +0000
Received: by yw-out-1718.google.com with SMTP id 5so169919ywm.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 18 Dec 2008 06:16:53 -0800 (PST)
Message-ID: <52e42efe0812180616u59242b0eucccaccdd5e276f22@mail.gmail.com>
Date: Thu, 18 Dec 2008 15:16:53 +0100
From: "Sidney Amani" <amani_s@epitech.net>
Sender: seed95@gmail.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] Makefile export libraries headers
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From 9d61143fdeb85b0239bd8e755114c50a45a151ef Mon Sep 17 00:00:00 2001
From: Sidney Amani <amani_s@epitech.net>
Date: Wed, 17 Dec 2008 12:50:54 +0100
Subject: [PATCH] Makefile export libraries headers

Export headers, if we want to use the previoulsy exported
shared libraries we will need them.

Signed-off-by: Sidney Amani <amani_s@epitech.net>
Signed-off-by: Corentin Chary <chary_c@epitech.net>
---
 ubi-utils/new-utils/Makefile |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/ubi-utils/new-utils/Makefile b/ubi-utils/new-utils/Makefile
index a975a99..560e391 100644
--- a/ubi-utils/new-utils/Makefile
+++ b/ubi-utils/new-utils/Makefile
@@ -6,7 +6,7 @@ KERNELHDR := ../../include
 DESTDIR := /usr/local
 SBINDIR=/usr/sbin
 MANDIR=/usr/man
-INCLUDEDIR=/usr/include
+INCLUDEDIR=/include
 LIBDIR=/lib

 CC := $(CROSS)gcc
@@ -74,6 +74,9 @@ clean:
 install: ${UTILS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
 	install -m 0755 ${UTILS} ${DESTDIR}/${SBINDIR}/
+	for i in $(addsuffix .h, $(LIBS)); do \
+		[ -f include/$$i ] &&  install -m 0755 include/$$i  ${DESTDIR}/${LIBDIR}/; \
+	done
 	for i in $(addsuffix .so, $(LIBS)); do \
 		[ -f $$i ] &&  install -m 0755 $$i  ${DESTDIR}/${LIBDIR}/; \
 	done
-- 
1.5.6.4
