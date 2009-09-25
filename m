MIME-Version: 1.0
Date: Fri, 25 Sep 2009 08:02:59 -0400
Message-ID: <771cded00909250502md543cb3wa2ef34c9946e7db5@mail.gmail.com>
Subject: [PATCH 5/5] support pxa3xx onenand in saar and ttc dkb
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>, kyungmin.park@samsung.com,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary=001517741a14b6225c047465bad5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--001517741a14b6225c047465bad5
Content-Type: multipart/alternative; boundary=001517741a14b62254047465bad3

--001517741a14b62254047465bad3
Content-Type: text/plain; charset=ISO-8859-1

>From fb826341bffa364cb04802674dda45768e3f86b1 Mon Sep 17 00:00:00 2001
From: Haojian Zhuang <haojian.zhuang@marvell.com>
Date: Fri, 25 Sep 2009 15:43:13 -0400
Subject: [PATCH] pxa: support pxa3xx onenand in saar and ttc dkb

Marvell PXA3xx bad block management is supported in pxa3xx onenand
device driver. Enable it in saar and ttc dkb platform.

Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
---
 arch/arm/mach-mmp/ttc_dkb.c |    2 +-
 arch/arm/mach-pxa/saar.c    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-mmp/ttc_dkb.c b/arch/arm/mach-mmp/ttc_dkb.c
index 57d0535..dbd8cfd 100644
--- a/arch/arm/mach-mmp/ttc_dkb.c
+++ b/arch/arm/mach-mmp/ttc_dkb.c
@@ -100,7 +100,7 @@ static struct resource ttc_dkb_resource_onenand[] = {
 };

 static struct platform_device ttc_dkb_device_onenand = {
-    .name        = "onenand",
+    .name        = "pxa3xx-onenand",
     .id        = -1,
     .dev        = {
         .platform_data    = &ttc_dkb_onenand_info,
diff --git a/arch/arm/mach-pxa/saar.c b/arch/arm/mach-pxa/saar.c
index 8b7ea09..6892867 100644
--- a/arch/arm/mach-pxa/saar.c
+++ b/arch/arm/mach-pxa/saar.c
@@ -556,7 +556,7 @@ static struct resource saar_resource_onenand[] = {
 };

 static struct platform_device saar_device_onenand = {
-    .name        = "onenand",
+    .name        = "pxa3xx-onenand",
     .id        = -1,
     .dev        = {
         .platform_data    = &saar_onenand_info,
-- 
1.5.6.5

--001517741a14b62254047465bad3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

>From fb826341bffa364cb04802674dda45768e3f86b1 Mon Sep 17 00:00:00 2001<br>F=
rom: Haojian Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marvell.com">haoji=
an.zhuang@marvell.com</a>&gt;<br>Date: Fri, 25 Sep 2009 15:43:13 -0400<br>
Subject: [PATCH] pxa: support pxa3xx onenand in saar and ttc dkb<br><br>Mar=
vell PXA3xx bad block management is supported in pxa3xx onenand<br>device d=
river. Enable it in saar and ttc dkb platform.<br><br>Signed-off-by: Haojia=
n Zhuang &lt;<a href=3D"mailto:haojian.zhuang@marvell.com">haojian.zhuang@m=
arvell.com</a>&gt;<br>
---<br>=A0arch/arm/mach-mmp/ttc_dkb.c |=A0=A0=A0 2 +-<br>=A0arch/arm/mach-p=
xa/saar.c=A0=A0=A0 |=A0=A0=A0 2 +-<br>=A02 files changed, 2 insertions(+), =
2 deletions(-)<br><br>diff --git a/arch/arm/mach-mmp/ttc_dkb.c b/arch/arm/m=
ach-mmp/ttc_dkb.c<br>
index 57d0535..dbd8cfd 100644<br>--- a/arch/arm/mach-mmp/ttc_dkb.c<br>+++ b=
/arch/arm/mach-mmp/ttc_dkb.c<br>@@ -100,7 +100,7 @@ static struct resource =
ttc_dkb_resource_onenand[] =3D {<br>=A0};<br>=A0<br>=A0static struct platfo=
rm_device ttc_dkb_device_onenand =3D {<br>
-=A0=A0=A0 .name=A0=A0=A0 =A0=A0=A0 =3D &quot;onenand&quot;,<br>+=A0=A0=A0 =
.name=A0=A0=A0 =A0=A0=A0 =3D &quot;pxa3xx-onenand&quot;,<br>=A0=A0=A0=A0 .i=
d=A0=A0=A0 =A0=A0=A0 =3D -1,<br>=A0=A0=A0=A0 .dev=A0=A0=A0 =A0=A0=A0 =3D {<=
br>=A0=A0=A0=A0 =A0=A0=A0 .platform_data=A0=A0=A0 =3D &amp;ttc_dkb_onenand_=
info,<br>diff --git a/arch/arm/mach-pxa/saar.c b/arch/arm/mach-pxa/saar.c<b=
r>
index 8b7ea09..6892867 100644<br>--- a/arch/arm/mach-pxa/saar.c<br>+++ b/ar=
ch/arm/mach-pxa/saar.c<br>@@ -556,7 +556,7 @@ static struct resource saar_r=
esource_onenand[] =3D {<br>=A0};<br>=A0<br>=A0static struct platform_device=
 saar_device_onenand =3D {<br>
-=A0=A0=A0 .name=A0=A0=A0 =A0=A0=A0 =3D &quot;onenand&quot;,<br>+=A0=A0=A0 =
.name=A0=A0=A0 =A0=A0=A0 =3D &quot;pxa3xx-onenand&quot;,<br>=A0=A0=A0=A0 .i=
d=A0=A0=A0 =A0=A0=A0 =3D -1,<br>=A0=A0=A0=A0 .dev=A0=A0=A0 =A0=A0=A0 =3D {<=
br>=A0=A0=A0=A0 =A0=A0=A0 .platform_data=A0=A0=A0 =3D &amp;saar_onenand_inf=
o,<br>-- <br>1.5.6.5<br><br>

--001517741a14b62254047465bad3--

--001517741a14b6225c047465bad5
Content-Type: text/x-patch; charset=US-ASCII;
	name="0005-pxa-support-pxa3xx-onenand-in-saar-and-ttc-dkb.patch"
Content-Disposition: attachment;
	filename="0005-pxa-support-pxa3xx-onenand-in-saar-and-ttc-dkb.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g01crvu20

RnJvbSBmYjgyNjM0MWJmZmEzNjRjYjA0ODAyNjc0ZGRhNDU3NjhlM2Y4NmIxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBIYW9qaWFuIFpodWFuZyA8aGFvamlhbi56aHVhbmdAbWFydmVs
bC5jb20+CkRhdGU6IEZyaSwgMjUgU2VwIDIwMDkgMTU6NDM6MTMgLTA0MDAKU3ViamVjdDogW1BB
VENIXSBweGE6IHN1cHBvcnQgcHhhM3h4IG9uZW5hbmQgaW4gc2FhciBhbmQgdHRjIGRrYgoKTWFy
dmVsbCBQWEEzeHggYmFkIGJsb2NrIG1hbmFnZW1lbnQgaXMgc3VwcG9ydGVkIGluIHB4YTN4eCBv
bmVuYW5kCmRldmljZSBkcml2ZXIuIEVuYWJsZSBpdCBpbiBzYWFyIGFuZCB0dGMgZGtiIHBsYXRm
b3JtLgoKU2lnbmVkLW9mZi1ieTogSGFvamlhbiBaaHVhbmcgPGhhb2ppYW4uemh1YW5nQG1hcnZl
bGwuY29tPgotLS0KIGFyY2gvYXJtL21hY2gtbW1wL3R0Y19ka2IuYyB8ICAgIDIgKy0KIGFyY2gv
YXJtL21hY2gtcHhhL3NhYXIuYyAgICB8ICAgIDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtbW1w
L3R0Y19ka2IuYyBiL2FyY2gvYXJtL21hY2gtbW1wL3R0Y19ka2IuYwppbmRleCA1N2QwNTM1Li5k
YmQ4Y2ZkIDEwMDY0NAotLS0gYS9hcmNoL2FybS9tYWNoLW1tcC90dGNfZGtiLmMKKysrIGIvYXJj
aC9hcm0vbWFjaC1tbXAvdHRjX2RrYi5jCkBAIC0xMDAsNyArMTAwLDcgQEAgc3RhdGljIHN0cnVj
dCByZXNvdXJjZSB0dGNfZGtiX3Jlc291cmNlX29uZW5hbmRbXSA9IHsKIH07CiAKIHN0YXRpYyBz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIHR0Y19ka2JfZGV2aWNlX29uZW5hbmQgPSB7Ci0JLm5hbWUJ
CT0gIm9uZW5hbmQiLAorCS5uYW1lCQk9ICJweGEzeHgtb25lbmFuZCIsCiAJLmlkCQk9IC0xLAog
CS5kZXYJCT0gewogCQkucGxhdGZvcm1fZGF0YQk9ICZ0dGNfZGtiX29uZW5hbmRfaW5mbywKZGlm
ZiAtLWdpdCBhL2FyY2gvYXJtL21hY2gtcHhhL3NhYXIuYyBiL2FyY2gvYXJtL21hY2gtcHhhL3Nh
YXIuYwppbmRleCA4YjdlYTA5Li42ODkyODY3IDEwMDY0NAotLS0gYS9hcmNoL2FybS9tYWNoLXB4
YS9zYWFyLmMKKysrIGIvYXJjaC9hcm0vbWFjaC1weGEvc2Fhci5jCkBAIC01NTYsNyArNTU2LDcg
QEAgc3RhdGljIHN0cnVjdCByZXNvdXJjZSBzYWFyX3Jlc291cmNlX29uZW5hbmRbXSA9IHsKIH07
CiAKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlIHNhYXJfZGV2aWNlX29uZW5hbmQgPSB7
Ci0JLm5hbWUJCT0gIm9uZW5hbmQiLAorCS5uYW1lCQk9ICJweGEzeHgtb25lbmFuZCIsCiAJLmlk
CQk9IC0xLAogCS5kZXYJCT0gewogCQkucGxhdGZvcm1fZGF0YQk9ICZzYWFyX29uZW5hbmRfaW5m
bywKLS0gCjEuNS42LjUKCg==
--001517741a14b6225c047465bad5--
