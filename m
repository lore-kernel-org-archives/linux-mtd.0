From: "Woodruff, Richard" <r-woodruff2@ti.com>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Date: Mon, 4 Aug 2008 16:45:19 -0500
Subject: RE: [PATCH] MTD: OMAP2-NAND: Fix partition reading from board info
Message-ID: <13B9B4C6EF24D648824FF11BE89671620361EE18A2@dlee02.ent.ti.com>
References: <9c9fda240807011627v60428f9eh3c2bb17cdc8ce6ea@mail.gmail.com>
	<200808041302.46323.david-b@pacbell.net>
	<20080804201715.GD31974@xi.wantstofly.org>
	<200808041326.38840.david-b@pacbell.net>
	<13B9B4C6EF24D648824FF11BE89671620361EE1833@dlee02.ent.ti.com>
	<20080804213200.GH31974@xi.wantstofly.org>
In-Reply-To: <20080804213200.GH31974@xi.wantstofly.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Kyungmin Park <kmpark@infradead.org>, Tony Lindgren <tony@atomide.com>,
	"Kamat, Nishant" <nskamat@ti.com>, David Brownell <david-b@pacbell.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > The most visible BE-ARM seems to be Intel's IXP network processors.
>
> The IXPs are one of the few cases where the vendors _ships an all-BE
> software development environment by default_ -- but that doesn't mean
> that BE doesn't work on ARM CPUs where the vendor ships a LE software
> development environment by default (BE has certainly worked on all
> ARM CPUs I've ever tried it on).

I wonder how many shipping systems use LE.  A grep of current ARM Linux Kco=
nfig's only shows 3 IXP systems setting CONFIG_CPU_BIG_ENDIAN. Perhaps you =
are correct about ability but few seem to use it. Seems like a trivia quest=
ion for ARM Ltd.

At any rate all OMAPs have been hardwired.

Regards,
Richard W.
