Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HWrQE-0001ZT-Jb
	for linux-mtd@lists.infradead.org; Thu, 29 Mar 2007 06:00:00 -0400
Subject: Re: [PATCH] [JFFS2] Prevent list corruption when handling write errors
From: Artem Bityutskiy <dedekind@infradead.org>
To: joakim.tjernlund@transmode.se
In-Reply-To: <1175161973.2135.1.camel@gentoo-jocke.transmode.se>
References: <460B722F.9020604@nokia.com>
	<1175161973.2135.1.camel@gentoo-jocke.transmode.se>
Content-Type: text/plain; charset=utf-8
Date: Thu, 29 Mar 2007 12:59:42 +0300
Message-Id: <1175162382.19966.11.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <ext-adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-03-29 at 11:52 +0200, Joakim Tjernlund wrote:
> On Thu, 2007-03-29 at 11:00 +0300, Adrian Hunter wrote:
> > If a write error occurs, the affected block is placed on the
> > bad_used_list.  In the case that the write error occured
> > when writing summary data the block was also being placed on
> > the dirty_list, which caused list corruption and ultimately
> > a soft lockup in jffs2_mark_node_obsolete. This fixes that.
>=20
> I thougth that node obsoleting was disabled when summary is active?

Of course not. On-flash obsoleting is disabled, but not in-RAM.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
