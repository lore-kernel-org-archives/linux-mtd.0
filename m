Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AMdXy-0005tZ-1j
	for <linux-mtd@lists.infradead.org>; Thu, 20 Nov 2003 01:23:50 +0000
Received: from there (unknown [203.96.30.253])
	by blood.actrix.co.nz (Postfix) with SMTP id 349D84FE2
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Nov 2003 14:22:18 +1300 (NZDT)
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Thu, 20 Nov 2003 14:28:37 +1300
MIME-Version: 1.0
Message-Id: <20031120012218.349D84FE2@blood.actrix.co.nz>
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_PRMMYCA1EECW1E7A7RKH"
Subject: cfi_cmdset_0002.c patch
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--------------Boundary-00=_PRMMYCA1EECW1E7A7RKH
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Two variables being declared in mid-block as allowed by C++, but not C.

-- CHarles


--------------Boundary-00=_PRMMYCA1EECW1E7A7RKH
Content-Type: text/x-diff;
  charset="iso-8859-1";
  name="patch_cfi_cmdset_0002.c"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch_cfi_cmdset_0002.c"

LS0tIGNmaV9jbWRzZXRfMDAwMi5jfglUaHUgT2N0IDIzIDA3OjI3OjU5IDIwMDMKKysrIGNmaV9j
bWRzZXRfMDAwMi5jCVRodSBOb3YgMjAgMTQ6MjQ6MjggMjAwMwpAQCAtMjc4LDYgKzI3OCw5IEBA
CiAJc3RydWN0IG10ZF9pbmZvICptdGQ7CiAJdW5zaWduZWQgbG9uZyBkZXZzaXplID0gKDE8PGNm
aS0+Y2ZpcS0+RGV2U2l6ZSkgKiBjZmktPmludGVybGVhdmU7CiAKKwl1bnNpZ25lZCBsb25nIG9m
ZnNldCA9IDA7CisJaW50IGksajsKKwogCW10ZCA9IGttYWxsb2Moc2l6ZW9mKCptdGQpLCBHRlBf
S0VSTkVMKTsKIAlwcmludGsoS0VSTl9OT1RJQ0UgIm51bWJlciBvZiAlcyBjaGlwczogJWRcbiIs
IAogCSAgICAgICAoY2ZpLT5jZmlfbW9kZSA9PSBDRklfTU9ERV9DRkkpPyJDRkkiOiJKRURFQyIs
Y2ZpLT5udW1jaGlwcyk7CkBAIC0yOTIsOSArMjk1LDYgQEAKIAltdGQtPnR5cGUgPSBNVERfTk9S
RkxBU0g7CiAJLyogQWxzbyBzZWxlY3QgdGhlIGNvcnJlY3QgZ2VvbWV0cnkgc2V0dXAgdG9vICov
IAogCW10ZC0+c2l6ZSA9IGRldnNpemUgKiBjZmktPm51bWNoaXBzOwotCi0JdW5zaWduZWQgbG9u
ZyBvZmZzZXQgPSAwOwotCWludCBpLGo7CiAKIAltdGQtPm51bWVyYXNlcmVnaW9ucyA9IGNmaS0+
Y2ZpcS0+TnVtRXJhc2VSZWdpb25zICogY2ZpLT5udW1jaGlwczsKIAltdGQtPmVyYXNlcmVnaW9u
cyA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCBtdGRfZXJhc2VfcmVnaW9uX2luZm8pCg==

--------------Boundary-00=_PRMMYCA1EECW1E7A7RKH--
