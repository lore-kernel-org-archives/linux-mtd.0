Received: from moat.murgatroid.com ([69.17.55.116] helo=mail.murgatroid.com)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgoxu-000882-64
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 13:42:35 -0500
From: "Christopher Hoover" <ch@murgatroid.com>
To: =?iso-8859-1?Q?'J=F6rn_Engel'?= <joern@wohnheim.fh-wedel.de>
Date: Tue, 21 Dec 2004 10:42:07 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20041221135705.GS22636@wohnheim.fh-wedel.de>
Message-Id: <20041221184215.2BC64A00096@mail.murgatroid.com>
Cc: 'Linux MTD' <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH 13/22] remove erase regions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20
>From J=F6rn Engel -
> I see absolutely no reason for complicated erase reagions.  On the
> user side, everyone but mtdchar effectively ignores it anyway.

I don't grok this.   What about flash with variable-sized blocks?  (I =
have a
board with such flash and code that uses eraseregions.)

-ch
