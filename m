Received: from na3sys009aog105.obsmtp.com ([74.125.149.75])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RELMu-0002QZ-Ih
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2011 13:30:42 +0000
Received: by mail-bw0-f47.google.com with SMTP id t8so641859bka.20
	for <linux-mtd@lists.infradead.org>;
	Thu, 13 Oct 2011 06:30:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20111012164837.GA13691@logfs.org>
References: <CA+Xn3W3-JCqMKjiXi2cLCGm_bHtRx8RPsc9P5BoOS6YmbGZmHw@mail.gmail.com>
	<20111012164837.GA13691@logfs.org>
Date: Thu, 13 Oct 2011 15:30:35 +0200
Message-ID: <CA+Xn3W18bwZWzdjmRzEDUCqe3bVHnmW-7bJ_wvaoXpJxO1KmjQ@mail.gmail.com>
Subject: Re: Make phram work with kernel cmdline args when built-in
From: "Fache, Herve" <h-fache@ti.com>
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>
Content-Type: multipart/mixed; boundary=00151758854040d35a04af2e25f4
Cc: linux-mtd@lists.infradead.org, Joern Engel <joern@lazybastard.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--00151758854040d35a04af2e25f4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi again J=C3=B6rn,

Please find attached a revised version of the patch.

On Wed, Oct 12, 2011 at 18:48, J=C3=B6rn Engel <joern@logfs.org> wrote:
> Looks good in principle.

Thanks :-)

> What I slightly dislike about this patch is the tiny differences
> between Ville Herva's and this one. =C2=A0In block2mtd those same lines a=
re
> added in a different place. =C2=A0While I don't care much where to put
> them, I see some value in having duplicated code stand out as
> duplicated code and not have subtle variations all over the place. =C2=A0=
So
> my preference would be to either change this patch or alternatively
> move the code in block2mtd as well.

Thanks for your politeness. I have now moved things in the same place
as the original patch for consistency.

> Same here. =C2=A0phram_setup_late may be a better name, but it is
> inconsistent with block2mtd_setup2.

Indeed, I have now renamed the function phram_setup2 in my patch.

> So while I have no preference for either of the two variants, I would
> like to keep the two drivers as similar as possible. =C2=A0Apart from tha=
t
> minor thing, nice work!

I have updated my patch rather than block2mtd, so we minimize the changes.

Thanks a lot for your help.
Herv=C3=A9

--
Texas Instruments France SA, 821 Avenue Jack Kilby, 06270 Villeneuve
Loubet. 036 420 040 R.C.S Antibes. Capital de EUR 753.920

--00151758854040d35a04af2e25f4
Content-Type: text/x-diff; charset=UTF-8;
	name="0001-phram-make-kernel-boot-command-line-arguments-work.patch"
Content-Disposition: attachment;
	filename="0001-phram-make-kernel-boot-command-line-arguments-work.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gtps4di20

RnJvbSBhNDI5MzBjNjM1ZDAwYWZhOWRhYjgwNDc2ZWFlOTY0MjEzNjk0NDU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/SGVydj1DMz1BOT0yMEZhY2hlPz0gPGgtZmFj
aGVAdGkuY29tPgpEYXRlOiBUdWUsIDQgT2N0IDIwMTEgMTg6MzU6NDYgKzAyMDAKU3ViamVjdDog
W1BBVENIXSBwaHJhbTogbWFrZSBrZXJuZWwgYm9vdCBjb21tYW5kIGxpbmUgYXJndW1lbnRzIHdv
cmsKTUlNRS1WZXJzaW9uOiAxLjAKQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVU
Ri04CkNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKClRoaXMgcGF0Y2ggaXMgYmFzZWQg
b24gVmlsbGUgSGVydmEncyBzaW1pbGFyIHBhdGNoIHRvIGJsb2NrMm10ZC4KClRyeWluZyB0byBw
YXNzIGtlcm5lbCBjb21tYW5kIGxpbmUgYXJndW1lbnRzIGF0IGJvb3QtdGltZSBkaWQgbm90IHdv
cmssIGFzCnBocmFtX3NldHVwKCkgd2FzIGNhbGxlZCBzbyBlYXJseSB0aGF0IGttYWxsb2MoKSB3
YXMgbm90IGZ1bmN0aW9uYWwuCgpUaGlzIHBhdGNoIG9ubHkgc2F2ZXMgdGhlIG9wdGlvbiBzdHJp
bmcgYXQgdGhlIGVhcmx5IGJvb3Qgc3RhZ2UsIGFuZCBwYXJzZXMKaXQgbGF0ZXIgd2hlbiBpbml0
X3BocmFtKCkgaXMgY2FsbGVkLgoKV2l0aCB0aGlzIHBhdGNoLCBJIGNhbiBib290IHdpdGggYSBz
dGF0aWNhbGx5LWNvbXBpbGVkIHBocmFtLCBhbmQgbW91bnQgYQpleHQyIHJvb3QgZnMgZnJvbSBw
aHlzaWNhbCBSQU0sIHdpdGhvdXQgdGhlIG5lZWQgZm9yIGEgaW5pdHJkLgoKU2lnbmVkLW9mZi1i
eTogSGVydsOpIEZhY2hlIDxoLWZhY2hlQHRpLmNvbT4KLS0tCiBkcml2ZXJzL210ZC9kZXZpY2Vz
L3BocmFtLmMgfCAgIDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LS0KIDEgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9kZXZpY2VzL3BocmFtLmMgYi9kcml2ZXJzL210ZC9kZXZp
Y2VzL3BocmFtLmMKaW5kZXggMjM0MjNiZC4uOTNjN2ViZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
dGQvZGV2aWNlcy9waHJhbS5jCisrKyBiL2RyaXZlcnMvbXRkL2RldmljZXMvcGhyYW0uYwpAQCAt
MjMzLDcgKzIzMywxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQga2lsbF9maW5hbF9uZXdsaW5lKGNo
YXIgKnN0cikKIAlyZXR1cm4gMTsJCVwKIH0gd2hpbGUgKDApCiAKLXN0YXRpYyBpbnQgcGhyYW1f
c2V0dXAoY29uc3QgY2hhciAqdmFsLCBzdHJ1Y3Qga2VybmVsX3BhcmFtICprcCkKKyNpZm5kZWYg
TU9EVUxFCitzdGF0aWMgaW50IHBocmFtX2luaXRfY2FsbGVkOworc3RhdGljIF9faW5pdGRhdGEg
Y2hhciBwaHJhbV9wYXJhbWxpbmVbNjQrMTIrMTJdOworI2VuZGlmCisKK3N0YXRpYyBpbnQgcGhy
YW1fc2V0dXAyKGNvbnN0IGNoYXIgKnZhbCkKIHsKIAljaGFyIGJ1Zls2NCsxMisxMl0sICpzdHIg
PSBidWY7CiAJY2hhciAqdG9rZW5bM107CkBAIC0yODIsMTMgKzI4Nyw0NyBAQCBzdGF0aWMgaW50
IHBocmFtX3NldHVwKGNvbnN0IGNoYXIgKnZhbCwgc3RydWN0IGtlcm5lbF9wYXJhbSAqa3ApCiAJ
cmV0dXJuIHJldDsKIH0KIAorc3RhdGljIGludCBwaHJhbV9zZXR1cChjb25zdCBjaGFyICp2YWws
IHN0cnVjdCBrZXJuZWxfcGFyYW0gKmtwKQoreworI2lmZGVmIE1PRFVMRQorCXJldHVybiBwaHJh
bV9zZXR1cDIodmFsKTsKKyNlbHNlCisJLyogSWYgbW9yZSBwYXJhbWV0ZXJzIGFyZSBsYXRlciBw
YXNzZWQgaW4gdmlhCisJICAgL3N5cy9tb2R1bGUvcGhyYW0vcGFyYW1ldGVycy9waHJhbQorCSAg
IGFuZCBpbml0X3BocmFtKCkgaGFzIGFscmVhZHkgYmVlbiBjYWxsZWQsCisJICAgd2UgY2FuIHBh
cnNlIHRoZSBhcmd1bWVudCBkaXJlY3RseS4gKi8KKworCWlmIChwaHJhbV9pbml0X2NhbGxlZCkK
KwkJcmV0dXJuIHBocmFtX3NldHVwMih2YWwpOworCisJLyogRHVyaW5nIGVhcmx5IGJvb3Qgc3Rh
Z2UsIHdlIG9ubHkgc2F2ZSB0aGUgcGFyYW1ldGVycworCSAgIGhlcmUuIFdlIG11c3QgcGFyc2Ug
dGhlbSBsYXRlcjogaWYgdGhlIHBhcmFtIHBhc3NlZAorCSAgIGZyb20ga2VybmVsIGJvb3QgY29t
bWFuZCBsaW5lLCBwaHJhbV9zZXR1cCgpIGlzCisJICAgY2FsbGVkIHNvIGVhcmx5IHRoYXQgaXQg
aXMgbm90IHBvc3NpYmxlIHRvIHJlc29sdmUKKwkgICB0aGUgZGV2aWNlIChrbWFsbG9jKCkgZmFp
bHMpLiBEZWZlciB0aGF0IHdvcmsgdG8KKwkgICBwaHJhbV9zZXR1cDIoKSwgY2FsbGVkIGJ5IGlu
aXRfcGhyYW0oKS4gKi8KKworCXN0cmxjcHkocGhyYW1fcGFyYW1saW5lLCB2YWwsIHNpemVvZihw
aHJhbV9wYXJhbWxpbmUpKTsKKworCXJldHVybiAwOworI2VuZGlmCit9CisKIG1vZHVsZV9wYXJh
bV9jYWxsKHBocmFtLCBwaHJhbV9zZXR1cCwgTlVMTCwgTlVMTCwgMDAwKTsKIE1PRFVMRV9QQVJN
X0RFU0MocGhyYW0sICJNZW1vcnkgcmVnaW9uIHRvIG1hcC4gXCJwaHJhbT08bmFtZT4sPHN0YXJ0
Piw8bGVuZ3RoPlwiIik7CiAKIAogc3RhdGljIGludCBfX2luaXQgaW5pdF9waHJhbSh2b2lkKQog
ewotCXJldHVybiAwOworCWludCByZXQgPSAwOworCisjaWZuZGVmIE1PRFVMRQorCWlmIChzdHJs
ZW4ocGhyYW1fcGFyYW1saW5lKSkKKwkJcmV0ID0gcGhyYW1fc2V0dXAyKHBocmFtX3BhcmFtbGlu
ZSk7CisJcGhyYW1faW5pdF9jYWxsZWQgPSAxOworI2VuZGlmCisKKwlyZXR1cm4gcmV0OwogfQog
CiBzdGF0aWMgdm9pZCBfX2V4aXQgY2xlYW51cF9waHJhbSh2b2lkKQotLSAKMS43LjAuNAoK
--00151758854040d35a04af2e25f4--
