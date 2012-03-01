Received: from nm8.bullet.mail.ird.yahoo.com ([77.238.189.23])
 by merlin.infradead.org with smtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S39hk-0001RH-4I
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 17:22:12 +0000
Message-ID: <1330622530.76119.YahooMailClassic@web29018.mail.ird.yahoo.com>
Date: Thu, 1 Mar 2012 17:22:10 +0000 (GMT)
From: Paul Parsons <lost.distance@yahoo.com>
Subject: Re: [PATCH] mtd: cfi: Wait for Block Erase operation to finish
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
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

--- On Thu, 1/3/12, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:=
=0A> > OK, I think I've made some progress here.=0A> >=0A> > The status tra=
nsitions around the Erase Resume are as=0A> follows:=0A> >=0A> > [=A0=A0=A0=
58.702774] 108: PUTC: 0:=0A> status=3D0x00c000c0 // Before CMD(0xd0)=0A> > =
[=A0=A0=A058.702792] 108: PUTC: 1:=0A> status=3D0x00400040 // After CMD(0xd=
0),CMD(0x70)=0A> > [=A0=A0=A058.702808] 108: PUTC: 2:=0A> status=3D0x000000=
00 // + cfi_udelay(1)=0A> =0A> hmm, this is not ideal. The status bits are =
only valid if=0A> SR.7 is set if I remember correctly?=0A> Maybe SR.6 is an=
 exception?=0A> So reading SR.6 and waiting for it to clear may not work on=
=0A> other chips?=0A> Is there some resume to erase time in the specs?=0A=
=0AYes the spec I have (Intel StrataFlash, 253854-003) says SR[6:1] are val=
id=0Aonly if SR.7=3D1. It also says (section 13.4) "The Erase Resume comman=
d=0Ainstructs the corresponding segment to continue erasing, and automatica=
lly=0Aclears status register bits SR[7:6]". The flowchart makes no mention =
of=0Aneeding to poll the status register after issuing an Erase Resume comm=
and.=0AThe spec makes no mention of Erase Resume time.=0A=0AIt seems to me =
that waiting for SR[7:6]=3D00 instead of just SR.6=3D0 would:=0A1. Have the=
 same outcome.=0A2. Be strictly within spec; SR[7:6] have been cleared ther=
efore the Erase=0AResume command has been accepted.
