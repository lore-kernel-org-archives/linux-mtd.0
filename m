Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mXkZ-00017n-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 11:51:07 +0100
Subject: Problems compiling nand.c from cvs
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C25400.EBD44294"
Date: Wed, 4 Sep 2002 11:50:45 +0100
Message-ID: <541025071C7AC24C84E9F82296BB9B9508067E@OPTEX1.optex.local>
Content-Class: urn:content-classes:message
From: "John Hall" <John.Hall@optionexist.co.uk>
To: "Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Cc: <tglx@linutronix.de>
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

------_=_NextPart_001_01C25400.EBD44294
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I was unable to compile the latest nand.c from cvs (revision 1.30). =
There were several problems, which I've fixed and it now compiles. I =
haven't been able to test the code yet, just made it compile. Patch is =
attached.

Regards,
John Hall


--=20
OptionExist Limited.
The Irwin Centre, Scotland Road, Dry Drayton, Cambridge.
Tel: +44 (0)1954 211244, Fax: +44 (0)1954 211565
http://www.optionexist.co.uk/

------_=_NextPart_001_01C25400.EBD44294
Content-Type: application/octet-stream;
	name="nand.c.patch"
Content-Transfer-Encoding: base64
Content-Description: nand.c.patch
Content-Disposition: attachment;
	filename="nand.c.patch"

LS0tIG10ZC9kcml2ZXJzL210ZC9uYW5kL25hbmQuYwlXZWQgU2VwICA0IDExOjAyOjA2IDIwMDIK
KysrIHdvcmtpbmcvZHJpdmVycy9tdGQvbmFuZC9uYW5kLmMJV2VkIFNlcCAgNCAxMTo0OToyMSAy
MDAyCkBAIC00OTEsMTAgKzQ5MSwxMSBAQAogCQkJaWYgKG9vYl9kYXRhW2ldICE9IHJlYWRiICh0
aGlzLT5JT19BRERSX1IpKSB7CiAJCQkJREVCVUcgKE1URF9ERUJVR19MRVZFTDAsICJuYW5kX3dy
aXRlX2VjYzogIiAiRmFpbGVkIHdyaXRlIHZlcmlmeSwgcGFnZSAweCUwOHggIiwgcGFnZSk7CiAJ
CQkJcmV0dXJuIC1FSU87CisJCQl9CiAJCX0KIAl9IGVsc2UgewotCQlpZiAoZWNjbW9kZSAhPSBO
QU5EX0VDQ19OT05FICYmICFjb2wgJiYgbGFzdCA9PSB0aGlzLT5vb2JibG9jaykgewotCQkJaW50
IGVjY19ieXRlczsKKwkJaWYgKGVjY21vZGUgIT0gTkFORF9FQ0NfTk9ORSAmJiAhY29sICYmIGxh
c3QgPT0gbXRkLT5vb2JibG9jaykgeworCQkJaW50IGVjY19ieXRlcyA9IDA7CiAKIAkJCXN3aXRj
aCAodGhpcy0+ZWNjbW9kZSkgewogCQkJY2FzZSBOQU5EX0VDQ19TT0ZUOgpAQCAtNTA0LDEwICs1
MDUsMTAgQEAKIAkJCX0KIAogCQkJZm9yIChpID0gMDsgaSA8IG10ZC0+b29ic2l6ZTsgaSsrKQot
CQkJCW9vYl9kYXRhID0gcmVhZGIgKHRoaXMtPklPX0FERFJfUik7CisJCQkJb29iX2RhdGFbaV0g
PSByZWFkYiAodGhpcy0+SU9fQUREUl9SKTsKIAogCQkJZm9yIChpID0gMDsgaSA8IGVjY19ieXRl
czsgaSsrKSB7Ci0JCQkJaWYgKG9vYl9kYXRhW29vYl9jb25maWcuZWNjX3Bvc1tpXV0gIT0gZWNj
X2NvZGVbaV0pKSB7CisJCQkJaWYgKG9vYl9kYXRhW29vYl9jb25maWdbaV1dICE9IGVjY19jb2Rl
W2ldKSB7CiAJCQkJCURFQlVHIChNVERfREVCVUdfTEVWRUwwLAogCQkJCQkgICAgICAgIm5hbmRf
d3JpdGVfZWNjOiBGYWlsZWQgRUNDIHdyaXRlICIKIAkJCQkgICAgICAgInZlcmlmeSwgcGFnZSAw
eCUwOHgsICIgIiU2aSBieXRlcyB3ZXJlIHN1Y2Nlc2Z1bFxuIiwgcGFnZSwgaSk7Cg==

------_=_NextPart_001_01C25400.EBD44294--
