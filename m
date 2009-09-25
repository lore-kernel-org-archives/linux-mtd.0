MIME-Version: 1.0
Date: Fri, 25 Sep 2009 07:59:35 -0400
Message-ID: <771cded00909250459v4ca7b890n796f55c65f023775@mail.gmail.com>
Subject: [PATCH 2/5] onenand: export onenand_command
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>, kyungmin.park@samsung.com,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary=0016e645b8ca818e7c047465ae90
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0016e645b8ca818e7c047465ae90
Content-Type: multipart/alternative; boundary=0016e645b8ca818e73047465ae8e

--0016e645b8ca818e73047465ae8e
Content-Type: text/plain; charset=ISO-8859-1

>From f104c778c4f76ebe1b7d4b4575d7e9b0dffc6d69 Mon Sep 17 00:00:00 2001
From: Haojian Zhuang <haojian.zhuang@marvell.com>
Date: Fri, 25 Sep 2009 15:15:56 -0400
Subject: [PATCH] [MTD] [ONENAND] export onenand_command

Marvell PXA3xx bad block management will replaces the bad block with good
one.
The driver have to implement custom command function. Export
onenand_command()
in order to reuse the command function in onenand_base.c.

Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 drivers/mtd/onenand/onenand_base.c |    3 ++-
 include/linux/mtd/onenand.h        |    2 ++
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
index 6e82909..8f7c73a 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -317,7 +317,7 @@ EXPORT_SYMBOL(flexonenand_region);
  * Send command to OneNAND device. This function is used for middle/large
page
  * devices (1KB/2KB Bytes per page)
  */
-static int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr,
size_t len)
+int onenand_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t len)
 {
     struct onenand_chip *this = mtd->priv;
     int value, block, page;
@@ -433,6 +433,7 @@ static int onenand_command(struct mtd_info *mtd, int
cmd, loff_t addr, size_t le

     return 0;
 }
+EXPORT_SYMBOL(onenand_command);

 /**
  * onenand_read_ecc - return ecc status
diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index 8ed8733..c99737f 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -24,6 +24,8 @@
 extern int onenand_scan(struct mtd_info *mtd, int max_chips);
 /* Free resources held by the OneNAND device */
 extern void onenand_release(struct mtd_info *mtd);
+extern int onenand_command(struct mtd_info *mtd, int cmd,
+               loff_t addr, size_t len);

 /*
  * onenand_state_t - chip states
-- 
1.5.6.5

--0016e645b8ca818e73047465ae8e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>From f104c778c4f76ebe1b7d4b4575d7e9b0dffc6d69 Mon Sep 17 00:00:00 2001<br>F=
rom: Haojian Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marvell.com">haoji=
an.zhuang@marvell.com</a>&gt;<br>Date: Fri, 25 Sep 2009 15:15:56 -0400<br>
Subject: [PATCH] [MTD] [ONENAND] export onenand_command<br><br>Marvell PXA3=
xx bad block management will replaces the bad block with good one.<br>The d=
river have to implement custom command function. Export onenand_command()<b=
r>
in order to reuse the command function in onenand_base.c.<br><br>Signed-off=
-by: Haojian Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marvell.com">haoji=
an.zhuang@marvell.com</a>&gt;<br>---<br>=A0drivers/mtd/onenand/onenand_base=
.c |=A0=A0=A0 3 ++-<br>
=A0include/linux/mtd/onenand.h=A0=A0=A0=A0=A0=A0=A0 |=A0=A0=A0 2 ++<br>=A02=
 files changed, 4 insertions(+), 1 deletions(-)<br><br>diff --git a/drivers=
/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c<br>index 6=
e82909..8f7c73a 100644<br>
--- a/drivers/mtd/onenand/onenand_base.c<br>+++ b/drivers/mtd/onenand/onena=
nd_base.c<br>@@ -317,7 +317,7 @@ EXPORT_SYMBOL(flexonenand_region);<br>=A0 =
* Send command to OneNAND device. This function is used for middle/large pa=
ge<br>
=A0 * devices (1KB/2KB Bytes per page)<br>=A0 */<br>-static int onenand_com=
mand(struct mtd_info *mtd, int cmd, loff_t addr, size_t len)<br>+int onenan=
d_command(struct mtd_info *mtd, int cmd, loff_t addr, size_t len)<br>=A0{<b=
r>
=A0=A0=A0=A0 struct onenand_chip *this =3D mtd-&gt;priv;<br>=A0=A0=A0=A0 in=
t value, block, page;<br>@@ -433,6 +433,7 @@ static int onenand_command(str=
uct mtd_info *mtd, int cmd, loff_t addr, size_t le<br>=A0<br>=A0=A0=A0=A0 r=
eturn 0;<br>=A0}<br>+EXPORT_SYMBOL(onenand_command);<br>
=A0<br>=A0/**<br>=A0 * onenand_read_ecc - return ecc status<br>diff --git a=
/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h<br>index 8ed8733=
..c99737f 100644<br>--- a/include/linux/mtd/onenand.h<br>+++ b/include/linu=
x/mtd/onenand.h<br>
@@ -24,6 +24,8 @@<br>=A0extern int onenand_scan(struct mtd_info *mtd, int m=
ax_chips);<br>=A0/* Free resources held by the OneNAND device */<br>=A0exte=
rn void onenand_release(struct mtd_info *mtd);<br>+extern int onenand_comma=
nd(struct mtd_info *mtd, int cmd,<br>
+=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 =A0=A0 loff_t addr, size_t len);<br>=A0<br>=
=A0/*<br>=A0 * onenand_state_t - chip states<br>-- <br>1.5.6.5<br><br>

--0016e645b8ca818e73047465ae8e--

--0016e645b8ca818e7c047465ae90
Content-Type: text/x-patch; charset=US-ASCII;
	name="0002--MTD-ONENAND-export-onenand_command.patch"
Content-Disposition: attachment;
	filename="0002--MTD-ONENAND-export-onenand_command.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g01cnbl30

RnJvbSBmMTA0Yzc3OGM0Zjc2ZWJlMWI3ZDRiNDU3NWQ3ZTliMGRmZmM2ZDY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW9qaWFuIFpodWFuZyA8aGFvamlhbi56aHVhbmdAbWFydmVs
bC5jb20+CkRhdGU6IEZyaSwgMjUgU2VwIDIwMDkgMTU6MTU6NTYgLTA0MDAKU3ViamVjdDogW1BB
VENIXSBbTVREXSBbT05FTkFORF0gZXhwb3J0IG9uZW5hbmRfY29tbWFuZAoKTWFydmVsbCBQWEEz
eHggYmFkIGJsb2NrIG1hbmFnZW1lbnQgd2lsbCByZXBsYWNlcyB0aGUgYmFkIGJsb2NrIHdpdGgg
Z29vZCBvbmUuClRoZSBkcml2ZXIgaGF2ZSB0byBpbXBsZW1lbnQgY3VzdG9tIGNvbW1hbmQgZnVu
Y3Rpb24uIEV4cG9ydCBvbmVuYW5kX2NvbW1hbmQoKQppbiBvcmRlciB0byByZXVzZSB0aGUgY29t
bWFuZCBmdW5jdGlvbiBpbiBvbmVuYW5kX2Jhc2UuYy4KClNpZ25lZC1vZmYtYnk6IEhhb2ppYW4g
Wmh1YW5nIDxoYW9qaWFuLnpodWFuZ0BtYXJ2ZWxsLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9vbmVu
YW5kL29uZW5hbmRfYmFzZS5jIHwgICAgMyArKy0KIGluY2x1ZGUvbGludXgvbXRkL29uZW5hbmQu
aCAgICAgICAgfCAgICAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9vbmVuYW5kL29uZW5hbmRfYmFz
ZS5jIGIvZHJpdmVycy9tdGQvb25lbmFuZC9vbmVuYW5kX2Jhc2UuYwppbmRleCA2ZTgyOTA5Li44
ZjdjNzNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9vbmVuYW5kL29uZW5hbmRfYmFzZS5jCisr
KyBiL2RyaXZlcnMvbXRkL29uZW5hbmQvb25lbmFuZF9iYXNlLmMKQEAgLTMxNyw3ICszMTcsNyBA
QCBFWFBPUlRfU1lNQk9MKGZsZXhvbmVuYW5kX3JlZ2lvbik7CiAgKiBTZW5kIGNvbW1hbmQgdG8g
T25lTkFORCBkZXZpY2UuIFRoaXMgZnVuY3Rpb24gaXMgdXNlZCBmb3IgbWlkZGxlL2xhcmdlIHBh
Z2UKICAqIGRldmljZXMgKDFLQi8yS0IgQnl0ZXMgcGVyIHBhZ2UpCiAgKi8KLXN0YXRpYyBpbnQg
b25lbmFuZF9jb21tYW5kKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBpbnQgY21kLCBsb2ZmX3QgYWRk
ciwgc2l6ZV90IGxlbikKK2ludCBvbmVuYW5kX2NvbW1hbmQoc3RydWN0IG10ZF9pbmZvICptdGQs
IGludCBjbWQsIGxvZmZfdCBhZGRyLCBzaXplX3QgbGVuKQogewogCXN0cnVjdCBvbmVuYW5kX2No
aXAgKnRoaXMgPSBtdGQtPnByaXY7CiAJaW50IHZhbHVlLCBibG9jaywgcGFnZTsKQEAgLTQzMyw2
ICs0MzMsNyBAQCBzdGF0aWMgaW50IG9uZW5hbmRfY29tbWFuZChzdHJ1Y3QgbXRkX2luZm8gKm10
ZCwgaW50IGNtZCwgbG9mZl90IGFkZHIsIHNpemVfdCBsZQogCiAJcmV0dXJuIDA7CiB9CitFWFBP
UlRfU1lNQk9MKG9uZW5hbmRfY29tbWFuZCk7CiAKIC8qKgogICogb25lbmFuZF9yZWFkX2VjYyAt
IHJldHVybiBlY2Mgc3RhdHVzCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L210ZC9vbmVuYW5k
LmggYi9pbmNsdWRlL2xpbnV4L210ZC9vbmVuYW5kLmgKaW5kZXggOGVkODczMy4uYzk5NzM3ZiAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tdGQvb25lbmFuZC5oCisrKyBiL2luY2x1ZGUvbGlu
dXgvbXRkL29uZW5hbmQuaApAQCAtMjQsNiArMjQsOCBAQAogZXh0ZXJuIGludCBvbmVuYW5kX3Nj
YW4oc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBtYXhfY2hpcHMpOwogLyogRnJlZSByZXNvdXJj
ZXMgaGVsZCBieSB0aGUgT25lTkFORCBkZXZpY2UgKi8KIGV4dGVybiB2b2lkIG9uZW5hbmRfcmVs
ZWFzZShzdHJ1Y3QgbXRkX2luZm8gKm10ZCk7CitleHRlcm4gaW50IG9uZW5hbmRfY29tbWFuZChz
dHJ1Y3QgbXRkX2luZm8gKm10ZCwgaW50IGNtZCwKKwkJCSAgIGxvZmZfdCBhZGRyLCBzaXplX3Qg
bGVuKTsKIAogLyoKICAqIG9uZW5hbmRfc3RhdGVfdCAtIGNoaXAgc3RhdGVzCi0tIAoxLjUuNi41
Cgo=
--0016e645b8ca818e7c047465ae90--
