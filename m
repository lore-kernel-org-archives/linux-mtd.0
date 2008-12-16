Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCTTb-0003Ky-BQ
	for linux-mtd@lists.infradead.org; Tue, 16 Dec 2008 06:32:15 +0000
Subject: Re: [PATCH] nandwrite - handle situation when read returns less
	bytes the expected
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hai Zaar <haizaar@codefidence.com>
In-Reply-To: <76d9e2a30812140559y6ade25c0jf55fd8a7b299e83a@mail.gmail.com>
References: <76d9e2a30812140559y6ade25c0jf55fd8a7b299e83a@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Date: Tue, 16 Dec 2008 08:28:30 +0200
Message-Id: <1229408910.4911.72.camel@sauron>
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

On Sun, 2008-12-14 at 15:59 +0200, Hai Zaar wrote:
> Good day!
> I've found a bug: nandwrite does not handle the situation when read
> syscall returns less bytes when expected. Instead of requesting more
> input, nandwrite just aborts with error.
> The bug is especially triggered when input comes from stdin[1] which
> is filled from remote host.
>=20
> [1] http://lists.infradead.org/pipermail/linux-mtd/2008-September/022913.=
html.
> BTW - is it going to be applied?
>=20
> P.S. I'm not on the list, so please CC me.

Your patch does not apply. It looks like it is not against the latest
mtd-utils. How about this patch?

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Tue, 16 Dec 2008 10:02:16 +0200
Subject: [PATCH] nandwrite: correct data reading

The "read" syscall does not necessarily return all the requested
data, in which case the caller has to try again and read more.
Take this into account when reading input data.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 nandwrite.c |   31 +++++++++++++++++++++++--------
 1 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/nandwrite.c b/nandwrite.c
index fc23e85..0b2a9ee 100644
--- a/nandwrite.c
+++ b/nandwrite.c
@@ -260,6 +260,7 @@ int main(int argc, char * const argv[])
 	int ret, readlen;
 	int oobinfochanged =3D 0;
 	struct nand_oobinfo old_oobinfo;
+	int readcnt =3D 0;
=20
 	process_options(argc, argv);
=20
@@ -477,6 +478,8 @@ int main(int argc, char * const argv[])
 		readlen =3D meminfo.writesize;
=20
 		if (ifd !=3D STDIN_FILENO) {
+			int tinycnt =3D 0;
+
 			if (pad && (imglen < readlen))
 			{
 				readlen =3D imglen;
@@ -484,11 +487,15 @@ int main(int argc, char * const argv[])
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
 			int tinycnt =3D 0;
@@ -522,11 +529,19 @@ int main(int argc, char * const argv[])
 		}
=20
 		if (writeoob) {
-			/* Read OOB data from input file, exit on failure */
-			if ((cnt =3D read(ifd, oobreadbuf, meminfo.oobsize)) !=3D meminfo.oobsi=
ze) {
-				perror ("File I/O error on input file");
-				goto closeall;
+			int tinycnt =3D 0;
+
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
