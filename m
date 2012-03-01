Received: from nm19-vm1.bullet.mail.ird.yahoo.com ([77.238.189.208])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S3B5D-00007c-EZ
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 18:50:32 +0000
Message-ID: <1330627829.44517.YahooMailClassic@web29011.mail.ird.yahoo.com>
Date: Thu, 1 Mar 2012 18:50:29 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <OFF8581AC6.39235742-ONC12579B4.00629DA8-C12579B4.00633A79@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, philipp.zabel@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--- On Thu, 1/3/12, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:=
=0A> > > > It seems to me that waiting for SR[7:6]=3D00=0A> instead of=0A> =
> > just=0A> > > > SR.6=3D0 would:=0A> > > > 1. Have the same outcome.=0A> =
> > > 2. Be strictly within spec; SR[7:6] have been=0A> cleared=0A> > > > t=
herefore the Erase=0A> > > > Resume command has been accepted.=0A> > >=0A> =
> > Actually on second thoughts maybe not: if the=0A> erase has=0A> > > act=
ually completed=0A> > > when we issue an Erase Resume command then SR.7=0A>=
 should read=0A> > > back as 1 and we=0A> > > end up looping forever. hmm..=
.=0A> >=0A> > OK, how about this:=0A> >=0A> > 1. Erase Suspend now checks S=
R.6, exactly as it=0A> *should* according to the=0A> > spec flowchart.=0A> =
>=0A> > 2. If SR.6=3D0 then the erase has already completed, and=0A> there =
is no need to set chip->erase_suspended or=0A> subsequently issue an Erase =
Resume command.=0A> =0A> Wont work when you have interleaved chips, there o=
ne chip=0A> may complete and the other not.=0A=0AOK, I see, I think: one ch=
ip might have finished erasing by the time we=0Aissue an Erase Suspend, but=
 the other might not. Yikes, they don't make it=0Aeasy for us.=0A=0A> It wo=
uld be an optimization though, if all chips complete=0A> then skip suspend =
state.=0A=0AAnd it might just preclude other problems elsewhere. Issuing an=
 unnecessary=0AErase Resume does seem risky, given that the command code - =
0xd0 - is so=0Aoverloaded:=0A1. 3rd cycle of Buffered Program.=0A2. 2nd cyc=
le of Buffered Enhanced Factory Program.=0A3. 2nd cycle of Block Erase.=0A4=
. 1st cycle of Program Resume.=0A5. 1st cycle of Erase Resume.=0A6. 2nd cyc=
le of Unlock Block.=0AThat said, I presume the state machine already preven=
ts any ambiguity.=0A=0A> > 3. If an Erase Resume command is needed then we =
know=0A> that the erase has=0A> > not completed, therefore it should be saf=
e to wait for=0A> SR[7:6]=3D00.=0A> =0A> Just wait for SR.6 to clear might =
work.=0A=0AThat is what my 2nd patch does. Should I just submit that as V2?=
=0A=0A> Perhaps adding 1 or 2 extra throw away status reads to=0A> create a=
 small delay instead?=0A=0AHow much delay is enough for which platform and =
which chips? I would=0Aprefer just waiting for SR.6 to clear if that works.
