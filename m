Received: from nf-out-0910.google.com ([64.233.182.190])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Fvxi7-0006vm-J6
	for linux-mtd@lists.infradead.org; Thu, 29 Jun 2006 10:41:47 -0400
Received: by nf-out-0910.google.com with SMTP id c29so87563nfb
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 Jun 2006 07:41:37 -0700 (PDT)
Message-ID: <fe810cf0606290741r2b1de379mc0ba49c2aa336757@mail.gmail.com>
Date: Thu, 29 Jun 2006 18:41:37 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@wohnheim.fh-wedel.de>
Subject: Re: JFFS2 wbuf non-contiguous write bug
In-Reply-To: <20060629124433.GA19237@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <fe810cf0606290500h54295e34jbb018a5346dceb6a@mail.gmail.com>
	<20060629124433.GA19237@wohnheim.fh-wedel.de>
Cc: Josh Boyer <jwboyer@gmail.com>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/29/06, J=F6rn Engel <joern@wohnheim.fh-wedel.de> wrote:
>
> How can that be?  The removed code was:
> -       if (jffs2_nor_ecc(c)) {
> -               if (((c->wbuf_ofs % c->sector_size) =3D=3D 0) && !c->wbuf=
_len) {
> -                       c->wbuf_ofs =3D PAGE_DIV(to);
> -                       c->wbuf_len =3D PAGE_MOD(to);
> -                       memset(c->wbuf,0xff,c->wbuf_pagesize);
> -               }
> -       }
>
> And jffs2_nor_ecc(c) would have been false for Sibley (true for
> STMicro, though).  So if we have a bug for Sibley and adding this code
> solves the problem _now_, how could it have solved the problem
> _before_?
>

True. But actually that piece of code was (before migration to GIT)

=09if (jffs2_nor_ecc(c) || jffs2_nor_wbuf_flash(c)) {
=09=09if (((c->wbuf_ofs % c->sector_size) =3D=3D 0) && !c->wbuf_len) {
=09=09=09c->wbuf_ofs =3D PAGE_DIV(to);
=09=09=09c->wbuf_len =3D PAGE_MOD(to);
=09=09=09memset(c->wbuf,0xff,c->wbuf_pagesize);
=09=09}
=09}

Your commit just was one which removed that check completely. Probably
jffs2_nor_wbuf_flash(c) check here was just missed duirng migration to
GIT and "[JFFS2] Teach JFFS2 about Sibley flash" commit is just
incomplete.

http://kernel.org/git/?p=3Dlinux/kernel/git/dwmw2/mtd-2.6.git;a=3Dcommit;h=
=3D59da721a2288b8aec751a2716f7ab60f2ea0c925

Dunno.

Anyway I was speaking _not_ about reverting part of your patch but
about getting back following code for Sibley, since it indeed shows if
we moved to a new eraseblock.

=09=09if (((c->wbuf_ofs % c->sector_size) =3D=3D 0) && !c->wbuf_len) {
=09=09=09c->wbuf_ofs =3D PAGE_DIV(to);
=09=09=09c->wbuf_len =3D PAGE_MOD(to);
=09=09=09memset(c->wbuf,0xff,c->wbuf_pagesize);
=09=09}

> You must be missing something, but I don't know what.  Maybe Josh has
> some insight into this problem - he did a thorough review and asked
> many probing questions about this particular part of the patch.

It would be really nice, since current code seems to be broken somehow.

Thanks,
Alexander Belyakov
