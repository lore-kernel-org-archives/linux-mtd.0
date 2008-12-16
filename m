Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCX3P-0005jx-OJ
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 10:21:28 +0000
Subject: Re: [PATCH] nandwrite - handle situation when read returns less
	bytes the expected
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hai Zaar <haizaar@haizaar.com>
In-Reply-To: <76d9e2a30812160040u263e275aqa04c0e4b726365cc@mail.gmail.com>
References: <76d9e2a30812140559y6ade25c0jf55fd8a7b299e83a@mail.gmail.com>
	<1229408910.4911.72.camel@sauron>
	<76d9e2a30812160040u263e275aqa04c0e4b726365cc@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 16 Dec 2008 12:18:34 +0200
Message-Id: <1229422714.17960.2.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-12-16 at 10:40 +0200, Hai Zaar wrote:
> On Tue, Dec 16, 2008 at 8:28 AM, Artem Bityutskiy
> <dedekind@infradead.org> wrote:
> >
> > Your patch does not apply. It looks like it is not against the latest
> > mtd-utils. How about this patch?
> Yes, my patch is against mtd-utils-1.2.0. Yours is surely better since
> it covers oob reading as well.

Would be nice if you tried my patch and confirmed it works, because I
did not test it.

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Subject: [PATCH] nandwrite: correct data reading

The "read" syscall does not necessarily return all the requested
data, in which case the caller has to try again and read more.
Take this into account when reading input data.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 nandwrite.c |   32 +++++++++++++++++++++-----------
 1 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index fc23e85..b4bc871 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -262,7 +262,6 @@ int main(int argc, char * const argv[])
 	struct nand_oobinfo old_oobinfo;
=20
 	process_options(argc, argv);
-
 	erase_buffer(oobbuf, sizeof(oobbuf));
=20
 	if (pad && writeoob) {
@@ -438,6 +437,8 @@ int main(int argc, char * const argv[])
 	 * length or zero.
 	 */
 	while (imglen && (mtdoffset < meminfo.size)) {
+		int tinycnt =3D 0;
+
 		// new eraseblock , check for bad block(s)
 		// Stay in the loop to be sure if the mtdoffset changes because
 		// of a bad block, that the next block that will be written to
@@ -484,15 +485,17 @@ int main(int argc, char * const argv[])
 			}
=20
 			/* Read Page Data from input file */
-			if ((cnt =3D read(ifd, writebuf, readlen)) !=3D readlen) {
-				if (cnt =3D=3D 0)	// EOF
+			while(tinycnt < readlen) {
+				cnt =3D read(ifd, writebuf + tinycnt, readlen - tinycnt);
+				if (cnt =3D=3D 0) { // EOF
 					break;
-				perror ("File I/O error on input file");
-				goto closeall;
+				} else if (cnt < 0) {
+					perror ("File I/O error on input file");
+					goto closeall;
+				}
+				tinycnt +=3D cnt;
 			}
 		} else {
-			int tinycnt =3D 0;
-
 			while(tinycnt < readlen) {
 				cnt =3D read(ifd, writebuf + tinycnt, readlen - tinycnt);
 				if (cnt =3D=3D 0) { // EOF
@@ -522,11 +525,18 @@ int main(int argc, char * const argv[])
 		}
=20
 		if (writeoob) {
-			/* Read OOB data from input file, exit on failure */
-			if ((cnt =3D read(ifd, oobreadbuf, meminfo.oobsize)) !=3D meminfo.oobsi=
ze) {
-				perror ("File I/O error on input file");
-				goto closeall;
+			tinycnt =3D 0;
+			while(tinycnt < readlen) {
+				cnt =3D read(ifd, oobreadbuf + tinycnt, meminfo.oobsize - tinycnt);
+				if (cnt =3D=3D 0) { // EOF
+					break;
+				} else if (cnt < 0) {
+					perror ("File I/O error on input file");
+					goto closeall;
+				}
+				tinycnt +=3D cnt;
 			}
+
 			if (!noecc) {
 				int i, start, len;
 				/*
--=20
1.5.4.3

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
