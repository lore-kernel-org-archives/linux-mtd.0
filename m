Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Luxoi-0005k8-Vz
	for linux-mtd@lists.infradead.org; Fri, 17 Apr 2009 23:50:03 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Fri, 17 Apr 2009 17:49:52 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <1239979018.3390.298.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
	<1239860798.3390.205.camel@localhost.localdomain>
	<20090416213400.GA10578@shareable.org>
	<1239958593.3390.293.camel@localhost.localdomain>
	<20090417135149.GA7129@shareable.org>
	<1239979018.3390.298.camel@localhost.localdomain>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: <dedekind@infradead.org>,
	"Jamie Lokier" <jamie@shareable.org>
Cc: Urs Muff <urs_muff@trimble.com>, linux-mtd@lists.infradead.org,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > >=20
> > > Then I guess we should just introduce mtd->max_corruption=20
> ? This would
> > > mean maximum amount of bytes corruption may span in vase=20
> of power cuts?
> >=20
> > With that name maybe whoever implements striping will remember think
> > about parallelism and limit it :-)
> >=20
> >   /* Max size of corrupted block when a write command is interrupted
> >      by reset or power failure. */
> >   u32 max_write_corruption;

I like this suggestion -- good variable name.

>=20
> Yeah, let's wait for Eric's results and then will work on
> extending MTD device model with this parameter.
>=20

As suggested, I patched my 2.6.27 kernel with the latest from
http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git (includes all
updates up to and including fhe fix-recovery bug,
http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git?a=3Dcommit;h=3D=
e14
4c1c037f1c6f7c687de5a2cd375cb40dfe71e).

I have the unit running with a maximum write buffer of 8 bytes (the NOR
flash chip is capable of 64 bytes).

I was seeing 4 different failure scenarios with the base 2.6.27 code,
but now I am only seeing one remaining failure after 30+ hours of power
cycling.  I added a stack dump this afternoon that will let me pinpoint
exactly what is happening, but haven't seen the failure, yet.

The failure happens when I get two corrupt empty LEB's.  I believe the
scenario is that an erase is interrupted and on the next boot, while the
file system is being recovered, another power failure occurs.

I can erase one of the LEB's manually in U-Boot and the file system
recovers properly.

I'm going to leave the units running over the weekend and see what is
waiting for me Monday morning.

Thanks for your help so far and have a great weekend!

-Eric

P.S.  I am scheduled to work on some higher-priority items next week, so
I won't be able to work on the max_write_corruption code.
