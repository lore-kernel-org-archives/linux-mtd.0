Date: Fri, 28 Jan 2011 08:51:58 -0800
From: Tony Lindgren <tony@atomide.com>
To: "Ghorai, Sukumar" <s-ghorai@ti.com>
Subject: Re: [PATCH RESEND v8 3/7] omap: gpmc: enable irq mode in gpmc
Message-ID: <20110128165158.GU23412@atomide.com>
References: <1295443503-14515-1-git-send-email-s-ghorai@ti.com>
	<1295443503-14515-4-git-send-email-s-ghorai@ti.com>
	<20110121184020.GD11678@atomide.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B036A8DB549@dbde02.ent.ti.com>
	<20110125165735.GL13589@atomide.com>
	<2A3DCF3DA181AD40BDE86A3150B27B6B036AA2EC2E@dbde02.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2A3DCF3DA181AD40BDE86A3150B27B6B036AA2EC2E@dbde02.ent.ti.com>
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

* Ghorai, Sukumar <s-ghorai@ti.com> [110128 00:14]:
> 
> 
> > -----Original Message-----
> > From: Tony Lindgren [mailto:tony@atomide.com]
> > Sent: Tuesday, January 25, 2011 10:28 PM
> > To: Ghorai, Sukumar
> > Cc: linux-omap@vger.kernel.org; linux-mtd@lists.infradead.org; linux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: [PATCH RESEND v8 3/7] omap: gpmc: enable irq mode in gpmc
> > 
> > * Ghorai, Sukumar <s-ghorai@ti.com> [110122 09:53]:
> > > >
> > > > I think I've commented on this before, but why don't you make
> > gpmc_init
> > > > a subsys_initcall? There should be no reason to call this earlier.
> > > > If something does not work because of that, then that issue must be
> > > > fixed.
> > >
> > > [Ghorai] You suggested the same in previous v5 and v6; and I mentioned
> > > the issues [1] that - nand_init()called before
> > subsys_initcall(gpmc_init);
> > > Let me know if I am missing anything again.
> > 
> > There should not be any need to call nand_init early either. We want
> > to initialize as much as possible late so we have proper console
> > error messages.
> 
> [Ghorai] thanks...
> changed to postcore_initcall() and it solved the problem I mentioned earlier. And it simplifies the overall modification in different board files.
> postcore_initcall(gpmc_init);

OK great. I will check the order of initcalls anyways over next few
weeks, so whatever works for the initcall is fine for now.

Regards,

Tony
