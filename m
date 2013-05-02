Received: from mail-qc0-x231.google.com ([2607:f8b0:400d:c01::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UXjMI-0008NC-U7
 for linux-mtd@lists.infradead.org; Thu, 02 May 2013 02:34:59 +0000
Received: by mail-qc0-f177.google.com with SMTP id d10so69453qca.8
 for <linux-mtd@lists.infradead.org>; Wed, 01 May 2013 19:34:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5181CF32.1090502@freescale.com>
References: <CACwUX0NbKtBCFrjKBFd307D6=EbBZQbE4w25GSAzop0FsBM2LQ@mail.gmail.com>
 <5181CF32.1090502@freescale.com>
Date: Wed, 1 May 2013 20:34:34 -0600
Message-ID: <CACwUX0M_CGStWih0qcR_8na-yMmvHrAaHxpYe4Y_Q5mx+jno+g@mail.gmail.com>
Subject: Re: nand_base: fix for ONFI chips that do not support GET/SET FEATURES
From: David Mosberger-Tang <dmosberger@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: multipart/mixed; boundary=20cf3074d2d82c261a04dbb313f9
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

--20cf3074d2d82c261a04dbb313f9
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable

Sure.  C99-style comments replaced with old-style comments...

  --david


On Wed, May 1, 2013 at 8:28 PM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA05=D4=C201=C8=D5 07:39, David Mosberger-Tang =D0=B4=B5=
=C0:
>
>> The attached patch is relative to linux-mtd.  It fixes a problem with
>> NAND-chips that are ONFI-compliant but don't support the SET/GET
>> FEATURES commands (such as Spansion S34Mx).
>>
> good catch.
>
> but could you check your patch with scripts/checkpatch.pl , and then
> send out this patch?
>
> thanks
> Huang Shijie
>
>

--20cf3074d2d82c261a04dbb313f9
Content-Type: text/plain; charset=US-ASCII; name="nand_base-features-fix.diff.txt"
Content-Disposition: attachment; filename="nand_base-features-fix.diff.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hg7blsyx0

bXRkOiBuYW5kX2Jhc2U6IE9ubHkgdXNlIEdFVC9TRVQgRkVBVFVSRVMgY29tbWFuZCBvbiBjaGlw
cyB0aGF0IHN1cHBvcnQgdGhlbS4KClNwYW5zaW9uJ3MgUzM0TUx4IGNoaXBzIHN1cHBvcnQgT05G
SSBidXQgbm90IHRoZSBHRVQvU0VUIEZFQVRVUkVTIGNhbGxzLgoKU2lnbmVkLW9mZi1ieTogRGF2
aWQgTW9zYmVyZ2VyIDxkbW9zYmVyZ2VyQGdtYWlsLmNvbT4KCmRpZmYgLS1naXQgYS9kcml2ZXJz
L210ZC9uYW5kL25hbmRfYmFzZS5jIGIvZHJpdmVycy9tdGQvbmFuZC9uYW5kX2Jhc2UuYwppbmRl
eCBkZmNkMGE1Li4xM2M4MDQzIDEwMDY0NAotLS0gYS9kcml2ZXJzL210ZC9uYW5kL25hbmRfYmFz
ZS5jCisrKyBiL2RyaXZlcnMvbXRkL25hbmQvbmFuZF9iYXNlLmMKQEAgLTI3MjAsNyArMjcyMCw5
IEBAIHN0YXRpYyBpbnQgbmFuZF9vbmZpX3NldF9mZWF0dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10
ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIHsKIAlpbnQgc3RhdHVzOwogCi0JaWYgKCFjaGlw
LT5vbmZpX3ZlcnNpb24pCisJaWYgKCFjaGlwLT5vbmZpX3ZlcnNpb24gfHwKKwkgICAgLyogc3Vw
cG9ydHMgR0VUL1NFVCBGRUFUVVJFUz8gKi8KKwkgICAgIShsZTE2X3RvX2NwdShjaGlwLT5vbmZp
X3BhcmFtcy5vcHRfY21kKSAmIDQpKQogCQlyZXR1cm4gLUVJTlZBTDsKIAogCWNoaXAtPmNtZGZ1
bmMobXRkLCBOQU5EX0NNRF9TRVRfRkVBVFVSRVMsIGFkZHIsIC0xKTsKQEAgLTI3NDEsNyArMjc0
Myw5IEBAIHN0YXRpYyBpbnQgbmFuZF9vbmZpX3NldF9mZWF0dXJlcyhzdHJ1Y3QgbXRkX2luZm8g
Km10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIHN0YXRpYyBpbnQgbmFuZF9vbmZpX2dldF9m
ZWF0dXJlcyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKIAkJ
CWludCBhZGRyLCB1aW50OF90ICpzdWJmZWF0dXJlX3BhcmFtKQogewotCWlmICghY2hpcC0+b25m
aV92ZXJzaW9uKQorCWlmICghY2hpcC0+b25maV92ZXJzaW9uIHx8CisJICAgIC8qIHN1cHBvcnRz
IEdFVC9TRVQgRkVBVFVSRVM/ICovCisJICAgICEobGUxNl90b19jcHUoY2hpcC0+b25maV9wYXJh
bXMub3B0X2NtZCkgJiA0KSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAkvKiBjbGVhciB0aGUgc3Vi
IGZlYXR1cmUgcGFyYW1ldGVycyAqLwo=
--20cf3074d2d82c261a04dbb313f9--
