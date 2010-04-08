Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nzudp-0005Wm-KD
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 16:31:42 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Steve Sakoman <sakoman@gmail.com>, Vimal Singh <vimal.newwork@gmail.com>
Date: Thu, 8 Apr 2010 22:01:32 +0530
Subject: RE: [PATCH 0/3][NAND][OMAP]: fixing omap nand driver issues
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030D44E1BA@dbde02.ent.ti.com>
References: <ce9ab5791001060558u362f17baj5ee90e9b4adb72a7@mail.gmail.com>
	<l2v5e088bd91004080858ub5dd068ci711a5399098ba0ee@mail.gmail.com>
In-Reply-To: <l2v5e088bd91004080858ub5dd068ci711a5399098ba0ee@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	Linux MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> -----Original Message-----
> From: linux-omap-owner@vger.kernel.org [mailto:linux-omap-
> owner@vger.kernel.org] On Behalf Of Steve Sakoman
> Sent: 2010-04-08 21:28
> To: Vimal Singh
> Cc: Linux MTD; linux-omap@vger.kernel.org
> Subject: Re: [PATCH 0/3][NAND][OMAP]: fixing omap nand driver issues
>=20
> On Wed, Jan 6, 2010 at 5:58 AM, Vimal Singh <vimal.newwork@gmail.com>
> wrote:
> > From 3700088e8da8c890d9e4c6eb626e18287d149b97 Mon Sep 17 00:00:00 2001
> > From: Vimal Singh <vimalsingh@ti.com>
> > Date: Tue, 5 Jan 2010 16:43:08 +0530
> > Subject: [PATCH] fixing omap nand driver issues
> >
> > fixing omap nand driver issues.
> >
> > Vimal Singh (3):
> > =A0Fixing compilation warning for 'nand/omap2.c'
> > =A0NAND: OMAP: correct 'info' pointer in 'omap_nand_remove'
> > =A0NAND: OMAP: Fixing issue in oamp nand driver in prefetch mode read
>=20
> What is the status of this patch series?

[Ghorai] These are already accepted by MTD-list. Please check the first thr=
ee patches in the link -
http://git.infradead.org/mtd-2.6.git?a=3Dsearch&h=3DHEAD&st=3Dcommit&s=3Dvi=
mal

>=20
> I've been testing them on Overo and Beagle and they do indeed solve
> the prefetch issue.  So if they are queued waiting an ack:
>=20
> Acked-by: Steve Sakoman <steve@sakoman.com>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-omap" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
