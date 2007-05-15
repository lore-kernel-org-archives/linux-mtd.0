Received: from mycroft.westnet.com ([216.187.52.7])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ho2Qg-0006z8-Hy
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 15:11:27 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Message-ID: <17994.1241.436841.681216@stoffel.org>
Date: Tue, 15 May 2007 15:07:05 -0400
From: "John Stoffel" <john@stoffel.org>
To: Jörn Engel <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
In-Reply-To: <20070515151919.GA32510@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "J=C3=B6rn" =3D=3D J=C3=B6rn Engel <joern@lazybastard.org> writes=
:

J=C3=B6rn> [ I have put everyone that gave comments to the last patch o=
n Cc:.  Hope
J=C3=B6rn> that doesn't offend anyone. ]


J=C3=B6rn> Add LogFS, a scalable flash filesystem.

I've been semi watching this, and the only comment I really can give
is that I hate the name.  To me, logfs implies a filesystem for
logging purposes, not for Flash hardware with wear leveling issues to
be taken into account.

I admit, neither does JFFS2 or YAFFS really do justice either.  And I
do realize your filesystem design is pretty neat. =20


Also, having scanned through the code, I find the name "cookie" using
in logfs=5Finode(), logfs=5Fiput(), logfs=5Figet() to be badly named.  =
It
should really be something like *cached=5Finode, which would seem to
give more natural semantics of

=09if (cached=5Finode)
=09=09do=5Fcached=5Finode=5Fops(...)
=09else
=09=09do=5Finode=5Fops(...)

But hey, I'm not a kernel programmer, so feel free to discount
comments.

John
