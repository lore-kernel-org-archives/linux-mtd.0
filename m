Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oyno5-0000hk-Je
	for linux-mtd@lists.infradead.org; Thu, 23 Sep 2010 15:33:59 +0000
Received: by qyk34 with SMTP id 34so2748726qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 08:33:56 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <6E1A182A06054C5A99BD3C0D3202C24F@THOR>
References: <E73F778B634944A0B8D4333B7BD012E4@THOR>
	<AANLkTin2b-QovauogfjMZP_7KeChY5oWsMPFBAiC2ERE@mail.gmail.com>
	<74A5BE60138147F696E151AACD52EDEE@THOR>
	<AANLkTintkdKGpkUGMkgGbVK6Pb3cttspwnuPQR=DJxnm@mail.gmail.com>
	<D3A375B91F5944B38630B07214914DF8@THOR>
	<AANLkTinotjfB26VPmF7_vx8M1kX5cYMzygFMk8X6exww@mail.gmail.com>
	<341EADF720C14B4F86C63204D9C60723@THOR>
	<AANLkTikXbKZLFOCBDkrwgVPJEYTwF88xBtYFnwaTQH+5@mail.gmail.com>
	<6E1A182A06054C5A99BD3C0D3202C24F@THOR>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Thu, 23 Sep 2010 17:33:35 +0200
Message-ID: <AANLkTi=qZ_wYcHHfKjaJsvf-ODgnECDOTEHmuorpA7K2@mail.gmail.com>
Subject: Re: [Help] SST39VF6401B Support
To: =?UTF-8?Q?Fl=C3=A1vio_Silveira?= <fggs@terra.com.br>
Content-Type: multipart/mixed; boundary=0015175cb4a480927c0490eefd29
Cc: linux-mtd@lists.infradead.org, Yegor Yefremov <yegorslists@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0015175cb4a480927c0490eefd29
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2010/9/23 Fl=C3=A1vio Silveira <fggs@terra.com.br>:
> I think I might found something:
>
> In cfi_probe.c, starting at line 222, there are these lines:
>
> cfi_send_gen_cmd(0xaa, addr_unlock1, base, map, cfi, cfi->device_type,
> NULL);
> cfi_send_gen_cmd(0x55, addr_unlock2, base, map, cfi, cfi->device_type,
> NULL);
> cfi_send_gen_cmd(0x90, addr_unlock1, base, map, cfi, cfi->device_type,
> NULL);
>
> Which seems the correct way to CFI query the chip, but the last line is
> 0x90.
> Datasheet states that 0x90 is Software ID and CFI Query Entry is 0x98
>
> Could that be the problem?

No. This snippet comes from the function in charge of identifying the
chip and its capacities.

CFI Query Entry (0x98) is handled by cfi_qry_mode_on() in cfi_util.c.
Humm...
Could you try the attached patch ?

--=20
Guillaume LECERF
GeeXboX developer - www.geexbox.org

--0015175cb4a480927c0490eefd29
Content-Type: application/octet-stream;
	name="cfi_util-add-support-for-switc.patch"
Content-Disposition: attachment;
	filename="cfi_util-add-support-for-switc.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gefs8b7c0

Y2ZpX3V0aWw6IGFkZCBzdXBwb3J0IGZvciBzd2l0Y2hpbmcgU1NUIDM5VkY2NDAxQiBjaGlwcyBp
bnRvIFFSWSBtb2RlCgpGcm9tOiBHdWlsbGF1bWUgTEVDRVJGIDxnbGVjZXJmQGdtYWlsLmNvbT4K
ClNpZ25lZC1vZmYtYnk6IEd1aWxsYXVtZSBMRUNFUkYgPGdsZWNlcmZAZ21haWwuY29tPgotLS0K
IGRyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmMgfCAgICA3ICsrKysrKysKIDEgZmlsZXMgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCAwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbXRkL2NoaXBzL2NmaV91dGlsLmMgYi9kcml2ZXJzL210ZC9jaGlwcy9jZmlfdXRpbC5jCmlu
ZGV4IGU1MDNiMmMuLmU0MTU2MWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV91
dGlsLmMKKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwuYwpAQCAtNzcsNiArNzcsMTMg
QEAgaW50IF9feGlwcmFtIGNmaV9xcnlfbW9kZV9vbih1aW50MzJfdCBiYXNlLCBzdHJ1Y3QgbWFw
X2luZm8gKm1hcCwKIAljZmlfc2VuZF9nZW5fY21kKDB4OTgsIDB4NTU1NSwgYmFzZSwgbWFwLCBj
ZmksIGNmaS0+ZGV2aWNlX3R5cGUsIE5VTEwpOwogCWlmIChjZmlfcXJ5X3ByZXNlbnQobWFwLCBi
YXNlLCBjZmkpKQogCQlyZXR1cm4gMTsKKwkvKiAzOVZGNjQwMUIgKi8KKwljZmlfc2VuZF9nZW5f
Y21kKDB4RjAsIDAsIGJhc2UsIG1hcCwgY2ZpLCBjZmktPmRldmljZV90eXBlLCBOVUxMKTsKKwlj
Zmlfc2VuZF9nZW5fY21kKDB4QUEsIDB4NTU1LCBiYXNlLCBtYXAsIGNmaSwgY2ZpLT5kZXZpY2Vf
dHlwZSwgTlVMTCk7CisJY2ZpX3NlbmRfZ2VuX2NtZCgweDU1LCAweDJBQSwgYmFzZSwgbWFwLCBj
ZmksIGNmaS0+ZGV2aWNlX3R5cGUsIE5VTEwpOworCWNmaV9zZW5kX2dlbl9jbWQoMHg5OCwgMHg1
NTUsIGJhc2UsIG1hcCwgY2ZpLCBjZmktPmRldmljZV90eXBlLCBOVUxMKTsKKwlpZiAoY2ZpX3Fy
eV9wcmVzZW50KG1hcCwgYmFzZSwgY2ZpKSkKKwkJcmV0dXJuIDE7CiAJLyogUVJZIG5vdCBmb3Vu
ZCAqLwogCXJldHVybiAwOwogfQo=
--0015175cb4a480927c0490eefd29--
