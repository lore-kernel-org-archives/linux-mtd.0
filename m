Date: Mon, 12 Oct 2015 14:27:42 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Anup Patel <anup.patel@broadcom.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 David Woodhouse <dwmw2@infradead.org>, Ray Jui <rjui@broadcom.com>,
 Pramod Kumar <pramodku@broadcom.com>,
 Vikram Prakash <vikramp@broadcom.com>,
 Sandeep Tripathy <tripathy@broadcom.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Rafal Milecki <zajec5@gmail.com>
Subject: Re: [PATCH 3/5] mtd: brcmnand: Optional DT flag to reset IPROC NAND
 controller
Message-ID: <20151012212742.GQ107187@google.com>
References: <1443808606-21203-1-git-send-email-anup.patel@broadcom.com>
 <1443808606-21203-4-git-send-email-anup.patel@broadcom.com>
 <20151004214943.GA28904@localhost>
 <39063E8F96E11742B35A201CC5D095B7AD54C1@SJEXCHMB10.corp.ad.broadcom.com>
 <20151006134119.GB26818@localhost> <56144A62.70300@broadcom.com>
 <5614574C.2060701@gmail.com>
 <39063E8F96E11742B35A201CC5D095B7AD8ADD@SJEXCHMB10.corp.ad.broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39063E8F96E11742B35A201CC5D095B7AD8ADD@SJEXCHMB10.corp.ad.broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Anup,

On Wed, Oct 07, 2015 at 03:33:50AM +0000, Anup Patel wrote:
> > -----Original Message-----
> > From: Florian Fainelli [mailto:f.fainelli@gmail.com]
> > 
> > On 06/10/15 15:25, Scott Branden wrote:
> > 
> > Then instead of adding a "reset flag" to Device Tree, another approach could be
> > to put the desired or currently configured exhaustive list of NAND timings in
> > Device Tree, and based on that you could have this:
> > 
> > - the NAND controller driver finds that these timings match the current
> > configuration, you are good to go
> > 
> > - the NAND controller drivers finds a difference in how current timings are
> > configured vs. desired timings, and issues a controller reset, prior to applying
> > new timing configuration
> 
> To add to this ...
> 
> The mechanism to reset is BRCM NAND controller is SOC specific so the
> SoC independent BRCM NAND driver (i.e. brcmnand.c) does not know how
> to reset the NAND controller.
> 
> For iProc SoC family, the NAND controller reset is through IDM register
> space which is only iomap'ed by iproc_nand.c.
> 
> We might end-up having one more SoC specific callback which will be
> Provided by iproc_nand.c to brcmnand.c.
> 
> > 
> > - no timings are configured, reset the controller and use existing auto-detection
> > capabilities like ONFI modes
> > 
> > Typically you would put the desired timings instead of the currently configured
> > timings though..
> 
> Overall, it would good to support timing parameters through DT or ONFI but
> for now have we can rely on reset and auto-devid configuration.

I don't want to support a DT property that is only used as a workaround
for the right solution. That means the property may quickly become
obsolete, yet we have to support it forever.


> > >>     compatible = "brcm,iproc-nand-ns2", ...;
> > >>
> > > As described above - the option is not SoC specific.  It is system
> > > specific.  In some systems we may wish to reset the NAND controller in
> > > linux.  In some we may wish to rely on initialization that has already
> > > been done to speed up boot times.
> > 
> > It seems to me like having this property is fine as long as you are describing that
> > the controller *needs* a reset to operate properly, it does not strike me as a
> > particularly well suited property if its side effect and main usage is to keep or
> > wipe-out existing NAND timings.
> 
> IMHO, having SoC specific compatible string for NS2 is like saying
> NAND controller on NS2 is different from other iProc SoCs whereas
> Having optional DT flags for quirks/work-arounds (e.g. NAND controller
> reset) is like saying NAND controller on NS2 same as other iProc SoCs
> but some additional programming is required. 

OK... so what is the reason that you have to reset the controller on NS2
and not Cygnus? Is it a SoC difference (i.e., compatible string)?
Firmware/bootloader difference? So far, all statements have been
non-specific, AFAICT.

Brian
