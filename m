Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWKU0-0004a1-RG
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2018 12:16:22 +0000
Received: by mail-wr1-x431.google.com with SMTP id 96so10256911wrb.2
 for <linux-mtd@lists.infradead.org>; Mon, 10 Dec 2018 04:16:09 -0800 (PST)
MIME-Version: 1.0
From: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Date: Mon, 10 Dec 2018 13:15:56 +0100
Message-ID: <CABDcavac8U3aM4F8o3mcrEEtkunuryOrtTJW015CsjwPK0S--w@mail.gmail.com>
Subject: UBIFS: Do we need to fsync the parent directory?
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

When using the typical and well-known approach for atomic file updates:

fd =3D open(=E2=80=9Cfoo.new=E2=80=9D, O_WRONLY);
write(fd, buf, bufsize);
fsync(fd);
close(fd);
rename(=E2=80=9Cfoo.new=E2=80=9D, =E2=80=9Cfoo=E2=80=9D);

And assuming that we want to ensure not only that the update was
atomic, but also that the "new" version of the file will be available
in the event of a crash, normally one would also fsync the parent
directory.

Is this needed in UBIFS? The reason I am asking is this snippet from
the online documentation:

> fsync() may be called for directories - it synchronizes the directory ino=
de meta-data. [...]
> The fdatasync() call for directories is "no-op" in UBIFS and all UBIFS op=
erations which change directory entries are synchronous.

If I am reading correctly, the latter ("all UBIFS operations which
change directory entries are synchronous") seems to imply that calling
fsync on the parent dir would not be necessary. However my tests seem
to indicate otherwise. Am I misreading the docs?

Thank you,

Guillermo Rodriguez Garcia
guille.rodriguez@gmail.com
