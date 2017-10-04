Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dzmfG-0008Nr-11
 for linux-mtd@lists.infradead.org; Wed, 04 Oct 2017 16:36:56 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: Issue with encrypted filenames on UBIFS
From: David Gstir <david@sigma-star.at>
In-Reply-To: <CAFadFHQLbHNpQCP6tDsGFOSw7ZsujRaiBzQBbXx7-_QOjZwuPw@mail.gmail.com>
Date: Wed, 4 Oct 2017 18:36:31 +0200
Cc: linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <607D25F7-8DC9-4B2D-844B-F2359BCD642D@sigma-star.at>
References: <CAFadFHRqVe5SmQBZAaFHt2d6+GY5p1mbE9_G40AApfK29oHh8Q@mail.gmail.com>
 <34D12043-D369-458C-BEEA-B0B7463B3242@sigma-star.at>
 <CAFadFHQLbHNpQCP6tDsGFOSw7ZsujRaiBzQBbXx7-_QOjZwuPw@mail.gmail.com>
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

> On 4 Oct 2017, at 18:14, Nicolas Feignon =
<nicolas.feignon@mobile-devices.fr> wrote:
>=20
> I was indeed using a hardware crypto accelerator on a Atmel SAMA5D2 =
platform.
> It works correctly after removing it. I'll work on a patch.

nice! :)

Just in case you take reference on the CAAM patch, beware that Gilad =
noticed some potential issues with it when performing in-place =
decryption [1]. This is however not an issue for CTS, but from what i =
understand violates the skcipher API.

- David


[1] https://marc.info/?l=3Dlinux-crypto-vger&m=3D150269756430496&w=3D2
