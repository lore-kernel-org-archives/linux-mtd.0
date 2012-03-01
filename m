Received: from nm18-vm1.bullet.mail.ird.yahoo.com ([77.238.189.217])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S3ACU-0003Ej-10
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 17:53:58 +0000
Message-ID: <1330624434.10902.YahooMailClassic@web29011.mail.ird.yahoo.com>
Date: Thu, 1 Mar 2012 17:53:54 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <1330623502.1881.YahooMailClassic@web29011.mail.ird.yahoo.com>
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

--- On Thu, 1/3/12, Paul Parsons <lost.distance@yahoo.com> wrote:=0A> From:=
 Paul Parsons <lost.distance@yahoo.com>=0A> Subject: Re: [PATCH] mtd: cfi: =
Wait for Block Erase operation to finish=0A> To: "Joakim Tjernlund" <joakim=
.tjernlund@transmode.se>=0A> Cc: linux-mtd@lists.infradead.org, dwmw2@infra=
dead.org, philipp.zabel@gmail.com=0A> Date: Thursday, 1 March, 2012, 17:38=
=0A> --- On Thu, 1/3/12, Paul Parsons=0A> <lost.distance@yahoo.com>=0A> wro=
te:=0A> > It seems to me that waiting for SR[7:6]=3D00 instead of=0A> just=
=0A> > SR.6=3D0 would:=0A> > 1. Have the same outcome.=0A> > 2. Be strictly=
 within spec; SR[7:6] have been cleared=0A> > therefore the Erase=0A> > Res=
ume command has been accepted.=0A> =0A> Actually on second thoughts maybe n=
ot: if the erase has=0A> actually completed=0A> when we issue an Erase Resu=
me command then SR.7 should read=0A> back as 1 and we=0A> end up looping fo=
rever. hmm...=0A=0AOK, how about this:=0A=0A1. Erase Suspend now checks SR.=
6, exactly as it *should* according to the=0Aspec flowchart.=0A=0A2. If SR.=
6=3D0 then the erase has already completed, and there is no need to set chi=
p->erase_suspended or subsequently issue an Erase Resume command.=0A=0A3. I=
f an Erase Resume command is needed then we know that the erase has=0Anot c=
ompleted, therefore it should be safe to wait for SR[7:6]=3D00.
