Received: from nm22-vm8.bullet.mail.ird.yahoo.com ([212.82.109.227])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S3T7z-0006HX-DE
 for linux-mtd@lists.infradead.org; Fri, 02 Mar 2012 14:06:36 +0000
Message-ID: <1330697193.91058.YahooMailClassic@web29016.mail.ird.yahoo.com>
Date: Fri, 2 Mar 2012 14:06:33 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OF56C9B29B.F0D0442B-ONC12579B5.00450ADB-C12579B5.00458326@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

--- On Fri, 2/3/12, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:=
=0A> > > > 2. If SR.6=3D0 then the erase has already=0A> completed, and=0A>=
 > > there is no need to set chip->erase_suspended=0A> or=0A> > > subsequen=
tly issue an Erase Resume command.=0A> > >=0A> > > Wont work when you have =
interleaved chips, there=0A> one chip=0A> > > may complete and the other no=
t.=0A> >=0A> > OK, I see, I think: one chip might have finished=0A> erasing=
 by the time we=0A> > issue an Erase Suspend, but the other might not. Yike=
s,=0A> they don't make it=0A> > easy for us.=0A=0AThinking about this more,=
 it shouldn't matter if not all interleaved chips=0Ahave completed their er=
ase. We should initiate Erase Resume to *all* chips=0Aif we find that *any*=
 chips have suspended. The worse that happens is that=0Awe issue unnecessar=
y resumes to those chips which have already completed.=0ASince this is what=
 the current MTD driver already does it shouldn't be a=0Aproblem.=0A=0A> > =
> Just wait for SR.6 to clear might work.=0A> >=0A> > That is what my 2nd p=
atch does. Should I just submit=0A> that as V2?=0A> =0A> Not sure yet, you =
would have add tmo support though and=0A> check=0A> were to change state/ol=
dstate as the loop drop the lock.=0A=0AOK.=0A=0A> > > Perhaps adding 1 or 2=
 extra throw away status=0A> reads to=0A> > > create a small delay instead?=
=0A> >=0A> > How much delay is enough for which platform and which=0A> chip=
s? I would=0A> > prefer just waiting for SR.6 to clear if that works.=0A> =
=0A> The problem is very rare, the other case I mentioned is the=0A> only o=
ne I know of.=0A> I seem to recall that in that case adding a throwaway sta=
tus=0A> read cured his problem.=0A> You could try, just so we known if it w=
orks and mail the=0A> other guy too, he might have=0A> some more info.=0A=
=0AThe problem only became a problem for me after I switched from JFFS2 to=
=0AUBIFS. I found that UBIFS would make file systems read-only. Either JFFS=
2=0Awas more forgiving of CFI errors, or UBIFS exercised CFI in new ways th=
at=0Aprovoked the errors. As others switch from JFFS2 to UBIFS they too mig=
ht=0Afind the same problem.
