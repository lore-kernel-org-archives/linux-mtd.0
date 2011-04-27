Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QEy8d-0008VK-T2
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2011 06:22:20 +0000
Date: Wed, 27 Apr 2011 08:22:08 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Umar Qureshey <umar@janteq.com>
Subject: Re: Discovering current MTD partition
In-Reply-To: <1303882262.2778.51.camel@localhost>
Message-ID: <Pine.LNX.4.64.1104270820560.15966@lnxricardw.se.axis.com>
References: <000201cc046b$b03a6310$10af2930$@janteq.com>
	<1303882262.2778.51.camel@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Wed, 27 Apr 2011, Artem Bityutskiy wrote:
>=20
> > On Tue, 2011-04-26 at 16:43 -0700, Umar Qureshey wrote:
> > Hi,
> >=20
> > I searched this list's archive but did not see anything pertinent.
> >=20
> > I was wondering if there is a way to find out what the currently active=
 mtd
> > partition is.  In my system, I have a few flash partitions for my file
> > system and the kernel boots with the partition that is specified on the
> > kernel command line.  Aside from scanning /proc/cmdline, is there a way=
 to
> > programmatically ascertain which mtd partition is active *now*.=20
> > I need to find this information within a Python script but really if it=
 can
> > be done in C (perhaps a syscall?), it's all I need.
>=20
> What does active mean? Anyway, there is /proc/mtd at your disposal.

If you want to find out which partition is mounted as root you could look=
=20
at /proc/mounts .

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
