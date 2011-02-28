Received: from web30207.mail.mud.yahoo.com ([209.191.69.54])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Ptymx-0007l3-Ow
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2011 08:49:08 +0000
Message-ID: <312621.60695.qm@web30207.mail.mud.yahoo.com>
Date: Mon, 28 Feb 2011 00:49:06 -0800 (PST)
From: Lars Michael <lh_post@yahoo.com>
Subject: Re: mount ubi volume fails: No such device
To: dedekind1@gmail.com
In-Reply-To: <1298630702.2798.45.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=0A=0A--- On Fri, 25/2/11, Artem Bityutskiy <dedekind1@gmail.com> wrote:=0A=
=0A> From: Artem Bityutskiy <dedekind1@gmail.com>=0A> Subject: Re: mount ub=
i volume fails: No such device=0A> To: "Lars Michael" <lh_post@yahoo.com>=
=0A> Cc: linux-mtd@lists.infradead.org=0A> Date: Friday, 25 February, 2011,=
 11:45=0A> On Fri, 2011-02-18 at 02:57 -0800,=0A> Lars Michael wrote:=0A> >=
 NAND read: device 0 offset 0x1, size 0xfffffff=0A> > Skipping bad block 0x=
00000000=0A> > Skipping bad block 0x00020000=0A> > Skipping bad block 0x000=
40000=0A> > <cut>=0A> > Skipping bad block 0x0ffa0000=0A> > Skipping bad bl=
ock 0x0ffc0000=0A> > Skipping bad block 0x0ffe0000=0A> > NAND read from off=
set 10000000 failed -22=0A> >=A0 0 bytes read: ERROR=0A> > -> nand =0A> > =
=0A> > I am really stuck here, and don't know how to proceed.=0A> Is it nor=
mal that=0A> > the flash can suddenly go totally bad?=0A> =0A> Most likely =
not. Probably this is due to a bug=0A> somewhere.=A0 =A0 =A0 =0A> =0A=0ALet=
 us assume this is a software problem and that the NAND device is=0Aok. Not=
e: I did not cycle the power during a flash operation, and I =0Adid not wri=
te (e.g. format or erase) the flash prior to it going bad.=0A=0ACan the bbt=
 somehow be corrupt, reporting all blocks bad even if they=0Aare not?=0A=0A=
Is the problem likely to be in the UBI layer or in the NAND driver=0A(I sus=
pect the first) and how can I troubleshoot this?=0A=0AAny help is appreciat=
ed,=0A=0A- Lars=0A=0A=0A      
