Received: from blood.actrix.co.nz ([203.96.16.160])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cf9vc-0000fu-Io
	for linux-mtd@lists.infradead.org; Thu, 16 Dec 2004 23:41:22 -0500
Received: from there (203-96-48-26-tollfree.actrix.co.nz [203.96.48.26])
	by blood.actrix.co.nz (Postfix) with SMTP id 066064A07
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Dec 2004 17:41:11 +1300 (NZDT)
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Fri, 17 Dec 2004 16:24:09 +1300
References: <3C5AD150.1A3B9AAE@comdev.cc> <3C5ADFC8.BD97CFFF@comdev.cc>
	<3C5AF025.F61F91F6@comdev.cc>
In-Reply-To: <3C5AF025.F61F91F6@comdev.cc>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
	boundary="------------Boundary-00=_94KUT7DOAVAKJABQ8AXX"
Message-Id: <20041217044111.066064A07@blood.actrix.co.nz>
Subject: PATCH to help understanding
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--------------Boundary-00=_94KUT7DOAVAKJABQ8AXX
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hi folks

I propose the following patches to mtd.h to help the understanding of these 
functions.

read_ecc() and write_ecc() use the argument eccbuff, but this is really oob 
data being passed. The oob data might contain ecc info as well as other 
stuff. With the preferred autoplacement model, this will not have ecc info in 
it. Therefore I suggest a rename on this parameter.

suspend() and resume() are surely the functions for erase suspend and erase 
resume (for those NOR devices that provide this). Perhaps I goofed here and 
these are really power control functions (which would seem rather dodgy). If 
these are really power control fns, then where does erase suspend/resume get 
exposed?

-- Charles

--------------Boundary-00=_94KUT7DOAVAKJABQ8AXX
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="mtd.h.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="mtd.h.patch"

ZGlmZiAtTmF1ciBvbGRtdGQvbXRkLmggbXRkL210ZC5oCi0tLSBvbGRtdGQvbXRkLmgJRnJpIERl
YyAxNyAxNjoxMTozNCAyMDA0CisrKyBtdGQvbXRkLmgJRnJpIERlYyAxNyAxNjoxMjo1NyAyMDA0
CkBAIC0xMDIsOCArMTAyLDggQEAKIAlpbnQgKCpyZWFkKSAoc3RydWN0IG10ZF9pbmZvICptdGQs
IGxvZmZfdCBmcm9tLCBzaXplX3QgbGVuLCBzaXplX3QgKnJldGxlbiwgdV9jaGFyICpidWYpOwog
CWludCAoKndyaXRlKSAoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCB0bywgc2l6ZV90IGxl
biwgc2l6ZV90ICpyZXRsZW4sIGNvbnN0IHVfY2hhciAqYnVmKTsKIAotCWludCAoKnJlYWRfZWNj
KSAoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9tLCBzaXplX3QgbGVuLCBzaXplX3Qg
KnJldGxlbiwgdV9jaGFyICpidWYsIHVfY2hhciAqZWNjYnVmLCBzdHJ1Y3QgbmFuZF9vb2JpbmZv
ICpvb2JzZWwpOwotCWludCAoKndyaXRlX2VjYykgKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2Zm
X3QgdG8sIHNpemVfdCBsZW4sIHNpemVfdCAqcmV0bGVuLCBjb25zdCB1X2NoYXIgKmJ1ZiwgdV9j
aGFyICplY2NidWYsIHN0cnVjdCBuYW5kX29vYmluZm8gKm9vYnNlbCk7CisJaW50ICgqcmVhZF9l
Y2MpIChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgbG9mZl90IGZyb20sIHNpemVfdCBsZW4sIHNpemVf
dCAqcmV0bGVuLCB1X2NoYXIgKmJ1ZiwgdV9jaGFyICpvb2JidWYsIHN0cnVjdCBuYW5kX29vYmlu
Zm8gKm9vYnNlbCk7CisJaW50ICgqd3JpdGVfZWNjKSAoc3RydWN0IG10ZF9pbmZvICptdGQsIGxv
ZmZfdCB0bywgc2l6ZV90IGxlbiwgc2l6ZV90ICpyZXRsZW4sIGNvbnN0IHVfY2hhciAqYnVmLCB1
X2NoYXIgKm9vYmJ1Ziwgc3RydWN0IG5hbmRfb29iaW5mbyAqb29ic2VsKTsKIAogCWludCAoKnJl
YWRfb29iKSAoc3RydWN0IG10ZF9pbmZvICptdGQsIGxvZmZfdCBmcm9tLCBzaXplX3QgbGVuLCBz
aXplX3QgKnJldGxlbiwgdV9jaGFyICpidWYpOwogCWludCAoKndyaXRlX29vYikgKHN0cnVjdCBt
dGRfaW5mbyAqbXRkLCBsb2ZmX3QgdG8sIHNpemVfdCBsZW4sIHNpemVfdCAqcmV0bGVuLCBjb25z
dCB1X2NoYXIgKmJ1Zik7CkBAIC0xMzksNyArMTM5LDcgQEAKIAlpbnQgKCpsb2NrKSAoc3RydWN0
IG10ZF9pbmZvICptdGQsIGxvZmZfdCBvZnMsIHNpemVfdCBsZW4pOwogCWludCAoKnVubG9jaykg
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBsb2ZmX3Qgb2ZzLCBzaXplX3QgbGVuKTsKIAotCS8qIFBv
d2VyIE1hbmFnZW1lbnQgZnVuY3Rpb25zICovCisJLyogRXJhc2Ugc3VzcGVuZCBmdW5jdGlvbiA/
Pz8qLwogCWludCAoKnN1c3BlbmQpIChzdHJ1Y3QgbXRkX2luZm8gKm10ZCk7CiAJdm9pZCAoKnJl
c3VtZSkgKHN0cnVjdCBtdGRfaW5mbyAqbXRkKTsKIAo=

--------------Boundary-00=_94KUT7DOAVAKJABQ8AXX--
