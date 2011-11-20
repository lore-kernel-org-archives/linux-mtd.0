Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RS78F-0004BS-4y
 for linux-mtd@lists.infradead.org; Sun, 20 Nov 2011 13:08:28 +0000
Received: by bkat2 with SMTP id t2so7111590bka.36
 for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2011 05:08:25 -0800 (PST)
Subject: Re: [PATCH 0/2] small mtd-utils fixes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Sun, 20 Nov 2011 15:08:21 +0200
In-Reply-To: <1321790131.15493.85.camel@shinybook.infradead.org>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala> <87k46xrqyr.fsf@macbook.be.48ers.dk>
 <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
 <1321735668.2167.2.camel@koala>
 <CAMjpGUfB0OoP_TvQ+eVEwx6_nmJ0p4jrCyu4ceTQBHGeRvUm-Q@mail.gmail.com>
 <1321743864.2167.6.camel@koala>
 <1321790131.15493.85.camel@shinybook.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321794503.2170.3.camel@koala>
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2011-11-20 at 11:55 +0000, David Woodhouse wrote:
> On Sun, 2011-11-20 at 01:04 +0200, Artem Bityutskiy wrote:
> > # Prepare the tarball
> > git archive --format=tar --prefix="mtd-utils-$new_ver/" "v$new_ver" | \
> >         bzip2 > "mtd-utils-$new_ver.tar.bz2"
> 
> gpg --detach-sign -a "mtd-utils-$new_ver.tar.bz2"
> 
> > # Upload the tarball
> > scp "mtd-utils-$new_ver.tar.bz2" casper.infradead.org:/var/ftp/pub/mtd-utils/
> 
> mtd-utils-$new_ver.tar.bz2{.asc,}

OK, I've updated the script:

1. Added some sanity checks
2. Sign tags
3. Sign the tarball
4. Instead of uploading, print the instructions how to do this

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

new_ver="$1"; shift
outdir="$1"; shift

release_name="mtd-utils-$new_ver"
tag_name="v$new_ver"

# Make sure the input is sane and the makefile contains sensible version
echo "$new_ver" | egrep -q -x '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+' ||
	fatal "please, provide new version in X.Y.Z format"

egrep -q -x 'VERSION = [[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+' Makefile ||
	fatal "Makefile does not contain \"Version = X.Y.Z\" line"

# Make sure the git index is up-to-date
[ -z "$(git status --porcelain)" ] || fatal "Git index is not up-to-date"

# Make sure the tag does not exist
[ -z "$(git tag -l "$tag_name")" ] || fatal "Tag $tag_name already exists"

# Change the version in the Makefile
tmpfile="$(mktemp)"
sed -e "s/^VERSION = [[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+/VERSION = $new_ver/" \
	Makefile > "$tmpfile"
mv "$tmpfile" Makefile

# And commit the change
git commit -s -m "Release $release_name" Makefile

# Create new signed tag
git tag -m "$release_name" -s "$tag_name"

# Prepare signed tarball
git archive --format=tar --prefix="$release_name/" "$tag_name" | \
	bzip2 > "$outdir/$release_name.tar.bz2"
gpg --detach-sign -a "$outdir/$release_name.tar.bz2" > "$outdir/$release_name.tar.bz2.asc"

echo "Created $outdir/$release_name.tar.bz2"
echo "Please, verify, then push the tag and upload the tarball and the signature"
echo "You can use these commands:"
echo "git push $tag_name"
echo "scp $outdir/$release_name.tar.bz2 $outdir/$release_name.tar.bz2.asc casper.infradead.org:/var/ftp/pub/mtd-utils"
