Received: from mail-qy0-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MhL01-00007v-II
	for linux-mtd@lists.infradead.org; Sat, 29 Aug 2009 10:17:38 +0000
Received: by qyk8 with SMTP id 8so2161027qyk.2
	for <linux-mtd@lists.infradead.org>;
	Sat, 29 Aug 2009 03:17:30 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 29 Aug 2009 19:17:29 +0900
Message-ID: <58484c0e0908290317m62485b2bu6ca69db7de8111a5@mail.gmail.com>
Subject: [PATCH] inappropriate pending block in foldchain
From: Mohanlal Jangir <mohanlaljangir@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In function  INFTL_findwriteunit, inappropriate pending block
parameter is passed which prevents 0xFFFF block copy during foldchain.
This patch fixes the problem.

-Mohan

diff -Nur a/linux-2.6.30.5/drivers/mtd/inftlcore.c
b/linux-2.6.30.5/drivers/mtd/inftlcore.c
--- a/linux-2.6.30.5/drivers/mtd/inftlcore.c=A02009-08-17 06:19:38.00000000=
0 +0900
+++ b/linux-2.6.30.5/drivers/mtd/inftlcore.c=A02009-08-29 19:04:21.95312500=
0 +0900
@@ -549,7 +549,7 @@
=A0=A0=A0=A0 * waiting to be picked up. We're going to have to fold
=A0=A0=A0=A0 * a chain to make room.
=A0=A0=A0=A0 */
-=A0=A0=A0thisEUN =3D INFTL_makefreeblock(inftl, 0xffff);
+=A0=A0=A0thisEUN =3D INFTL_makefreeblock(inftl, block);

=A0=A0=A0=A0/*
=A0=A0=A0=A0 * Hopefully we free something, lets try again.
