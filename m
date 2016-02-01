Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQJkb-0004N1-JP
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 19:03:02 +0000
Received: by mail-pa0-x22e.google.com with SMTP id uo6so88193454pac.1
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2016 11:02:41 -0800 (PST)
Date: Mon, 1 Feb 2016 11:02:38 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, Hauke Mehrtens <hauke@hauke-m.de>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH] mtd: brcmnand: set initial ECC params based on info from
 HW
Message-ID: <20160201190238.GJ19540@google.com>
References: <1453881500-11736-1-git-send-email-zajec5@gmail.com>
 <20160201175342.GF19540@google.com> <56AF9F58.4050103@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56AF9F58.4050103@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 01, 2016 at 10:09:28AM -0800, Florian Fainelli wrote:
> On 01/02/16 09:53, Brian Norris wrote:
> > Anyway, if we are really making the DT properties optional, we'd need to
> > modify Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt to
> > reflect this.
> 
> The Marvell PXA3XX NAND controller has a "marvell,nand-keep-config"
> which seems to be in par with what Rafal is after here, maybe it would
> be worth standardizing/mimicing that kind of property for the brcmnand
> driver?

Maybe. Honestly, it's not that clear to me what the pxa3xx-nand binding
means. But if we make that clear, that could be a possibility.

(Side note: this isn't too far from what we did the Broadcom STB BSP
previously, except that we wouldn't use device tree. We attempted a
heuristic to detect whether the bootloader had initialized the flash
controller properly... I didn't want to maintain that crazy logic
upstream though. A DT flag to enable that behavior might be OK.)

> >> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> >> ---
> >> It took me hours to figure out how to setup NAND on my D-Link DIR-885L.
> >> This should be very helpful for ppl adding new devices support.
> > 
> > What if we just print out the hardware defaults when we bail out due to
> > missing ECC DT properties? Then developers can choose to set up their DT
> > with these properties, if those are actually proven correct. Would that
> > save you the hours of setup you mention?
> > 
> > Another option: maybe a commandline boot flag?
> 
> One could argue that the bootloader is patf of the platform, and so, if
> the bootloader is known to provide good defaults, then a DT property
> could be appropriate. The commandline boot flag just sounds a little
> impractical, in case you have more than one NAND controller, but how
> common is that?

Not sure if you mean multiple *controller* or multiple *flash*. The
former is much less common than the latter, but neither is very common
AFAIK.

Brian
