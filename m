Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LsLY7-0004Ye-I4
	for linux-mtd@lists.infradead.org; Fri, 10 Apr 2009 18:34:06 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Fri, 10 Apr 2009 12:33:56 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <1239383500.3390.76.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: <dedekind@infradead.org>
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@trimble.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Fri, 2009-04-10 at 11:00 -0600, Eric Holmberg wrote:
> > Thank you very much for your help so far.=20
> NP, this is all I can do now without having real NOR and much time :-)
>=20
> >  I am going to do two things:
> >  1. Turn off write buffering which converts the NOR minimum=20
> I/O size from 1 to effectively 32 16-bit words (64 bytes) and=20
> re-run all of the tests.
>=20
> Err, which buffering? Is this something at the flash driver level?=20

This is for the CFI flash interface.  The
drivers/mtd/chips/cfi_cmdset_0002.c driver has write buffers which is
uses to do a "block" write to the NOR flash which for my chip allows
writing up to 32 16-bit words.  This is what I used for the tests with
U-Boot and it is why you see patterns such as the one below.  The code I
used to write this pattern to flash wrote the entire block in 1 write.
The CFI driver then broke up the writes into 64-byte writes.
Apparently, it didn't do them in order (or the flash chip didn't), which
is why you have aa55aa0a values after ffffffff values.  Turning off the
write buffering in the CFI driver by setting FORCE_WORD_WRITE to 1
should solve this (although it will now probably be somewhere between
10x and 32x slower).


30352250  aa55aa0a aa55aa0a aa55aa0a aa55aa0a=20
30352260  aa55aa0a aa55aa0a aa55aa0a aa55aa0a=20
30352270  aa55aa0a aa55aa0a aa55aa0a aa55aa0a=20
30352280  ffffffff ffffffff ffffffff ffffffff=20
30352290  ffffffff ffffffff ffffffff ffffffff=20
303522a0  ffffffff ffffffff ffffffff ffffffff=20
303522b0  aa55aa0a aa55aa0a aa55aa0a aa55aa0a=20
303522c0  ffffffff ffffffff ffffffff ffffffff=20
303522d0  ffffffff ffffffff ffffffff ffffffff=20

Does that make sense now, or am I on the wrong path?

-Eric

>=20
> Note, UBIFS never talks to MTD level, it talks only to UBI=20
> level, which talks to MTD. UBI will provide UBIFS min. I/O=20
> unit size which it reads from mtd->writesize.
> Then if it is < 8, UBIFS will use 8 instead. There is not=20
> fundamental reason for this, it was just easier to implement=20
> UBIFS this way. But this is not big deal.
>=20
> In your case, as I see from your logs, min. I/O unit reported=20
> from MTD to UBI is 1, and from UBI to UBIFS it is 1, but then=20
> UBIFS will use 8 instead. This means all write commands UBIFS=20
> will issue will be aligned to 8 and be multiple of 8.
>=20
> So if you are talking about turning off some buffering on MTD=20
> level, may be it is ok. But if you are talking about UBIFS=20
> level - no need to do anything there.
>=20
