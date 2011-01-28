From: "Ghorai, Sukumar" <s-ghorai@ti.com>
To: Tony Lindgren <tony@atomide.com>
Date: Fri, 28 Jan 2011 13:45:10 +0530
Subject: RE: [PATCH RESEND v8 3/7] omap: gpmc: enable irq mode in gpmc
Message-ID: <2A3DCF3DA181AD40BDE86A3150B27B6B036AA2EC2E@dbde02.ent.ti.com>
References: <1295443503-14515-1-git-send-email-s-ghorai@ti.com>
	<1295443503-14515-4-git-send-email-s-ghorai@ti.com>
	<20110121184020.GD11678@atomide.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B036A8DB549@dbde02.ent.ti.com>
	<20110125165735.GL13589@atomide.com>
In-Reply-To: <20110125165735.GL13589@atomide.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
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



> -----Original Message-----
> From: Tony Lindgren [mailto:tony@atomide.com]
> Sent: Tuesday, January 25, 2011 10:28 PM
> To: Ghorai, Sukumar
> Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH RESEND v8 3/7] omap: gpmc: enable irq mode in gpmc
>=20
> * Ghorai, Sukumar <s-ghorai@ti.com> [110122 09:53]:
> > >
> > > I think I've commented on this before, but why don't you make
> gpmc_init
> > > a subsys_initcall? There should be no reason to call this earlier.
> > > If something does not work because of that, then that issue must be
> > > fixed.
> >
> > [Ghorai] You suggested the same in previous v5 and v6; and I mentioned
> > the issues [1] that - nand_init()called before
> subsys_initcall(gpmc_init);
> > Let me know if I am missing anything again.
>=20
> There should not be any need to call nand_init early either. We want
> to initialize as much as possible late so we have proper console
> error messages.

[Ghorai] thanks...
changed to postcore_initcall() and it solved the problem I mentioned earlie=
r. And it simplifies the overall modification in different board files.
postcore_initcall(gpmc_init);

>=20
> Tony
