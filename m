Received: from py-out-1112.google.com ([64.233.166.178])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IjHKR-00068B-Oo
	for linux-mtd@lists.infradead.org; Sat, 20 Oct 2007 17:37:38 +0100
Received: by py-out-1112.google.com with SMTP id a25so1582351pyi
	for <linux-mtd@lists.infradead.org>;
	Sat, 20 Oct 2007 09:37:16 -0700 (PDT)
Message-ID: <f383264b0710200937j25dd2c62pba1f39767c9ff9d8@mail.gmail.com>
Date: Sat, 20 Oct 2007 09:37:16 -0700
From: "Matt Reimer" <mattjreimer@gmail.com>
To: "=?ISO-8859-1?Q?J=F6rn_Engel?=" <joern@logfs.org>
Subject: Re: [PATCH] MTD: treat any negative return value from correct() as an
	error
In-Reply-To: <20071020104226.GD32465@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <1192656803-32151-1-git-send-email-mattjreimer@gmail.com>
	<20071020104226.GD32465@lazybastard.org>
Cc: Matt Reimer <mreimer@vpop.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/20/07, J=F6rn Engel <joern@logfs.org> wrote:
> On Wed, 17 October 2007 14:33:23 -0700, mattjreimer@gmail.com wrote:
> >
> > Treat any negative return value from a NAND driver's correct() function
> > as a failure, rather than just -1. Some drivers (e.g. diskonchip) can
> > return error values such as -EIO, which ended up being treated as the
> > number of bits corrected, which in turn resulted in nand_do_read_ops()
> > returning -EUCLEAN rather than -EBADMSG.
>
> What an interesting patch.
>
> NACK on patch description.  Several things are wrong with this:
> o -EIO shouldn't become -EBADMSG any more than -EUCLEAN.  It should
>   remain -EIO and nothing else.

My mistake: I did most of this analysis in the 2.6.21 code, where
cafe_ecc.c:cafe_correct_ecc() did return -EIO, not diskonchip.

But as for the rest of the description, I'm just reading the code
that's there. An error return from ecc.correct bumps stats.failed,
which in nand_do_read_ops does become -EBADMSG:

        if (mtd->ecc_stats.failed - stats.failed)
                return -EBADMSG;

        return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;

So I was just following what I found there, assuming it was standard practi=
ce.

> o I cannot see how diskonchip can return -EIO.  Only -ERANGE.

Again, my bad; I was confusing it with an earlier version of
cafe_ecc.c (which I see now didn't pass -EIO up all the way).

Matt
