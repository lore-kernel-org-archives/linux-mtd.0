Subject: Re: [PATCH] [MTD] physmap: remove physmap_flash_shutdown() method.
From: David Woodhouse <dwmw2@infradead.org>
To: Vladimir Zapolskiy <vzapolskiy@gmail.com>
In-Reply-To: <1268400366-14802-1-git-send-email-vzapolskiy@gmail.com>
References: <1268400366-14802-1-git-send-email-vzapolskiy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 14 May 2010 00:36:20 +0100
Message-ID: <1273793780.9999.359.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-03-12 at 16:26 +0300, Vladimir Zapolskiy wrote:
> physmap driver operates with cfi, jedec, qinfo and map_rom compliant
> chips. None of interface drivers for all these chips uses actual
> suspend and resume chip operations, but correspondent two methods only
> change flash chip state in drivers' internal state machines, and for
> Intel chips save/restore block locks is done.
> 
> To operate with boards with Intel flash chips where RP# pin is not
> asserted on reset there is an already implemented mechanism of reboot
> notifiers, and on reboot the flash moves into defined "read array"
> state.
> 
> If CONFIG_PM kernel option is enabled, then physmap_flash_shutdown()
> method is called after reboot notifier work, and save/restore block
> locks operations disturb the chip from default "read array" state,
> thus if the flash is a bootable one, board cann't be booted from it
> after reset. 

I think this is the wrong approach. We should instead remove the reboot
notifier, and keep the shutdown() method called through the map driver,
which is in the right place in the power management tree.

I'd much rather see a patch which does that.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
