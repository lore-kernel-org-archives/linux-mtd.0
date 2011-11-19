Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RRtxW-0001sm-6s
 for linux-mtd@lists.infradead.org; Sat, 19 Nov 2011 23:04:30 +0000
Received: by bkat2 with SMTP id t2so6495524bka.36
 for <linux-mtd@lists.infradead.org>; Sat, 19 Nov 2011 15:04:27 -0800 (PST)
Subject: Re: [PATCH 0/2] small mtd-utils fixes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Sun, 20 Nov 2011 01:04:22 +0200
In-Reply-To: <CAMjpGUfB0OoP_TvQ+eVEwx6_nmJ0p4jrCyu4ceTQBHGeRvUm-Q@mail.gmail.com>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala> <87k46xrqyr.fsf@macbook.be.48ers.dk>
 <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
 <1321735668.2167.2.camel@koala>
 <CAMjpGUfB0OoP_TvQ+eVEwx6_nmJ0p4jrCyu4ceTQBHGeRvUm-Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321743864.2167.6.camel@koala>
Mime-Version: 1.0
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2011-11-19 at 15:55 -0500, Mike Frysinger wrote:
> On Sat, Nov 19, 2011 at 15:47, Artem Bityutskiy wrote:
> > On Fri, 2011-11-18 at 15:37 -0800, Brian Norris wrote:
> >> On Fri, Nov 18, 2011 at 2:44 PM, Peter Korsgaard wrote:
> >> > Thanks, I've updated the package in buildroot. One minor nit, you forgot
> >> > to update the version in the Makefile.
> >>
> >> I was just about to comment on the Makefile version as well; I forgot
> >> about that...any chance we can fix this on the official release? It's
> >> kind of important that I can tell which version my users are using,
> >> now that we've fixed a lot of annoying bugs/"features". If not, I may
> >> just modify it in my own releases.
> >
> > My apologies. I've released 1.4.8 and changed the Makefile this time.
> > Uploaded the tarball as well.
> 
> how are you making the releases ?  seems like this keeps coming up, so
> maybe we should have a `make dist` that takes care of this stuff
> automatically to avoid future mistakes ...

You are right. I've just created a simple shell script which should do
cut a new release properly.

#!/bin/sh -uef

# A small helper script to release mtd-utils. Takes the new version
# as a parameter.

fatal() {
	printf "%s\n" "$1" >&2
	exit 1
}

[ $# -eq 1 ] || fatal "Please, specify the new version"
new_ver="$1"

# Change the version in the Makefile
tmpfile="$(mktemp)"
sed -e "s/^VERSION = [[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+/VERSION = $new_ver/" \
	Makefile > "$tmpfile"
mv "$tmpfile" Makefile

# And commit the change
git commit -s -m "Release mtd-utils-$new_ver" Makefile

# Create new tag
git tag "v$new_ver"

# Prepare the tarball
git archive --format=tar --prefix="mtd-utils-$new_ver/" "v$new_ver" | \
	bzip2 > "mtd-utils-$new_ver.tar.bz2"

# Upload the tarball
scp "mtd-utils-$new_ver.tar.bz2" casper.infradead.org:/var/ftp/pub/mtd-utils/
