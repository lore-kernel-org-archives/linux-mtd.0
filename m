Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uVqr-0005YV-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2002 11:26:33 +0100
Received: from optex.demon.co.uk ([158.152.119.220] helo=optex1.optex.local)
	by anchor-post-32.mail.demon.net with esmtp (Exim 3.35 #1)
	id 17uVqr-000O7q-0W
	for linux-mtd@lists.infradead.org; Thu, 26 Sep 2002 11:26:33 +0100
Content-Class: urn:content-classes:message
Subject: set_user_nice in 2.4.18
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C26547.261DAAE8"
Date: Thu, 26 Sep 2002 11:26:17 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B950806E5@OPTEX1.optex.local>
From: "John Hall" <john.hall@optionexist.co.uk>
To: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C26547.261DAAE8
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I found a problem compiling the latest cvs version against armlinux =
2.4.18-rmk7. It seems that this kernel doesn't have set_user_nice =
defined; compatmac.h checks for versions less than 2.4.18 before =
defining set_user_nice. I checked vanilla 2.4.18 and 2.4.19 and they =
don't have it either. A patch is attached that changes the check to =
check for less than 2.5.0, assuming this is correct.

regards,
John

--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/

------_=_NextPart_001_01C26547.261DAAE8
Content-Type: application/octet-stream;
	name="compatmac.h-1.40.patch"
Content-Transfer-Encoding: base64
Content-Description: compatmac.h-1.40.patch
Content-Disposition: attachment;
	filename="compatmac.h-1.40.patch"

LS0tIG10ZC9pbmNsdWRlL2xpbnV4L210ZC9jb21wYXRtYWMuaAlXZWQgU2VwIDI1IDE2OjIxOjIy
IDIwMDIKKysrIGxpbnV4L2luY2x1ZGUvbGludXgvbXRkL2NvbXBhdG1hYy5oCVRodSBTZXAgMjYg
MTE6MjQ6MTMgMjAwMgpAQCAtNTE5LDcgKzUxOSw3IEBACiAjaWYgTElOVVhfVkVSU0lPTl9DT0RF
IDwgS0VSTkVMX1ZFUlNJT04oMiw0LDApCiAJLyogSXMgdGhpcyByaWdodD8gKi8KICNkZWZpbmUg
c2V0X3VzZXJfbmljZSh0c2ssIG4pIGRvIHsgKHRzayktPnByaW9yaXR5ID0gMjAtKG4pOyB9IHdo
aWxlKDApIAotI2VsaWYgTElOVVhfVkVSU0lPTl9DT0RFIDwgS0VSTkVMX1ZFUlNJT04oMiw0LDE4
KQorI2VsaWYgTElOVVhfVkVSU0lPTl9DT0RFIDwgS0VSTkVMX1ZFUlNJT04oMiw1LDApCiAjZGVm
aW5lIHNldF91c2VyX25pY2UodHNrLCBuKSBkbyB7ICh0c2spLT5uaWNlID0gbjsgfSB3aGlsZSgw
KQogI2VuZGlmCiAK

------_=_NextPart_001_01C26547.261DAAE8--
