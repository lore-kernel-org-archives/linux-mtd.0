Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFXs4-0005Lz-QG
	for <linux-mtd@lists.infradead.org>; Fri, 31 Oct 2003 11:55:18 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20031031112421.GC5604@wohnheim.fh-wedel.de>
References: <Law11-F26lgYBr4BvRn0000b9c5@hotmail.com>
	 <1067539988.3423.208.camel@hades.cambridge.redhat.com>
	 <20031031112421.GC5604@wohnheim.fh-wedel.de>
Message-Id: <1067601200.24809.13.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 31 Oct 2003 11:53:20 +0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
cc: linux-mtd@lists.infradead.org
cc: jffs-dev@axis.com
cc: J B <mad_flasher@hotmail.com>
Subject: Re: jffs2 fragmentation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-10-31 at 12:24 +0100, J=C3=B6rn Engel wrote:
> If your explanation is correct, a shift from 4 to 28 minutes would
> correspond to 6 clean nodes reused for every 1 dirty node deleted and
> new node written.
>=20
> Doesn't make a lot of sense with a filesystem that should be >80% free
> or dirty, does it?

Hmmm. The figure of 87% was _with_ the large file, wasn't it? How full
is it when the large file is deleted?=20

When it's 80% full it does make sense. It's 80% full. 20% "free or
dirty". Your 20% free space is mixed in with the clean data; you have to
move 6 nodes out of the way for every node's worth of space you recover.

Consider the case where every eraseblock has 80% clean data and 20% of
each contains part of the large file you've just deleted, and is hence
now dirty. Then you write the same large file again. Garbage collection
happens -- each time we GC a full eraseblock we recover and rewrite 80%
of an eraseblock of clean data, and we manage to write 20% of an
eraseblock of the new file. The 80/20 ratio hence remains stable.

--=20
dwmw2
