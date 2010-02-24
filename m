Received: from web37608.mail.mud.yahoo.com ([209.191.87.91])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nk6ru-0005C1-1X
	for linux-mtd@lists.infradead.org; Wed, 24 Feb 2010 02:20:58 +0000
Message-ID: <688377.21089.qm@web37608.mail.mud.yahoo.com>
Date: Tue, 23 Feb 2010 18:20:50 -0800 (PST)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Legacy memstick support + FTL questions
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1266973815.5068.8.camel@maxim-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > =0A> > It is so and not so.=0A> > It appears, length is not transmitted=
 as part of=0A> actual TPC payload.=0A> > However, number of data payload b=
ytes is always=0A> determined by the media=0A> > register values. If this c=
ondition is not maintained=0A> all sorts of bad=0A> > things may happen.=0A=
> It is finally clear to me.=0A> While googling I found that in fact the CR=
C is transmitted=0A> after data in=0A> both directions=0A> (ieeexplore.ieee=
.org/iel5/40/18745/00865865.pdf?arnumber=3D865865)=0A> =0A> So, if host tra=
nsmits too much or little that media=0A> expects, it will=0A> treat wrong b=
ytes as the CRC, and vise versa. thus both=0A> ends have to=0A> know exactl=
y how many bytes to expect.=0A=0AYes, the CRC is there as well. =0A=0A> =0A=
> One last thing that I probably will accepts as is. It=0A> appears that ca=
rd=0A> has some special way to tell the host that command if=0A> complete=
=0A> regardless or serial/parallel mode, since there is special=0A> hw regi=
ster=0A> (bit 29 of register 16) that is polled only after commands,=0A> an=
d I=0A> verified that it takes significant time to turn that bit=0A> on, th=
us I=0A> suspect that card can somehow inform the host that it not=0A> only=
 accepted=0A> the TPC, but actually done with the command.=0A> =0A=0AThere =
are no any special modes.=0AIt's just sampling the SDIO line at the right t=
ime.=0A=0AThis is, however, should not be of any importance, because a prop=
er=0Adriver should always establish the reason for the failure. It means=0A=
you better read the interrupt register and upon checking it, get status=0Ar=
egister values as well.=0A=0ATI adapters, for instance, do not support all =
these tricks (which are=0Amostly helpful when dealing with MSPro, with its =
much refined and more=0Asensible command set). On the other hand, they are =
the best adapters around=0Aand closely follow Sony's reference design (or, =
quite probably, reference=0Adesign was made by TI in the first place).=0A=
=0A=0A=0A      
