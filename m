Received: from west-smtp1.trimble.com ([155.63.128.51])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LmqHC-0002YD-Tj
	for linux-mtd@lists.infradead.org; Thu, 26 Mar 2009 14:09:53 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS Corrupt during power failure
Date: Thu, 26 Mar 2009 08:09:41 -0600
Message-ID: <C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
In-Reply-To: <1238050770.3321.41.camel@localhost.localdomain>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
From: "Eric Holmberg" <Eric_Holmberg@Trimble.com>
To: <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > > Also, could you tell us what MTD drivers you are using?
> > I'm using the physmap CFI flash driver for a CFI-compliant=20
> > S29GL256P90F 256Mbit NOR flash chip.  Is that what you're asking
for?
> >=20
> > I'll keep working on a better way to reproduce the problem.  Let me=20
> > know if I need to add some printk statements somewhere and/or enable

> > UBI or MTD debugging.
>
> Any news? I am afraid your problem will be that UBIFS floods to much.
> In that case try to enable debugging in the config, but do not enable
any debugging messages. Even with > this UBIFS should give useful dumps
when this error happens:

I had to work on some other issues yesterday, but I'm back to the UBIFS
error.  Adding the kernel boot arg "ignore_loglevel" has enabled the
flood of UBIFS messages.  I will be working on the issue today and will
let you know what I find.

> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
>=20
> And BTW, we did not test UBIFS well enough on NOR, and never tested
unclean reboots on NOR, but tested > > them _a lot_ on NAND. So there
may be some problems, but hopefully we can fix them.

Thank you very much for that information -- I will keep that in mind as
I go through the code.

Regards,

Eric Holmberg
Trimble Navigation
Westminster, Colorado
