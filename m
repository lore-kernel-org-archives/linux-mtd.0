Received: from forward11.mail.yandex.net ([95.108.130.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VSqDn-0008NJ-TS
 for linux-mtd@lists.infradead.org; Sun, 06 Oct 2013 15:26:17 +0000
From: Konstantin Tokarev <annulen@yandex.ru>
To: Elie De Brauwer <eliedebrauwer@gmail.com>,
 Brent Taylor <motobud@gmail.com>, Artem Bityutskiy <dedekind1@gmail.com>
In-Reply-To: <165301380997382@web12j.yandex.ru>
References: <CAGWqfihkGT5wWDoFGTtBHK31+Fvav8if6iy_jFJ7io1H_wktFA@mail.gmail.com>
 <165301380997382@web12j.yandex.ru>
Subject: Re: [PATCH v0.5] mtd-utils: mkfs.ubifs: Add support for LZ4HC
 compression
MIME-Version: 1.0
Message-Id: <47881381073118@web4j.yandex.ru>
Date: Sun, 06 Oct 2013 19:25:18 +0400
Content-Type: multipart/mixed;
	boundary="----==--bound.4789.web4j.yandex.ru"
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


------==--bound.4789.web4j.yandex.ru
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=koi8-r



05.10.2013, 22:24, "Konstantin Tokarev" <annulen@yandex.ru>:
> 05.10.2013, 18:48, "Elie De Brauwer" <eliedebrauwer@gmail.com>:
>
>> šAll,
>>
>> šAfter some time to do some testing this is a second version of the
>> šsame patch. Now lz4hc gets actually used. šHowever at this moment in
>> štime only improvement in terms of cpu time is seen, but lz4hc in this
>> šcontext seems to behave worse than LZO, on my local system:
>>
>> š-rw-r--r-- 1 edb šedb š28M Oct š5 16:22 imag.lz4hc
>> š-rw-r--r-- 1 root root 25M Oct š5 16:22 imag.lzo
>> š-rw-r--r-- 1 root root 43M Oct š5 16:11 imag.none
>> š-rw-r--r-- 1 root root 22M Oct š5 16:30 imag.zlib
>>
>> šThe only thing which comes immediately to mind is that due to the size
>> šof the chunks (in my case large block being compressed is 4k) lz4hc
>> šisn't starting to pay off ..
>
> Looks like it might be useful to have mixed lz4hc/lzo mode - lz4hc is faster,
> lzo provides better ratio, and both don't use additional memory for decompression.
> I did no speed benchmarks yet though.
>
> It also might be that lz4 has tuning parameters which may be useful for rootfs
> compression in case when most of files are not modified most of the times, i.e.
> trade compression time to space efficiency while keeping decompression speed.

In attached patch I've replaced "favor lz4hc" mode with lz4hc/lzo mix, depending
purely on which algorithm gives smaller size for the block. In my case it allowed
to get slightly smaller image size than lzo (27564 blocks were compressed with lzo
and 1054 - with lz4hc).

-- 
Regards,
Konstantin
------==--bound.4789.web4j.yandex.ru
Content-Disposition: attachment;
	filename="0001-LZ4HC-LZO-hybrid-compression.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-diff;
	name="0001-LZ4HC-LZO-hybrid-compression.patch"

RnJvbSBlMTEzNTk1ZTBiZDg0NWJiZDMzNDY4MDZjN2YxMGExN2ZiMDk5MjdjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLb25zdGFudGluIFRva2FyZXYgPGt0b2thcmV2QHNtYXJ0bGFi
cy50dj4KRGF0ZTogU3VuLCA2IE9jdCAyMDEzIDE5OjI0OjI3ICswNDAwClN1YmplY3Q6IFtQQVRD
SF0gTFo0SEMvTFpPIGh5YnJpZCBjb21wcmVzc2lvbgoKLS0tCiBta2ZzLnViaWZzL2NvbXByLmMg
fCAgIDUyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0KIDEgZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9ta2ZzLnViaWZzL2NvbXByLmMgYi9ta2ZzLnViaWZzL2NvbXByLmMKaW5kZXgg
MDkwMDY1My4uOGY2ZTA2ZSAxMDA2NDQKLS0tIGEvbWtmcy51Ymlmcy9jb21wci5jCisrKyBiL21r
ZnMudWJpZnMvY29tcHIuYwpAQCAtMTgyLDYgKzE4Miw1NCBAQCBzZWxlY3RfemxpYjoKIAlyZXR1
cm4gMDsKIH0KIAorc3RhdGljIGludCBsejRoY19sem9fY29tcHJlc3Modm9pZCAqaW5fYnVmLCBz
aXplX3QgaW5fbGVuLCB2b2lkICpvdXRfYnVmLAorCQkJICAgICAgc2l6ZV90ICpvdXRfbGVuLCBp
bnQgKnR5cGUpCit7CisJaW50IGx6NGhjX3JldCwgbHpvX3JldDsKKwlzaXplX3QgbHo0aGNfbGVu
LCBsem9fbGVuOworCisJbHo0aGNfbGVuID0gbHpvX2xlbiA9ICpvdXRfbGVuOworCWx6b19yZXQg
PSBsem9fY29tcHJlc3MoaW5fYnVmLCBpbl9sZW4sIHpsaWJfYnVmLCAmbHpvX2xlbik7CisJbHo0
aGNfcmV0ID0gbHo0aGNfY29tcHJlc3MoaW5fYnVmLCBpbl9sZW4sIG91dF9idWYsICZsejRoY19s
ZW4pOworCisJaWYgKGx6NGhjX3JldCAmJiBsem9fcmV0KQorCQkvKiBCb3RoIGNvbXByZXNzb3Jz
IGZhaWxlZCAqLworCQlyZXR1cm4gLTE7CisKKwlpZiAoIWx6NGhjX3JldCAmJiAhbHpvX3JldCkg
eworCQlkb3VibGUgcGVyY2VudDsKKworCQkvKiBCb3RoIGNvbXByZXNzb3JzIHN1Y2NlZWRlZCAq
LworCQlpZiAobHo0aGNfbGVuIDw9IGx6b19sZW4gKQorCQkJZ290byBzZWxlY3RfbHo0aGM7CisK
KwkJLypwZXJjZW50ID0gKGRvdWJsZSlsem9fbGVuIC8gKGRvdWJsZSlsejRoY19sZW47CisJCXBl
cmNlbnQgKj0gMTAwOworCQlpZiAocGVyY2VudCA+IDEwMCAtIGMtPmZhdm9yX3BlcmNlbnQpCisJ
CQlnb3RvIHNlbGVjdF9sejRoYzsqLworCQlnb3RvIHNlbGVjdF9sem87CisJfQorCisJaWYgKGx6
NGhjX3JldCkKKwkJLyogT25seSBsem8gY29tcHJlc3NvciBzdWNjZWVkZWQgKi8KKwkJZ290byBz
ZWxlY3RfbHpvOworCisJLyogT25seSBsejRoYyBjb21wcmVzc29yIHN1Y2NlZWRlZCAqLworCitz
ZWxlY3RfbHo0aGM6CisgICAgcHJpbnRmKCJsejRoY1xuIik7CisJKm91dF9sZW4gPSBsejRoY19s
ZW47CisJKnR5cGUgPSBNS0ZTX1VCSUZTX0NPTVBSX0xaNEhDOworCXJldHVybiAwOworCitzZWxl
Y3RfbHpvOgorICAgIHByaW50ZigibHpvXG4iKTsKKwkqb3V0X2xlbiA9IGx6b19sZW47CisJKnR5
cGUgPSBNS0ZTX1VCSUZTX0NPTVBSX0xaTzsKKwltZW1jcHkob3V0X2J1ZiwgemxpYl9idWYsIGx6
b19sZW4pOworCXJldHVybiAwOworfQorCiBpbnQgY29tcHJlc3NfZGF0YSh2b2lkICppbl9idWYs
IHNpemVfdCBpbl9sZW4sIHZvaWQgKm91dF9idWYsIHNpemVfdCAqb3V0X2xlbiwKIAkJICBpbnQg
dHlwZSkKIHsKQEAgLTE5Miw4ICsyNDAsMTAgQEAgaW50IGNvbXByZXNzX2RhdGEodm9pZCAqaW5f
YnVmLCBzaXplX3QgaW5fbGVuLCB2b2lkICpvdXRfYnVmLCBzaXplX3QgKm91dF9sZW4sCiAJCXJl
dHVybiBNS0ZTX1VCSUZTX0NPTVBSX05PTkU7CiAJfQogCi0JaWYgKGMtPmZhdm9yX2x6byB8fCBj
LT5mYXZvcl9sejRoYykKKwlpZiAoYy0+ZmF2b3JfbHpvKQogCQlyZXQgPSBmYXZvcl9hbHRfY29t
cHJlc3MoaW5fYnVmLCBpbl9sZW4sIG91dF9idWYsIG91dF9sZW4sICZ0eXBlLCBjLT5mYXZvcl9s
em8pOworCWVsc2UgaWYgKGMtPmZhdm9yX2x6NGhjKQorCQlyZXQgPSBsejRoY19sem9fY29tcHJl
c3MoaW5fYnVmLCBpbl9sZW4sIG91dF9idWYsIG91dF9sZW4sICZ0eXBlKTsKIAllbHNlIHsKIAkJ
c3dpdGNoICh0eXBlKSB7CiAJCWNhc2UgTUtGU19VQklGU19DT01QUl9MWjRIQzoKLS0gCjEuNy4y
LjUKCg==
------==--bound.4789.web4j.yandex.ru--
