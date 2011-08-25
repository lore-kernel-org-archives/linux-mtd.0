Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QwVH3-00067b-6O
	for linux-mtd@lists.infradead.org; Thu, 25 Aug 2011 08:26:53 +0000
Received: by gyh20 with SMTP id 20so1843132gyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Aug 2011 01:26:49 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 25 Aug 2011 10:26:49 +0200
Message-ID: <CAMjE+nUOxOm4bBWKp1xAcVDjP-Pepd_GuJ=DcQ4jUcsohn-K=g@mail.gmail.com>
Subject: mtd-utils: ubiformat: writing images on flash with badblocks.
From: Anton Olofsson <anol.martinsson@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

We encountered some problems with ubiformat
and writing ubi-images onto flash with badblocks.

If a badblock was encountered during write ubiformat would
skip writing that =93file-block=94 altogether, and this would eventually
result in EOF while trying to read the image file.

The quick fix was to rewind the filedescriptor for the next pass.

Im not sure if others have encountered this problem
or even if this is the correct way to handle this situation.

Here is the change made though:

--- a/ubi-utils/ubiformat.c
+++ b/ubi-utils/ubiformat.c
@@ -546,6 +546,11 @@ static int flash_image(libmtd_t libmtd, const
struct mtd_dev_info *mtd,
                                if (mark_bad(mtd, si, eb))
                                        goto out_close;
                        }
+                       /*rewind fd so next read_all(...) reads correct blo=
ck*/
+                       if (lseek(fd, -mtd->eb_size, SEEK_CUR) =3D=3D -1) {
+                               sys_errmsg("unable to rewind file");
+                               goto out_close;
+                       }
                        continue;
                }
                if (++written_ebs >=3D img_ebs)
