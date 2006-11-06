Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gh4NX-0007Us-2Y
	for linux-mtd@lists.infradead.org; Mon, 06 Nov 2006 08:19:14 -0500
Subject: Re: UBI and OneNand
From: Artem Bityutskiy <dedekind@infradead.org>
To: haver@vnet.ibm.com
In-Reply-To: <1162806360.5636.19.camel@localhost.localdomain>
References: <Pine.LNX.4.33.0611040819560.26940-100000@arrows.demon.co.uk>
	<1162806360.5636.19.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Nov 2006 15:18:49 +0200
Message-Id: <1162819129.15435.46.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: John <john@arrows.demon.co.uk>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Mon, 2006-11-06 at 10:46 +0100, Frank Haverkamp wrote:
> >   1. Should I expect UBI to run on OneNAND without change, or should I
> >      expect to have to write or adapt some code?
>=20
> UBI should run on mostly any mtd device. I tried it on NAND as well as
> NOR mtds.
Yeah, in theory you should be able.

> >   4. The UBI faq
> >      http://www.linux-mtd.infradead.org/faq/ubi.html#L_run_ubi says
> >      that when UBI is compiled into the Kernel, you should call
> >      ubi_attach_mtd_dev() to launch the UBI code.  But
> >      ubi_attach_mtd_dev() is now declared static, so I guess the
> >      advice is out of date.  How should UBI be started when compiled
> >      into the kernel?
>=20
> We decided that the connection between UBI and its mtd should be made at
> the kernel command line, instead of exporting a function to do this.
I'll update the FAQ.

> >   5. What is the way to get jffs2 running on an UBI partition?  Should
> >      I still be aiming to use gluebi to provide an MTD partition on
> >      top of a UBI partition (whatever that means)? Cook book
> >      instructions would be very helpful.

Just enable "Emulate MTD devices" option in the configuration and UBI
will create an MTD device for each volume, and those MTD devices may be
used to mount JFFS2.

I'll update the FAQ.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
