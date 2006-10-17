Received: from mgw-ext14.nokia.com ([131.228.20.173])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GZpmM-0007it-Mw
	for linux-mtd@lists.infradead.org; Tue, 17 Oct 2006 10:19:01 -0400
Subject: Re: JFFS2 on Lite5200
From: Artem Bityutskiy <dedekind@infradead.org>
To: Andrey Volkov <avolkov@varma-el.com>
In-Reply-To: <4534D8A5.7060206@varma-el.com>
References: <1161081183.22948.58.camel@localhost.localdomain>
	<4534D8A5.7060206@varma-el.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Oct 2006 17:18:44 +0300
Message-Id: <1161094725.3260.76.camel@sauron>
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
> Andrea, check ml archive, I already sent patch half-year ago
> (http://ozlabs.org/pipermail/linuxppc-embedded/2006-April/022566.html)
> Problem is in alignment/memcpy: JFFS2 code assumed that memory at
> unaligned addresses could be touched, but access to an external MMIO
> on MPC5200 _must_ be aligned (i.e. you could not read u32 from odd addres=
s).
>=20
> P.S. Artem, I repeat, I sent this patch _HALF_YEAR_AGO_
> how about to fix scan.c?

Just talked to David. Please, find the result of our discussion in my
edition below.

Strictly speaking, JFFS2 *does not* do anything wrong, so it should not
be fixed. Indeed, JFFS2 does have full right to use memcpy() for that.

The question is: does memcpy() make sense for flash adresses at your
board? Is it a valid operation for flash addresses at your board?

If the answer is yes - then please fix memcpy() for your platform.

If no - then please, do not pretend that your flash may be treated as
memory and fix your platform MTD driver. Namely, set point()/unpoint()
to NULL in your mapping driver - JFFS2 should work then.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
