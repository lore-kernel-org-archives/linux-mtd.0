Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HSGCO-00010x-H2
	for linux-mtd@lists.infradead.org; Fri, 16 Mar 2007 17:26:42 +0000
Subject: RE: [PATCH] Obsolete nodes that are unlinked when possible
From: Artem Bityutskiy <dedekind@infradead.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
In-Reply-To: <006e01c767ed$30828a40$0667a8c0@Jocke>
References: <006e01c767ed$30828a40$0667a8c0@Jocke>
Content-Type: text/plain; charset=utf-8
Date: Fri, 16 Mar 2007 19:26:08 +0200
Message-Id: <1174065968.11927.2.camel@sauron>
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

On Fri, 2007-03-16 at 18:04 +0100, Joakim Tjernlund wrote:
> Would bad things happen if an unclean reboot happens or will
> you just loose some performance?

Well, probably if you _first_ mark the summary entry obsolete and then
the node itself it would work. The idea that JFFS2 trusts summary and
does not read the actual nodes when scanning.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
