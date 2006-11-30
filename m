Received: from de01egw01.freescale.net ([192.88.165.102])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1GpoE7-00031l-Ft
	for linux-mtd@lists.infradead.org; Thu, 30 Nov 2006 10:53:33 -0500
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by de01egw01.freescale.net (8.12.11/de01egw01) with ESMTP id
	kAUHFPTn014621 for <linux-mtd@lists.infradead.org>;
	Thu, 30 Nov 2006 10:15:25 -0700 (MST)
Received: from zin33exm21.fsl.freescale.net (zin33exm21.ap.freescale.net
	[10.232.192.8])
	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id kAUFrLJR005494
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Nov 2006 09:53:22 -0600 (CST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C71497.A8C1391A"
Subject: RE: NOR read/write beyond end of flash partition
Date: Thu, 30 Nov 2006 21:23:19 +0530
Message-ID: <A4F93E6F2F2D4E4D8F6AF6C7562DDBD89155AB@zin33exm21.fsl.freescale.net>
In-Reply-To: <1164893238.576.68.camel@sauron>
From: "Tigadi Kiran-r10350c" <R10350C@freescale.com>
To: <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C71497.A8C1391A
Content-Type: text/plain;
	charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Hi Artem,

Please find attached patch for drivers/mtd/mtdchar.c file to fix NOR =
read beyond flash. Let me know whether it is valid fix.

Regards,
Kiran

-----Original Message-----
From: Artem Bityutskiy [mailto:dedekind@infradead.org]=20
Sent: Thursday, November 30, 2006 6:57 PM
To: Tigadi Kiran-r10350c
Cc: linux-mtd@lists.infradead.org
Subject: Re: NOR read/write beyond end of flash partition

Hello,

On Thu, 2006-11-30 at 18:45 +0530, Tigadi Kiran-r10350c wrote:
> But mtd_read routine implemented in the same file does not have this
> check. So when I try to read beyond end of NOR MTD partition it is
> returning 0.=20

Sounds like a bug, feel free to send a patch against mtd-2.6.git tree.

--=20
Best regards,
Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)


------_=_NextPart_001_01C71497.A8C1391A
Content-Type: application/octet-stream;
	name="mtdchar_patch"
Content-Transfer-Encoding: base64
Content-Description: mtdchar_patch
Content-Disposition: attachment;
	filename="mtdchar_patch"

LS0tIGRyaXZlcnMvbXRkL210ZGNoYXIuYwkyMDA2LTExLTMwIDIxOjE2OjUwLjAwMDAwMDAwMCAr
MDUzMAorKysgZHJpdmVycy9tdGQvbXRkY2hhci5uZXcuYwkyMDA2LTExLTIxIDE4OjI3OjQ2LjAw
MDAwMDAwMCArMDUzMApAQCAtMTYxLDYgKzE2MSw5IEBACiAKIAlERUJVRyhNVERfREVCVUdfTEVW
RUwwLCJNVERfcmVhZFxuIik7CiAKKwlpZiAoKnBwb3MgPT0gbXRkLT5zaXplKQorCQlyZXR1cm4g
LUVOT1NQQzsKKwkKIAlpZiAoKnBwb3MgKyBjb3VudCA+IG10ZC0+c2l6ZSkKIAkJY291bnQgPSBt
dGQtPnNpemUgLSAqcHBvczsKIAo=

------_=_NextPart_001_01C71497.A8C1391A--
