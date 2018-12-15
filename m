Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gY6xT-0002p0-2s
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 10:14:08 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, dwmw2@infradead.org,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Andreas Gruenbacher <agruenba@redhat.com>
Subject: [PATCH] jffs2: Fix retry handling jffs2_listxattr
Date: Sat, 15 Dec 2018 11:13:29 +0100
Message-Id: <20181215101329.16246-1-richard@nod.at>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When jffs2 has to retry reading xattrs we need to reset
the buffer pointer. Otherwise we return old xattrs from the
previous iteration which leads to a inconsistency between
the number of bytes we return and the real list size.

Cc: <stable@vger.kernel.org>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Fixes: 764a5c6b1fa4 ("xattr handlers: Simplify list operation")
Signed-off-by: Richard Weinberger <richard@nod.at>
---
Andreas,

since you maintain the attr package too, I report it right here. :-)
This jffs2 bug lead to a crash in attr_list().

for() will loop to crash when there is no trailing \0 in the
list of xattrs.

for (l =3D lbuf; l !=3D lbuf + length; l =3D strchr(l, '\0') + 1) {
	if (api_unconvert(name, l, flags))
		continue;

...
}

I suggest changing the loop condition to something like l < lbuf + length=
.

Thanks,
//richard
---
 fs/jffs2/xattr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/jffs2/xattr.c b/fs/jffs2/xattr.c
index da3e18503c65..0cb322eb9516 100644
--- a/fs/jffs2/xattr.c
+++ b/fs/jffs2/xattr.c
@@ -967,6 +967,7 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *=
buffer, size_t size)
 	struct jffs2_xattr_ref *ref, **pref;
 	struct jffs2_xattr_datum *xd;
 	const struct xattr_handler *xhandle;
+	char *orig_buffer =3D buffer;
 	const char *prefix;
 	ssize_t prefix_len, len, rc;
 	int retry =3D 0;
@@ -977,6 +978,7 @@ ssize_t jffs2_listxattr(struct dentry *dentry, char *=
buffer, size_t size)
=20
 	down_read(&c->xattr_sem);
  retry:
+	buffer =3D orig_buffer;
 	len =3D 0;
 	for (ref=3Dic->xref, pref=3D&ic->xref; ref; pref=3D&ref->next, ref=3Dre=
f->next) {
 		BUG_ON(ref->ic !=3D ic);
--=20
2.20.0
