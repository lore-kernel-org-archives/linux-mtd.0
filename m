Date: Wed, 13 Jul 2016 10:13:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Teresa Remmet <t.remmet@phytec.de>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org,
 =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 2/2] mtd: nand: omap2: Add check for old elm binding
Message-ID: <20160713171303.GA136972@google.com>
References: <1467711150-23356-1-git-send-email-t.remmet@phytec.de>
 <1467711150-23356-2-git-send-email-t.remmet@phytec.de>
 <20160710005614.GB29572@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160710005614.GB29572@localhost>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jul 09, 2016 at 05:56:14PM -0700, Brian Norris wrote:
> On Tue, Jul 05, 2016 at 11:32:30AM +0200, Teresa Remmet wrote:
> > commit c9711ec5250b ("mtd: nand: omap: Clean up device tree support")
> > removes the check for the old elm phandle binding.
> 
> That seems like a silly breakage of backwards compatibility. Must have
> overlooked that one, sorry.
> 
> > Add it again to keep backward compatibility.
> > 
> > Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
> 
> I think we should probably take this for v4.7, since the breaking commit
> was only merged in v4.7-rc1. OMAP folks, any comment?

Applied to linux-mtd.git. I plan to send this to Linus for v4.7, since
it's a DT regression, unless someone has a good reason not to.

Brian
