Date: Wed, 13 Nov 2013 00:44:18 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix bug driver will in a dead lock if
 no nand detected
Message-ID: <20131113084418.GA16999@norris.computersforpeace.net>
References: <1383645547-21813-1-git-send-email-josh.wu@atmel.com>
 <20131107083932.GJ3805@norris.computersforpeace.net>
 <527B6ADF.1090201@atmel.com>
 <20131107180942.GU20061@ld-irv-0074.broadcom.com>
 <527C5E96.40805@atmel.com>
 <20131113001022.GC9468@ld-irv-0074.broadcom.com>
 <5282F164.3040509@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5282F164.3040509@atmel.com>
Cc: dedekind1@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Josh,

On Wed, Nov 13, 2013 at 11:26:28AM +0800, Josh Wu wrote:
> On 11/13/2013 8:10 AM, Brian Norris wrote:
> >On Fri, Nov 08, 2013 at 11:46:30AM +0800, Josh Wu wrote:
> >>On 11/8/2013 2:09 AM, Brian Norris wrote:
> >>>   if (nand_nfc.is_initialized) {
> >>>     ...
> >>Yes, exactly.
> >>And the NAND probe will also load the NFC device before it reach
> >>above check code.
> >No, it loads the *driver*, not the *device*. I'm not familiar with the
> >driver core guarantees, but I don't think you can guarantee that just
> >because a driver was registered before another that the corresponding
> >devices will be probed in that order. Or are you relying on the
> >dependencies captured by device tree? (I don't think even the
> >parent/child dependency between NAND/NFC gives you enough.)
> 
> I put  more code here to make it clearer:
> 
> arch/arm/boot/dts/sama5d3.dtsi:
> nand0: nand@60000000 {
>             compatible = "atmel,at91rm9200-nand";
>             ...
>             ranges;
>             ...
>             nfc@70000000 {
>                 compatible = "atmel,sama5d3-nfc";
>                 ...
>             };
>         };

Ah, so you're focusing purely on the device tree support? It seems this
driver also supports traditional platform devices, but nobody uses NFC
without DT? That explains some things.

> drivers/mtd/nand/atmel_nand.c
> int atmel_of_init_port() {
>    ...
>    /* load the nfc driver if there is */
>   of_platform_populate(np, NULL, NULL, host->dev);   # <--- Manually
> populate the sub node (NFC node) to load NFC driver
>   ...
> }

Right, that makes sense. So the ordering of the driver registration
stuff is kind of a distraction in this case, then. It's this portion of
the NAND probe that triggers bus_probe_device() to initialize the NFC
device before continuing on.

[snip rest of explanation; thanks!]

So I don't think you have a problem for device tree platforms. But if
someone were to try to instantiate these devices via
platform_device_register(), they will have a problem.

Please, do follow up with the cleanup to the driver registration that
you mentioned.

Brian
