Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RT9HD-0006wo-6w
 for linux-mtd@lists.infradead.org; Wed, 23 Nov 2011 09:37:59 +0000
Received: by ywa12 with SMTP id 12so1365250ywa.36
 for <linux-mtd@lists.infradead.org>; Wed, 23 Nov 2011 01:37:58 -0800 (PST)
Subject: Re: [PATCH 0/2] small mtd-utils fixes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 23 Nov 2011 11:38:38 +0200
In-Reply-To: <CAMjpGUdsdppTEOuPdWTGGU=ztbyvoF4_=TiZ1RqQ4W1_wFhbkQ@mail.gmail.com>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala> <87k46xrqyr.fsf@macbook.be.48ers.dk>
 <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
 <1321735668.2167.2.camel@koala>
 <CAMjpGUfB0OoP_TvQ+eVEwx6_nmJ0p4jrCyu4ceTQBHGeRvUm-Q@mail.gmail.com>
 <1321743864.2167.6.camel@koala>
 <1321790131.15493.85.camel@shinybook.infradead.org>
 <1321794503.2170.3.camel@koala>
 <CAMjpGUdsdppTEOuPdWTGGU=ztbyvoF4_=TiZ1RqQ4W1_wFhbkQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-0phEGU0evioO3UeSUC5u"
Message-ID: <1322041124.24797.269.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Kevin Cernekee <cernekee@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-0phEGU0evioO3UeSUC5u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, updated the script as you suggested. Did not do the "outdir should
be optional" part because it is not needed now - we can do this later if
we want.

#!/bin/sh -uef

# A small helper script to release mtd-utils. Takes the new version
# as a parameter.

fatal() {
	printf "Error: %s\n" "$1" >&2
	exit 1
}

usage() {
	cat <<EOF
Usage: ${0##*/} <new_ver> <outdir>

<new_ver>  - mtd utils version to create in X.Y.Z format
<outdir>   - the output directory where to store the tarball with the
             gpg signature
EOF
	exit 0
}

[ $# -eq 0 ] && usage
[ $# -eq 2 ] || fatal "Insufficient or too many argumetns"

new_ver=3D"$1"; shift
outdir=3D"$1"; shift

release_name=3D"mtd-utils-$new_ver"
tag_name=3D"v$new_ver"

# Make sure the input is sane and the makefile contains sensible version
echo "$new_ver" | egrep -q -x '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+' ||
	fatal "please, provide new version in X.Y.Z format"

egrep -q -x 'VERSION =3D [[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+' Makefile=
 ||
	fatal "Makefile does not contain \"Version =3D X.Y.Z\" line"

# Make sure the git index is up-to-date
[ -z "$(git status --porcelain)" ] || fatal "Git index is not up-to-date"

# Make sure the tag does not exist
[ -z "$(git tag -l "$tag_name")" ] || fatal "Tag $tag_name already exists"

# Change the version in the Makefile
sed -i -e "s/^VERSION =3D [[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+/VERSI=
ON =3D $new_ver/" Makefile

# And commit the change
git commit -s -m "Release $release_name" Makefile

# Create new signed tag
echo "Signing tag $tag_name"
git tag -m "$release_name" -s "$tag_name"

# Prepare signed tarball
git archive --format=3Dtar --prefix=3D"$release_name/" "$tag_name" | \
	bzip2 > "$outdir/$release_name.tar.bz2"
echo "Signing the tarball"
gpg -o "$outdir/$release_name.tar.bz2.asc" --detach-sign -a "$outdir/$relea=
se_name.tar.bz2"

cat <<EOF
Created $outdir/$release_name.tar.bz2
Please, verify, then push the tag and upload the tarball and the signature
You can use these commands:
git push origin $tag_name
scp $outdir/$release_name.tar.bz2 $outdir/$release_name.tar.bz2.asc casper.=
infradead.org:/var/ftp/pub/mtd-utils
EOF


--=-0phEGU0evioO3UeSUC5u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAABAgAGBQJOzL8eAAoJECmIfjd9wqK0tHMP/RAmY4v5NNMR11G2qyaSHPDC
LRy6aT97gwuXF2B01MOwc4YBiyr9gwx2Jrka8Z1WUDrrGCkY1NgQgU3egXpnWWiO
K2J0zEN5kVe3z6IDDzmsLyRyB8hGpQY4fc8XWbnvuHVFMnsq7WD58u3zeX6+b8ad
hPlWhRZ6UghoFysuZxGROY+MoRRcEalMHYAMkJaQ8tXE4/HbWu1VzQMRBKCT1pS+
1KOGIK4SfWdb5e9fKLuao5SpTf4gGmi5rR/fxvU/34jhs4x7r+PWGYV7ypq1bmM7
KjFXjcYr+K9y4cwiQbQnawwaWiVBqmROqUyEo7gK1Ntjy9JOBM3XKpSnqZAznpiP
NUq7fA7cSVRpWFkv4GMtOM3Jaga1NIr4MbtN7P7serP+Uji14lRQ5pQJ4e3VpRwO
q8avr2mihiAy1OD0B56Wf8UQbcNT+HzkLYEdCR/bGY/VkfbarI7JBTdSa0/uxxCo
0tLpSxGhM5RWntwKcREXLr0Osl1xZzQLVVm6oNDexUyFXSAyOHp9bhUQYpuJTcjN
fumdo9phNVQWzMqLTzr6GVO7BvE9l3dcouqR29up34NeMuKflXOVyhENNKgqoFVs
a2yTwyFESAgCQQWfgx3rwTnf5UxSo386miQaEJxDkyg73KEpIUpKLjF9DHmvu6zb
Eyb5cUqabA4vA7YQKdbD
=T00b
-----END PGP SIGNATURE-----

--=-0phEGU0evioO3UeSUC5u--
