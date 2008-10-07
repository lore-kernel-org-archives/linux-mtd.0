Received: from smtpout.cs.fsu.edu ([128.186.122.75] helo=mail.cs.fsu.edu)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KnGo4-0003hS-DA
	for linux-mtd@lists.infradead.org; Tue, 07 Oct 2008 17:57:13 +0000
Message-ID: <20081007132904.6vvmlioy8co004ko@system.cs.fsu.edu>
Date: Tue,  7 Oct 2008 13:29:04 -0400
From: Daniel Rosenthal <danielrosenthal@acm.org>
To: gerg@snapgear.com, dwmw2@infradead.org
Subject: [PATCH (fixed)] Fix infinite loop in INFTL_foldchain() in
	drivers/mtd/inftlcore.c
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="=_5ywxds22qysk"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This message is in MIME format.

--=_5ywxds22qysk
Content-Type: text/plain;
	charset=ISO-8859-1;
	DelSp="Yes";
	format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm having problems with my email client, but I've attached a patch =20
(both inline and as a regular attachment). This patch fixes a loop =20
that is potentially infinite in INFTL_foldchain in =20
drivers/mtd/inftlcore.c.

When iterating over a chain in reverse (oldest block first), this =20
patch correctly marks the PUtable[] entry of the second to last erase =20
block of a chain as BLOCK_NIL, regardless of whether or not it can =20
format the last block successfully. Before, the second to last block =20
was only marked as pointing to BLOCK_NIL if INFTL_formatblock() =20
succeeded on the last block of the chain, which could potentially =20
result in an infinite loop if the block was worn out and refused to =20
format.

If there are any problems with this patch please let me know. I can =20
apply them fine after pulling them from email, but my email client =20
(web interface) isn't fullproof, so if anybody else has problems, =20
please let me know. (I can't send it through pine or otherwise due to =20
network configuration.)

Thanks,
Daniel

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.


--=_5ywxds22qysk
Content-Type: text/plain; charset=UTF-8;
	name="0001-Fix-infinite-loop-in-INFTL_foldchain-in-drivers-mtd.patch"
Content-Disposition: inline;
	filename="0001-Fix-infinite-loop-in-INFTL_foldchain-in-drivers-mtd.patch"
Content-Transfer-Encoding: quoted-printable

>From 8f1275749768d316788194cc198093b00f85d0d6 Mon Sep 17 00:00:00 2001
From: Daniel Rosenthal <danielrosenthal@acm.org>
Date: Sun, 5 Oct 2008 17:43:10 -0400
Subject: [PATCH] Fix infinite loop in INFTL_foldchain in drivers/mtd/inftlco=
re.c.


Signed-off-by: Daniel Rosenthal <danielrosenthal@acm.org>
---
 drivers/mtd/inftlcore.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index c4f9d33..50ce138 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -388,6 +388,10 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, u=
nsigned thisVUC, unsigned
 =09=09if (thisEUN =3D=3D targetEUN)
 =09=09=09break;
=20
+=09=09/* Unlink the last block from the chain. */
+=09=09inftl->PUtable[prevEUN] =3D BLOCK_NIL;
+
+=09=09/* Now try to erase it. */
 =09=09if (INFTL_formatblock(inftl, thisEUN) < 0) {
 =09=09=09/*
 =09=09=09 * Could not erase : mark block as reserved.
@@ -396,7 +400,6 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, un=
signed thisVUC, unsigned
 =09=09} else {
 =09=09=09/* Correctly erased : mark it as free */
 =09=09=09inftl->PUtable[thisEUN] =3D BLOCK_FREE;
-=09=09=09inftl->PUtable[prevEUN] =3D BLOCK_NIL;
 =09=09=09inftl->numfreeEUNs++;
 =09=09}
 =09}
--=20
1.5.6.4


--=_5ywxds22qysk
Content-Type: text/plain; charset=UTF-8;
	name="0001-Fix-infinite-loop-in-INFTL_foldchain-in-drivers-mtd.patch"
Content-Disposition: attachment;
	filename="0001-Fix-infinite-loop-in-INFTL_foldchain-in-drivers-mtd.patch"
Content-Transfer-Encoding: quoted-printable

>From 8f1275749768d316788194cc198093b00f85d0d6 Mon Sep 17 00:00:00 2001
From: Daniel Rosenthal <danielrosenthal@acm.org>
Date: Sun, 5 Oct 2008 17:43:10 -0400
Subject: [PATCH] Fix infinite loop in INFTL_foldchain in drivers/mtd/inftlco=
re.c.


Signed-off-by: Daniel Rosenthal <danielrosenthal@acm.org>
---
 drivers/mtd/inftlcore.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/inftlcore.c b/drivers/mtd/inftlcore.c
index c4f9d33..50ce138 100644
--- a/drivers/mtd/inftlcore.c
+++ b/drivers/mtd/inftlcore.c
@@ -388,6 +388,10 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, u=
nsigned thisVUC, unsigned
 =09=09if (thisEUN =3D=3D targetEUN)
 =09=09=09break;
=20
+=09=09/* Unlink the last block from the chain. */
+=09=09inftl->PUtable[prevEUN] =3D BLOCK_NIL;
+
+=09=09/* Now try to erase it. */
 =09=09if (INFTL_formatblock(inftl, thisEUN) < 0) {
 =09=09=09/*
 =09=09=09 * Could not erase : mark block as reserved.
@@ -396,7 +400,6 @@ static u16 INFTL_foldchain(struct INFTLrecord *inftl, un=
signed thisVUC, unsigned
 =09=09} else {
 =09=09=09/* Correctly erased : mark it as free */
 =09=09=09inftl->PUtable[thisEUN] =3D BLOCK_FREE;
-=09=09=09inftl->PUtable[prevEUN] =3D BLOCK_NIL;
 =09=09=09inftl->numfreeEUNs++;
 =09=09}
 =09}
--=20
1.5.6.4


--=_5ywxds22qysk--
