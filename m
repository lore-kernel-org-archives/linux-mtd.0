Received: from anchor-post-31.mail.demon.net ([194.217.242.89])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BM5on-0004CI-C3
	for linux-mtd@lists.infradead.org; Fri, 07 May 2004 14:55:13 +0100
From: Simon Haynes <simon@baydel.com>
To: linux-mtd@lists.infradead.org
Date: Fri, 7 May 2004 14:42:05 +0100
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_5EJCIJPZ0BMEDYUALXFH"
Message-ID: <C98EE3515623@baydel.com>
cc: David Woodhouse <dwmw2@infradead.org>
Subject: wbuf flush or remount ro 
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--------------Boundary-00=_5EJCIJPZ0BMEDYUALXFH
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 8bit

David,

Just to recap 

It seems that the latest jffs2 CVS code does not flush wbuf when the 
filesystem is remounted read only. This can cause a gc operation to be 
abnormally terminated an error messages are generated on remount.

A while ago you suggested I do something like this. See attached 

I don't really know how to create a patch file so here is a diff and a patch.
If the patch is not correct would you please enlighten me.

--------------Boundary-00=_5EJCIJPZ0BMEDYUALXFH
Content-Type: text/x-diff;
  charset="iso-8859-15";
  name="fs.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="fs.patch"

LS0tIGZzLmN2cwlGcmkgTWF5ICA3IDE0OjI5OjQ1IDIwMDQKKysrIGZzLmMJRnJpIE1heSAgNyAx
NDowODo0MCAyMDA0CkBAIC0zNTUsNiArMzU1LDEzIEBACiAKIAlpZiAoISgqZmxhZ3MgJiBNU19S
RE9OTFkpKQogCQlqZmZzMl9zdGFydF9nYXJiYWdlX2NvbGxlY3RfdGhyZWFkKGMpOworCS8qIE1I
QiBoYWNrICovCisJZWxzZSB7CisJCWRvd24oJmMtPmFsbG9jX3NlbSk7CisJICAgICAgICBqZmZz
Ml9mbHVzaF93YnVmX3BhZChjKTsKKwkgICAgICAgIHVwKCZjLT5hbGxvY19zZW0pOworCX0KKwog
CQogCXNiLT5zX2ZsYWdzID0gKHNiLT5zX2ZsYWdzICYgfk1TX1JET05MWSl8KCpmbGFncyAmIE1T
X1JET05MWSk7CiAKQEAgLTQ2Myw3ICs0NzAsMTIgQEAKIAl9CiAKIAlpZiAoYy0+c2VjdG9yX3Np
emUgIT0gYy0+bXRkLT5lcmFzZXNpemUpCisvKiBNSEIgKi8KKy8qCiAJCXByaW50ayhLRVJOX0lO
Rk8gImpmZnMyOiBFcmFzZSBibG9jayBzaXplIHRvbyBzbWFsbCAoJWRLaUIpLiBVc2luZyB2aXJ0
dWFsIGJsb2NrcyBzaXplICglZEtpQikgaW5zdGVhZFxuIiwgCisJCQljLT5tdGQtPmVyYXNlc2l6
ZSAvIDEwMjQsIGMtPnNlY3Rvcl9zaXplIC8gMTAyNCk7CisqLworCQlwcmludGsoS0VSTl9ERUJV
RyAiamZmczI6IEVyYXNlIGJsb2NrIHNpemUgdG9vIHNtYWxsICglZEtpQikuIFVzaW5nIHZpcnR1
YWwgYmxvY2tzIHNpemUgKCVkS2lCKSBpbnN0ZWFkXG4iLCAKIAkJCWMtPm10ZC0+ZXJhc2VzaXpl
IC8gMTAyNCwgYy0+c2VjdG9yX3NpemUgLyAxMDI0KTsKIAogCWlmIChjLT5mbGFzaF9zaXplIDwg
NSpjLT5zZWN0b3Jfc2l6ZSkgewo=

--------------Boundary-00=_5EJCIJPZ0BMEDYUALXFH
Content-Type: text/x-diff;
  charset="iso-8859-15";
  name="fs.diff"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="fs.diff"

KioqIGZzLmN2cwlGcmkgTWF5ICA3IDE0OjI5OjQ1IDIwMDQKLS0tIGZzLmMJRnJpIE1heSAgNyAx
NDowODo0MCAyMDA0CioqKioqKioqKioqKioqKgoqKiogMzU1LDM2MCAqKioqCi0tLSAzNTUsMzY3
IC0tLS0KICAKICAJaWYgKCEoKmZsYWdzICYgTVNfUkRPTkxZKSkKICAJCWpmZnMyX3N0YXJ0X2dh
cmJhZ2VfY29sbGVjdF90aHJlYWQoYyk7CisgCS8qIE1IQiBoYWNrICovCisgCWVsc2UgeworIAkJ
ZG93bigmYy0+YWxsb2Nfc2VtKTsKKyAJICAgICAgICBqZmZzMl9mbHVzaF93YnVmX3BhZChjKTsK
KyAJICAgICAgICB1cCgmYy0+YWxsb2Nfc2VtKTsKKyAJfQorIAogIAkKICAJc2ItPnNfZmxhZ3Mg
PSAoc2ItPnNfZmxhZ3MgJiB+TVNfUkRPTkxZKXwoKmZsYWdzICYgTVNfUkRPTkxZKTsKICAKKioq
KioqKioqKioqKioqCioqKiA0NjMsNDY5ICoqKioKLS0tIDQ3MCw0ODEgLS0tLQogIAl9CiAgCiAg
CWlmIChjLT5zZWN0b3Jfc2l6ZSAhPSBjLT5tdGQtPmVyYXNlc2l6ZSkKKyAvKiBNSEIgKi8KKyAv
KgogIAkJcHJpbnRrKEtFUk5fSU5GTyAiamZmczI6IEVyYXNlIGJsb2NrIHNpemUgdG9vIHNtYWxs
ICglZEtpQikuIFVzaW5nIHZpcnR1YWwgYmxvY2tzIHNpemUgKCVkS2lCKSBpbnN0ZWFkXG4iLCAK
KyAJCQljLT5tdGQtPmVyYXNlc2l6ZSAvIDEwMjQsIGMtPnNlY3Rvcl9zaXplIC8gMTAyNCk7Cisg
Ki8KKyAJCXByaW50ayhLRVJOX0RFQlVHICJqZmZzMjogRXJhc2UgYmxvY2sgc2l6ZSB0b28gc21h
bGwgKCVkS2lCKS4gVXNpbmcgdmlydHVhbCBibG9ja3Mgc2l6ZSAoJWRLaUIpIGluc3RlYWRcbiIs
IAogIAkJCWMtPm10ZC0+ZXJhc2VzaXplIC8gMTAyNCwgYy0+c2VjdG9yX3NpemUgLyAxMDI0KTsK
ICAKICAJaWYgKGMtPmZsYXNoX3NpemUgPCA1KmMtPnNlY3Rvcl9zaXplKSB7Cg==

--------------Boundary-00=_5EJCIJPZ0BMEDYUALXFH--
