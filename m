Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HSFH8-0007B2-7v
	for linux-mtd@lists.infradead.org; Fri, 16 Mar 2007 16:27:32 +0000
Subject: Re: [PATCH] Obsolete nodes that are unlinked when possible
From: Artem Bityutskiy <dedekind@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1174061640.26465.235.camel@gentoo-jocke.transmode.se>
References: <1174059907.26465.228.camel@gentoo-jocke.transmode.se>
	<1174061640.26465.235.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain; charset=utf-8
Date: Fri, 16 Mar 2007 18:27:09 +0200
Message-Id: <1174062429.11160.10.camel@sauron>
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

Hi Joakim,

On Fri, 2007-03-16 at 17:14 +0100, Joakim Tjernlund wrote:
> Ouch, I just discovered that JFFS2_SUMMARY disables
> jffs2_can_mark_obsolete(c). Is this really needed for all
> obsolete cases?
>=20
> SUMMARY really implies that a better automatic GC is needed, since
> your
> fs will be littered with deletion entries.=20

I am not the author of this stuff, so I probably not the right person
for CC :-)

But it is understandable why they did this - because otherwise it would
need marking corresponding entries in summary as obsolete, and here you
have a problem of an unclean reboot between marking the node and the
summary entry obsolete.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
