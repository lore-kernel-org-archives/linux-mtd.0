Received: from mail-ie0-x232.google.com ([2607:f8b0:4001:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yuxf5-0000qd-Ow
 for linux-mtd@lists.infradead.org; Wed, 20 May 2015 06:39:28 +0000
Received: by ieczm2 with SMTP id zm2so31995396iec.1
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2015 23:39:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150520003402.GC11598@ld-irv-0074>
References: <1431877266-28566-1-git-send-email-hauke@hauke-m.de>
 <1431877266-28566-6-git-send-email-hauke@hauke-m.de>
 <20150520003402.GC11598@ld-irv-0074>
Date: Wed, 20 May 2015 08:39:06 +0200
Message-ID: <CACna6rzBn3yzzER56aAmk+VPNiMh9ikA3B1YZmMesF=3DWdq+A@mail.gmail.com>
Subject: Re: [PATCH 5/7] mtd: brcmnand: add bcma driver
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 20 May 2015 at 02:34, Brian Norris <computersforpeace@gmail.com> wrote:
> On Sun, May 17, 2015 at 05:41:04PM +0200, Hauke Mehrtens wrote:
>> This driver registers at the bcma bus and drives the NAND core if it
>> was found on this bus. The bcma bus with this NAND core is used on the
>> bcm53xx and bcm47xx Northstar SoC with ARM CPU cores. The memory ranges
>> are automatically detected by bcma and the irq numbers read from device
>> tree by bcma bus driver.
>
> If you're going to use device tree for part of it (IRQs) why not the
> whole thing?
>
>> This is based on the iproc driver.
>
> This looks like you could probably get by with just using iproc_nand.c
> as-is. The main NAND core is apparently MMIO-accessible on your chips,
> so aren't the BCMA bits you're touching also?

That's right, in case of SoCs cores are MMIO-accessible, however I see
few reasons for writing this driver as bcma based:
1) MMIO access isn't available for bcma bus /hosted/ on PCIe devices.
By using bcma layer we write generic drivers.
2) bcma detects cores and their MMIO addresses automatically, if we
are a bit lazy, it's easier to use it rather than keep hardcoding all
addresses
3) There are some dependencies in cores initialization, e.g.
ChipCommon core usually has to be initialized first
4) bcma provides some helpers like bcma_core_enable so we don't have
to duplicate it in driver code

That said, I'm for using bcma layer, even if there is some small DT
involvement already.
