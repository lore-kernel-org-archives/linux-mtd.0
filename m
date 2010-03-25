Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nui2c-0007Jt-Bh
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2010 08:03:50 +0000
Received: by bwz10 with SMTP id 10so9678963bwz.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 25 Mar 2010 01:03:45 -0700 (PDT)
Sender: Vladimir Zapolskiy <animist@gmail.com>
From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>
Subject: Re: [PATCH] [MTD] physmap: remove physmap_flash_shutdown() method.
In-Reply-To: <1268400366-14802-1-git-send-email-vzapolskiy@gmail.com>
	(Vladimir Zapolskiy's message of "Fri, 12 Mar 2010 16:26:06 +0300")
References: <1268400366-14802-1-git-send-email-vzapolskiy@gmail.com>
Date: Thu, 25 Mar 2010 11:03:26 +0300
Message-ID: <87iq8krfox.fsf@vovsem.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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


Hello David,

please could you be so kind to share your objections about the proposed
change?

Thank you in advance.

Vladimir Zapolskiy <vzapolskiy@gmail.com> writes:

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

With best wishes,
Vladimir
