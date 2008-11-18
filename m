Subject: Re: [PATCH] physmap: Fix leak of memory returned by
	parse_mtd_partitions
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1227016647.27728.398.camel@macbook.infradead.org>
References: <20081112.235733.01917391.anemo@mba.ocn.ne.jp>
	<20081113.005534.56563769.anemo@mba.ocn.ne.jp>
	<8bd0f97a0811120808p5858d5adleeef43b1d374bee1@mail.gmail.com>
	<1227016647.27728.398.camel@macbook.infradead.org>
Content-Type: text/plain; charset=utf-8
Date: Tue, 18 Nov 2008 16:04:38 +0200
Message-Id: <1227017078.16925.123.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-11-18 at 13:57 +0000, David Woodhouse wrote:
> I suspect it might be better to take the simple bug-fix approach for
> now, given that we are planning a revamp of the MTD core API anyway --
> we can redo partitions properly at the point, so they aren't just an
> evil hack.

Off topic: is this going to really happen? Are you have real plans
to do this?

Also, you also mentioned that you have sysfs for MTD, are we going to
see them in mtd-2.6.git any time soon?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
