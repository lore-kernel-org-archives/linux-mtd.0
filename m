Received: from gw1.transmode.se ([195.58.98.146])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S2fMP-0000YE-7S
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 08:58:11 +0000
In-Reply-To: <1330475001.50223.YahooMailClassic@web29002.mail.ird.yahoo.com>
References: <OF718A97E1.ACAF6B20-ONC12579B2.00754C8D-C12579B2.0075B1B3@transmode.se>
 <1330475001.50223.YahooMailClassic@web29002.mail.ird.yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Paul Parsons <lost.distance@yahoo.com>,
	<lost.distance@yahoo.com>
Message-ID: <OFB4D94431.92097836-ONC12579B3.002C764D-C12579B3.00314167@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 29 Feb 2012 09:58:00 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=ISO-8859-15
Content-transfer-encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Paul Parsons <lost.distance@yahoo.com> wrote on 2012/02/29 01:23:21:
> From: Paul Parsons <lost.distance@yahoo.com>
>
> > > If an Erase Suspend Command (0xb0) is issued while a
> > Block Erase operation
> > > (0x20, 0xd0) is in progress, Status Register bit 6
> > (SR.6) will be set to 1.
> > > After an Erase Resume Command (0xd0) is issued, SR.6
> > will be set back to 0.
> > >
> > > Unfortunately when inval_cache_and_wait_for_operation()
> > is called to wait for
> > > a Block Erase operation to finish, it never checks that
> > SR.6 =3D 0 before
> > > returning. Consequently it can (and does) return while
> > a Block Erase operation
> > > is still suspended, resulting in random breakage.
> > >
> > > This patch ensures that when
> > inval_cache_and_wait_for_operation() is called to
> > > wait for a Block Erase operation to finish
> > (chip->state =3D=3D FL_ERASING), it does
> > > not return until both SR.7 =3D 1 (as before) and SR.6 =3D
> > 0.
> >
> > Interesting but I do wonder, should not the
> > =A0 if (chip->state !=3D chip_state)
> > test just before the status test prevent this in the first
> > place?
>
> I'm not sure I understand. The (chip->state !=3D chip_state) test for=
ces
> inval_cache_and_wait_for_operation() to stop polling and sleep, pendi=
ng
> the operation which suspended it. After it wakes it resumes polling. =
The
> test doesn't prevent inval_cache_and_wait_for_operation() returning
> prematurely, i.e. before the Block Erase has finished.

Been to long since I been in this code I guess, but I still don't get i=
t.

If erase is suspended, chip->state is changed which will keep the funct=
ion in
the for(;;) loop. Once erase has been resumed again chip->state will ch=
ange back.
It seems to me that chip->state and SR.6 are mutally exclusive? I can n=
ot see how
you can get to
	status =3D map_read(map, cmd_adr);
	if (map_word_andequal(map, status, status_OK, status_OK))
if the the erase has been suspended.

>
> An important point which I suspect has been overlooked is that both S=
R.7
> and SR.6 are set when a Block Erase is suspended. Thus testing SR.7 o=
nly
> is not sufficient to determine that a Block Erase has completed.
>
> > > +=A0=A0=A0map_word status_76 =3D (chip->state
> > =3D=3D FL_ERASING) ? CMD(0xc0) : CMD(0x80);
> >
> > hmm, I wonder if you can get by without the chip->state
> > test? Just always set it to 0xc0?
>
> No, unfortunately not. For example a write buffer sequence will finis=
h
> whether or not a Block Erase is currently suspended; thus it must tes=
t
> SR.7 only, not SR.6.

I see, thanks.

 Jocke=
