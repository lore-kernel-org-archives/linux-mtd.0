Received: from mail-qe0-f44.google.com ([209.85.128.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXkWL-0000ev-Vt
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 03:49:26 +0000
Received: by mail-qe0-f44.google.com with SMTP id s14so109698qeb.3
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2013 20:49:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACwUX0ObapqNuV=D_8nMT6Pbr-PQhkC=ZfuVMWEOtGUcyzt8tg@mail.gmail.com>
References: <CACwUX0NbKtBCFrjKBFd307D6=EbBZQbE4w25GSAzop0FsBM2LQ@mail.gmail.com>
 <5181CF32.1090502@freescale.com>
 <CACwUX0M_CGStWih0qcR_8na-yMmvHrAaHxpYe4Y_Q5mx+jno+g@mail.gmail.com>
 <5181D25C.2080001@freescale.com>
 <CACwUX0ObapqNuV=D_8nMT6Pbr-PQhkC=ZfuVMWEOtGUcyzt8tg@mail.gmail.com>
Date: Wed, 1 May 2013 21:49:03 -0600
Message-ID: <CACwUX0N5dhEBU9S_g6ZUWjvoEWndU7L+4PrmiFRg5sZjmCG0DQ@mail.gmail.com>
Subject: Re: nand_base: fix for ONFI chips that do not support GET/SET FEATURES
From: David Mosberger-Tang <dmosberger@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: multipart/mixed; boundary=20cf3074d9ac96213604dbb41d65
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--20cf3074d9ac96213604dbb41d65
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable

Sorry, try this one instead.

  --david

On Wed, May 1, 2013 at 9:45 PM, David Mosberger-Tang
<dmosberger@gmail.com> wrote:
> Fine by me.
>
>   --david
>
>
> On Wed, May 1, 2013 at 8:41 PM, Huang Shijie <b32955@freescale.com> wrote=
:
>> =D3=DA 2013=C4=EA05=D4=C202=C8=D5 10:34, David Mosberger-Tang =D0=B4=B5=
=C0:
>>> +         !(le16_to_cpu(chip->onfi_params.opt_cmd) & 4))
>> it's better to add a macro to replace the hardcore '4', such as
>>
>> #define ONFI_OPT_CMD_SET_GET_FEAT (1 << 2)
>>
>> Just a suggestion. :)
>>
>> thanks
>> Huang Shijie
>>

--20cf3074d9ac96213604dbb41d65
Content-Type: text/plain; charset=US-ASCII; name="nand_base-features-fix-v2.diff.txt"
Content-Disposition: attachment;
	filename="nand_base-features-fix-v2.diff.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hg7e9rup1

bXRkOiBuYW5kX2Jhc2U6IE9ubHkgdXNlIEdFVC9TRVQgRkVBVFVSRVMgY29tbWFuZCBvbiBjaGlw
cyB0aGF0IHN1cHBvcnQgdGhlbS4KClNwYW5zaW9uJ3MgUzM0TUx4IGNoaXBzIHN1cHBvcnQgT05G
SSBidXQgbm90IHRoZSBHRVQvU0VUIEZFQVRVUkVTIGNhbGxzLgoKU2lnbmVkLW9mZi1ieTogRGF2
aWQgTW9zYmVyZ2VyIDxkbW9zYmVyZ2VyQGdtYWlsLmNvbT4KCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL25hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jhc2UuYwppbmRl
eCBkZmNkMGE1Li4xM2JkYjk2IDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL25hbmRfYmFz
ZS5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvbmFuZF9iYXNlLmMKQEAgLTI3MjAsNyArMjcyMCw5
IEBAIHN0YXRpYyBpbnQgbmFuZF9vbmZpX3NldF9mZWF0dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10
ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIHsKIAlpbnQgc3RhdHVzOwogCi0JaWYgKCFjaGlw
LT5vbmZpX3ZlcnNpb24pCisJaWYgKCFjaGlwLT5vbmZpX3ZlcnNpb24gfHwKKwkgICAgIShsZTE2
X3RvX2NwdShjaGlwLT5vbmZpX3BhcmFtcy5vcHRfY21kKQorCSAgICAgICYgT05GSV9PUFRfQ01E
X1NFVF9HRVRfRkVBVFVSRVMpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCWNoaXAtPmNtZGZ1bmMo
bXRkLCBOQU5EX0NNRF9TRVRfRkVBVFVSRVMsIGFkZHIsIC0xKTsKQEAgLTI3NDEsNyArMjc0Myw5
IEBAIHN0YXRpYyBpbnQgbmFuZF9vbmZpX3NldF9mZWF0dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10
ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIHN0YXRpYyBpbnQgbmFuZF9vbmZpX2dldF9mZWF0
dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIAkJCWlu
dCBhZGRyLCB1aW50OF90ICpzdWJmZWF0dXJlX3BhcmFtKQogewotCWlmICghY2hpcC0+b25maV92
ZXJzaW9uKQorCWlmICghY2hpcC0+b25maV92ZXJzaW9uIHx8CisJICAgICEobGUxNl90b19jcHUo
Y2hpcC0+b25maV9wYXJhbXMub3B0X2NtZCkKKwkgICAgICAmIE9ORklfT1BUX0NNRF9TRVRfR0VU
X0ZFQVRVUkVTKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAkvKiBjbGVhciB0aGUgc3ViIGZlYXR1
cmUgcGFyYW1ldGVycyAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tdGQvbmFuZC5oIGIv
aW5jbHVkZS9saW51eC9tdGQvbmFuZC5oCmluZGV4IGFiNjM2MzQuLjliOThhZjggMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvbXRkL25hbmQuaAorKysgYi9pbmNsdWRlL2xpbnV4L210ZC9uYW5k
LmgKQEAgLTIxNyw2ICsyMTcsOSBAQCBzdHJ1Y3QgbmFuZF9jaGlwOwogLyogT05GSSBzdWJmZWF0
dXJlIHBhcmFtZXRlcnMgbGVuZ3RoICovCiAjZGVmaW5lIE9ORklfU1VCRkVBVFVSRV9QQVJBTV9M
RU4JNAogCisvKiBPTkZJIG9wdGlvbmFsIGNvbW1hbmRzIFNFVC9HRVQgRkVBVFVSRVMgc3VwcG9y
dGVkPyAqLworI2RlZmluZSBPTkZJX09QVF9DTURfU0VUX0dFVF9GRUFUVVJFUwkoMSA8PCAyKQor
CiBzdHJ1Y3QgbmFuZF9vbmZpX3BhcmFtcyB7CiAJLyogcmV2IGluZm8gYW5kIGZlYXR1cmVzIGJs
b2NrICovCiAJLyogJ08nICdOJyAnRicgJ0knICAqLwo=
--20cf3074d9ac96213604dbb41d65--
