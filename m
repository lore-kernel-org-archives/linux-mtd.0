Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0vme-00010V-CL
 for linux-mtd@lists.infradead.org; Mon, 23 Nov 2015 18:24:13 +0000
Received: by pacej9 with SMTP id ej9so198512498pac.2
 for <linux-mtd@lists.infradead.org>; Mon, 23 Nov 2015 10:23:51 -0800 (PST)
Message-ID: <56535977.9050201@gmail.com>
Date: Mon, 23 Nov 2015 10:22:47 -0800
From: Florian Fainelli <f.fainelli@gmail.com>
MIME-Version: 1.0
To: Simon Arlott <simon@fire.lp0.eu>, Rob Herring <robh@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Jonas Gorski <jogo@openwrt.org>
Subject: Re: [PATCH (v4) 2/2] mtd: brcmnand: Add support for the BCM63268
References: <56506D55.3000907@simon.arlott.org.uk>
 <20151122215945.GA5930@rob-hp-laptop> <56523E85.905@simon.arlott.org.uk>
 <56523EFF.9050502@simon.arlott.org.uk>
In-Reply-To: <56523EFF.9050502@simon.arlott.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22/11/15 14:17, Simon Arlott wrote:
> The BCM63268 has a NAND interrupt register with combined status and enable
> registers. It also has a clock for the NAND controller that needs to be
> enabled.
> 
> Set up the device by enabling the clock, disabling and acking all
> interrupts, then handle the CTRL_READY interrupt.
> 
> Add a "device_remove" function to struct brcmnand_soc so that the clock
> can be disabled when the device is removed.
> 
> Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
> ---
> On 22/11/15 21:59, Rob Herring wrote:
>>>>> + * "brcm,nand-bcm63268"
>>>>> + - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"
>>>
>>> vendor,<soc>-device is preferred.
> 
> The existing two bindings use brcm,nand-<soc>, but I've changed this one.

Could we stick with the existing binding naming convention of using:

brcm,nand-<soc> just so automated tools or other things can match this
one too, and +1 for consistency?

Other than, that, same comment as Jonas, why do we we need the
device_remove callback to be called from the main driver down to this one?
-- 
Florian
