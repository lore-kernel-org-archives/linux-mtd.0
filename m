Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dzPLF-0004U7-Rt
 for linux-mtd@lists.infradead.org; Tue, 03 Oct 2017 15:42:44 +0000
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Issue with encrypted filenames on UBIFS
From: David Gstir <david@sigma-star.at>
In-Reply-To: <CAFadFHRqVe5SmQBZAaFHt2d6+GY5p1mbE9_G40AApfK29oHh8Q@mail.gmail.com>
Date: Tue, 3 Oct 2017 17:42:18 +0200
Cc: linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <34D12043-D369-458C-BEEA-B0B7463B3242@sigma-star.at>
References: <CAFadFHRqVe5SmQBZAaFHt2d6+GY5p1mbE9_G40AApfK29oHh8Q@mail.gmail.com>
To: Nicolas Feignon <nicolas.feignon@mobile-devices.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nicolas,

> On 3 Oct 2017, at 15:01, Nicolas Feignon =
<nicolas.feignon@mobile-devices.fr> wrote:
>=20
> Hi,
>=20
> I'm encountering an issue with filesystem encryption on UBIFS. I'm =
using Kernel
> 4.13.3.
>=20
> The encryption of filenames does not work correctly for filenames of =
more that
> 16 characters. It works fine if the names are shorter. Here's what I =
get:
>=20
> [~/writeDir]# touch aaaaaaaaaaaaaaaa # 16 characters
> [~/writeDir]# ls
> ls: cannot access aaaaaaaaaaaaaaaa>*0=D1=90L9: No such file or =
directory
> aaaaaaaaaaaaaaaa?>??*0?????n??L9
>=20
> I set the policy with:
> [~]# openssl rand 64 > key
> [~]# fscryptctl insert_key < key
> a5bb6bff407f6f67
> [~]# fscryptctl set_policy a5bb6bff407f6f67 writeDir/
>=20
> I get the issue for all encryption modes and padding values altough =
the length
> of filenames at which it doesn't work varies.
> With the default padding of 32 and AES-256-CTS encryption mode, it =
does not
> work for length >=3D 16 and <=3D 32, length >=3D 48 and <=3D 64...
>=20
> I took a look at fs/crypto/fname.c but I can't figure out the problem. =
It seems
> like it's an overflow somewhere.

Do you use a hardware crypto accelerator for AES? I saw the same issue =
with the CAAM driver (see issue 1 here [1]) some time ago.

Specifically, the blockcipher driver code is required to update ->iv of =
skcipher_request after encryption/decryption. This is used by the =
CTS-mode code. Here's the fix that got merged for the CAAM driver [2].

- David

[1] https://marc.info/?l=3Dlinux-crypto-vger&m=3D149640631518134&w=3D2
[2] https://marc.info/?l=3Dlinux-crypto-vger&m=3D149865646825902&w=3D2=
