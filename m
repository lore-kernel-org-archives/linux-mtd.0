Received: from web37603.mail.mud.yahoo.com ([209.191.87.86])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NjqeD-0005ww-Hs
	for linux-mtd@lists.infradead.org; Tue, 23 Feb 2010 09:01:45 +0000
Message-ID: <75802.83415.qm@web37603.mail.mud.yahoo.com>
Date: Tue, 23 Feb 2010 01:01:40 -0800 (PST)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Legacy memstick support + FTL questions
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1266880283.32669.8.camel@maxim-laptop>
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

> > > Alex, could you explain how a single TPC is=0A> performed?=0A> > > =
=0A> > > I currently first send MS_TPC_SET_RW_REG_ADRS,=0A> and then=0A> > =
> MS_TPC_READ_REG=0A> > > =0A> > > When I send the TPC I specify both the t=
pc number=0A> and its=0A> > > len. Is the=0A> > > len transmitted?=0A> > =
=0A> > Of course, it is. How otherwise media would know how=0A> many bits t=
o sample=0A> > in?=0A> By watching the #BS?=0A> Every clock cycle media rea=
ds 1 or 4 bits, when #BS goes=0A> low it stops=0A> reading...=0A> Why other=
wise one would need the #BS line?=0A=0AIt is so and not so.=0AIt appears, l=
ength is not transmitted as part of actual TPC payload.=0AHowever, number o=
f data payload bytes is always determined by the media=0Aregister values. I=
f this condition is not maintained all sorts of bad=0Athings may happen.=0A=
=0A=0A=0A      ____________________________________________________________=
______________________=0AYahoo!7: Catch-up on your favourite Channel 7 TV s=
hows easily, legally, and for free at PLUS7. www.tv.yahoo.com.au/plus7
