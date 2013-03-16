Received: from mail-qa0-f51.google.com ([209.85.216.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UGuFB-0006Rr-Vi
 for linux-mtd@lists.infradead.org; Sat, 16 Mar 2013 16:46:06 +0000
Received: by mail-qa0-f51.google.com with SMTP id cr7so889512qab.3
 for <linux-mtd@lists.infradead.org>; Sat, 16 Mar 2013 09:46:03 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 16 Mar 2013 10:46:02 -0600
Message-ID: <CACwUX0OGZivc3pui7Kgo=Y+Tp+dP7UszR_DNN3-pzovo0L7LAg@mail.gmail.com>
Subject: ONFI patch
From: David Mosberger-Tang <dmosberger@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary=047d7bdc9612c2c00704d80d7d71
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--047d7bdc9612c2c00704d80d7d71
Content-Type: multipart/alternative; boundary=047d7bdc9612c2c00304d80d7d6f

--047d7bdc9612c2c00304d80d7d6f
Content-Type: text/plain; charset=ISO-8859-1

I would like to propose a patch along the attached to make some of the ONFI
support routines work on 16-bit devices.  It does the following:

   - Always call nand_flash_detect_onfi(), even for known chips.  Without
   this, onfi_version stays at 0 and nand_onfi_get_features and
   nand_onfi_set_features will always fail with EINVAL.
   - For the READID, GET_FEATURES, and SET_FEATURES commands, the column
   address is always 1 byte, regardless of bus-width.
   - nand_onfi_set_features(), nand_onfi_get_features(), and
   nand_flash_detect_onfi() need to use 8-bit transfers, regardless of
   bus-width.

I see that the linux-mtd tree has a NAND_BUSWIDTH_AUTO features, but I
don't see how that's supposed to help for, say, nand_onfi-set_features() or
nand_onfi_get_features() as nand_set_defaults() will eventually set the
16-bit transfer routines for 16-bit devices.

The patch is relative to linux-mtd GIT tree.

Thanks,

  --david

--047d7bdc9612c2c00304d80d7d6f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I would like to propose a patch along the attached to make=
 some of the ONFI support routines work on 16-bit devices. =A0It does the f=
ollowing:<div><ul style><li style>Always call nand_flash_detect_onfi(), eve=
n for known chips. =A0Without this, onfi_version stays at 0 and nand_onfi_g=
et_features and nand_onfi_set_features will always fail with EINVAL.<br>
</li><li style>For the READID, GET_FEATURES, and SET_FEATURES commands, the=
 column address is always 1 byte, regardless of bus-width.</li><li style>na=
nd_onfi_set_features(), nand_onfi_get_features(), and nand_flash_detect_onf=
i() need to use 8-bit transfers, regardless of bus-width.</li>
</ul><div style>I see that the linux-mtd tree has a NAND_BUSWIDTH_AUTO feat=
ures, but I don&#39;t see how that&#39;s supposed to help for, say, nand_on=
fi-set_features() or nand_onfi_get_features() as nand_set_defaults() will e=
ventually set the 16-bit transfer routines for 16-bit devices.</div>
</div><div style><br></div><div style>The patch is relative to linux-mtd GI=
T tree.</div><div style><br></div><div style>Thanks,</div><div style><br></=
div><div style>=A0 --david</div><div style><br></div></div>

--047d7bdc9612c2c00304d80d7d6f--

--047d7bdc9612c2c00704d80d7d71
Content-Type: text/plain; charset=US-ASCII; name="onfi-fixes.diff.txt"
Content-Disposition: attachment; filename="onfi-fixes.diff.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_heczza3f0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9u
YW5kL25hbmRfYmFzZS5jCmluZGV4IDQyYzYzOTIuLjMxZGVjZDEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvbmFuZF9iYXNlLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jhc2Uu
YwpAQCAtNTA3LDYgKzUwNywzMiBAQCB2b2lkIG5hbmRfd2FpdF9yZWFkeShzdHJ1Y3QgbXRkX2lu
Zm8gKm10ZCkKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKG5hbmRfd2FpdF9yZWFkeSk7CiAKK3N0YXRp
YyBpbnQKK3NldF9jb2x1bW4gKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlw
ICpjaGlwLAorCSAgICB1bnNpZ25lZCBpbnQgY29tbWFuZCwgaW50IGNvbHVtbiwKKwkgICAgdW5z
aWduZWQgaW50IGNvbHVtbl93aWR0aCwgaW50IGN0cmwpCit7CisJc3dpdGNoIChjb21tYW5kKSB7
CisJY2FzZSBOQU5EX0NNRF9SRUFESUQ6CisJY2FzZSBOQU5EX0NNRF9HRVRfRkVBVFVSRVM6CisJ
Y2FzZSBOQU5EX0NNRF9TRVRfRkVBVFVSRVM6CisJCWNoaXAtPmNtZF9jdHJsKG10ZCwgY29sdW1u
LCBjdHJsKTsKKwkJY3RybCAmPSB+TkFORF9DVFJMX0NIQU5HRTsKKwkJYnJlYWs7CisKKwlkZWZh
dWx0OgorCQkvKiBBZGp1c3QgY29sdW1ucyBmb3IgMTYgYml0IGJ1c3dpZHRoICovCisJCWlmIChj
aGlwLT5vcHRpb25zICYgTkFORF9CVVNXSURUSF8xNikKKwkJCWNvbHVtbiA+Pj0gMTsKKwkJY2hp
cC0+Y21kX2N0cmwobXRkLCBjb2x1bW4sIGN0cmwpOworCQljdHJsICY9IH5OQU5EX0NUUkxfQ0hB
TkdFOworCQlpZiAoY29sdW1uX3dpZHRoID4gOCkKKwkJCWNoaXAtPmNtZF9jdHJsKG10ZCwgY29s
dW1uID4+IDgsIGN0cmwpOworCQlicmVhazsKKwl9CisJcmV0dXJuIGN0cmw7Cit9CisKIC8qKgog
ICogbmFuZF9jb21tYW5kIC0gW0RFRkFVTFRdIFNlbmQgY29tbWFuZCB0byBOQU5EIGRldmljZQog
ICogQG10ZDogTVREIGRldmljZSBzdHJ1Y3R1cmUKQEAgLTU0NiwxMyArNTcyLDggQEAgc3RhdGlj
IHZvaWQgbmFuZF9jb21tYW5kKHN0cnVjdCBtdGRfaW5mbyAqbXRkLCB1bnNpZ25lZCBpbnQgY29t
bWFuZCwKIAkvKiBBZGRyZXNzIGN5Y2xlLCB3aGVuIG5lY2Vzc2FyeSAqLwogCWN0cmwgPSBOQU5E
X0NUUkxfQUxFIHwgTkFORF9DVFJMX0NIQU5HRTsKIAkvKiBTZXJpYWxseSBpbnB1dCBhZGRyZXNz
ICovCi0JaWYgKGNvbHVtbiAhPSAtMSkgewotCQkvKiBBZGp1c3QgY29sdW1ucyBmb3IgMTYgYml0
IGJ1c3dpZHRoICovCi0JCWlmIChjaGlwLT5vcHRpb25zICYgTkFORF9CVVNXSURUSF8xNikKLQkJ
CWNvbHVtbiA+Pj0gMTsKLQkJY2hpcC0+Y21kX2N0cmwobXRkLCBjb2x1bW4sIGN0cmwpOwotCQlj
dHJsICY9IH5OQU5EX0NUUkxfQ0hBTkdFOwotCX0KKwlpZiAoY29sdW1uICE9IC0xKQorCQljdHJs
ID0gc2V0X2NvbHVtbihtdGQsIGNoaXAsIGNvbW1hbmQsIGNvbHVtbiwgOCwgY3RybCk7CiAJaWYg
KHBhZ2VfYWRkciAhPSAtMSkgewogCQljaGlwLT5jbWRfY3RybChtdGQsIHBhZ2VfYWRkciwgY3Ry
bCk7CiAJCWN0cmwgJj0gfk5BTkRfQ1RSTF9DSEFOR0U7CkBAIC02MzgsMTQgKzY1OSw5IEBAIHN0
YXRpYyB2b2lkIG5hbmRfY29tbWFuZF9scChzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgdW5zaWduZWQg
aW50IGNvbW1hbmQsCiAJCWludCBjdHJsID0gTkFORF9DVFJMX0NIQU5HRSB8IE5BTkRfTkNFIHwg
TkFORF9BTEU7CiAKIAkJLyogU2VyaWFsbHkgaW5wdXQgYWRkcmVzcyAqLwotCQlpZiAoY29sdW1u
ICE9IC0xKSB7Ci0JCQkvKiBBZGp1c3QgY29sdW1ucyBmb3IgMTYgYml0IGJ1c3dpZHRoICovCi0J
CQlpZiAoY2hpcC0+b3B0aW9ucyAmIE5BTkRfQlVTV0lEVEhfMTYpCi0JCQkJY29sdW1uID4+PSAx
OwotCQkJY2hpcC0+Y21kX2N0cmwobXRkLCBjb2x1bW4sIGN0cmwpOwotCQkJY3RybCAmPSB+TkFO
RF9DVFJMX0NIQU5HRTsKLQkJCWNoaXAtPmNtZF9jdHJsKG10ZCwgY29sdW1uID4+IDgsIGN0cmwp
OwotCQl9CisJCWlmIChjb2x1bW4gIT0gLTEpCisJCQljdHJsID0gc2V0X2NvbHVtbiAobXRkLCBj
aGlwLCBjb21tYW5kLCBjb2x1bW4sIDE2LAorCQkJCQkgICBjdHJsKTsKIAkJaWYgKHBhZ2VfYWRk
ciAhPSAtMSkgewogCQkJY2hpcC0+Y21kX2N0cmwobXRkLCBwYWdlX2FkZHIsIGN0cmwpOwogCQkJ
Y2hpcC0+Y21kX2N0cmwobXRkLCBwYWdlX2FkZHIgPj4gOCwKQEAgLTI3MzcsNyArMjc1Myw3IEBA
IHN0YXRpYyBpbnQgbmFuZF9vbmZpX3NldF9mZWF0dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwg
c3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAljaGlwLT5jbWRm
dW5jKG10ZCwgTkFORF9DTURfU0VUX0ZFQVRVUkVTLCBhZGRyLCAtMSk7Ci0JY2hpcC0+d3JpdGVf
YnVmKG10ZCwgc3ViZmVhdHVyZV9wYXJhbSwgT05GSV9TVUJGRUFUVVJFX1BBUkFNX0xFTik7CisJ
bmFuZF93cml0ZV9idWYobXRkLCBzdWJmZWF0dXJlX3BhcmFtLCBPTkZJX1NVQkZFQVRVUkVfUEFS
QU1fTEVOKTsKIAlzdGF0dXMgPSBjaGlwLT53YWl0ZnVuYyhtdGQsIGNoaXApOwogCWlmIChzdGF0
dXMgJiBOQU5EX1NUQVRVU19GQUlMKQogCQlyZXR1cm4gLUVJTzsKQEAgLTI3NjEsNyArMjc3Nyw3
IEBAIHN0YXRpYyBpbnQgbmFuZF9vbmZpX2dldF9mZWF0dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10
ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIAltZW1zZXQoc3ViZmVhdHVyZV9wYXJhbSwgMCwg
T05GSV9TVUJGRUFUVVJFX1BBUkFNX0xFTik7CiAKIAljaGlwLT5jbWRmdW5jKG10ZCwgTkFORF9D
TURfR0VUX0ZFQVRVUkVTLCBhZGRyLCAtMSk7Ci0JY2hpcC0+cmVhZF9idWYobXRkLCBzdWJmZWF0
dXJlX3BhcmFtLCBPTkZJX1NVQkZFQVRVUkVfUEFSQU1fTEVOKTsKKwluYW5kX3JlYWRfYnVmKG10
ZCwgc3ViZmVhdHVyZV9wYXJhbSwgT05GSV9TVUJGRUFUVVJFX1BBUkFNX0xFTik7CiAJcmV0dXJu
IDA7CiB9CiAKQEAgLTI4ODIsNyArMjg5OCw4IEBAIHN0YXRpYyBpbnQgbmFuZF9mbGFzaF9kZXRl
Y3Rfb25maShzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIAog
CWNoaXAtPmNtZGZ1bmMobXRkLCBOQU5EX0NNRF9QQVJBTSwgMCwgLTEpOwogCWZvciAoaSA9IDA7
IGkgPCAzOyBpKyspIHsKLQkJY2hpcC0+cmVhZF9idWYobXRkLCAodWludDhfdCAqKXAsIHNpemVv
ZigqcCkpOworCQkvKiBNdXN0IHJlYWQgd2l0aCA4LWJpdCB0cmFuc2ZlcnMgZXZlbiBvbiAxNi1i
aXQgZGV2aWNlczogKi8KKwkJbmFuZF9yZWFkX2J1ZihtdGQsICh1aW50OF90ICopcCwgc2l6ZW9m
ICgqcCkpOwogCQlpZiAob25maV9jcmMxNihPTkZJX0NSQ19CQVNFLCAodWludDhfdCAqKXAsIDI1
NCkgPT0KIAkJCQlsZTE2X3RvX2NwdShwLT5jcmMpKSB7CiAJCQlwcl9pbmZvKCJPTkZJIHBhcmFt
IHBhZ2UgJWQgdmFsaWRcbiIsIGkpOwpAQCAtMzIyNywxMSArMzI0NCw5IEBAIHN0YXRpYyBzdHJ1
Y3QgbmFuZF9mbGFzaF9kZXYgKm5hbmRfZ2V0X2ZsYXNoX3R5cGUoc3RydWN0IG10ZF9pbmZvICpt
dGQsCiAJCQlicmVhazsKIAogCWNoaXAtPm9uZmlfdmVyc2lvbiA9IDA7Ci0JaWYgKCF0eXBlLT5u
YW1lIHx8ICF0eXBlLT5wYWdlc2l6ZSkgewotCQkvKiBDaGVjayBpcyBjaGlwIGlzIE9ORkkgY29t
cGxpYW50ICovCi0JCWlmIChuYW5kX2ZsYXNoX2RldGVjdF9vbmZpKG10ZCwgY2hpcCwgJmJ1c3cp
KQotCQkJZ290byBpZGVudF9kb25lOwotCX0KKwkvKiBDaGVjayBpcyBjaGlwIGlzIE9ORkkgY29t
cGxpYW50ICovCisJaWYgKG5hbmRfZmxhc2hfZGV0ZWN0X29uZmkobXRkLCBjaGlwLCAmYnVzdykp
CisJCWdvdG8gaWRlbnRfZG9uZTsKIAogCWlmICghdHlwZS0+bmFtZSkKIAkJcmV0dXJuIEVSUl9Q
VFIoLUVOT0RFVik7Cg==
--047d7bdc9612c2c00704d80d7d71--
