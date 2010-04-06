Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nz4eJ-0005lY-2b
	for linux-mtd@lists.infradead.org; Tue, 06 Apr 2010 09:00:43 +0000
Subject: Re: [PATCH] [MTD] physmap: remove physmap_flash_shutdown() method.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vladimir Zapolskiy <vzapolskiy@gmail.com>
In-Reply-To: <1268400366-14802-1-git-send-email-vzapolskiy@gmail.com>
References: <1268400366-14802-1-git-send-email-vzapolskiy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 06 Apr 2010 11:58:44 +0300
Message-ID: <1270544324.6754.14.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>,
	Lennert Buytenhek <buytenh@wantstofly.org>,
	David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
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
> 
> Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
> Cc: David Woodhouse <David.Woodhouse@intel.com>
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: Mike Frysinger <vapier.adi@gmail.com>
> Cc: Lennert Buytenhek <buytenh@wantstofly.org>
> ---
>  drivers/mtd/maps/physmap.c |   16 ----------------
>  1 files changed, 0 insertions(+), 16 deletions(-)

Taken to my l2-mtd-2.6.git / dunno, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
