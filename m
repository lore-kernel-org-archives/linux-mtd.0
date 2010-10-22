Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P9JEN-0000Xk-Q7
	for linux-mtd@lists.infradead.org; Fri, 22 Oct 2010 15:08:32 +0000
Received: by wyf22 with SMTP id 22so1053967wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Oct 2010 08:08:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTikG5KWJwm2MFCX+-j2f4JiVTsiG1qsgh4T8aoZQ@mail.gmail.com>
References: <AANLkTinaRHUmLHeTqcDeVMDQyHfYm7B6vPbUGVkebK2_@mail.gmail.com>
	<20101016100744.GA10815@pengutronix.de>
	<AANLkTikOKx7hhF9jffRF+HvfwYFDghZAzNBgO-pZpAFv@mail.gmail.com>
	<20101016131752.GA2676@pengutronix.de>
	<AANLkTim+RBZRsYFyqXRD65tPw69s3rKogEnBFBQr4E5q@mail.gmail.com>
	<20101018114104.GC15440@pengutronix.de>
	<AANLkTimcpMb6-VykL0jSsocVF4z19TLMUi4c6dvvbNtF@mail.gmail.com>
	<AANLkTi=jNvWZe-bED0fZa-XbvoLmpu7VcFN7nUN=4Tru@mail.gmail.com>
	<AANLkTinLTW25faUTBfKBVcpFXFrtv1UhWWDN9Dgm1jOH@mail.gmail.com>
	<AANLkTiknoWR_v-TfV5M5ZwsV3Lsk=EDDD185kXp4B96V@mail.gmail.com>
	<AANLkTin-4fGYzD8a9rDp9M7YEk1y7JbXmZVLjA=3iU3Q@mail.gmail.com>
	<AANLkTimwhvNmfz5rVjzCTc5_GaNzCg185v+NLD6bLgno@mail.gmail.com>
	<AANLkTinjcF_4wDGXN+Jg43Pjq=iM++1YQ9+evHrgxPaa@mail.gmail.com>
	<AANLkTinr5E2E4Nth_-XybNPKfHnrgSFPWtVqxkMdQa-Y@mail.gmail.com>
	<AANLkTi=NKDPhdoDYE0ZdM2tuqWdFBNbui1AHZw_wXx97@mail.gmail.com>
	<AANLkTikG5KWJwm2MFCX+-j2f4JiVTsiG1qsgh4T8aoZQ@mail.gmail.com>
Date: Fri, 22 Oct 2010 23:07:20 +0800
Message-ID: <AANLkTimrtKYLi9trbM7+t7gLqsSTme=_t--7nxdLkmAd@mail.gmail.com>
Subject: Re: Re :Re: [Help] SST39VF6401B Support
From: yidong zhang <zhangyd6@gmail.com>
To: Guillaume LECERF <glecerf@gmail.com>
Content-Type: multipart/mixed; boundary=0016367f9696ca330f049335ff2c
Cc: taliaferro62@gmail.com, yegorslists@googlemail.com,
	linux-mtd@lists.infradead.org,
	Wolfram Sang <w.sang@pengutronix.de>, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0016367f9696ca330f049335ff2c
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 22, 2010 at 6:41 PM, Guillaume LECERF <glecerf@gmail.com> wrote=
:
> 2010/10/22 yidong zhang <zhangyd6@gmail.com>:
>>> You didn't applied my latest patch, you would have only 1 erase region
>>> if you did.
>> =A0It was printed by the print_cfi_ident function. And the region
>> number is readed from the flash. So there was 2 erase region
>
> OK, my bad :(
>
> The datasheet is really f***ed up.
>
> "Sector Information (y + 1 =3D Number of sectors; z x 256B =3D sector siz=
e)
> y =3D 2047 + 1 =3D 2048 sectors (03FFH =3D 1023)
> z =3D 32 x 256 Bytes =3D 8 KBytes/sector (0100H =3D 32)"
>
> 03FFH =3D 1023, so y =3D 1023 + 1 =3D 1024 sectors
> 0100H =3D 256 (not 32), so z =3D 256 x 256 =3D 64 KBytes/sector
>
> I think we should modify the sector size on the fly, i.e. changing
> 0100h to 0020h (32).
>
> Could you try setting cif->cfiq->EraseRegionInfo[0] to 0x02003FF in
> fixup_sst39vf_rev_b() ?
>
Hi
  how about this attached patch.

> --
> Guillaume LECERF
> GeeXboX developer - www.geexbox.org
>

--0016367f9696ca330f049335ff2c
Content-Type: application/octet-stream;
	name="0001-mtd-cfi_cmdset_0002-add-CFI-detection-for-SST-38VF64.patch"
Content-Disposition: attachment;
	filename="0001-mtd-cfi_cmdset_0002-add-CFI-detection-for-SST-38VF64.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gfl71dy70

RnJvbSBkNDBlNjU4NDU0NjMxNDQzN2JiMzRjYzJlMzZhZGE0OWViNTE0MTNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiB6aGFuZ3lkIDx6aGFuZ3lkNkBnbWFpbC5jb20+CkRhdGU6IEZy
aSwgMjIgT2N0IDIwMTAgMjI6NTk6NDIgLTA0MDAKU3ViamVjdDogW1BBVENIXSBtdGQ6IGNmaV9j
bWRzZXRfMDAwMjogYWRkIENGSSBkZXRlY3Rpb24gZm9yIFNTVCAzOFZGNjQweCBjaGlwcwoKQWRk
IHN1cHBvcnQgZm9yIFNTVDM4VkY2NDB4IGNoaXBzIGluIENGSSBtb2RlLgoKU2lnbmVkLW9mZi1i
eTogeWlkb25nIHpoYW5nIDx6aGFuZ3lkNkBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9tdGQvY2hp
cHMvY2ZpX2NtZHNldF8wMDAyLmMgfCAgIDEwICsrKysrKysrKysKIDEgZmlsZXMgY2hhbmdlZCwg
MTAgaW5zZXJ0aW9ucygrKSwgMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9jaGlwcy9jZmlfY21kc2V0XzAwMDIuYyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRf
MDAwMi5jCmluZGV4IDNlNmM0N2IuLjdjZThkYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2No
aXBzL2NmaV9jbWRzZXRfMDAwMi5jCisrKyBiL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRf
MDAwMi5jCkBAIC0yOTEsNiArMjkxLDEyIEBAIHN0YXRpYyB2b2lkIGZpeHVwX3NzdDM5dmZfcmV2
X2Ioc3RydWN0IG10ZF9pbmZvICptdGQsIHZvaWQgKnBhcmFtKQogCiAJY2ZpLT5hZGRyX3VubG9j
azEgPSAweDU1NTsKIAljZmktPmFkZHJfdW5sb2NrMiA9IDB4MkFBOworCQorCWlmICgoKGNmaS0+
Y2ZpcS0+RXJhc2VSZWdpb25JbmZvWzBdID4+IDgpICYgfjB4ZmYpID09IDB4MTAwMDApIHsKKwkJ
Y2ZpLT5jZmlxLT5FcmFzZVJlZ2lvbkluZm9bMF0gPSAweDAyMDAzZmY7CisJCXByX3dhcm5pbmco
IiVzOiBCYWQgU1NUMzhWRjY0MFggQ0ZJIGRhdGEsIGFkanVzdCBvbmUgc2VjdG9yCVwKKwkJCXNp
emUgIGZyb20gNjRLQnl0ZXMgdG8gOEtCeXRlcyIsIG10ZC0+bmFtZSk7CisJfQogfQogCiBzdGF0
aWMgdm9pZCBmaXh1cF9zMjlnbDA2NG5fc2VjdG9ycyhzdHJ1Y3QgbXRkX2luZm8gKm10ZCwgdm9p
ZCAqcGFyYW0pCkBAIC0zMjUsNiArMzMxLDEwIEBAIHN0YXRpYyBzdHJ1Y3QgY2ZpX2ZpeHVwIGNm
aV9ub3ByaV9maXh1cF90YWJsZVtdID0gewogCXsgQ0ZJX01GUl9TU1QsIDB4MjM1RCwgZml4dXBf
c3N0Mzl2Zl9yZXZfYiwgTlVMTCwgfSwgLy8gU1NUMzlWRjMyMDFCCiAJeyBDRklfTUZSX1NTVCwg
MHgyMzZDLCBmaXh1cF9zc3QzOXZmX3Jldl9iLCBOVUxMLCB9LCAvLyBTU1QzOVZGNjQwMkIKIAl7
IENGSV9NRlJfU1NULCAweDIzNkQsIGZpeHVwX3NzdDM5dmZfcmV2X2IsIE5VTEwsIH0sIC8vIFNT
VDM5VkY2NDAxQgorCXsgQ0ZJX01GUl9TU1QsIDB4NTM2QSwgZml4dXBfc3N0Mzl2Zl9yZXZfYiwg
TlVMTCwgfSwgLyogU1NUMzhWRjY0MDIgKi8KKwl7IENGSV9NRlJfU1NULCAweDUzNkIsIGZpeHVw
X3NzdDM5dmZfcmV2X2IsIE5VTEwsIH0sIC8qIFNTVDM4VkY2NDAxICovCisJeyBDRklfTUZSX1NT
VCwgMHg1MzZDLCBmaXh1cF9zc3QzOXZmX3Jldl9iLCBOVUxMLCB9LCAvKiBTU1QzOFZGNjQwNCAq
LworCXsgQ0ZJX01GUl9TU1QsIDB4NTM2RCwgZml4dXBfc3N0Mzl2Zl9yZXZfYiwgTlVMTCwgfSwg
LyogU1NUMzhWRjY0MDMgKi8KIAl7IDAsIDAsIE5VTEwsIE5VTEwgfQogfTsKIAotLSAKMS43LjIu
MwoK
--0016367f9696ca330f049335ff2c--
