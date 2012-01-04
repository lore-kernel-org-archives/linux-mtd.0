Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RiTHN-0001At-5f
 for linux-mtd@lists.infradead.org; Wed, 04 Jan 2012 16:01:29 +0000
Received: by iadk27 with SMTP id k27so36322800iad.36
 for <linux-mtd@lists.infradead.org>; Wed, 04 Jan 2012 08:01:27 -0800 (PST)
Message-ID: <1325693012.8917.76.camel@sauron.fi.intel.com>
Subject: Re: I need help analyzing a failed UBIfs
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Wed, 04 Jan 2012 18:03:32 +0200
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD33254FA3C54@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD33254FA3C54@dekaexchange07.deka.local>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-zH30RUjoNlAhS/fBGvth"
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-zH30RUjoNlAhS/fBGvth
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 2012-01-02 at 14:11 -0500, Atlant Schmidt wrote:
>     o Is the failed LEB part of the UBIfs "Wandering
>       Journal" or is it storing actual, fully-committed
>       parts of the data volume such as iNodes, directories,
>       or file data extents?*

To get the list of uncommitted journal LEBs you have to analyze the Log
which is stored at the beginning of the volume and has a fixed address.

>   Looking at a data dump of the volume (from the MTD
>   level), is there an easy way to determine this?
>   For example, "All the Journal LEBs are listed in
>   a table at..."**

I think in case of error UBIFS prints a lot of information, if debugging
is enabled. It uses KERN_DEBUG level, though, which causes a lot of
confusion because people do not realize that they have a lot of info, it
is just not in their console and they have to type 'dmesg'. A patch
which changes this would be welcome.

Anyway, the info you want can be printed there as well.

>  * I'm assuming that LEBs are either fully-allocated to
>    the Wandering Journal or fully-available to the "data
>    volume"; if this assumption is incorrect, I'm sure
>    someone will correct me!

When new data arrives, the Journal subsystem allocates space. If there
is half-filled committed LEB, it may be allocated and its empty space
may be used.

Why half-filled committed LEBs may appear? E.g., if you unmount or do a
sync, we commit everything, including partially filled LEBs.

> ** I have a Perl script that I wrote that helps me automate
>    this and could easily extend my script to do more analysis
>    if I knew what I was looking for.

If it is a general purpose scripts, making it a part of the mtd-utils
could be a good idea.

--=20
Best Regards,
Artem Bityutskiy

--=-zH30RUjoNlAhS/fBGvth
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJPBHhUAAoJECmIfjd9wqK0O+AP/0s3i1RFSbcnzsxkutn7EJRP
xiobwa4NNgVY4swyBBbjD0lncu1YNArSn/sr3ssOP8zq6rd8VGKn2su3iYjxeV1T
JlBhqcb0WtHkZMZWFS+97tJT2TEoAdlC/cN1B950ldEQPhpWrsJ02AIlAVVeDVPS
/7R1GzCQpw9nVk/7IOxubZGX0AU7vb3xfmfxZFNEW5wBhaSNVlHYBtc18hce6lg3
RjeykJGP7+bcsjS1eWmthuGsgJDVZnX4kISoHfnLHvrhubxg5hzm575qoj0qnghr
omjXI/J1+gVAI6as++PP2czEzo+0l9UWMv/Nf4m4vF1mewBoPPDWCOzAJgLWF1fT
OI3TWbH3qsTnkXgiLWT23b/WyUdMHPnxqMxZ9tsZA1jWFazsBt88Bp/itWXBv1bW
apQKRTOMS48OrmDUf5SnBPIb6n+/5De09EVvkTXOZDcR1odjLugej8DCRKoR3HKg
VWm5ntL8RbXufcWqTEhS6lp8jSiHYfzB3JyebHaYHEGZna2FHCfTus/Jp6jKWIPK
oexKgG74gygA0MfAyTWx2yh+is1dual0wd1Per1gKvwhZRpmu79ieTruxs3ncC7V
5OLEPJGQbyyCVEvZr2BHPh19wVGy7p6miZV+G2AThL/UTTg6fGEI64gnO1c9brUu
naMzcxM3PKLodcjlsyn4
=jFea
-----END PGP SIGNATURE-----

--=-zH30RUjoNlAhS/fBGvth--
