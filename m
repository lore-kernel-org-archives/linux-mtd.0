Received: from web37606.mail.mud.yahoo.com ([209.191.87.89])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NhODY-0002yH-Fm
	for linux-mtd@lists.infradead.org; Tue, 16 Feb 2010 14:16:04 +0000
Message-ID: <154304.22668.qm@web37606.mail.mud.yahoo.com>
Date: Tue, 16 Feb 2010 06:15:58 -0800 (PST)
From: Alex Dubov <oakad@yahoo.com>
Subject: Re: Legacy memstick support + FTL questions
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1266174235.3451.107.camel@maxim-laptop>
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

=0A> > =0A> > It is quite possible. Some controllers will=0A> automatically=
 retrieve an=0A> > "interrupt" field from the status register on each=0A> m=
edia access (in fact,=0A> > this behavior is mandated in parallel mode). Ch=
eck if=0A> the bits fit "inter-=0A> > rupt" register bits.=0A> Doesn't seem=
 to map to anything.=0A> =0A> =0A> =0A> =0A> 0x10 is polled on register wri=
tes=0A> 0x20 is polled on command writes, and then 0x10 is polled=0A> 0x50 =
(0x40 | 0x10) if polled after MS_TPC_GET_INT and only=0A> it=0A> =0A> 0x03 =
is mask for error detection, if found in any of above=0A> polls, error=0A> =
out.=0A> =0A> The above was for register #19 (0xXX000000) =0A=0ASo, it's pr=
obably an implementation specific register.=0AThere's no common standard fo=
r MS interfaces.=0A=0A> =0A> after the MS_TPC_READ_LONG_DATA, 0x40 is polle=
d, and=0A> register #18 is=0A> polled for 0x20 clear. These are all bits th=
at are=0A> accessed.=0A> =0A> You try to tell me that controller itself iss=
ues TPCs,=0A> reads their=0A> responses, and puts that in registers, right?=
 This is very=0A> interesting.=0A> =0A> Bus is half duplex, and there is a =
line that indicates who=0A> sends data.=0A> =0A> I currently understand tha=
t host sends an TPC, then card=0A> sends a=0A> response. Is it another TPC?=
=0A=0A=0ANot at all.=0AI answered this already.=0ASee below.=0A=0A> > > As =
I understand it, TPCs are send in both=0A> directions, and=0A> > > nothing =
more.=0A> > > There are no dedicated lines, or something like=0A> that.=0A>=
 > =0A> > TPC means "transport protocol command" and it is only=0A> send fr=
om host to=0A> > media. Generally speaking, the whole thing works like=0A> =
this (each point=0A> > is a TPC):=0A> > =0A> > 1. Host selects media regist=
er access window.=0A> > 2. Host modifies media register values.=0A> > 3. Ho=
st invokes media command.=0A> > 4. Host reads media registers.=0A> > 5. Hos=
t moves data around.=0A> > 6. Lather, rinse, repeat.=0A> =0A> > =0A> > > =
=0A> > > So status should be a content of the answer TPC=0A> or=0A> > > som=
ething like that.=0A> > =0A> > It is not.=0A> > =0A=0ALegacy MS protocol us=
es 3 meaningful lines: SCLK (clock), SDIO (data/=0Acommand IO) and BS (bus =
state lane). There may be additional 3 or 7=0ADIO lines but they are only u=
sed for bulk data transfer.=0A=0AThere are 4 hw states:=0A=0A1) BS at low -=
 media is idle=0A2) BS goes to high - TPC is clocked in on SDIO=0A3) BS goe=
s to low - host waits for level change on SDIO=0A4) BS goes to high - data =
can be clocked in/out on all data lines=0A5) BS goes to low again -> same a=
s 1 (idle)=0A=0AMedia can not initiate anything and can not send anything t=
o host.=0AHost is responsible to query the media state as necessary.=0A=0A>=
 > > I wish I had the memstick spec (original not=0A> pro)=0A> > > =0A> > =
=0A> > There's an email address on Sony's website.=0A> And the chances they=
 give me the specs without NDA and a=0A> lump of money=0A> are higher that =
winning a lottery?=0A> =0A=0AThey will give you the spec for nothing if you=
're a certified sony=0Adeveloper. How do you become one is different questi=
on, but it is not=0Amoney dependent.=0A=0A=0A=0A      _____________________=
_____________________________________________________________=0AYahoo!7: Ca=
tch-up on your favourite Channel 7 TV shows easily, legally, and for free a=
t PLUS7. www.tv.yahoo.com.au/plus7
