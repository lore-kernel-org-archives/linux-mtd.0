From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: "Nori, Sekhar" <nsekhar@ti.com>, "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>
Date: Tue, 4 Jan 2011 14:20:17 +0530
Subject: RE: [PATCH v7 4/7] omap3: nand: prefetch in irq mode support
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B036A57ACC7@dbde02.ent.ti.com>
References: <1293629546-18831-1-git-send-email-s-ghorai@ti.com>
	<1293629546-18831-5-git-send-email-s-ghorai@ti.com>
	<B85A65D85D7EB246BE421B3FB0FBB593024816D63C@dbde02.ent.ti.com>
In-Reply-To: <B85A65D85D7EB246BE421B3FB0FBB593024816D63C@dbde02.ent.ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Vimal Singh <vimalsingh@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



[..snip...]
> > +		if (info->buf_len & (info->buf_len < bytes))
>=20
> Meant to use logical AND here?
[Ghorai] thanks, you are right.

[..snip..]
> > +	init_completion(&info->comp);
>=20
> You can use INIT_COMPLETION to reset the completion variable.
> Same change can be done in write below.
[..snip..]
> s/methode/method
>=20
[Ghorai] yes. I will do this=20

[..snip..]
> > +	/* waiting for write to complete */
> > +	wait_for_completion(&info->comp);
> > +	/* wait for data to flushed-out before reset the prefetch */
> > +	do {
> > +		ret =3D gpmc_read_status(GPMC_PREFETCH_COUNT);
> > +	} while (ret);
>=20
> Please have a timeout for this while loop in case hardware does
> not become ready. Also, consider using cpu_relax() inside the
> tight loop.
>=20
[Ghorai] Thanks. I will send again.
