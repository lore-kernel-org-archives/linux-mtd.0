Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PLXeV-0007tB-C6
	for linux-mtd@lists.infradead.org; Thu, 25 Nov 2010 08:58:04 +0000
Received: by qwc9 with SMTP id 9so713149qwc.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Nov 2010 00:58:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=sKOzXnr-CZLvu_XP4gm5y15pL0HxS+=-=2ij7@mail.gmail.com>
References: <AANLkTimwumfui-_T1ScDYwMLKbNh1ia-SDMUg56wTfN5@mail.gmail.com>
	<4CD11C03.3090207@parrot.com>
	<AANLkTimfxjrtV4eks5tK68h6TQ20soib+6gaTC+QyB4a@mail.gmail.com>
	<AANLkTinSj2vAJJjeSxF-rvq08OVsnw3YcpRSpuOfv9pQ@mail.gmail.com>
	<AANLkTikQtNwsPkJSkmpmC=kMZpmdqHDW0HROeUBNDOEi@mail.gmail.com>
	<1289646433.2218.22.camel@localhost>
	<1289649338.2218.42.camel@localhost>
	<AANLkTink+0WvCmQWwd4+Vf8TETjR5-6BsGU=a071Rk0+@mail.gmail.com>
	<AANLkTim7TT8ydMiSX8B2ehJP2kQ6jtGSnEZU98AZjWUf@mail.gmail.com>
	<AANLkTimHCBNCcc3suXv4kJ4+MXUSf5Tw2r876A7tqtoL@mail.gmail.com>
	<AANLkTinzqwsEFoG+Z0S0ep7JN3p4jHugkHhN-J19Y3cn@mail.gmail.com>
	<1290607959.2793.11.camel@localhost>
	<AANLkTinTpe=niqS87JRR4h53TJ803ohs3e2MwiVFstgR@mail.gmail.com>
	<AANLkTi=sKOzXnr-CZLvu_XP4gm5y15pL0HxS+=-=2ij7@mail.gmail.com>
Date: Thu, 25 Nov 2010 09:58:01 +0100
Message-ID: <AANLkTikSEH4SOTYv9oqniP6-pPtRc0Y=M2+8hvdAirRg@mail.gmail.com>
Subject: Re: Suggested patch: reset errno after isatty()
From: Ketil Froyn <ketil@froyn.name>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: multipart/mixed; boundary=00163631049196d4120495dccd76
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--00163631049196d4120495dccd76
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2010 at 10:36 PM, Mike Frysinger <vapier.adi@gmail.com> wro=
te:
>
> awesome. =A0can you post your signed-off-by tag and/or a proper git patch=
 please ?
> -mike

I'm pretty new to git. Hope this is right.

Cheers, Ketil

--00163631049196d4120495dccd76
Content-Type: text/x-diff; charset=US-ASCII;
	name="0001-mtd-utils-libmtd-legacy-code-OOB.patch"
Content-Disposition: attachment;
	filename="0001-mtd-utils-libmtd-legacy-code-OOB.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ggxesudv0

RnJvbSBhZWE2OTZhNDJkMTE4NTk4Y2E1ODIxODBhODljN2U1YzBmZTEzYjRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLZXRpbCBGcm95biA8a2V0aWxAZnJveW4ubmFtZT4KRGF0ZTog
VGh1LCAyNSBOb3YgMjAxMCAwOTo1MjoxMiArMDEwMApTdWJqZWN0OiBbUEFUQ0hdIG10ZC11dGls
czogbGlibXRkOiBsZWdhY3kgY29kZSBPT0IKCmxlZ2FjeV9nZXRfZGV2X2luZm8oKSBmb3Jnb3Qg
dG8gc2V0IHRoZSBPT0Igc2l6ZQoKU2lnbmVkLW9mZi1ieTogS2V0aWwgRnJveW4gPGtldGlsQGZy
b3luLm5hbWU+Ci0tLQogbGliL2xpYm10ZF9sZWdhY3kuYyB8ICAgIDEgKwogMSBmaWxlcyBjaGFu
Z2VkLCAxIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2xp
Ym10ZF9sZWdhY3kuYyBiL2xpYi9saWJtdGRfbGVnYWN5LmMKaW5kZXggNzQ4ODI3NS4uZDZjMzkz
OCAxMDA2NDQKLS0tIGEvbGliL2xpYm10ZF9sZWdhY3kuYworKysgYi9saWIvbGlibXRkX2xlZ2Fj
eS5jCkBAIC0yNjEsNiArMjYxLDcgQEAgaW50IGxlZ2FjeV9nZXRfZGV2X2luZm8oY29uc3QgY2hh
ciAqbm9kZSwgc3RydWN0IG10ZF9kZXZfaW5mbyAqbXRkKQogCW10ZC0+c2l6ZSA9IHVpLnNpemU7
CiAJbXRkLT5lYl9zaXplID0gdWkuZXJhc2VzaXplOwogCW10ZC0+bWluX2lvX3NpemUgPSB1aS53
cml0ZXNpemU7CisJbXRkLT5vb2Jfc2l6ZSA9IHVpLm9vYnNpemU7CiAKIAlpZiAobXRkLT5taW5f
aW9fc2l6ZSA8PSAwKSB7CiAJCWVycm1zZygibXRkJWQgKCVzKSBoYXMgaW5zYW5lIG1pbi4gSS9P
IHVuaXQgc2l6ZSAlZCIsCi0tIAoxLjcuMC40Cgo=
--00163631049196d4120495dccd76--
