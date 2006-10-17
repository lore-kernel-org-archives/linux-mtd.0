Received: from mgw-ext13.nokia.com ([131.228.20.172])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GZp7V-0006mc-Mi
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 09:36:44 -0400
Subject: Re: JFFS2 on Lite5200
From: Artem Bityutskiy <dedekind@infradead.org>
To: Andrey Volkov <avolkov@varma-el.com>
In-Reply-To: <4534D8A5.7060206@varma-el.com>
References: <1161081183.22948.58.camel@localhost.localdomain>
	<4534D8A5.7060206@varma-el.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Oct 2006 16:36:33 +0300
Message-Id: <1161092193.3260.61.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Andrea Galbusera <andrea.galbusera@teamware.it>,
	linux-mtd@lists.infradead.org, linuxppc-embedded@ozlabs.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-10-17 at 17:20 +0400, Andrey Volkov wrote:
> P.S. Artem, I repeat, I sent this patch _HALF_YEAR_AGO_
> how about to fix scan.c?

Andrey,

I am not JFFS2 maintainer, David Woodhouse is.

Just looked into your patch. I agree that it may make sense to teach
JFFS2 to use only aligned addresses, but your patch changes
include/asm-ppc/io.h which is probably not MTD's business. It probably
makes sense to submit these changes to a PPC maintainer separately.

A question - does this mean that one can write only 4-byte chunks to
this NOR (?) flash?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
