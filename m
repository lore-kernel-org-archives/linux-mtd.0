Received: from mail.free-electrons.com ([88.190.12.23])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RVnby-0006V9-Fl
 for linux-mtd@lists.infradead.org; Wed, 30 Nov 2011 17:06:23 +0000
Date: Wed, 30 Nov 2011 18:06:08 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 0/5] MTD: modify mtd api to return bitflip info on read
 operations
Message-ID: <20111130180608.1a8c687d@skate>
In-Reply-To: <4ED66140.8020008@newsguy.com>
References: <4ED66140.8020008@newsguy.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hello,

Le Wed, 30 Nov 2011 09:00:48 -0800,
Mike Dunn <mikedunn@newsguy.com> a =C3=A9crit :

> Thanks Thomas.  For some reason this post never made it to my inbox.  Pas=
ted from the list archive...

Huh, strange. Let's see if this one reaches your Inbox.

> > Making this change in patch 1 will break the build if someone bisects
> > kernel changes between patch 1 and your other patches.
>=20
> Then I guess it should be a single patch.  As a general rule, should indi=
vidual patches=20
> not be interdependent?

My understanding is that the kernel should be buildable at any given
point, so that things such as "git bisect" can easily be used. So, it's
not so much a "interdependence" question but rather a "buildability"
question.

Basically, you have to ensure that the kernel still builds when patch 1
is enabled, when patches 1+2 are enabled, when patches 1+2+3 are
enabled, etc.

> Well, then it wouldn't be a generic mtd read operation, and higher layers=
 would have to be=20
> aware of the type of device and call the appropriate read function.
> Fewer drivers would need to be patched, but patches to infrastructure cod=
e would be complicated=20
> and make the resulting code ugly, I think.

True that having some drivers implementing the standard ->read()
method and some others implementing the extended ->readext() method
would be ugly.

> I'm not a flash expert, but I think that the greatest number of bitflips =
on any one page=20
> is a sufficient diagnostic of the integrity of an eraseblock.  One bad pa=
ge will make the=20
> entire eraseblock unusable, so I'm not sure it's useful to report bitflip=
s for specific pages. =20

Ok, understood, that makes sense to me (but I'm not a flash expert
either).

Regards,

Thomas
--=20
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
