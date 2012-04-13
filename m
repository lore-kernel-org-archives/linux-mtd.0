Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SIjIw-0001qe-3a
 for linux-mtd@lists.infradead.org; Fri, 13 Apr 2012 16:24:58 +0000
Message-ID: <1334334462.13160.10.camel@sauron.fi.intel.com>
Subject: RE: Unstable bits and JFFS2
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Fri, 13 Apr 2012 19:27:42 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD3351F9CAD87@dekaexchange07.deka.local>
References: <CAHMF36FsVeg=ZVtZZz8H6YLj3GhKwD-ofCV1hcJcL5cVVKRK1A@mail.gmail.com>
 <CAN8TOE-2exM1YomfbiQ_CzkZn=MbotYwSxJnzU6mNVK4WPBNdQ@mail.gmail.com>
 <CAHMF36GrBOZBTzyBpxD2U+nkBcZExGqkvKY7fkA6494M2PtShw@mail.gmail.com>
 <0A40042D85E7C84DB443060EC44B3FD3351F9CAD87@dekaexchange07.deka.local>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-TarVrH3bekJIc/5U81gQ"
Mime-Version: 1.0
Cc: 'Matej Kupljen' <matej.kupljen@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-TarVrH3bekJIc/5U81gQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-04-04 at 06:54 -0400, Atlant Schmidt wrote:
> Matej:
>=20
> > Artem, you said that this unstable bits only happen
> > during power cuts, is this right? Would those appear
> > also on simulated power cuts, the ones that integck
> > can produce?
>=20
>   (Note: This isn't Artem replying.)
>=20
>   Unstable bits can happen anytime, but *REAL* power-cuts
>   while writing are certainly a great way to produce them;
>   after all, if you've only transferred half the electrons
>   to the floating gate when power goes away, well, that
>   Flash cell is now a roll-of-the-quantum-dice each time
>   you read it.
>=20
>   Simulated power cuts (that just stop the software
>   processing at arbitrary and random points) can't
>   produce this effect.
>=20
>   But any time a read-disturb or write-disturb takes place,
>   there's some probability that a Flash cell will be left
>   with a "near-threshold" charge on the floating gate, so
>   unstable bits are a fact of life that must be faced by
>   any software that drives NAND Flash memory chips. This
>   is, of course, especially true of MLC chips and even
>   more-true for TLC chips (with three bits per cell).

Yeah, thanks for correcting. Yeah, read/write-disturb may make bits to
become unstable, but we assume this is a slow process which will
gradually make more and more bits flip and ECC will take care of that.
So I think Matej can exclude this.

--=20
Best Regards,
Artem Bityutskiy

--=-TarVrH3bekJIc/5U81gQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPiFP+AAoJECmIfjd9wqK0UMUP/2jDL62leOf04cxpVY9INwNn
IbPdGnRPt4NDspZerB5fdqbG8NXvz64l6kUkkUeNeGzNWSiXC5MgTWriVV/L6hW4
P0d2+Vwr/IChTT4KcZ1zwFxBlNqPn+5gg4zFBUnvrCCNHe9Fngf75HPkRFnEWSAF
YUGz3S4IwmCfwUOe7xi/rX0DD1Bwb0r/NVcsAbvjFTlrQXydJP687p0Vv/ycurso
zwnANdnDMn4FheZHtPIyXqdJ8K4uHUjrkzLXZm3flCL5hjj2pDDkz6SzeNE3KHyX
mltQQiqLz0kwhQQWC0dajeawS1fzoHksL3XPofofrMS4tFNdoDt48OS/vqKZ8B25
YbL8RR+KKQzTKiS3klxGjGlTuMHF6HDstUTtQoyydmo4LtrYAghvqFvC3bBYylu7
XG8FRdJmdGWAie9ESUWJJP4tnnZKrh9guVheqmIamH/Sx9Hu47WH5GfW02OPDUr4
ic8pLQduGID6ykOYuXGwlcnSIkr7BTG20BaKzq30MvEqATFMncprheR11J4J7uh0
1grLOTuL8olSWQLmYNuW5KNZzTkP2yhh+m2K++ArSE/93ITlJ+OXUpF5tUOF2igl
EYoDIRw/uIEjiEpcj35TVP0z9JSbr3A6JJq2Hfqy0QLV2pqVYJdlXz50RNZFVMl9
NxLc1ATWWWDTNogd58zW
=VKB1
-----END PGP SIGNATURE-----

--=-TarVrH3bekJIc/5U81gQ--
