Received: from zeus.vortex.is ([193.4.145.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 157bNN-00062s-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Jun 2001 12:21:25 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <linux-mtd@lists.infradead.org>;
          Wed, 6 Jun 2001 11:25:40 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <linux-mtd@lists.infradead.org>;
          Wed, 6 Jun 2001 11:25:40 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: jffs2
Date: Wed, 6 Jun 2001 11:25:39 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E310A9188@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: "Vipin Malik" <vipin.malik@daniel.com>
Cc: <linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

> -----Original Message-----
> From: Vipin Malik [mailto:vipin.malik@daniel.com]
> Sent: 1. j=FAn=ED 2001 14:56
> To: K=E1ri Dav=ED=F0sson
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: jffs2
>=20
>=20
> K=E1ri Dav=ED=F0sson wrote:
>=20
> > Are there any known issues of running programs from a jffs2=20
> partition?
>=20
> Not that I know of.
>=20
>=20
> > I am attempting to run a program from a jffs2 partition (not root
> > partition which is mounted on /dev/ram)
>=20
> Interesting choice of mount dir names (why "ram"?) :)

Well that is the initrd. I am limited in flash and I found that
compressing
a e2fs and mount it through the initrd mechanism gives me more space in
the
flash for a jffs2 partition that keeps the stuff I need to write to
flash=20
during operation of board (logs, frequently changing configuration
files,
upgradable programs and drivers, etc).

>=20
>=20
> > and the program seem to be running extremely slow and what=20
> is worse it
> > seem to block the kernel at the
> > same time, i.e. I can not ping the board nor telnet to it.
>=20
> Not being able to ping it is bad. Not being able to telnet to it may
> depend on how much CPU resources are available
> to run the telnet daemon.

Yes, actually I found out it was a combination of two "bugs", one was
that I was running a very big (unstriped C++ program) in the range of
3.5 MB from the jffs2 partition, so I guess just uncompressing that kind
of file
takes its time. The second bug was another driver that disables
interrupts, was hanging.....

>=20
> >
> >
> > If I wait long enough I get output from the program on the=20
> console but
> > everything is very very slow.....
> >
>=20
> What processor are you using? How big is your JFFS2 partition=20

The processor is mpc823 running at 50Mhz, no powerhorse but a resonable
CPU for the things we are dooing.

> and what is

The jffs2 partition is 1.75 MB.

> this program that you are running doing?

Data acquizition.

>
> Remember that JFFS2 needs to go GC when the fs gets full (or=20
> near full if
> the background GC task is running). If your program

How full is "near full" for the jffs2?

> is reading/writing from/to the JFFS2 fs it will get blocked. Are you
> generating a lot of data to the JFFS2 fs?

After I striped the executable, it is around 350kb everything is running
much better.

>=20
> Vipin

Thanks,

K.D.
