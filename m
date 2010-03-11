Received: from mail-gw0-f49.google.com ([74.125.83.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Npl6z-0005S4-Vg
	for linux-mtd@lists.infradead.org; Thu, 11 Mar 2010 16:19:54 +0000
Received: by gwj21 with SMTP id 21so114903gwj.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Mar 2010 08:19:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <fcda838a1003110703p30377bfcjf6d65d3a474ab42d@mail.gmail.com>
References: <fcda838a1003110703p30377bfcjf6d65d3a474ab42d@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 11 Mar 2010 11:19:27 -0500
Message-ID: <8bd0f97a1003110819w42d81c12yc5b2df74d5762b2@mail.gmail.com>
Subject: Re: physmap shutdown
To: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 11, 2010 at 10:03, Vladimir Zapolskiy wrote:
> recently I have encountered a problem with Intel I28F160C3B NOR flash
> on a board where RP# pin is not connected to CPU RESET#, and after
> software reboot it is not in "Read Array" status.
>
> This flash is mapped by physmap driver, and Intel Extended Vendor
> Command Set (0x0001) is used to operate with it, CONFIG_PM kernel
> option is enabled, MTD_POWERUP_LOCK flag is set in mtd->flags.
>
> On reboot cfi_intelext_reboot() is called properly by reboot notifier
> to change the flash state to "Read Array", but after this call
> physmap_flash_shutdown() initiates sequent cfi_intelext_suspend() and
> cfi_intelext_resume() calls, the latter one restores block locks, but
> the flash remains in "Read Status" state.
>
> Making a fix is not a problem, but I would like to be sure in the best
> solution in joint opinion:
> * remove physmap_flash_shutdown() method completely (is it safe?)
> * be aware of FL_SHUTDOWN chip state in cfi_intelext_suspend()
> * restore "Read Array" state in cfi_intelext_resume()
> * ...

sounds like the issue i have:
http://thread.gmane.org/gmane.linux.drivers.mtd/25452/focus=25896
-mike
