Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MjKFx-00008N-7K
	for linux-mtd@lists.infradead.org; Thu, 03 Sep 2009 21:54:17 +0000
From: "Paulraj, Sandeep" <s-paulraj@ti.com>
To: David Brownell <david-b@pacbell.net>
Date: Thu, 3 Sep 2009 16:53:10 -0500
Subject: RE: [patch 3/3] mtd-nand: DaVinci: Add 4-bit ECC support for large
	page NAND chips
Message-ID: <0554BEF07D437848AF01B9C9B5F0BC5D923DAA36@dlee01.ent.ti.com>
References: <200908071824.n77IONlo008375@imap1.linux-foundation.org>
	<200908271908.15309.david-b@pacbell.net>
	<0554BEF07D437848AF01B9C9B5F0BC5D91E07BD2@dlee01.ent.ti.com>
	<200909031448.43314.david-b@pacbell.net>
In-Reply-To: <200909031448.43314.david-b@pacbell.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Troy Kisky <troy.kisky@boundarydevices.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>




> On Friday 28 August 2009, Paulraj, Sandeep wrote:
> > I've already sent the patch to U-Boot and it has been accepted.
> > Its in the nand next branch.
>=20
> Actually at that time it was also in the u-boot-next branch;
> and since then (after U-Boot 2009.08 got tagged) it's been
> merged into the current U-Boot GIT tree.  :)
[Sandeep] that's very correct
>=20
>=20
> > For things to become fully functional i'll need a syncs
> > between the various branches of U-Boot. I'll have to enable
> > stuff in the DM355 and Dm365 configs
>=20
> I've got a DM355 config patch; why don't I send that along,
> after I test with the latest u-boot and some Linux version
> which includes the relevant NAND apatches.  It's been
> waiting on that merge, which has now happened.
[Sandeep] No probs. My config update patch(to enable NAND) got accepted but=
 Jean-Christophe forgot to merge it. So I was about to send it again since =
he insisted that I send again.
>=20
> - Dave
>=20
>=20
