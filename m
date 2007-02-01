Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCWA7-0000ig-DT
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 02:15:18 -0500
Subject: Re: Driver-specific ioctls
From: Artem Bityutskiy <dedekind@infradead.org>
To: Gavin Lambert <gavinl@compacsort.com>
In-Reply-To: <042701c745b1$5dc9c260$0502a8c0@gavinlpc>
References: <042701c745b1$5dc9c260$0502a8c0@gavinlpc>
Content-Type: text/plain; charset=utf-8
Date: Thu, 01 Feb 2007 09:14:54 +0200
Message-Id: <1170314094.6275.9.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-02-01 at 16:30 +1300, Gavin Lambert wrote:
> I came across a situation the other day where I wanted to get some more
> esoteric data from an MTD chip driver into userspace (mostly for
> debugging purposes).  Sadly (at least in 2.6.15) mtdchar doesn't pass
> any unrecognised ioctls to the MTD driver, which seems like the cleanest
> way to do that sort of thing.

Add sysfs support to mtd and export nearly any data outside.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
