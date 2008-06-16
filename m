Received: from smtp6-g19.free.fr ([212.27.42.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8DvH-0002QU-0I
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 12:34:59 +0000
To: =?utf-8?b?SsO2cm4gRW5nZWw=?= <joern@logfs.org>
Subject: Re: physmap without MTD partitions
References: <87y75hz3u2.fsf@free.fr> <20080616095047.GA18998@logfs.org>
From: Robert Jarzmik <rjarzmik@free.fr>
Date: 16 Jun 2008 14:34:56 +0200
In-Reply-To: <20080616095047.GA18998@logfs.org>
Message-ID: <87k5gpv9qn.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Robert Jarzmik <rjarzmik@free.fr>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

J=C3=B6rn Engel <joern@logfs.org> writes:

> On Sat, 7 June 2008 17:01:41 +0200, Robert Jarzmik wrote:
> > @@ -213,8 +214,10 @@ static int physmap_flash_resume(struct platform_de=
vice *dev)
> >  	struct physmap_flash_info *info =3D platform_get_drvdata(dev);
> >  	int i;
> >=20=20
> > +	return 0;
>=20
> Is this bit leftover from debugging?

Yes, sorry for that. That got through.
Here is the amended patch.

--
Robert

>From f09b6952c2cb3ac307654f628f3899757b3a1023 Mon Sep 17 00:00:00 2001
From: Robert Jarzmik <rjarzmik@free.fr>
Date: Sat, 7 Jun 2008 16:59:05 +0200
Subject: [PATCH] Fix suspend/resume/shutdown bugs.

Don't call suspend/resume functions if they have not been
defined.

Signed-off-by: Robert Jarzmik <rjarzmik@free.fr>
---
 drivers/mtd/maps/physmap.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 183255f..73c770b 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -203,7 +203,8 @@ static int physmap_flash_suspend(struct platform_device=
 *dev, pm_message_t state
 	int i;
=20
 	for (i =3D 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		ret |=3D info->mtd[i]->suspend(info->mtd[i]);
+		if (info->mtd[i]->suspend)
+			ret |=3D info->mtd[i]->suspend(info->mtd[i]);
=20
 	return ret;
 }
@@ -214,7 +215,8 @@ static int physmap_flash_resume(struct platform_device =
*dev)
 	int i;
=20
 	for (i =3D 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		info->mtd[i]->resume(info->mtd[i]);
+		if (info->mtd[i]->resume)
+			info->mtd[i]->resume(info->mtd[i]);
=20
 	return 0;
 }
@@ -225,8 +227,9 @@ static void physmap_flash_shutdown(struct platform_devi=
ce *dev)
 	int i;
=20
 	for (i =3D 0; i < MAX_RESOURCES && info->mtd[i]; i++)
-		if (info->mtd[i]->suspend(info->mtd[i]) =3D=3D 0)
-			info->mtd[i]->resume(info->mtd[i]);
+		if (info->mtd[i]->suspend && info->mtd[i]->resume)
+			if (info->mtd[i]->suspend(info->mtd[i]) =3D=3D 0)
+				info->mtd[i]->resume(info->mtd[i]);
 }
 #else
 #define physmap_flash_suspend NULL
--=20
1.5.5.3
