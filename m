Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17uWFR-0005aM-00
	for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2002 11:51:57 +0100
Content-Class: urn:content-classes:message
Subject: Debug messages in nand.c
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C2654A.B244CFE8"
Date: Thu, 26 Sep 2002 11:51:41 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B950806E6@OPTEX1.optex.local>
From: "John Hall" <john.hall@optionexist.co.uk>
To: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Cc: "Thomas Gleixner (E-mail)" <tglx@linutronix.de>
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

------_=_NextPart_001_01C2654A.B244CFE8
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Looking through nand.c I found some trivial bugs in the debug output; =
some statements were prefixed with the wrong function name.

I thought about modifying all the uses of DEBUG to =
DEBUG(MTD_DEBUG_LEVELx, "%s: ....", __FUNCTION__, ...) but thought this =
might be too intrusive.

regards,
John

--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/

------_=_NextPart_001_01C2654A.B244CFE8
Content-Type: application/octet-stream;
	name="nand.c-1.32.patch"
Content-Transfer-Encoding: base64
Content-Description: nand.c-1.32.patch
Content-Disposition: attachment;
	filename="nand.c-1.32.patch"

LS0tIG10ZC9kcml2ZXJzL210ZC9uYW5kL25hbmQuYwlXZWQgU2VwIDI1IDE2OjIxOjE1IDIwMDIK
KysrIGxpbnV4L2RyaXZlcnMvbXRkL25hbmQvbmFuZC5jCVRodSBTZXAgMjYgMTE6MTE6NTYgMjAw
MgpAQCAtNDU5LDcgKzQ1OSw3IEBACiAKIAkvKiBTZWUgaWYgZGV2aWNlIHRoaW5rcyBpdCBzdWNj
ZWVkZWQgKi8KIAlpZiAoc3RhdHVzICYgMHgwMSkgewotCQlERUJVRyAoTVREX0RFQlVHX0xFVkVM
MCwgIm5hbmRfd3JpdGVfZWNjOiAiICJGYWlsZWQgd3JpdGUsIHBhZ2UgMHglMDh4LCAiLCBwYWdl
KTsKKwkJREVCVUcgKE1URF9ERUJVR19MRVZFTDAsICIlczogIiAiRmFpbGVkIHdyaXRlLCBwYWdl
IDB4JTA4eCwgIiwgX19GVU5DVElPTl9fLCBwYWdlKTsKIAkJcmV0dXJuIC1FSU87CiAJfQogCkBA
IC00ODIsNyArNDgyLDcgQEAKIAkvKiBMb29wIHRocm91Z2ggYW5kIHZlcmlmeSB0aGUgZGF0YSAq
LwogCWZvciAoaSA9IGNvbDsgaSA8IGxhc3Q7IGkrKykgewogCQlpZiAodGhpcy0+ZGF0YV9idWZb
aV0gIT0gcmVhZGIgKHRoaXMtPklPX0FERFJfUikpIHsKLQkJCURFQlVHIChNVERfREVCVUdfTEVW
RUwwLCAibmFuZF93cml0ZV9lY2M6ICIgIkZhaWxlZCB3cml0ZSB2ZXJpZnksIHBhZ2UgMHglMDh4
ICIsIHBhZ2UpOworCQkJREVCVUcgKE1URF9ERUJVR19MRVZFTDAsICIlczogIiAiRmFpbGVkIHdy
aXRlIHZlcmlmeSwgcGFnZSAweCUwOHggIiwgX19GVU5DVElPTl9fLCBwYWdlKTsKIAkJCXJldHVy
biAtRUlPOwogCQl9CiAJfQpAQCAtNDkxLDcgKzQ5MSw3IEBACiAJaWYgKG9vYl9idWYpIHsKIAkJ
Zm9yIChpID0gMDsgaSA8IG10ZC0+b29ic2l6ZTsgaSsrKSB7CiAJCQlpZiAob29iX2RhdGFbaV0g
IT0gcmVhZGIgKHRoaXMtPklPX0FERFJfUikpIHsKLQkJCQlERUJVRyAoTVREX0RFQlVHX0xFVkVM
MCwgIm5hbmRfd3JpdGVfZWNjOiAiICJGYWlsZWQgd3JpdGUgdmVyaWZ5LCBwYWdlIDB4JTA4eCAi
LCBwYWdlKTsKKwkJCQlERUJVRyAoTVREX0RFQlVHX0xFVkVMMCwgIiVzOiAiICJGYWlsZWQgd3Jp
dGUgdmVyaWZ5LCBwYWdlIDB4JTA4eCAiLCBfX0ZVTkNUSU9OX18sIHBhZ2UpOwogCQkJCXJldHVy
biAtRUlPOwogCQkJfQogCQl9CkBAIC01MTIsOCArNTEyLDggQEAKIAkJCWZvciAoaSA9IDA7IGkg
PCBlY2NfYnl0ZXM7IGkrKykgewogCQkJCWlmIChvb2JfZGF0YVtvb2JfY29uZmlnW2ldXSAhPSBl
Y2NfY29kZVtpXSkgewogCQkJCQlERUJVRyAoTVREX0RFQlVHX0xFVkVMMCwKLQkJCQkJICAgICAg
ICJuYW5kX3dyaXRlX2VjYzogRmFpbGVkIEVDQyB3cml0ZSAiCi0JCQkJICAgICAgICJ2ZXJpZnks
IHBhZ2UgMHglMDh4LCAiICIlNmkgYnl0ZXMgd2VyZSBzdWNjZXNmdWxcbiIsIHBhZ2UsIGkpOwor
CQkJCQkgICAgICAgIiVzOiBGYWlsZWQgRUNDIHdyaXRlICIKKwkJCQkgICAgICAgInZlcmlmeSwg
cGFnZSAweCUwOHgsICIgIiU2aSBieXRlcyB3ZXJlIHN1Y2Nlc2Z1bFxuIiwgX19GVU5DVElPTl9f
LCBwYWdlLCBpKTsKIAkJCQlyZXR1cm4gLUVJTzsKIAkJCQl9CiAJCQl9Cg==

------_=_NextPart_001_01C2654A.B244CFE8--
