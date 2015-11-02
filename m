Received: from bh-25.webhostbox.net ([208.91.199.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtLQQ-0007Gt-CF
 for linux-mtd@lists.infradead.org; Mon, 02 Nov 2015 20:09:55 +0000
Date: Mon, 2 Nov 2015 12:09:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jesper Nilsson <jespern@axis.com>, linux-cris-kernel@axis.com
Subject: Re: Problems with 'mtd: warn when registering the same master many
 times'
Message-ID: <20151102200931.GA26577@roeck-us.net>
References: <5637843C.10307@roeck-us.net>
 <20151102174356.GA13101@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151102174356.GA13101@localhost>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 02, 2015 at 09:43:56AM -0800, Brian Norris wrote:
> On Mon, Nov 02, 2015 at 07:41:48AM -0800, Guenter Roeck wrote:
> > Brian,
> > 
> > I see the following warnings in recent mips qemu tests on linux-next.
> > 
> > WARNING: CPU: 0 PID: 1 at drivers/mtd/mtdcore.c:619 mtd_device_parse_register+0x160/0x16c()
> > MTD already registered
> > 
> > Looking into the code, this is the result of your patch 'mtd: warn when registering
> > the same master many times'.
> > 
> > This patch is supposed to warn if mtd_device_parse_register is called multiple times
> > with the same mtd_info structure pointer as parameter.
> > 
> > At the surface, the check appears to make sense. However, it has a problem.
> > The output of "git grep reboot_notifier.notifier_call" in drivers/mtd results in
> > 
> > chips/cfi_cmdset_0001.c:        mtd->reboot_notifier.notifier_call = cfi_intelext_reboot;
> > chips/cfi_cmdset_0002.c:        mtd->reboot_notifier.notifier_call = cfi_amdstd_reboot;
> > mtdcore.c:      WARN_ONCE(mtd->reboot_notifier.notifier_call, "MTD already registered\n");
> > mtdcore.c:      if (mtd->_reboot && !mtd->reboot_notifier.notifier_call) {
> > mtdcore.c:              mtd->reboot_notifier.notifier_call = mtd_reboot_notifier;
> > 
> > As it turns out, the observed warning is not seen because mtd_device_parse_register()
> > is called multiple times. It is seen because mtd->reboot_notifier.notifier_call
> > is already set to cfi_intelext_reboot by the time it is checked.
> 
> Hmm, you're right. I overlooked this one. FWIW, this would be
> ameliorated by this patch [1] but I never got around to testing it
> properly, so I didn't merge it. (Could you test it? If so, I might just
> apply it as a fix.)
> 
Seems to be working, or at least my test passes without problems after I applied
it on top of -next. I sent you a Tested-by: as response to that patch.

> > I don't know if this is a bug in the mtd code, or if this is a valid use case.
> > Whatever it is, the warning does not warn about the driver, it warns about a potential
> > inconsistency in the mtd code itself (and if it is is a valid use case, the warning
> > is inappropriate). Maybe it would make sense to change the warning as follows ?
> > 
> > WARN_ONCE(mtd->_reboot && mtd->reboot_notifier.notifier_call, "MTD already registered\n");
> 
> That would be an OK fix, in the event that the above patch isn't taken.
> 
> > I am not sure, though, if that is correct, since even that might be a valid use case
> > (a caller registering a cfi based mtd device with a _reboot callback).
> 
> No, those two are supposed to be mutually exclusive before MTD
> registration; either the MTD driver provides a _reboot() callback and
> MTD core registers the notifier (which fills out .notifier_call), or the
> driver itself steals that notifier structure but never registers a
> _reboot() callback. So no driver should actually need both.
> 
> I'd really prefer it if we could just transition to the CFI drivers to
> let MTD register the notifier for us, but I'm not 100% confident without
> testing.
> 
> > I also see the warning in crisv32 runtime tests. This is because the code in
> > arch/cris/arch-v32/drivers/axisflashmap.c calls mtd_device_register() multiple times
> > with the same mtd_info argument, each time to register a different partition.
> > I am not sure if the check is appropriate for this case either, since the code calls
> > mtd_device_register(), both 'type' and 'parser_data' are NULL, parse_mtd_partitions()
> > does not do anything, and the problem you are concerned about does not apply.
> 
> Actually, that platform is probably one of the main reasons for the
> warning patch. It is not kosher to call mtd_device_register() as many
> times as it does. So, you get a warning until somebody can be bothered
> to fix that ugly code.
> 
> > How about changing the warning to something like the following ?
> > 
> > WARN_ONCE(types && mtd->_reboot && mtd->reboot_notifier.notifier_call, "MTD already registered\n");
> 
> No, that doesn't make much sense. We might as well just be removing the
> check entirely at that point, since this just looks like you're shooting
> at a random/fragile hack.
> 
> > This would eliminate (what I think are) false positives and only warn if there
> > is a real problem.
> 
> I think we have the option of either taking patch [1] or taking your
> first suggestion. But the axisflashmap.c is not a false positive, and it
> should be fixed. Or just live with the warning, if it's unmaintained.
> 
We'll see if Jesper has any comments. I didn't see an easy way to fix that
driver myself, so I guess we may have to live with the warning for now.

Thanks,
Guenter
