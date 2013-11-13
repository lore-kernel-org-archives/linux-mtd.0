Date: Tue, 12 Nov 2013 16:10:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix bug driver will in a dead lock if
 no nand detected
Message-ID: <20131113001022.GC9468@ld-irv-0074.broadcom.com>
References: <1383645547-21813-1-git-send-email-josh.wu@atmel.com>
 <20131107083932.GJ3805@norris.computersforpeace.net>
 <527B6ADF.1090201@atmel.com>
 <20131107180942.GU20061@ld-irv-0074.broadcom.com>
 <527C5E96.40805@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <527C5E96.40805@atmel.com>
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

+ Greg KH

Hi Josh,

On Fri, Nov 08, 2013 at 11:46:30AM +0800, Josh Wu wrote:
> On 11/8/2013 2:09 AM, Brian Norris wrote:
> >On Thu, Nov 07, 2013 at 06:26:39PM +0800, Josh Wu wrote:
> >>On 11/7/2013 4:39 PM, Brian Norris wrote:
> >>>On Tue, Nov 05, 2013 at 05:59:07PM +0800, Josh Wu wrote:
> >>>>In the atmel driver probe function, the code shows like following:
> >>>>   atmel_nand_probe(...) {
> >>>>         ...
> >>>>
> >>>>   err_nand_ioremap:
> >>>>         platform_driver_unregister(&atmel_nand_nfc_driver);
> >>>>         return res;
> >>>>   }
> >>>>
> >>>>If no nand flash detected, the driver probe function will goto
> >>>>err_nand_ioremap label.
> >>>>Then platform_driver_unregister() will be called. It will get the
> >>>>lock of atmel_nand device since it is parent of nfc_device. The
> >>>>problem is the lock is already hold by atmel_nand_probe itself.
> >>>>So system will be in a dead lock.
> >>>>
> >>>>This patch just simply removed to platform_driver_unregister() call.
> >>>>When atmel_nand driver is quit the platform_driver_unregister() will
> >>>>be called in atmel_nand_remove().
> >>>The real key, here, is that the platform-driver probe() has no business
> >>>un-registering another driver, right?
> >>right.
> >>
> >>>Shouldn't both drivers just be
> >>>registered/unregistered in the module init/exit, and not in probe()?
> >>currently the NFC driver is registered in the beginning of nand
> >>probe function. After NFC driver is initialized, the rest of the
> >>nand probe function
> >>will check the NFC driver status.
> >>I am not sure it is proper to registered another driver in a probe().
> >This whole 2-driver registration process seems like a totally racy mess.
> >
> >Unless I'm reading this wrong, the code is entirely wrong. You are not
> >properly expressing the dependency between the NFC device and the
> >atmel_nand device, so I think you're relying purely on happenstance that
> >when the NAND probe registers the NFC driver, it will complete the NFC
> >probe before the NAND probe reaches:
> >
> >   if (nand_nfc.is_initialized) {
> >     ...
> 
> Yes, exactly.
> And the NAND probe will also load the NFC device before it reach
> above check code.

No, it loads the *driver*, not the *device*. I'm not familiar with the
driver core guarantees, but I don't think you can guarantee that just
because a driver was registered before another that the corresponding
devices will be probed in that order. Or are you relying on the
dependencies captured by device tree? (I don't think even the
parent/child dependency between NAND/NFC gives you enough.)

> That is what I want: make *nfc probe function* is running before
> reach above check code.
> 
> >
> >This is a race, no?
> 
> So I don't think there is a race, as NFC probe will always run
> before the check code:
>   if (nand_nfc.is_initialized) {
>     ...

It is not clear to me how you guarantee this.

> >
> >Anyway, I think the current patch (fixing a deadlock) is still ready for
> >stable, while I would expect you can fix up this racy situation in a
> >subsequent patch. Or perhaps I'm misreading something?
> 
> I think my subsequent patch is to move the register/unregister()
> function to the module_init/exit().
> And in the module_init(), make sure register NFC driver before NAND driver.
> That means I will revert the change that convert module_init/exit()
> to module_platform_driver_probe().
> 
> So the whole flow will like that:
> 
> module_init()
>   register nfc driver
>   register nand driver
> 
> nand driver probe() {
>     # register nfc driver --> move to module_init()
>     populate nfc device

How do you guarantee this "populate" happens here?

>       since nfc driver is registered, so nfc_probe() is called (init nfc)

I'm not sure where you get this. Can you point to a line in the code?

>     check whether nfc is initialized
>     ...
>   }
> 
> module_exit()
>   unregister nand driver
>   unregister nfc driver

Brian
