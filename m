Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yv8vL-0000Jd-3O
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 18:40:59 +0000
Received: by padbw4 with SMTP id bw4so76240684pad.0
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 11:40:37 -0700 (PDT)
Date: Wed, 20 May 2015 11:40:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 5/7] mtd: brcmnand: add bcma driver
Message-ID: <20150520184028.GF11598@ld-irv-0074>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
 <1431877266-28566-6-git-send-email-hauke@hauke-m.de>
 <20150520003402.GC11598@ld-irv-0074>
 <CACna6rzBn3yzzER56aAmk+VPNiMh9ikA3B1YZmMesF=3DWdq+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACna6rzBn3yzzER56aAmk+VPNiMh9ikA3B1YZmMesF=3DWdq+A@mail.gmail.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 20, 2015 at 08:39:06AM +0200, Rafał Miłecki wrote:
> On 20 May 2015 at 02:34, Brian Norris <computersforpeace@gmail.com> wrote:
> > On Sun, May 17, 2015 at 05:41:04PM +0200, Hauke Mehrtens wrote:
> >> This driver registers at the bcma bus and drives the NAND core if it
> >> was found on this bus. The bcma bus with this NAND core is used on the
> >> bcm53xx and bcm47xx Northstar SoC with ARM CPU cores. The memory ranges
> >> are automatically detected by bcma and the irq numbers read from device
> >> tree by bcma bus driver.
> >
> > If you're going to use device tree for part of it (IRQs) why not the
> > whole thing?
> >
> >> This is based on the iproc driver.
> >
> > This looks like you could probably get by with just using iproc_nand.c
> > as-is. The main NAND core is apparently MMIO-accessible on your chips,
> > so aren't the BCMA bits you're touching also?
> 
> That's right, in case of SoCs cores are MMIO-accessible, however I see
> few reasons for writing this driver as bcma based:
> 1) MMIO access isn't available for bcma bus /hosted/ on PCIe devices.
> By using bcma layer we write generic drivers.

I strongly doubt that this NAND core is ever put on a PCIe endpoint.

> 2) bcma detects cores and their MMIO addresses automatically, if we
> are a bit lazy, it's easier to use it rather than keep hardcoding all
> addresses

Laziness is a pretty bad excuse. You already have to do 60% of the work
by putting the IRQs and base NAND register range into the device tree.
Finding those remaining two register addresses is not so hard.

> 3) There are some dependencies in cores initialization, e.g.
> ChipCommon core usually has to be initialized first

Are you aware of any important dependencies? Isn't it safe to assume
that the ChipCommon core would have to be initialized way before any
peripherals?

> 4) bcma provides some helpers like bcma_core_enable so we don't have
> to duplicate it in driver code

I don't see why we need to reset/re-enable the NAND core in the kernel
at all, but if we do, this is touching the exact same registers as
iproc_nand.c is already. So it makes sense to *share* that code, and do
the same thing on both Cygnus and Northstar, etc. (And no, Cygnus can't
convert to BCMA, so we can't do 100% sharing either way.)

> That said, I'm for using bcma layer, even if there is some small DT
> involvement already.

For any reasons besides the above? Cause I'm still not convinced we need
a BCMA driver at all.

Brian
