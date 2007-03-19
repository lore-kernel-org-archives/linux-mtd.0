Received: from 147.175.241.83.in-addr.dgcsystems.net ([83.241.175.147]
	helo=tmnt04.transmode.se)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HTJHc-0001rb-B2
	for linux-mtd@lists.infradead.org; Mon, 19 Mar 2007 10:56:27 -0400
Subject: Re: [PATCH] Obsolete nodes that are unlinked when possible
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <45FE6C2D.40509@inf.u-szeged.hu>
References: <006e01c767ed$30828a40$0667a8c0@Jocke>
	<45FE6C2D.40509@inf.u-szeged.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Mar 2007 15:56:06 +0100
Message-Id: <1174316166.26465.258.camel@gentoo-jocke.transmode.se>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: joakim.tjernlund@transmode.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-03-19 at 11:55 +0100, Ferenc Havasi wrote:
> Joakim Tjernlund =C3=ADrta:
> > Would bad things happen if an unclean reboot happens or will
> > you just loose some performance?
> >  =20
> There were many reason to set jffs2_can_mark_obsolete(c) to 0.
>=20
> As Artem wrote if we would like to enable we have to mark not only the=20
> node as obsolete but also the summary entry.
>=20
> It is not too easy because of the followings:
> - If you would like to modify the summary node on the flash it breaks=20
> the CRC of the summary node. A solutions can be: the ACCURATE bit should=20
> not included in the CRC. An other (worse) solution can be: when we=20
> obsolate a node we overwrite the summary magic with 0, and at the next=20
> mount the system will scan the erase block instead of using the summary=20
> (peformance penalty).
> - We also have to take care about not only the already written out=20
> summary. The summary is written out when the jffs2 close an erase block.=20
> If you want to mark obsolete a node in the unclosed eraseblock=20
> (nextblock) you should obsolate it in the collected summary, too.=20
> However it is not a big task, but also needs code modification and testin=
g.

I see, however I think it is highly desirable to have both SUMMARY and
mark obsolete support as the FS becomes very dirty quickly on some
systems.

I did some tests with and without SUMMARY support compiled into
the kernel and strangely there wasn't a difference in boot
time on my system, 13 seconds in both cases. The FS image was the same
and had about 110 EB with summary info. Is something broken
wrt. summary support on recent kernels(2.6.20 on Powerpc)?

I have also noted that GC isn't performed unless there is lack of space
on flash. I have also noted that JFFS2 doesn't erase obsolete erase
blocks immediately even though the jffs2 code tries to do this(I known
my 2.4 kernel does this)

 Jocke
