Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ONwSe-0007xe-6i
	for linux-mtd@lists.infradead.org; Sun, 13 Jun 2010 23:19:29 +0000
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
	by mailout4.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L3Z00MTH7GAAX20@mailout4.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 08:19:22 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L3Z0098A7GAMF@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Mon, 14 Jun 2010 08:19:22 +0900 (KST)
Date: Mon, 14 Jun 2010 08:19:22 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: RE: [PATCH 1/2] mtd: OneNAND: Add runtime badblock check feature
In-reply-to: <1276421200.19028.192.camel@localhost>
To: dedekind1@gmail.com, 'Joonyoung Shim' <jy0922.shim@samsung.com>
Message-id: <012f01cb0b4e$db1a7550$914f5ff0$%park@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-language: ko
Content-transfer-encoding: quoted-printable
References: <1275380256-15315-1-git-send-email-jy0922.shim@samsung.com>
	<1276421200.19028.192.camel@localhost>
Cc: 'Thomas Gleixner' <tglx@linutronix.de>, linux-mtd@lists.infradead.org
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> -----Original Message-----
> From: Artem Bityutskiy [mailto:dedekind1@gmail.com]
> Sent: Sunday, June 13, 2010 6:27 PM
> To: Joonyoung Shim
> Cc: linux-mtd@lists.infradead.org; Kyungmin Park; Thomas Gleixner
> Subject: Re: [PATCH 1/2] mtd: OneNAND: Add runtime badblock check =
feature
>=20
> On Tue, 2010-06-01 at 17:17 +0900, Joonyoung Shim wrote:
> > From: Kyungmin Park <kyungmin.park@samsung.com>
> >
> > This patch is to support runtime badblock checking. This supports =
only
> > OneNAND currently. The OneNAND badblock checking when boots occurs =
boot
> > time delay. We can reduce boot time because can detect badblock at
> > runtime.
> >
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>=20
> Hi, this feature is interesting. But why not to use bad block table
> instead of adding more complexity to the already very complex and
> difficult to follow code?

>=20
> Also, if you really want this, it should be rather lazy checking, =
where
> you read OOB on demand, and then save this information to the in-ram
> BBT, and when you get another ->block_isbad() for a block which was
> previously checked, you do not read OOB for the second time.

It's based on BBT already. Now I set the BBT values as 0x2 and then =
check it at runtime and then mark it 0 for good, 3 for bad block.

Right, it's same word lazy checking and runtime check.

The original ideas are from UBI scan it read all blocks again at probe.
I just scan almost block read once at ubi scan.

Thank you,
Kyungmin Park

>=20
> CCing Thomas, if we are lucky, he'll provide good input.
>=20
> --
> Best Regards,
> Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =
=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9)
