Received: from rproxy.gmail.com ([64.233.170.197] helo=mproxy.gmail.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BsRdq-0000qi-Ce
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2004 15:41:41 -0400
Received: by mproxy.gmail.com with SMTP id 76so231523rnk
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Aug 2004 12:41:32 -0700 (PDT)
Message-ID: <e2041ca104080412415a9ce4e8@mail.gmail.com>
Date: Wed, 4 Aug 2004 22:41:32 +0300
From: Ari Rahikkala <ari.rahikkala@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_137_26530822.1091648492592"
Subject: [PATCH] Trivial fix to phram.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_137_26530822.1091648492592
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I'm not sure if gmail likes to mangle stuff a lot, so I'll include
this patch both inline and as an attachment.

--- linux-2.6.7/drivers/mtd/devices/phram.c     2004-08-04
22:29:04.850552576 +0300
+++ linux-2.6.7/drivers/mtd/devices/phram.c.argument_fix       
2004-08-04 22:25:04.557082736 +0300
@@ -231,14 +231,15 @@
 
 static int phram_setup(const char *val, struct kernel_param *kp)
 {
-       char buf[64+12+12], *str = buf;
+       const int buflen = 88;
+       char buf[buflen], *str = buf;
        char *token[3];
        char *name;
        uint32_t start;
        uint32_t len;
        int i, ret;
 
-       if (strnlen(val, sizeof(str)) >= sizeof(str))
+       if (strnlen(val, buflen) >= buflen)
                parse_err("parameter too long\n");
 
        strcpy(str, val);

------=_Part_137_26530822.1091648492592
Content-Type: text/x-patch; name="argumentfix.diff"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="argumentfix.diff"

--- linux-2.6.7/drivers/mtd/devices/phram.c=092004-08-04 22:29:04.850552576=
 +0300
+++ linux-2.6.7/drivers/mtd/devices/phram.c.argument_fix=092004-08-04 22:25=
:04.557082736 +0300
@@ -231,14 +231,15 @@
=20
 static int phram_setup(const char *val, struct kernel_param *kp)
 {
-=09char buf[64+12+12], *str =3D buf;
+=09const int buflen =3D 88;
+=09char buf[buflen], *str =3D buf;
 =09char *token[3];
 =09char *name;
 =09uint32_t start;
 =09uint32_t len;
 =09int i, ret;
=20
-=09if (strnlen(val, sizeof(str)) >=3D sizeof(str))
+=09if (strnlen(val, buflen) >=3D buflen)
 =09=09parse_err("parameter too long\n");
=20
 =09strcpy(str, val);

------=_Part_137_26530822.1091648492592--
