Received: from zproxy.gmail.com ([64.233.162.194])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EQcSt-0003A6-JX
	for linux-mtd@lists.infradead.org; Sat, 15 Oct 2005 04:12:08 +0100
Received: by zproxy.gmail.com with SMTP id 14so808659nzn
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2005 20:12:07 -0700 (PDT)
Message-ID: <b1c6420f0510142012m3c6807acx885ff7d71e532368@mail.gmail.com>
Date: Sat, 15 Oct 2005 12:12:07 +0900
From: Suzuki Takashi <suzuki.takashi@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [PATCH 2/4] util/jffs2reader file size fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a trivial patch for util/jffs2reader
to correct file sizes shown in the listings.

Please review and apply if it is ok.
Thanks.


[PATCH 2/4] util/jffs2reader print file size fix

jffs2reader outputs wrong size for a file larger than a block size.
It outputs dsize of the newest raw inode as the file size.
This patch corrects it to use isize instead.

This patch depends on:
[PATCH 1/4] util/jffs2reader compile fix

Signed-off-by: Suzuki Takashi <suzuki.takashi@gmail.com>


--- jffs2reader.c.compile=092005-10-10 12:51:37.000000000 +0900
+++ jffs2reader.c=092005-10-10 17:55:17.000000000 +0900
@@ -369,7 +369,7 @@ void printdir(char *o, size_t size, stru
 =09=09=09putblock((char*)&rdev, sizeof(rdev), &devsize, ri);
 =09=09=09printf("%4d, %3d ", (int)MAJOR(rdev), (int)MINOR(rdev));
 =09=09} else {
-=09=09=09printf("%9ld ", (long)je32_to_cpu (ri->dsize));
+=09=09=09printf("%9ld ", (long)je32_to_cpu (ri->isize));
 =09=09}
 =09=09d->name[d->nsize]=3D'\0';
 =09=09if (age < 3600L * 24 * 365 / 2 && age > -15 * 60) {

--
Suzuki Takashi
