Received: from smtp.nokia.com ([131.228.20.170] helo=mgw-ext11.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IYizV-0001zm-9Z
	for linux-mtd@lists.infradead.org; Fri, 21 Sep 2007 09:56:24 -0400
Subject: Re: [PATCH] MTD: OneNAND: fix numerous races
From: Artem Bityutskiy <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1190382415.14370.207.camel@sauron>
References: <1190382415.14370.207.camel@sauron>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Sep 2007 16:56:02 +0300
Message-Id: <1190382963.14370.209.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2007-09-21 at 16:46 +0300, Artem Bityutskiy wrote:
> >From 5383a93bc534aa15c4e2a260fe5ca4a4ecb8310e Mon Sep 17 00:00:00 2001
> From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Date: Fri, 21 Sep 2007 15:34:43 +0300
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
> This was tested on N800 hardware.
>=20
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Sorry, this patch was against a little older kernel. But anyways,
I'd like to get feedback from Kyungmin.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
