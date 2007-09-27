Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IaqxB-0007aK-MO
	for linux-mtd@lists.infradead.org; Thu, 27 Sep 2007 06:50:49 -0400
Subject: Re: [PATCH try 3] MTD: OneNAND: fix numerous races
From: Artem Bityutskiy <dedekind@infradead.org>
To: Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <1190889529.12445.11.camel@sauron>
References: <1190889529.12445.11.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Sep 2007 13:50:28 +0300
Message-Id: <1190890228.25883.3.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-09-27 at 13:38 +0300, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Fri, 21 Sep 2007 19:35:21 +0300
> Subject: [PATCH] MTD: OneNAND: fix numerous races
>=20
> This patch make the OneNAND driver much less racy. It fixes
> our "onenand_wait: read timeout!" heisenbugs. The reason of
> these bugs was that the driver did not lock the chip when
> accessing OTP, and it screwed up OneNAND state when the OTP
> was read while JFFS2 was doing FS checking.
>=20
> This patch also fixes other races I spotted:
> 1. BBT was not protected
> 2. Access to ecc_stats was not protected
>=20
> Now the chip is locked when BBT is accessed.
>=20
> To fix all of these I basically split all interface functions
> on 'function()' and 'function_nolock()' parts.
>=20
> I tested this patch on N800 hardware - it fixes our problems.
> But I tested a little different version because our OneNAND
> codebase is slightly out-of-date. But it should be OK.
>=20
> This patch also includes the prin fixes I posted before.
>=20
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> ---

Kyungmin,

I did not test _this_ particular patch, I tested a slightly different
version of it. But the patch fixes quite severe problems which lead
to rare bugs which are very difficult to track.

Can you please try it on your setup, so that I'd ask dwmw2
to apply it and send upstream during the next merge window?

Thanks.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
