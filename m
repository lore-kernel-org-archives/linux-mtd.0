Received: from zproxy.gmail.com ([64.233.162.197])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EQcUV-0003gi-Bv
	for linux-mtd@lists.infradead.org; Sat, 15 Oct 2005 04:13:49 +0100
Received: by zproxy.gmail.com with SMTP id 14so808842nzn
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2005 20:13:46 -0700 (PDT)
Message-ID: <b1c6420f0510142013u634116eag4f360a6a2e7f8432@mail.gmail.com>
Date: Sat, 15 Oct 2005 12:13:46 +0900
From: Suzuki Takashi <suzuki.takashi@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [PATCH 4/4] util/jffs2reader better output formats
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is the 4th patch for util/jffs2reader.c.
It is not a bug fix and makes some improvements.

Please review and apply if it is ok.
Thanks.


[PATCH 4/4] util/jffs2reader better output formats

Some of the listings of the jffs2reader are unaligned and
prefixed by extra slashes.
This patch adjusts some alignments and removes extra slashes.

It also enables -r (recursive) option even if -d is not specified.
With this change, the default behavior comes to list files
NOT recursively like the command `ls'.

This patch depends on:
[PATCH 1/4] util/jffs2reader compile fix
[PATCH 2/4] util/jffs2reader file size fix
[PATCH 3/4] util/jffs2reader catfile fix

Signed-off-by: Suzuki Takashi <suzuki.takashi@gmail.com>

--- jffs2reader.c.catfile=092005-10-10 18:22:02.000000000 +0900
+++ jffs2reader.c=092005-10-10 19:31:21.000000000 +0900
@@ -320,6 +320,7 @@ void printdir(char *o, size_t size, stru
 =09char *filetime;
 =09time_t age;
 =09struct jffs2_raw_inode *ri;
+=09struct dir *od =3D d;

 =09if (!path)
 =09=09return;
@@ -369,7 +370,7 @@ void printdir(char *o, size_t size, stru
 =09=09age =3D je32_to_cpu (ri->ctime);
 =09=09filetime =3D ctime(&age);
 =09=09age =3D time(NULL) - je32_to_cpu (ri->ctime);
-=09=09printf("%s %-4d %-8d %-8d ", mode_string(jemode_to_cpu (ri->mode)),
+=09=09printf("%s %-4d %-5d %-5d ", mode_string(jemode_to_cpu (ri->mode)),
 =09=09=09   1, je16_to_cpu (ri->uid), je16_to_cpu (ri->gid));
 =09=09if ( d->type=3D=3DDT_BLK || d->type=3D=3DDT_CHR ) {
 =09=09=09dev_t rdev;
@@ -382,9 +383,14 @@ void printdir(char *o, size_t size, stru
 =09=09d->name[d->nsize]=3D'\0';
 =09=09if (age < 3600L * 24 * 365 / 2 && age > -15 * 60) {
 =09=09=09/* hh:mm if less than 6 months old */
-=09=09=09printf("%6.6s %5.5s %s/%s%c", filetime + 4, filetime + 11, path,
d->name, m);
+=09=09=09printf("%6.6s %5.5s ", filetime + 4, filetime + 11);
 =09=09} else {
-=09=09=09printf("%6.6s %4.4s %s/%s%c", filetime + 4, filetime + 20, path,
d->name, m);
+=09=09=09printf("%6.6s  %4.4s ", filetime + 4, filetime + 20);
+=09=09}
+=09=09if (*path =3D=3D '\0') {
+=09=09=09printf ("%s%c", d->name, m);
+=09=09} else {
+=09=09=09printf ("%s/%s%c", path, d->name, m);
 =09=09}
 =09=09if (d->type =3D=3D DT_LNK) {
 =09=09=09char symbuf[1024];
@@ -395,19 +401,32 @@ void printdir(char *o, size_t size, stru
 =09=09}
 =09=09printf("\n");

-=09=09if (d->type =3D=3D DT_DIR && recurse) {
-=09=09=09char *tmp;
-=09=09=09tmp =3D malloc(BUFSIZ);
-=09=09=09if (!tmp) {
-=09=09=09=09fprintf(stderr, "memory exhausted\n");
-=09=09=09=09exit(EXIT_FAILURE);
+=09=09d =3D d->next;
+=09}
+
+=09if (recurse) {
+=09=09d =3D od;
+=09=09while (d !=3D NULL) {
+=09=09=09if (d->type =3D=3D DT_DIR) {
+=09=09=09=09char *tmp;
+=09=09=09=09tmp =3D malloc(BUFSIZ);
+=09=09=09=09if (!tmp) {
+=09=09=09=09=09fprintf(stderr, "memory exhausted\n");
+=09=09=09=09=09exit(EXIT_FAILURE);
+=09=09=09=09}
+=09=09=09=09printf ("\n");
+=09=09=09=09if (*path =3D=3D '\0') {
+=09=09=09=09=09strcpy (tmp, d->name);
+=09=09=09=09} else {
+=09=09=09=09=09sprintf(tmp, "%s/%s", path, d->name);
+=09=09=09=09}
+=09=09=09=09printf("%s/\n", tmp);
+=09=09=09=09lsdir(o, size, tmp, recurse);=09=09/* Go recursive */
+=09=09=09=09free(tmp);
 =09=09=09}
-=09=09=09sprintf(tmp, "%s/%s", path, d->name);
-=09=09=09lsdir(o, size, tmp, recurse);=09=09/* Go recursive */
-=09=09=09free(tmp);
-=09=09}

-=09=09d =3D d->next;
+=09=09=09d =3D d->next;
+=09=09}
 =09}
 }

@@ -1032,7 +1051,7 @@ int main(int argc, char **argv)
 =09}

 =09if (!dir && !file)
-=09=09lsdir(buf, st.st_size, "/", 1);
+=09=09lsdir(buf, st.st_size, "", recurse);


 =09free(buf);

--
Suzuki Takashi
