Received: from sccrmhc11.comcast.net ([204.127.202.55])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19kVw1-0006e5-8W
	for <linux-mtd@lists.infradead.org>; Wed, 06 Aug 2003 22:35:05 +0100
Message-ID: <3F3174DC.3090609@mvista.com>
Date: Wed, 06 Aug 2003 17:36:28 -0400
From: "George G. Davis" <gdavis@mvista.com>
MIME-Version: 1.0
To: davis_g@mvista.com
References: <3F317459.1060300@mvista.com>
In-Reply-To: <3F317459.1060300@mvista.com>
Content-Type: multipart/mixed;
 boundary="------------010604000809060104090905"
cc: linux-mtd@lists.infradead.org
Subject: Re: Add cmdlinepart and default static partition table support for
 ARM Integrator
Reply-To: gdavis@mvista.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------010604000809060104090905
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Doh, patch is attached now...

George G. Davis wrote:
> Greetings,
> 
> The attached patch adds cmdlinepart and default static partition table 
> support
> to integrator-flash. I've tested this on an ARM Integrator/AP with CM920T
> core module. The patch is against recent MTD CVS checkout +/- 1 day. 
> I'ld like
> to get this committed to the MTD CVS repository. TIA!
> 
> -- 
> Regards,
> George
> 
> 
> 

--------------010604000809060104090905
Content-Type: text/plain;
 name="integrator-flash.patch"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="integrator-flash.patch"

SW5kZXg6IGRyaXZlcnMvbXRkL21hcHMvaW50ZWdyYXRvci1mbGFzaC5jCj09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0KUkNTIGZpbGU6IC9ob21lL2N2cy9tdGQvZHJpdmVycy9tdGQvbWFwcy9pbnRlZ3JhdG9y
LWZsYXNoLmMsdgpyZXRyaWV2aW5nIHJldmlzaW9uIDEuMTIKZGlmZiAtdSAtcjEuMTIgaW50
ZWdyYXRvci1mbGFzaC5jCi0tLSBkcml2ZXJzL210ZC9tYXBzL2ludGVncmF0b3ItZmxhc2gu
YwkyMCBNYXkgMjAwMyAyMDo1OTozMCAtMDAwMAkxLjEyCisrKyBkcml2ZXJzL210ZC9tYXBz
L2ludGVncmF0b3ItZmxhc2guYwk2IEF1ZyAyMDAzIDIwOjAyOjA2IC0wMDAwCkBAIC0xNTQs
MTQgKzE1NCw0MyBAQAogCiBzdGF0aWMgc3RydWN0IG1hcF9pbmZvIGFybWZsYXNoX21hcCA9
CiB7Ci0JLm5hbWUgPQkJIkFGUyIsCisJLm5hbWUgPQkJImludGVncmF0b3ItZmxhc2giLAog
CS5zZXRfdnBwID0JYXJtZmxhc2hfc2V0X3ZwcCwKIAkucGh5cyA9CQlGTEFTSF9CQVNFLAog
fTsKIAorCisvKgorICogRGVmYXVsdCBzdGF0aWMgTVREIHBhcnRpdGlvbiBkZWZpbml0aW9u
LgorICoKKyAqIFNlZSBpbmNsdWRlL2xpbnV4L210ZC9wYXJ0aXRpb25zLmggZm9yIGRlZmlu
aXRpb24gb2YgdGhlIG10ZF9wYXJ0aXRpb24KKyAqIHN0cnVjdHVyZS4KKyAqLworCitzdGF0
aWMgc3RydWN0IG10ZF9wYXJ0aXRpb24gaW50ZWdyYXRvcl9wYXJ0aXRpb25zW10gPSB7CisJ
eworCQkubmFtZQkJPSAiS2VybmVsIiwKKwkJLnNpemUJCT0gMHgwMDQwMDAwMCwKKwkJLm9m
ZnNldAkJPSAwLAorCX0sIHsKKwkJLm5hbWUJCT0gIlJvb3QgRmlsZXN5c3RlbSIsCisJCS5z
aXplCQk9IDB4MDBjMDAwMDAsCisJCS5vZmZzZXQJCT0gTVREUEFSVF9PRlNfQVBQRU5ELAor
CX0sIHsKKwkJLm5hbWUJCT0gIlVzZXIgRmlsZXN5c3RlbSIsCisJCS5zaXplCQk9IDB4MDBm
YzAwMDAsCisJCS5vZmZzZXQJCT0gTVREUEFSVF9PRlNfQVBQRU5ELAorCX0sIHsKKwkJLm5h
bWUJCT0gIkFSTSBCb290IE1vbml0b3IgU0lCIiwKKwkJLnNpemUJCT0gMHgwMDA0MDAwMCwK
KwkJLm9mZnNldAkJPSBNVERQQVJUX09GU19BUFBFTkQsCisJCS5tYXNrX2ZsYWdzCT0gTVRE
X1dSSVRFQUJMRSwgIC8qIGZvcmNlIHJlYWQtb25seSAqLworCX0KK307CisKIHN0YXRpYyBz
dHJ1Y3QgbXRkX2luZm8gKm10ZDsKIHN0YXRpYyBzdHJ1Y3QgbXRkX3BhcnRpdGlvbiAqcGFy
dHM7Ci1zdGF0aWMgY29uc3QgY2hhciAqcHJvYmVzW10gPSB7ICJSZWRCb290IiwgImFmcyIs
IE5VTEwgfTsKK3N0YXRpYyBjb25zdCBjaGFyICpwcm9iZXNbXSA9IHsgImNtZGxpbmVwYXJ0
IiwgIlJlZEJvb3QiLCAiYWZzIiwgTlVMTCB9OwogCiBzdGF0aWMgaW50IF9faW5pdCBhcm1m
bGFzaF9jZmlfaW5pdCh2b2lkICpiYXNlLCB1X2ludCBzaXplKQogewpAQCAtMTgwLDkgKzIw
OSw4IEBACiAJc2ltcGxlX21hcF9pbml0KCZhcm1mbGFzaF9tYXApOwogCiAJLyoKLQkgKiBB
bHNvLCB0aGUgQ0ZJIGxheWVyIGF1dG9tYXRpY2FsbHkgd29ya3Mgb3V0IHdoYXQgc2l6ZQot
CSAqIG9mIGNoaXBzIHdlIGhhdmUsIGFuZCBkb2VzIHRoZSBuZWNlc3NhcnkgaWRlbnRpZmlj
YXRpb24KLQkgKiBmb3IgdXMgYXV0b21hdGljYWxseS4KKwkgKiBUaGUgQ0ZJIGxheWVyIGF1
dG9tYXRpY2FsbHkgd29ya3Mgb3V0IHdoYXQgc2l6ZSBjaGlwcyB3ZSBoYXZlCisJICogYW5k
IGRvZXMgdGhlIG5lY2Vzc2FyeSBpZGVudGlmaWNhdGlvbiBmb3IgdXMgYXV0b21hdGljYWxs
eS4KIAkgKi8KIAltdGQgPSBkb19tYXBfcHJvYmUoImNmaV9wcm9iZSIsICZhcm1mbGFzaF9t
YXApOwogCWlmICghbXRkKQpAQCAtMTkxLDEyICsyMTksMTcgQEAKIAltdGQtPm93bmVyID0g
VEhJU19NT0RVTEU7CiAKIAlyZXQgPSBwYXJzZV9tdGRfcGFydGl0aW9ucyhtdGQsIHByb2Jl
cywgJnBhcnRzLCAodm9pZCAqKTApOwotCWlmIChyZXQgPiAwKSB7Ci0JCXJldCA9IGFkZF9t
dGRfcGFydGl0aW9ucyhtdGQsIHBhcnRzLCByZXQpOwotCQlpZiAocmV0KQotCQkJcHJpbnRr
KEtFUk5fRVJSICJtdGQgcGFydGl0aW9uIHJlZ2lzdHJhdGlvbiAiCi0JCQkJImZhaWxlZDog
JWRcbiIsIHJldCk7CisJaWYgKHJldCA8PSAwKSB7CisJCS8qCisJCSAqIFVzZSBkZWZhdWx0
IHN0YXRpYyBNVEQgcGFydGl0aW9uIGRlZmluaXRpb246CisJCSAqLworCQlwYXJ0cyA9IGlu
dGVncmF0b3JfcGFydGl0aW9uczsKKwkJcmV0ID0gQVJSQVlfU0laRShpbnRlZ3JhdG9yX3Bh
cnRpdGlvbnMpOwogCX0KKworCXJldCA9IGFkZF9tdGRfcGFydGl0aW9ucyhtdGQsIHBhcnRz
LCByZXQpOworCWlmIChyZXQpCisJCXByaW50ayhLRVJOX0VSUiAibXRkIHBhcnRpdGlvbiBy
ZWdpc3RyYXRpb24gZmFpbGVkOiAlZFxuIiwgcmV0KTsKIAogCS8qCiAJICogSWYgd2UgZ290
IGFuIGVycm9yLCBmcmVlIGFsbCByZXNvdXJjZXMuCg==
--------------010604000809060104090905--
