Received: from mx1.emlix.com ([46.4.235.150])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dUXH8-0005n3-38
 for linux-mtd@lists.infradead.org; Mon, 10 Jul 2017 11:54:52 +0000
Received: from mailer.emlix.com (unknown [80.150.94.234])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id A19A925F06A
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jul 2017 13:54:24 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: fix inclusion of uuid.h
Date: Mon, 10 Jul 2017 13:54:24 +0200
Message-ID: <1870262.xSbmLmMA2F@devpool21>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=46rom de17ee444ad4d523131806e4afe07c41a4c310d1 Mon Sep 17 00:00:00 2001
=46rom: Rolf Eike Beer <eb@emlix.com>
Date: Mon, 10 Jul 2017 13:43:06 +0200
Subject: [PATCH] ubifs: fix inclusion of uuid.h

The include directory exported by uuid.pc is */include/uuid, so uuid.h must=
 be
included without any directory in the path. This usually works out because =
uuid
is installed in the normal prefix, so the parent directory of what uuid has=
 as
include dir ends up in the include path anyway. In case one uses a custom u=
uid
outside of the regular include path this breaks.

Signed-off-by: Rolf Eike Beer <eb@emlix.com>
=2D--
 ubifs-utils/mkfs.ubifs/mkfs.ubifs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs/m=
kfs.ubifs.h
index 944a159..1321191 100644
=2D-- a/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
+++ b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
@@ -43,7 +43,7 @@
 #include <errno.h>
 #include <libgen.h>
 #include <ctype.h>
=2D#include <uuid/uuid.h>
+#include <uuid.h>
 #include <sys/file.h>
=20
 #include <mtd/ubifs-media.h>
=2D-=20
2.13.2


=2D-=20
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
=46on +49 551 30664-0, Fax +49 551 30664-11
Bertha-von-Suttner-Str. 9, 37085 G=C3=B6ttingen, Germany
Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 3160
Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-IdNr=
=2E: DE 205 198 055

emlix =E2=80=93 smart embedded open source
