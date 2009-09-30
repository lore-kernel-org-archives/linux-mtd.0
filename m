Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mt2vX-0002uS-LC
	for linux-mtd@lists.infradead.org; Wed, 30 Sep 2009 17:25:24 +0000
From: "Scott Branden" <sbranden@broadcom.com>
To: "Leo (Hao) Chen" <leochen@broadcom.com>
Date: Wed, 30 Sep 2009 10:25:09 -0700
Subject: RE: [PATCH] [MTD] bcmring: mtd nand driver
Message-ID: <9383297B60843144AC17878B479520F110AEE53E10@SJEXCHCCR01.corp.ad.broadcom.com>
In-Reply-To: <20090930004123.GC3812@broadcom.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain;
 charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=20

> -----Original Message-----
> From: Leo (Hao) Chen [mailto:leochen@broadcom.com]=20
> Sent: September 29, 2009 5:41 PM
> To: Scott Branden
> Cc: David Woodhouse; Linux MTD
> Subject: Re: [PATCH] [MTD] bcmring: mtd nand driver
>=20
> On Tue, Sep 29, 2009 at 05:22:05PM -0700, Scott Branden wrote:
> > > +CONFIG_MTD_NAND_BCM_UMI_HWECC=3Dy
> >=20
> > There is no need for an additional CONFIG option.  Just=20
> always use HWECC and delete the soft code.
> >=20
>=20
> Got it. Please check the updated patch in this email after the fix.
>=20
>=20
Looks good.
Acked-by: Scott Branden <sbranden@broadcom.com>=
