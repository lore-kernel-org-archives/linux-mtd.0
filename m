Received: from devils.ext.ti.com ([198.47.26.153])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mvv4J-0001TZ-O4
	for linux-mtd@lists.infradead.org; Thu, 08 Oct 2009 15:38:19 +0000
From: "Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
To: Kevin Hilman <khilman@deeprootsystems.com>, "Pedanekar, Hemant"
	<hemantp@ti.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Date: Thu, 8 Oct 2009 10:37:28 -0500
Subject: RE: [PATCH] mtd: nand: davinci: fix to use mask_ale from pdata
Message-ID: <7A436F7769CA33409C6B44B358BFFF0C012A6FC76F@dlee02.ent.ti.com>
References: <1254407106-19390-1-git-send-email-hemantp@ti.com>
	<87tyy9dih1.fsf@deeprootsystems.com>
In-Reply-To: <87tyy9dih1.fsf@deeprootsystems.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"dbrownell@users.sourceforge.net" <dbrownell@users.sourceforge.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew,

Could you please apply this patch to the -mm tree and thus queue it up for =
2.6.32-rc series?

Thanks
Sneha

> -----Original Message-----
> From: davinci-linux-open-source-bounces@linux.davincidsp.com
> [mailto:davinci-linux-open-source-bounces@linux.davincidsp.com] On Behalf
> Of Kevin Hilman
> Sent: Thursday, October 08, 2009 11:16 AM
> To: Pedanekar, Hemant
> Cc: Artem.Bityutskiy@nokia.com; davinci-linux-open-
> source@linux.davincidsp.com; dbrownell@users.sourceforge.net; linux-
> mtd@lists.infradead.org; akpm@linux-foundation.org; dwmw2@infradead.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] mtd: nand: davinci: fix to use mask_ale from pdata
>=20
> Hemant Pedanekar <hemantp@ti.com> writes:
>=20
> > Correct typo to use mask_ale from platform data when set to non-zero.
> >
> > Signed-off-by: Hemant Pedanekar <hemantp@ti.com>
>=20
> Signed-off-by: Kevin Hilman <khilman@deeprootsystems.com>
>=20
> Could this fix be queued for the .32-rc series please?
>=20
> Thanks,
>=20
> Kevin
>=20
> > ---
> >  drivers/mtd/nand/davinci_nand.c |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/davinci_nand.c
> b/drivers/mtd/nand/davinci_nand.c
> > index 0fad648..20b04a2 100644
> > --- a/drivers/mtd/nand/davinci_nand.c
> > +++ b/drivers/mtd/nand/davinci_nand.c
> > @@ -571,7 +571,7 @@ static int __init nand_davinci_probe(struct
> platform_device *pdev)
> >  	info->mask_chipsel	=3D pdata->mask_chipsel;
> >
> >  	/* use nandboot-capable ALE/CLE masks by default */
> > -	info->mask_ale		=3D pdata->mask_cle ? : MASK_ALE;
> > +	info->mask_ale		=3D pdata->mask_ale ? : MASK_ALE;
> >  	info->mask_cle		=3D pdata->mask_cle ? : MASK_CLE;
> >
> >  	/* Set address of hardware control function */
> > --
> > 1.6.2.4
> >
> > _______________________________________________
> > Davinci-linux-open-source mailing list
> > Davinci-linux-open-source@linux.davincidsp.com
> > http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source
>=20
> _______________________________________________
> Davinci-linux-open-source mailing list
> Davinci-linux-open-source@linux.davincidsp.com
> http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source
