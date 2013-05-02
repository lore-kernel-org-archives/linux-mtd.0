Received: from mail-qe0-f51.google.com ([209.85.128.51])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXkTJ-0000dv-9u
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 03:46:18 +0000
Received: by mail-qe0-f51.google.com with SMTP id x7so107384qeu.24
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2013 20:45:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5181D25C.2080001@freescale.com>
References: <CACwUX0NbKtBCFrjKBFd307D6=EbBZQbE4w25GSAzop0FsBM2LQ@mail.gmail.com>
 <5181CF32.1090502@freescale.com>
 <CACwUX0M_CGStWih0qcR_8na-yMmvHrAaHxpYe4Y_Q5mx+jno+g@mail.gmail.com>
 <5181D25C.2080001@freescale.com>
Date: Wed, 1 May 2013 21:45:55 -0600
Message-ID: <CACwUX0ObapqNuV=D_8nMT6Pbr-PQhkC=ZfuVMWEOtGUcyzt8tg@mail.gmail.com>
Subject: Re: nand_base: fix for ONFI chips that do not support GET/SET FEATURES
From: David Mosberger-Tang <dmosberger@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: multipart/mixed; boundary=20cf3074d2d86271a504dbb4120d
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

--20cf3074d2d86271a504dbb4120d
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable

Fine by me.

  --david


On Wed, May 1, 2013 at 8:41 PM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA05=D4=C202=C8=D5 10:34, David Mosberger-Tang =D0=B4=B5=
=C0:
>> +         !(le16_to_cpu(chip->onfi_params.opt_cmd) & 4))
> it's better to add a macro to replace the hardcore '4', such as
>
> #define ONFI_OPT_CMD_SET_GET_FEAT (1 << 2)
>
> Just a suggestion. :)
>
> thanks
> Huang Shijie
>

--20cf3074d2d86271a504dbb4120d
Content-Type: text/plain; charset=US-ASCII; name="nand_base-features-fix-v2.diff.txt"
Content-Disposition: attachment;
	filename="nand_base-features-fix-v2.diff.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hg7e5qxi0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvbmFuZF9iYXNlLmMgYi9kcml2ZXJzL210ZC9u
YW5kL25hbmRfYmFzZS5jCmluZGV4IGRmY2QwYTUuLmRiMzEzNTcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbXRkL25hbmQvbmFuZF9iYXNlLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jhc2Uu
YwpAQCAtMjcyMCw3ICsyNzIwLDggQEAgc3RhdGljIGludCBuYW5kX29uZmlfc2V0X2ZlYXR1cmVz
KHN0cnVjdCBtdGRfaW5mbyAqbXRkLCBzdHJ1Y3QgbmFuZF9jaGlwICpjaGlwLAogewogCWludCBz
dGF0dXM7CiAKLQlpZiAoIWNoaXAtPm9uZmlfdmVyc2lvbikKKwlpZiAoIWNoaXAtPm9uZmlfdmVy
c2lvbiB8fAorCSAgICAhKGxlMTZfdG9fY3B1KGNoaXAtPm9uZmlfcGFyYW1zLm9wdF9jbWQpICYg
T05GSV9PUFRfQ01EX1NFVF9HRVRfRkVBVFVSRVMpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCWNo
aXAtPmNtZGZ1bmMobXRkLCBOQU5EX0NNRF9TRVRfRkVBVFVSRVMsIGFkZHIsIC0xKTsKQEAgLTI3
NDEsNyArMjc0Miw4IEBAIHN0YXRpYyBpbnQgbmFuZF9vbmZpX3NldF9mZWF0dXJlcyhzdHJ1Y3Qg
bXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIHN0YXRpYyBpbnQgbmFuZF9v
bmZpX2dldF9mZWF0dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAq
Y2hpcCwKIAkJCWludCBhZGRyLCB1aW50OF90ICpzdWJmZWF0dXJlX3BhcmFtKQogewotCWlmICgh
Y2hpcC0+b25maV92ZXJzaW9uKQorCWlmICghY2hpcC0+b25maV92ZXJzaW9uIHx8CisJICAgICEo
bGUxNl90b19jcHUoY2hpcC0+b25maV9wYXJhbXMub3B0X2NtZCkgJiBPTkZJX09QVF9DTURfU0VU
X0dFVF9GRUFUVVJFUykpCiAJCXJldHVybiAtRUlOVkFMOwogCiAJLyogY2xlYXIgdGhlIHN1YiBm
ZWF0dXJlIHBhcmFtZXRlcnMgKi8KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbXRkL25hbmQu
aCBiL2luY2x1ZGUvbGludXgvbXRkL25hbmQuaAppbmRleCBhYjYzNjM0Li45Yjk4YWY4IDEwMDY0
NAotLS0gYS9pbmNsdWRlL2xpbnV4L210ZC9uYW5kLmgKKysrIGIvaW5jbHVkZS9saW51eC9tdGQv
bmFuZC5oCkBAIC0yMTcsNiArMjE3LDkgQEAgc3RydWN0IG5hbmRfY2hpcDsKIC8qIE9ORkkgc3Vi
ZmVhdHVyZSBwYXJhbWV0ZXJzIGxlbmd0aCAqLwogI2RlZmluZSBPTkZJX1NVQkZFQVRVUkVfUEFS
QU1fTEVOCTQKIAorLyogT05GSSBvcHRpb25hbCBjb21tYW5kcyBTRVQvR0VUIEZFQVRVUkVTIHN1
cHBvcnRlZD8gKi8KKyNkZWZpbmUgT05GSV9PUFRfQ01EX1NFVF9HRVRfRkVBVFVSRVMJKDEgPDwg
MikKKwogc3RydWN0IG5hbmRfb25maV9wYXJhbXMgewogCS8qIHJldiBpbmZvIGFuZCBmZWF0dXJl
cyBibG9jayAqLwogCS8qICdPJyAnTicgJ0YnICdJJyAgKi8K
--20cf3074d2d86271a504dbb4120d--
