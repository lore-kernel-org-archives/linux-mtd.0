MIME-Version: 1.0
Date: Fri, 25 Sep 2009 08:00:41 -0400
Message-ID: <771cded00909250500w34667fe3sa86acd82a00d736@mail.gmail.com>
Subject: [PATCH 3/5] onenand: support custom bad block management
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>, kyungmin.park@samsung.com,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary=0015175ce06877dbe4047465b2ba
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0015175ce06877dbe4047465b2ba
Content-Type: multipart/alternative; boundary=0015175ce06877dbdd047465b2b8

--0015175ce06877dbdd047465b2b8
Content-Type: text/plain; charset=ISO-8859-1

>From 8e32f4942dc839fe76ac33bc70aa7401de496c55 Mon Sep 17 00:00:00 2001
From: Haojian Zhuang <haojian.zhuang@marvell.com>
Date: Fri, 25 Sep 2009 15:21:50 -0400
Subject: [PATCH] [MTD] [ONENAND] supports custom bbm

In onenand driver, the default bad block management is embedded. Custom BBM
can't be used. Now make it to support custom BBM.

Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 drivers/mtd/onenand/onenand_base.c |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
index 8f7c73a..cc6bccb 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -2136,6 +2136,29 @@ static int onenand_block_isbad_nolock(struct mtd_info
*mtd, loff_t ofs, int allo
 {
     struct onenand_chip *this = mtd->priv;
     struct bbm_info *bbm = this->bbm;
+    struct mtd_oob_ops ops;
+    unsigned char *buf = this->page_buf;
+    int ret;
+
+    if (!bbm) {
+        ops.mode = MTD_OOB_PLACE;
+        ops.ooblen = 2;
+        ops.oobbuf = buf;
+        ops.len = 0;
+        ops.ooboffs = 0;
+        ops.retlen = 0;
+        ops.oobretlen = 0;
+
+        ofs = (ofs >> this->erase_shift) << this->erase_shift;
+        ret = onenand_read_oob_nolock(mtd, ofs, &ops);
+        if (ret == ONENAND_BBT_READ_FATAL_ERROR)
+            return -EIO;
+
+        if ((buf[ONENAND_BADBLOCK_POS] & 0x01) == 0) {
+            return -EIO;
+        }
+        return 0;
+    }

     /* Return info from the table */
     return bbm->isbad_bbt(mtd, ofs, allowbbt);
-- 
1.5.6.5

--0015175ce06877dbdd047465b2b8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>From 8e32f4942dc839fe76ac33bc70aa7401de496c55 Mon Sep 17 00:00:00 2001<br>F=
rom: Haojian Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marvell.com">haoji=
an.zhuang@marvell.com</a>&gt;<br>Date: Fri, 25 Sep 2009 15:21:50 -0400<br>
Subject: [PATCH] [MTD] [ONENAND] supports custom bbm<br><br>In onenand driv=
er, the default bad block management is embedded. Custom BBM<br>can&#39;t b=
e used. Now make it to support custom BBM.<br><br>Signed-off-by: Haojian Zh=
uang &lt;<a href=3D"mailto:haojian.zhuang@marvell.com">haojian.zhuang@marve=
ll.com</a>&gt;<br>
---<br>=A0drivers/mtd/onenand/onenand_base.c |=A0=A0 23 +++++++++++++++++++=
++++<br>=A01 files changed, 23 insertions(+), 0 deletions(-)<br><br>diff --=
git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base=
.c<br>
index 8f7c73a..cc6bccb 100644<br>--- a/drivers/mtd/onenand/onenand_base.c<b=
r>+++ b/drivers/mtd/onenand/onenand_base.c<br>@@ -2136,6 +2136,29 @@ static=
 int onenand_block_isbad_nolock(struct mtd_info *mtd, loff_t ofs, int allo<=
br>
=A0{<br>=A0=A0=A0=A0 struct onenand_chip *this =3D mtd-&gt;priv;<br>=A0=A0=
=A0=A0 struct bbm_info *bbm =3D this-&gt;bbm;<br>+=A0=A0=A0 struct mtd_oob_=
ops ops;<br>+=A0=A0=A0 unsigned char *buf =3D this-&gt;page_buf;<br>+=A0=A0=
=A0 int ret;<br>+<br>+=A0=A0=A0 if (!bbm) {<br>
+=A0=A0=A0 =A0=A0=A0 ops.mode =3D MTD_OOB_PLACE;<br>+=A0=A0=A0 =A0=A0=A0 op=
s.ooblen =3D 2;<br>+=A0=A0=A0 =A0=A0=A0 ops.oobbuf =3D buf;<br>+=A0=A0=A0 =
=A0=A0=A0 ops.len =3D 0;<br>+=A0=A0=A0 =A0=A0=A0 ops.ooboffs =3D 0;<br>+=A0=
=A0=A0 =A0=A0=A0 ops.retlen =3D 0;<br>+=A0=A0=A0 =A0=A0=A0 ops.oobretlen =
=3D 0;<br>+<br>+=A0=A0=A0 =A0=A0=A0 ofs =3D (ofs &gt;&gt; this-&gt;erase_sh=
ift) &lt;&lt; this-&gt;erase_shift;<br>
+=A0=A0=A0 =A0=A0=A0 ret =3D onenand_read_oob_nolock(mtd, ofs, &amp;ops);<b=
r>+=A0=A0=A0 =A0=A0=A0 if (ret =3D=3D ONENAND_BBT_READ_FATAL_ERROR)<br>+=A0=
=A0=A0 =A0=A0=A0 =A0=A0=A0 return -EIO;<br>+<br>+=A0=A0=A0 =A0=A0=A0 if ((b=
uf[ONENAND_BADBLOCK_POS] &amp; 0x01) =3D=3D 0) {<br>+=A0=A0=A0 =A0=A0=A0 =
=A0=A0=A0 return -EIO;<br>
+=A0=A0=A0 =A0=A0=A0 }<br>+=A0=A0=A0 =A0=A0=A0 return 0;<br>+=A0=A0=A0 }<br=
>=A0<br>=A0=A0=A0=A0 /* Return info from the table */<br>=A0=A0=A0=A0 retur=
n bbm-&gt;isbad_bbt(mtd, ofs, allowbbt);<br>-- <br>1.5.6.5<br><br>

--0015175ce06877dbdd047465b2b8--

--0015175ce06877dbe4047465b2ba
Content-Type: text/x-patch; charset=US-ASCII;
	name="0003--MTD-ONENAND-supports-custom-bbm.patch"
Content-Disposition: attachment;
	filename="0003--MTD-ONENAND-supports-custom-bbm.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g01coo1l0

RnJvbSA4ZTMyZjQ5NDJkYzgzOWZlNzZhYzMzYmM3MGFhNzQwMWRlNDk2YzU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW9qaWFuIFpodWFuZyA8aGFvamlhbi56aHVhbmdAbWFydmVs
bC5jb20+CkRhdGU6IEZyaSwgMjUgU2VwIDIwMDkgMTU6MjE6NTAgLTA0MDAKU3ViamVjdDogW1BB
VENIXSBbTVREXSBbT05FTkFORF0gc3VwcG9ydHMgY3VzdG9tIGJibQoKSW4gb25lbmFuZCBkcml2
ZXIsIHRoZSBkZWZhdWx0IGJhZCBibG9jayBtYW5hZ2VtZW50IGlzIGVtYmVkZGVkLiBDdXN0b20g
QkJNCmNhbid0IGJlIHVzZWQuIE5vdyBtYWtlIGl0IHRvIHN1cHBvcnQgY3VzdG9tIEJCTS4KClNp
Z25lZC1vZmYtYnk6IEhhb2ppYW4gWmh1YW5nIDxoYW9qaWFuLnpodWFuZ0BtYXJ2ZWxsLmNvbT4K
LS0tCiBkcml2ZXJzL210ZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jIHwgICAyMyArKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAwIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL29uZW5hbmQvb25lbmFuZF9iYXNlLmMg
Yi9kcml2ZXJzL210ZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jCmluZGV4IDhmN2M3M2EuLmNjNmJj
Y2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL29uZW5hbmQvb25lbmFuZF9iYXNlLmMKKysrIGIv
ZHJpdmVycy9tdGQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwpAQCAtMjEzNiw2ICsyMTM2LDI5IEBA
IHN0YXRpYyBpbnQgb25lbmFuZF9ibG9ja19pc2JhZF9ub2xvY2soc3RydWN0IG10ZF9pbmZvICpt
dGQsIGxvZmZfdCBvZnMsIGludCBhbGxvCiB7CiAJc3RydWN0IG9uZW5hbmRfY2hpcCAqdGhpcyA9
IG10ZC0+cHJpdjsKIAlzdHJ1Y3QgYmJtX2luZm8gKmJibSA9IHRoaXMtPmJibTsKKwlzdHJ1Y3Qg
bXRkX29vYl9vcHMgb3BzOworCXVuc2lnbmVkIGNoYXIgKmJ1ZiA9IHRoaXMtPnBhZ2VfYnVmOwor
CWludCByZXQ7CisKKwlpZiAoIWJibSkgeworCQlvcHMubW9kZSA9IE1URF9PT0JfUExBQ0U7CisJ
CW9wcy5vb2JsZW4gPSAyOworCQlvcHMub29iYnVmID0gYnVmOworCQlvcHMubGVuID0gMDsKKwkJ
b3BzLm9vYm9mZnMgPSAwOworCQlvcHMucmV0bGVuID0gMDsKKwkJb3BzLm9vYnJldGxlbiA9IDA7
CisKKwkJb2ZzID0gKG9mcyA+PiB0aGlzLT5lcmFzZV9zaGlmdCkgPDwgdGhpcy0+ZXJhc2Vfc2hp
ZnQ7CisJCXJldCA9IG9uZW5hbmRfcmVhZF9vb2Jfbm9sb2NrKG10ZCwgb2ZzLCAmb3BzKTsKKwkJ
aWYgKHJldCA9PSBPTkVOQU5EX0JCVF9SRUFEX0ZBVEFMX0VSUk9SKQorCQkJcmV0dXJuIC1FSU87
CisKKwkJaWYgKChidWZbT05FTkFORF9CQURCTE9DS19QT1NdICYgMHgwMSkgPT0gMCkgeworCQkJ
cmV0dXJuIC1FSU87CisJCX0KKwkJcmV0dXJuIDA7CisJfQogCiAJLyogUmV0dXJuIGluZm8gZnJv
bSB0aGUgdGFibGUgKi8KIAlyZXR1cm4gYmJtLT5pc2JhZF9iYnQobXRkLCBvZnMsIGFsbG93YmJ0
KTsKLS0gCjEuNS42LjUKCg==
--0015175ce06877dbe4047465b2ba--
