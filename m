From: Arnd Bergmann <arnd@arndb.de>
To: dedekind1@gmail.com
Subject: Re: [PATCH] ARM: LPC32xx: Provide DMA filter callbacks via platform
 data
Date: Fri, 17 Aug 2012 11:40:50 +0000
References: <1345122935-22115-1-git-send-email-stigge@antcom.de>
 <1345201311.27859.51.camel@sauron.fi.intel.com>
 <1345201835.27859.52.camel@sauron.fi.intel.com>
In-Reply-To: <1345201835.27859.52.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <201208171140.50388.arnd@arndb.de>
Cc: Roland Stigge <stigge@antcom.de>, srinivas.bakki@nxp.com,
 linux@arm.linux.org.uk, linux-kernel@vger.kernel.org, kevin.wells@nxp.com,
 linux-mtd@lists.infradead.org, aletes.xgr@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 17 August 2012, Artem Bityutskiy wrote:
>   Show Details
>   On Fri, 2012-08-17 at 14:01 +0300, Artem Bityutskiy wrote:
> > > To later avoid collisions on subsystem merge, can you please leave the
> > > patch with arch/arm/mach-lpc32xx/phy3250.c for arm-soc.git? (I will
> > > provide a pull request for Arnd and Olof, as usual.)
> > 
> > Only if Arnd insists. Otherwise I'd prefer to resolve collisions (they
> > cannot be hard with this patch) than pulling the soc tree to the mtd
> > tree.
> 
> Actually the mtd patches do not compile-depend on it, sorry, I am
> dropping it from the MTD tree. Thanks!

For reference, I'm fine with either outcome, I don't mind seeing an
occasional collision with subsystem trees, as they tend to be trivial
to resolve.

If you split a series to go through multiple git trees, you have to
ensure that both halves are actually regression free by themselves,
which typically ends up being much harder than fixing a small merge
conflict.

	Arnd
