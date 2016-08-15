Date: Mon, 15 Aug 2016 09:02:20 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Teresa Remmet <t.remmet@phytec.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] ARM: dts: am335x: Update elm phandle binding
Message-ID: <20160815160220.GP28140@atomide.com>
References: <1467711150-23356-1-git-send-email-t.remmet@phytec.de>
 <20160713171407.GB136972@google.com>
 <9354c50f-f851-f473-a8af-0a84c951453e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9354c50f-f851-f473-a8af-0a84c951453e@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [160801 02:25]:
> On 13/07/16 20:14, Brian Norris wrote:
> > On Tue, Jul 05, 2016 at 11:32:29AM +0200, Teresa Remmet wrote:
> >> The check for the "elm_id" binding had been removed.
> >> This causes nand boot to fail on boards still using
> >> the old binding. Update the bindings on those boards.
> > 
> > Acked-by: Brian Norris <computersforpeace@gmail.com>
> > 
> > We're fixing the backward compatibility issue anyway, but might as well
> > "upgrade" the device tree.
> > 
> >> Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
> 
> Acked-by: Roger Quadros <rogerq@ti.com>
> 
> Tony,
> 
> Please take this one via your OMAP DT tree. Thanks.

Applying to omap-for-v4.8/fixes finally thanks. Sorry for
the delay.

Regards,

Tony
