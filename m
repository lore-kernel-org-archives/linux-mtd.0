Received: from nm21-vm6.bullet.mail.ird.yahoo.com ([212.82.109.246])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S2XKO-0004D8-Oy
 for linux-mtd@lists.infradead.org; Wed, 29 Feb 2012 00:23:33 +0000
Message-ID: <1330475001.50223.YahooMailClassic@web29002.mail.ird.yahoo.com>
Date: Wed, 29 Feb 2012 00:23:21 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF718A97E1.ACAF6B20-ONC12579B2.00754C8D-C12579B2.0075B1B3@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > If an Erase Suspend Command (0xb0) is issued while a=0A> Block Erase op=
eration=0A> > (0x20, 0xd0) is in progress, Status Register bit 6=0A> (SR.6)=
 will be set to 1.=0A> > After an Erase Resume Command (0xd0) is issued, SR=
.6=0A> will be set back to 0.=0A> >=0A> > Unfortunately when inval_cache_an=
d_wait_for_operation()=0A> is called to wait for=0A> > a Block Erase operat=
ion to finish, it never checks that=0A> SR.6 =3D 0 before=0A> > returning. =
Consequently it can (and does) return while=0A> a Block Erase operation=0A>=
 > is still suspended, resulting in random breakage.=0A> >=0A> > This patch=
 ensures that when=0A> inval_cache_and_wait_for_operation() is called to=0A=
> > wait for a Block Erase operation to finish=0A> (chip->state =3D=3D FL_E=
RASING), it does=0A> > not return until both SR.7 =3D 1 (as before) and SR.=
6 =3D=0A> 0.=0A> =0A> Interesting but I do wonder, should not the=0A> =A0 i=
f (chip->state !=3D chip_state)=0A> test just before the status test preven=
t this in the first=0A> place?=0A=0AI'm not sure I understand. The (chip->s=
tate !=3D chip_state) test forces=0Ainval_cache_and_wait_for_operation() to=
 stop polling and sleep, pending=0Athe operation which suspended it. After =
it wakes it resumes polling. The=0Atest doesn't prevent inval_cache_and_wai=
t_for_operation() returning=0Aprematurely, i.e. before the Block Erase has =
finished.=0A=0AAn important point which I suspect has been overlooked is th=
at both SR.7=0Aand SR.6 are set when a Block Erase is suspended. Thus testi=
ng SR.7 only=0Ais not sufficient to determine that a Block Erase has comple=
ted.=0A=0A> > +=A0=A0=A0map_word status_76 =3D (chip->state=0A> =3D=3D FL_E=
RASING) ? CMD(0xc0) : CMD(0x80);=0A> =0A> hmm, I wonder if you can get by w=
ithout the chip->state=0A> test? Just always set it to 0xc0?=0A=0ANo, unfor=
tunately not. For example a write buffer sequence will finish=0Awhether or =
not a Block Erase is currently suspended; thus it must test=0ASR.7 only, no=
t SR.6.=0A=0APaul
