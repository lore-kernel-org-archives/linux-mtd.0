Received: from smtp3.infineon.com ([203.126.106.229])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J2lek-0000qC-Na
	for linux-mtd@lists.infradead.org; Thu, 13 Dec 2007 10:51:13 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: mtd-utils-1.1.0: build error
Date: Thu, 13 Dec 2007 18:51:01 +0800
Message-ID: <31E09F73562D7A4D82119D7F6C17298603002AFD@sinse303.ap.infineon.com>
From: <KokHow.Teh@infineon.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi;
	I have downloaded mtd-utils-1.1.0 and unfortunately bump into
build error as follows:

mips-linux-cc -I./include -g -O3 -G0 -pipe -fpic -fPIC -msoft-float
-mabi=3D32 -march=3Dmips32r2 -mtune=3D34kc -g -c -o mkfs.jffs2.o =
mkfs.jffs2.c
-g -Wp,-MD,./.mkfs.jffs2.c.dep
mkfs.jffs2.c:69:21: sys/acl.h: No such file or directory
mkfs.jffs2.c: In function `formalize_posix_acl':
mkfs.jffs2.c:1084: error: `ACL_USER_OBJ' undeclared (first use in this
function)
mkfs.jffs2.c:1084: error: (Each undeclared identifier is reported only
once
mkfs.jffs2.c:1084: error: for each function it appears in.)
mkfs.jffs2.c:1085: error: `ACL_GROUP_OBJ' undeclared (first use in this
function)
mkfs.jffs2.c:1086: error: `ACL_MASK' undeclared (first use in this
function)
mkfs.jffs2.c:1087: error: `ACL_OTHER' undeclared (first use in this
function)
mkfs.jffs2.c:1093: error: `ACL_USER' undeclared (first use in this
function)
mkfs.jffs2.c:1094: error: `ACL_GROUP' undeclared (first use in this
function)
mkdir -p .
mips-linux-cc -I./include -g -O3 -G0 -pipe -fpic -fPIC -msoft-float
-mabi=3D32 -march=3Dmips32r2 -mtune=3D34kc -g -c -o compr_zlib.o =
compr_zlib.c
-g -Wp,-MD,./.compr_zlib.c.dep
make: *** [mkfs.jffs2.o] Error 1
make: *** Waiting for unfinished jobs....
[tehkok@linux2:/usr/src/mtd-utils-1.1.0 8]$

	Any advice is appreciated. Thanks.

Regards,
KH
