Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MVqLJ-0004N5-Rg
	for linux-mtd@lists.infradead.org; Tue, 28 Jul 2009 17:20:02 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01CA0FA7.A0A2638A"
Subject: RE: UBIFS Corrupt during power failure
Date: Tue, 28 Jul 2009 11:19:56 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB703C97962@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <4A6EE895.9050008@gmx.de>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>	<1239979018.3390.298.camel@localhost.localdomain>	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>	<200905150916.54091.sr@denx.de>	<1244016510.5847.38.camel@localhost.localdomain>	<C77C279BA71FD14985DC8E75FB265AB703659A64@usw-am-xch-02.am.trimblecorp.net>
	<1244369819.5847.321.camel@localhost.localdomain>
	<4A6EE895.9050008@gmx.de>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: "news" <rw_nospam@gmx.de>,
	<dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
	Jamie Lokier <jamie@shareable.org>, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------_=_NextPart_001_01CA0FA7.A0A2638A
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> We have similar problems with a SPANSION falsh (S29GL01GP).
> I think the reason of the problem is a feature of the chip.
>=20
> I reduced the problem to the MTD access (without ubi/ubifs).
> We noticed toggle flash-bit(s) after power off during a write cycle.
> The toggle flash-bit(s) may occure after power of during an=20
> sector-erase
> too.
>=20
> Simple testsequence:
> * flash_erase ...
> * cp testfile /dev/mtd0
> - automatic or manuel power off during the cp
> Check the flash after reboot (e.g md5sum /dev/mtd0 helps).
>=20
> We used the default settings from the CFI (MaxBufWriteSize=3D6=20
> =3D=3D 64 byte
> buffer).

I think writing to /dev/mtd0 will also perform an erase if needed, so
you are probably seeing the interrupted erase.

If you're doing this because you are having UBIFS errors, then you
should set the MaxBufWriteSize to 3 to limit the write size to 2^3=3D8
bytes since this is a known problem.

Here's the patch (it's also attached to this email) for the debug code
that I added to limit the write buffer size to 2**3=3D8 bytes and have
been using for all of the recent robustness testing.

I'm using the S29GL256 chip (256Mbit) which is in the same family as
your S29GL01G (1Gbit), so with this patch and the latest patches from
http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git should get you
to the same place that I'm at.  So far, with over 10,000 power cycles, I
haven't seen any problems.

-Eric

Index: drivers/mtd/chips/cfi_probe.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- drivers/mtd/chips/cfi_probe.c	(revision 4477)
+++ drivers/mtd/chips/cfi_probe.c	(working copy)
@@ -18,7 +18,7 @@
 #include <linux/mtd/cfi.h>
 #include <linux/mtd/gen_probe.h>
=20
-//#define DEBUG_CFI
+#define DEBUG_CFI
=20
 #ifdef DEBUG_CFI
 static void print_cfi_ident(struct cfi_ident *);
@@ -251,6 +251,18 @@
 	cfi->cfiq->InterfaceDesc =3D
le16_to_cpu(cfi->cfiq->InterfaceDesc);
 	cfi->cfiq->MaxBufWriteSize =3D
le16_to_cpu(cfi->cfiq->MaxBufWriteSize);
=20
+	//DEBUG - BEGIN - force max write size to 8 bytes (2^3)
+	if (cfi->cfiq->MaxBufWriteSize)
+	{
+		printk("Warning:  Overriding MaxBufWriteSize from 2^%d
to 2^%d\n",
+				cfi->cfiq->MaxBufWriteSize,
+				3
+				);
+		cfi->cfiq->MaxBufWriteSize =3D 3;
+	}
+	//DEBUG - END
+
+
 #ifdef DEBUG_CFI
 	/* Dump the information therein */
 	print_cfi_ident(cfi->cfiq);

------_=_NextPart_001_01CA0FA7.A0A2638A
Content-Type: application/octet-stream;
	name="2.6.27-cfi-limit-max-write-buffer-to-8-bytes.patch"
Content-Transfer-Encoding: base64
Content-Description: 2.6.27-cfi-limit-max-write-buffer-to-8-bytes.patch
Content-Disposition: attachment;
	filename="2.6.27-cfi-limit-max-write-buffer-to-8-bytes.patch"

SW5kZXg6IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV9wcm9iZS5jCj09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGRyaXZl
cnMvbXRkL2NoaXBzL2NmaV9wcm9iZS5jCShyZXZpc2lvbiA0NDc3KQorKysgZHJpdmVycy9tdGQv
Y2hpcHMvY2ZpX3Byb2JlLmMJKHJldmlzaW9uIDYxODUpCkBAIC0xOCw3ICsxOCw3IEBACiAjaW5j
bHVkZSA8bGludXgvbXRkL2NmaS5oPgogI2luY2x1ZGUgPGxpbnV4L210ZC9nZW5fcHJvYmUuaD4K
IAotLy8jZGVmaW5lIERFQlVHX0NGSQorI2RlZmluZSBERUJVR19DRkkKIAogI2lmZGVmIERFQlVH
X0NGSQogc3RhdGljIHZvaWQgcHJpbnRfY2ZpX2lkZW50KHN0cnVjdCBjZmlfaWRlbnQgKik7CkBA
IC0yNTEsNiArMjUxLDE4IEBACiAJY2ZpLT5jZmlxLT5JbnRlcmZhY2VEZXNjID0gbGUxNl90b19j
cHUoY2ZpLT5jZmlxLT5JbnRlcmZhY2VEZXNjKTsKIAljZmktPmNmaXEtPk1heEJ1ZldyaXRlU2l6
ZSA9IGxlMTZfdG9fY3B1KGNmaS0+Y2ZpcS0+TWF4QnVmV3JpdGVTaXplKTsKIAorCS8vREVCVUcg
LSBCRUdJTiAtIGZvcmNlIG1heCB3cml0ZSBzaXplIHRvIDggYnl0ZXMgKDJeMykKKwlpZiAoY2Zp
LT5jZmlxLT5NYXhCdWZXcml0ZVNpemUpCisJeworCQlwcmludGsoIldhcm5pbmc6ICBPdmVycmlk
aW5nIE1heEJ1ZldyaXRlU2l6ZSBmcm9tIDJeJWQgdG8gMl4lZFxuIiwKKwkJCQljZmktPmNmaXEt
Pk1heEJ1ZldyaXRlU2l6ZSwKKwkJCQkzCisJCQkJKTsKKwkJY2ZpLT5jZmlxLT5NYXhCdWZXcml0
ZVNpemUgPSAzOworCX0KKwkvL0RFQlVHIC0gRU5ECisKKwogI2lmZGVmIERFQlVHX0NGSQogCS8q
IER1bXAgdGhlIGluZm9ybWF0aW9uIHRoZXJlaW4gKi8KIAlwcmludF9jZmlfaWRlbnQoY2ZpLT5j
ZmlxKTsK

------_=_NextPart_001_01CA0FA7.A0A2638A--
