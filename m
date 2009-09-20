Received: from sdcmail01.amcc.com ([198.137.200.72])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MpMew-0004ae-W7
	for linux-mtd@lists.infradead.org; Sun, 20 Sep 2009 13:41:03 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] [JFFS2] Fix csize integer overflow issue due to truncation
Date: Sun, 20 Sep 2009 06:40:55 -0700
Message-ID: <0CA0A16855646F4FA96D25A158E299D606FFE638@SDCEXCHANGE01.ad.amcc.com>
In-Reply-To: <1253450032.6317.89.camel@macbook.infradead.org>
References: <25217471.1985431251223831787.JavaMail.nabble@isper.nabble.com>
	<0CA0A16855646F4FA96D25A158E299D606EDB04E@SDCEXCHANGE01.ad.amcc.com>
	<1253392841.6317.37.camel@macbook.infradead.org>
	<0CA0A16855646F4FA96D25A158E299D606FFE631@SDCEXCHANGE01.ad.amcc.com>
	<1253450032.6317.89.camel@macbook.infradead.org>
From: "Victor Gallardo" <vgallardo@amcc.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: Prodyut Hazarika <phazarika@amcc.com>, linux-mtd@lists.infradead.org,
	Feng Kan <fkan@amcc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

> > Overall the patch looks good to me, except this line.
> >
> > > +#define tn_overlapped(tn)	(!!(((tn)->__csize) & TN_OVERLAP))
> >
> > Should just be this.
> >
> > #define tn_overlapped(tn)	((tn)->__csize) & TN_OVERLAP)
>=20
> You object to the !! ?
>=20
> That was intentional. Sometimes we print the value of tn_overlapped(),
> and I wanted it to be 1, not a huge number.

Sorry about that. Yes, you are 100% correct.

I'll try to patch on Monday.

Best Regards,

Victor Gallardo
