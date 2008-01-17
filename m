Received: from an-out-0708.google.com ([209.85.132.250])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JFYoD-0004zd-QG
	for linux-mtd@lists.infradead.org; Thu, 17 Jan 2008 17:45:51 +0000
Received: by an-out-0708.google.com with SMTP id c3so153102ana.99
	for <linux-mtd@lists.infradead.org>;
	Thu, 17 Jan 2008 09:45:43 -0800 (PST)
Date: Thu, 17 Jan 2008 11:43:53 -0600
From: Josh Boyer <jwboyer@gmail.com>
To: =?UTF-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Message-ID: <20080117114353.0bc71dac@zod.rchland.ibm.com>
In-Reply-To: <20080117162601.GA6677@lazybastard.org>
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 17 Jan 2008 17:26:01 +0100
J=C3=B6rn Engel <joern@logfs.org> wrote:

> On Thu, 17 January 2008 17:12:29 +0100, Matthieu CASTET wrote:
> >=20
> > we have a 240 MB jffs2 partition with summary enabled and no=20
> > compression. We use 2ad8ee713566671875216ebcec64f2eda47bd19d git jffs2=
=20
> > version=20
> > (http://git.infradead.org/?p=3Dmtd-2.6.git;a=3Dcommit;h=3D2ad8ee7135666=
71875216ebcec64f2eda47bd19d)
> >=20
> >=20
> > On this partition we have several file (less than 1 MB) and a big file=
=20
> > in the root (200 MB).
> >=20
> > The big file is a FAT image that is exported with usb-storage (with usb=
=20
> > device) or mounted on a loopback device.
> >=20
> > After some FAT operations, we manage to get in a situation were the=20
> > jffs2_garbage_collect_pass take 12 minutes.
> >=20
> > jffs2_lookup for the big file (triggered with a ls in the root) take 12=
=20
> > minutes.
> >=20
> > If we do a ls without waiting that jffs2_garbage_collect_pass finish, l=
s=20
> > takes 12 minutes to complete.
>=20
> Impressive!  JFFS2 may be slow, but it shouldn't be _that_ slow.  Not

How do you know?  A 200MiB file will likely have around 50,000 nodes.
If the summary stuff is incorrect, and since we have no idea what kind
of platform is being used here, it may well be within reason.

> sure who cares enough to look at this.  My approach would be to=20
> $ echo t > /proc/sysrq_trigger
> several times during those 12 minutes and take a close look at the code
> paths showing up.  Most likely it will spend 99% of the time in one
> place.

That's sound advice in any case.

josh
