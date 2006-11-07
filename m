Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GhS8i-0007ge-Ko
	for linux-mtd@lists.infradead.org; Tue, 07 Nov 2006 09:41:31 -0500
Subject: Re: UBI and OneNAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1162909455.3092.14.camel@zod.rchland.ibm.com>
References: <32544906.187201162866905328.JavaMail.weblogic@ep_ml06>
	<1162889433.5606.15.camel@localhost.localdomain>
	<loom.20061107T110704-786@post.gmane.org>
	<1162899578.31636.19.camel@sauron>
	<1162900051.19697.16.camel@crusty.rchland.ibm.com>
	<1162908637.31636.23.camel@sauron>
	<1162909455.3092.14.camel@zod.rchland.ibm.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Nov 2006 16:39:54 +0200
Message-Id: <1162910394.31636.29.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: John Smith <john.smith@arrows.demon.co.uk>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-11-07 at 08:24 -0600, Josh Boyer wrote:
> What are you talking about?
>=20
> (128MiB/128KiB) * .01 =3D 10.24
>=20
> So you'd end up with 10EB.

Yeah, but somebody showed me UBI on 128 MiB flashes with 32 or 64 KiB
eraseblocks. Probably EB size should be taken into account.

> Perhaps we should change MTD_UBI_BEB_RESERVE to be an actual number of
> eraseblocks instead of a percent of the device.  So
> MTD_UBI_BEB_RESERVE=3D1 would mean 1 EB, =3D10 would mean 10.

My concern is a dumb user who may not realize what to enter there.

But may be you are right... If user does not set the number of reserved
PEBs explicitly, we could use some percentage as a default value.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
