Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T2MLP-0000co-9q
 for linux-mtd@lists.infradead.org; Fri, 17 Aug 2012 13:12:09 +0000
Message-ID: <1345209400.27859.86.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 1/2] mtd: fix wrong usage of ioremap_nocache() in
 uclinux.c map driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: gerg@snapgear.com
Date: Fri, 17 Aug 2012 16:16:40 +0300
In-Reply-To: <1342676566-25651-1-git-send-email-gerg@snapgear.com>
References: <1342676566-25651-1-git-send-email-gerg@snapgear.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-MbmTRdCljiWmA7qbszTs"
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, uclinux-dev@uclinux.org,
 Greg Ungerer <gerg@uclinux.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-MbmTRdCljiWmA7qbszTs
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2012-07-19 at 15:42 +1000, gerg@snapgear.com wrote:
> From: Greg Ungerer <gerg@uclinux.org>
>=20
> The uclinux.c mapping driver uses ioremap_nocache() to map its physical
> mapping address to a system virtual address. Problem is that the region
> it is mapping is not device memory. It is ordinary system RAM. On most
> non-MMU systems this doesn't matter, and the mapping is always a 1:1
> translation of the address. On paged memory systems on some architectures
> the page table mappings are not compatible between normal RAM and device
> memory.

I cannot compile m68k because of the following errors:

arch/m68k/platform/coldfire/clk.c:54:13: error: redefinition of 'clk_get'
include/linux/clk.h:281:27: note: previous definition of 'clk_get' was here
arch/m68k/platform/coldfire/clk.c:68:5: error: redefinition of 'clk_enable'
include/linux/clk.h:295:19: note: previous definition of 'clk_enable' was h=
ere
arch/m68k/platform/coldfire/clk.c:80:6: error: redefinition of 'clk_disable=
'
include/linux/clk.h:300:20: note: previous definition of 'clk_disable' was =
here
arch/m68k/platform/coldfire/clk.c:90:6: error: redefinition of 'clk_put'
include/linux/clk.h:291:20: note: previous definition of 'clk_put' was here
arch/m68k/platform/coldfire/clk.c:97:15: error: redefinition of 'clk_get_ra=
te'
include/linux/clk.h:302:29: note: previous definition of 'clk_get_rate' was=
 here
arch/m68k/platform/coldfire/clk.c:150:13: error: redefinition of 'devm_clk_=
get'
include/linux/clk.h:286:27: note: previous definition of 'devm_clk_get' was=
 here
make[2]: *** [arch/m68k/platform/coldfire/clk.o] Error 1

so I cannot compile-test this patch. Do you have a work-around patch for
that compilation issue?

--=20
Best Regards,
Artem Bityutskiy

--=-MbmTRdCljiWmA7qbszTs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJQLkQ4AAoJECmIfjd9wqK0uYwP/j9Ij5c7lTwShzvN+BmJHLGx
2S4FNoH2b2PLV/3CstddXBMikGEIhW1eMAo7cFIIEkQ64FmWo3NkiJN5YOCHLY92
zzBbwwSciPg4yQoTSRHQJYJCKBCuyoump8NyT6FSywagsA6BEgorq3FeFWmxwk3q
9XPB/zXX9NPiwVA1jEWKCSKYphvNwvo3KBiHCjQCwocG33zQrr/gNu5dkU5U8y/U
m8YFtY0nXWfCW/2v+cWI5pGF/bJZMAYYJAycH98+g0iTYPY6Rd9k5Y/zR4Ufzj9M
Zl4xwo7J7dgofoZhh3cynmbtHaCBahL/n7705rreZOmTGdLzfklq/zOLjeLOYR25
L6BLyg7zXNy575TD28rk6pRbAvL+LAbmdozPogUTTIavF3+Xsv0+GerifQKXx+At
Y+RFoD3U/IFu4KDP5H/0eK3/iWEgCMVdgbOrrO80wdZcubCPjXd3g+JIJgqCaxR7
ViFx4RVu76VLse3huxcMdhwxv9Mi+hdTCci8wbpWoVfK7Cb85LwkNRT70MvIUwFO
6ZNnrkJj3c6YR6/i6bhgoBlnhKaYbfco/oevmTwbjJKkvdD6cyNTv7w2Cs3lgMp7
r1G4Tracjtbu9EAMIl5/hyWwNar7RvA3/nHZUb9bOLhK5D3tef3Icd2BKR/A3Od7
R+RCqo60avP7ywUTDG/i
=XuA2
-----END PGP SIGNATURE-----

--=-MbmTRdCljiWmA7qbszTs--
