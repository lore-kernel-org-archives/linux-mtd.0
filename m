Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSLOj-0004lG-Ba
 for linux-mtd@lists.infradead.org; Mon, 21 Nov 2011 04:22:25 +0000
Received: by iapp10 with SMTP id p10so8698647iap.36
 for <linux-mtd@lists.infradead.org>; Sun, 20 Nov 2011 20:22:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1321794503.2170.3.camel@koala>
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
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 20 Nov 2011 23:22:03 -0500
Message-ID: <CAMjpGUdsdppTEOuPdWTGGU=ztbyvoF4_=TiZ1RqQ4W1_wFhbkQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] small mtd-utils fixes
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 20, 2011 at 08:08, Artem Bityutskiy wrote:
> usage() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cat <<EOF
> Usage: ${0##*/} <new_ver> <outdir>
>
> <new_ver> =C2=A0- mtd utils version to create in X.Y.Z format
> <outdir> =C2=A0 - the output directory where to store the tarball with th=
e
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpg signature
> EOF
> =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 0
> }

i'd have outdir be optional and default to $PWD

prob want to update .gitignore to ignore "mtd-utils-*.tar*"

> # Change the version in the Makefile
> tmpfile=3D"$(mktemp)"
> sed -e "s/^VERSION =3D [[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+/VERSIO=
N =3D $new_ver/" \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Makefile > "$tmpfile"
> mv "$tmpfile" Makefile

use `sed -i` and you won't need the $tmpfile at all

> gpg --detach-sign -a "$outdir/$release_name.tar.bz2" > "$outdir/$release_=
name.tar.bz2.asc"

by using --detach-sign, you don't want the output redirection.  so
delete the "> .......".

> echo "Created $outdir/$release_name.tar.bz2"
> echo "Please, verify, then push the tag and upload the tarball and the si=
gnature"
> echo "You can use these commands:"
> echo "git push $tag_name"
> echo "scp $outdir/$release_name.tar.bz2 $outdir/$release_name.tar.bz2.asc=
 casper.infradead.org:/var/ftp/pub/mtd-utils"

if you really like, you could make this a single cat like in the usage()
-mike
