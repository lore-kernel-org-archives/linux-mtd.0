Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Npjva-0004Vi-8e
	for linux-mtd@lists.infradead.org; Thu, 11 Mar 2010 15:04:03 +0000
Received: by wyj26 with SMTP id 26so59472wyj.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 11 Mar 2010 07:03:56 -0800 (PST)
MIME-Version: 1.0
Sender: animist@gmail.com
Date: Thu, 11 Mar 2010 18:03:56 +0300
Message-ID: <fcda838a1003110703p30377bfcjf6d65d3a474ab42d@mail.gmail.com>
Subject: physmap shutdown
From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
To: David Woodhouse <David.Woodhouse@intel.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

recently I have encountered a problem with Intel I28F160C3B NOR flash
on a board where RP# pin is not connected to CPU RESET#, and after
software reboot it is not in "Read Array" status.

This flash is mapped by physmap driver, and Intel Extended Vendor
Command Set (0x0001) is used to operate with it, CONFIG_PM kernel
option is enabled, MTD_POWERUP_LOCK flag is set in mtd->flags.

On reboot cfi_intelext_reboot() is called properly by reboot notifier
to change the flash state to "Read Array", but after this call
physmap_flash_shutdown() initiates sequent cfi_intelext_suspend() and
cfi_intelext_resume() calls, the latter one restores block locks, but
the flash remains in "Read Status" state.

Making a fix is not a problem, but I would like to be sure in the best
solution in joint opinion:
* remove physmap_flash_shutdown() method completely (is it safe?)
* be aware of FL_SHUTDOWN chip state in cfi_intelext_suspend()
* restore "Read Array" state in cfi_intelext_resume()
* ...

Thank you in advance,
Vladimir
