Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUhSY-0002un-3M
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 18:29:10 +0000
Date: Fri, 11 Oct 2013 11:28:40 -0700
From: Tony Lindgren <tony@atomide.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v8 6/6] mtd: nand: omap: updated devm_xx for all
 resource allocation and free calls
Message-ID: <20131011182840.GW29913@atomide.com>
References: <1381498603-15715-1-git-send-email-pekon@ti.com>
 <1381498603-15715-7-git-send-email-pekon@ti.com>
 <20131011181515.GJ23337@ld-irv-0074.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131011181515.GJ23337@ld-irv-0074.broadcom.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 Pawel.Moll@arm.com, dedekind1@gmail.com, ijc+devicetree@hellion.org.uk,
 avinashphilipk@gmail.com, balbi@ti.com, robherring2@gmail.com,
 Pekon Gupta <pekon@ti.com>, bcousson@baylibre.com, swarren@wwwdotorg.org,
 olof@lixom.net, linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Brian Norris <computersforpeace@gmail.com> [131011 11:23]:
> Hi Pekon,
> 
> On Fri, Oct 11, 2013 at 07:06:43PM +0530, Pekon Gupta wrote:
> > "Managed Device Resource" or devm_xx calls takes care of automatic freeing
> > of the resource in case of:
> > - failure during driver probe
> > - failure during resource allocation
> > - detaching or unloading of driver module (rmmod)
> > Reference: Documentation/driver-model/devres.txt
> > 
> > Though OMAP NAND driver handles freeing of resource allocation in most of
> > the cases, but using devm_xx provides more clean and effortless approach
> > to handle all such cases.
> 
> Judging by your patch, I think you missed the point of the devm_*
> managed functions. They are useful because you don't need to do any of
> the cleanup (kfree(), iounmap(), etc.) yourself. I'll note the changes
> that are necessary below, but seeing as this is an add-on to your patch
> series, I may merge the rest of series without this, and if so, you can
> just resubmit this patch separately.

FYI, the .dts changes should be queued separately by Benoit to avoid
pointless merge conflicts. The arch/arm/mach-omap2/gpmc.c changes I
need to look, hopefully I can ack those for you today so you can take
the code related changes into the MTD tree.

Regards,

Tony
