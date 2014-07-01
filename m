Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1tiv-00036O-3j
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 08:47:33 +0000
Date: Tue, 1 Jul 2014 01:47:10 -0700
From: Tony Lindgren <tony@atomide.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v1 1/3] ARM: dts: am335x-bone: add support for beaglebone
 NAND cape
Message-ID: <20140701084709.GO28884@atomide.com>
References: <1403612666-31197-1-git-send-email-pekon@ti.com>
 <1403612666-31197-2-git-send-email-pekon@ti.com>
 <20140626194824.GA18814@fox>
 <20980858CB6D3A4BAE95CA194937D5E73EAF8248@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAF8248@DBDE04.ent.ti.com>
Cc: Jason Kridner <jkridner@gmail.com>, Robert Nelson <robertcnelson@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Guido =?utf-8?B?TWFydMOtbmV6?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Gupta, Pekon <pekon@ti.com> [140627 14:08]:
> >From: Guido Martínez [mailto:guido@vanguardiasur.com.ar]
> >>On Tue, Jun 24, 2014 at 05:54:24PM +0530, Pekon Gupta wrote:
> 
> [...]
> 
> >> +&gpmc {
> >> +	ranges = <0 0 0 0x01000000>;	/* address range = 16MB (minimum GPMC partition) */
> >> +	nand@0,0 {
> >> +		status = "disabled";
> >> +		reg = <0 0 4>;		/* device IO registers */
> >> +		pinctrl-names = "default";
> >> +		pinctrl-0 = <&bbcape_nand_flash_pins>;
> >This doesn't seem to work as pinctrl properties are not parsed for
> >childs of the gpmc node. Did this work for you?
> >Putting this in the gpmc node makes it work, but how will we control
> >pins for the nand and nor independently? I believe there is currently no
> >support for muxing individual gpmc devices. If we want to add both
> >devices to the DT and enable them as needed we'd need to add support for
> >this, right?
> >
> Yes, And that should be the case, because different devices would be
> connected to different chip-selects, so there should be support of
> providing individual pin-mux for different GPMC devices.
> 
> Currently both NAND and NOR cape share GPMC_CS0, so both NAND and NOR
> capes will not work simultaneously. But I'm planning to modify NOR cape
> hardware at my end to use GPMC_CS1 instead of GPMC_CS0.
> - NAND on GPMC_CS0
> - NOR on GPMC_CS1

Hmm but we should have these working with both using CS0 without
any need to modify the hardware though?

In that case we should make sure we always set large enough GPMC
partition and that the pins are muxed for the connected GPMC
devices only.

Regards,

Tony
