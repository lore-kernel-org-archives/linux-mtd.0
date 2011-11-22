Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSy3U-0007eH-Bk
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 21:39:04 +0000
Received: by yenr8 with SMTP id r8so836998yen.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2011 13:39:03 -0800 (PST)
Subject: Re: [PATCH 0/2] small mtd-utils fixes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 22 Nov 2011 23:38:53 +0200
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321997940.2222.19.camel@koala>
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

On Sun, 2011-11-20 at 23:22 -0500, Mike Frysinger wrote:
> On Sun, Nov 20, 2011 at 08:08, Artem Bityutskiy wrote:
> > usage() {
> >        cat <<EOF
> > Usage: ${0##*/} <new_ver> <outdir>
> >
> > <new_ver>  - mtd utils version to create in X.Y.Z format
> > <outdir>   - the output directory where to store the tarball with the
> >             gpg signature
> > EOF
> >        exit 0
> > }
> 
> i'd have outdir be optional and default to $PWD
> 
> prob want to update .gitignore to ignore "mtd-utils-*.tar*"

Yeah, but this would require me to add options handling using getopt,
because optional parameters have to have an option. I just do not feel
it is necessary right now. This can be done at any point if someone
needs.

> 
> > # Change the version in the Makefile
> > tmpfile="$(mktemp)"
> > sed -e "s/^VERSION = [[:digit:]]\+\.[[:digit:]]\+\.[[:digit:]]\+/VERSION = $new_ver/" \
> >        Makefile > "$tmpfile"
> > mv "$tmpfile" Makefile
> 
> use `sed -i` and you won't need the $tmpfile at all

Good point, thanks, I'll do this.

> 
> > gpg --detach-sign -a "$outdir/$release_name.tar.bz2" > "$outdir/$release_name.tar.bz2.asc"
> 
> by using --detach-sign, you don't want the output redirection.  so
> delete the "> .......".

OK, I'll actually test this and fix.

> > echo "Created $outdir/$release_name.tar.bz2"
> > echo "Please, verify, then push the tag and upload the tarball and the signature"
> > echo "You can use these commands:"
> > echo "git push $tag_name"
> > echo "scp $outdir/$release_name.tar.bz2 $outdir/$release_name.tar.bz2.asc casper.infradead.org:/var/ftp/pub/mtd-utils"
> 
> if you really like, you could make this a single cat like in the usage()

Will do.

But now I have to go sleep, will send an updated patch in near future.
Thank you for suggestions.

Artem.
