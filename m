Received: from arroyo.ext.ti.com ([192.94.94.40])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OXBIy-0008C1-Nu
	for linux-mtd@lists.infradead.org; Fri, 09 Jul 2010 10:59:41 +0000
From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Fri, 9 Jul 2010 16:29:32 +0530
Subject: RE: [PATCH v6 0/3] omap3 nand: cleanup exiting platform related code
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B030E181B51@dbde02.ent.ti.com>
References: <1278660308-8689-1-git-send-email-s-ghorai@ti.com>
	<20100709083256.GI24913@atomide.com>
In-Reply-To: <20100709083256.GI24913@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tony,

> -----Original Message-----
> From: Tony Lindgren [mailto:tony@atomide.com]
> Sent: Friday, July 09, 2010 2:03 PM
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org
> Subject: Re: [PATCH v6 0/3] omap3 nand: cleanup exiting platform related
> code
>=20
> * Sukumar Ghorai <s-ghorai@ti.com> [100709 10:19]:
> >    The following set of patches applies on top of for-next branch.
> > 	http://git.kernel.org/?p=3Dlinux/kernel/git/tmlind/linux-omap-2.6.git
> >    Patches verified on: omap3430-SDP, omap3630-sdp, zoom3 and beagle
> board
> >
> >    And these are the patches required to address the following input -
> >      1. The NAND driver needs to stop tinkering with the GPMC registers
> > 	The omap General Purpose Memory Controller (GPMC) registers are omap
> >         specific, and not driver specific. Tinkering with these
> registers can
> >         cause issues with the other devices on the GPMC.
> >
> >      2. Passing hardcoded GPMC_CS0_BASE needs to go from the board file=
s
> > 	Passing hardcoded GPMC virtual addressess is sure way to mess up
> things.
> >         This should all become unnecessary once the NAND drivers stops
> messing
> >         with the GPMC registers directly.
>=20
> Looks good to me, thanks for doing this.
>=20
> One more request: Please repost this series one more time with linux-arm-
> kernel
> mailing list Cc'd. Then if no comments, I'll merge this series during the
> next
> merge window.

[Ghorai] Thanks.=20
And would you please check if you have any input on following patch series?=
 Otherwise I will rework on this and send again. We need those patches in t=
his time.
1. http://www.mail-archive.com/linux-omap@vger.kernel.org/msg30735.html
2. http://www.mail-archive.com/linux-omap@vger.kernel.org/msg31471.html

Regards,
Ghorai
