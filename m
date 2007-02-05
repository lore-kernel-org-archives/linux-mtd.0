Received: from nf-out-0910.google.com ([64.233.182.186])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HDy1f-0004Qs-6e
	for linux-mtd@lists.infradead.org; Mon, 05 Feb 2007 02:12:38 -0500
Received: by nf-out-0910.google.com with SMTP id a4so774668nfc
	for <linux-mtd@lists.infradead.org>;
	Sun, 04 Feb 2007 23:12:29 -0800 (PST)
Message-ID: <c0526ddf0702042312v2041844by15a37fa57395d64e@mail.gmail.com>
Date: Sun, 4 Feb 2007 23:12:29 -0800
From: "Michael Marineau" <mike@marineau.org>
Sender: marineam@gmail.com
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: NAND diskonchip driver broken with NFTL DOC 2000
In-Reply-To: <1170436342.29759.555.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_50373_3008791.1170659549501"
References: <c0526ddf0701291710o65b9f786ifd1e579b75412cc2@mail.gmail.com>
	<1170436342.29759.555.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_50373_3008791.1170659549501
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2/2/07, David Woodhouse <dwmw2@infradead.org> wrote:
> On Mon, 2007-01-29 at 17:10 -0800, Michael Marineau wrote:
> > I have been having a bit of an adventure trying to get a DiskOnChip
> > 2000 (NFTL model) working properly with nandwrite/nanddump utilities
> > and jffs2.  With the current version in 2.6.20-rc6 nandwrite/nanddump
> > can properly read and write the main data area but writes to the oob
> > area didn't do anything and reads just got garbage.  jffs2 was
> > similar, generally working but could never find clearmarkes.
> >
> > If I use the generic nand_read/write_oob_std functions from
> > nand_base.c instead of nand_read/write_syndrome then
> > nandwrite/nanddump operates perfectly for both the data area and oob.
> > Unfortunatly with those oob functions swapped jffs2 is unhappy,
> > throwing ecc errors constantly.  I didn't check if jffs2 was able to
> > read the clearmarkers from oob.
>
> Does Artem's patch to use MTD_OOB_AUTO fix this?

Just gave that patch a try today and it fixed my jffs2 problems. So
that in combination with my previously mentioned trick fixes oob
access on this chip.  I'm attaching my hack patch, all it does is copy
the nand_read/write_oob_std functions from nand_base.c to diskonchip.c
and use them instead of the default syndrome functions on doc2000
chips. I don't have any other doc devices so I'm not sure if this
helps or breaks anything else.

-- 
Michael Marineau
Oregon State University
mike@marineau.org

------=_Part_50373_3008791.1170659549501
Content-Type: text/x-patch; name=diskonchip-oob-hack.patch;
	charset=ANSI_X3.4-1968
Content-Transfer-Encoding: base64
X-Attachment-Id: f_exskfefb
Content-Disposition: attachment; filename="diskonchip-oob-hack.patch"

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvZGlza29uY2hpcC5jIGIvZHJpdmVycy9tdGQv
bmFuZC9kaXNrb25jaGlwLmMKaW5kZXggMTI2MDhjMS4uOTE1MWU5MSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvbmFuZC9kaXNrb25jaGlwLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9kaXNrb25j
aGlwLmMKQEAgLTM5Niw2ICszOTYsMzQgQEAgc3RhdGljIGludCBkb2MyMDAwX3ZlcmlmeWJ1Zihz
dHJ1Y3QgbXRkXwogCXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IGRvYzIwMDBfcmVhZF9vb2Io
c3RydWN0IG10ZF9pbmZvICptdGQsIHN0cnVjdCBuYW5kX2NoaXAgKmNoaXAsCisJCQkgICAgIGlu
dCBwYWdlLCBpbnQgc25kY21kKQoreworCWlmIChzbmRjbWQpIHsKKwkJY2hpcC0+Y21kZnVuYyht
dGQsIE5BTkRfQ01EX1JFQURPT0IsIDAsIHBhZ2UpOworCQlzbmRjbWQgPSAwOworCX0KKwljaGlw
LT5yZWFkX2J1ZihtdGQsIGNoaXAtPm9vYl9wb2ksIG10ZC0+b29ic2l6ZSk7CisJcmV0dXJuIHNu
ZGNtZDsKK30KKworc3RhdGljIGludCBkb2MyMDAwX3dyaXRlX29vYihzdHJ1Y3QgbXRkX2luZm8g
Km10ZCwgc3RydWN0IG5hbmRfY2hpcCAqY2hpcCwKKwkJCSAgICAgIGludCBwYWdlKQoreworCWlu
dCBzdGF0dXMgPSAwOworCWNvbnN0IHVpbnQ4X3QgKmJ1ZiA9IGNoaXAtPm9vYl9wb2k7CisJaW50
IGxlbmd0aCA9IG10ZC0+b29ic2l6ZTsKKworCWNoaXAtPmNtZGZ1bmMobXRkLCBOQU5EX0NNRF9T
RVFJTiwgbXRkLT53cml0ZXNpemUsIHBhZ2UpOworCWNoaXAtPndyaXRlX2J1ZihtdGQsIGJ1Ziwg
bGVuZ3RoKTsKKwkvKiBTZW5kIGNvbW1hbmQgdG8gcHJvZ3JhbSB0aGUgT09CIGRhdGEgKi8KKwlj
aGlwLT5jbWRmdW5jKG10ZCwgTkFORF9DTURfUEFHRVBST0csIC0xLCAtMSk7CisKKwlzdGF0dXMg
PSBjaGlwLT53YWl0ZnVuYyhtdGQsIGNoaXApOworCisJcmV0dXJuIHN0YXR1cyAmIE5BTkRfU1RB
VFVTX0ZBSUwgPyAtRUlPIDogMDsKK30KKwogc3RhdGljIHVpbnQxNl90IF9faW5pdCBkb2MyMDB4
X2lkZW50X2NoaXAoc3RydWN0IG10ZF9pbmZvICptdGQsIGludCBucikKIHsKIAlzdHJ1Y3QgbmFu
ZF9jaGlwICp0aGlzID0gbXRkLT5wcml2OwpAQCAtMTY2Niw2ICsxNjk0LDEyIEBAIHN0YXRpYyBp
bnQgX19pbml0IGRvY19wcm9iZSh1bnNpZ25lZCBsb24KIAluYW5kLT5lY2MuYnl0ZXMJCT0gNjsK
IAluYW5kLT5vcHRpb25zCQk9IE5BTkRfVVNFX0ZMQVNIX0JCVDsKIAorCS8qIFVoLCBubyBpZGVh
IHdoYXQgdGhlIGNvcnJlY3QgY29uZGl0aW9uIGlzLiAqLworCWlmIChDaGlwSUQgPT0gRE9DX0No
aXBJRF9Eb2MyaykgeworCQluYW5kLT5lY2MucmVhZF9vb2IgPSBkb2MyMDAwX3JlYWRfb29iOwor
CQluYW5kLT5lY2Mud3JpdGVfb29iID0gZG9jMjAwMF93cml0ZV9vb2I7CisJfQorCiAJZG9jLT5w
aHlzYWRyCQk9IHBoeXNhZHI7CiAJZG9jLT52aXJ0YWRyCQk9IHZpcnRhZHI7CiAJZG9jLT5DaGlw
SUQJCT0gQ2hpcElEOwo=
------=_Part_50373_3008791.1170659549501--
