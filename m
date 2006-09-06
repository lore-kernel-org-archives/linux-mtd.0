Received: from www.kernelconcepts.de ([212.60.202.195]
	helo=mail.kernelconcepts.de)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GKyFE-0005cr-AI
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 15:19:13 +0100
Message-ID: <44FED8D4.6080505@kernelconcepts.de>
Date: Wed, 06 Sep 2006 16:19:00 +0200
From: Nils Faerber <nils.faerber@kernelconcepts.de>
MIME-Version: 1.0
To: Justin Clacherty <justin@redfish-group.com>
Subject: Re: Intel P30, locked sectors?
References: <44FED214.7090309@kernelconcepts.de>
	<44FED831.60704@redfish-group.com>
In-Reply-To: <44FED831.60704@redfish-group.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Justin Clacherty schrieb:
> Nils Faerber wrote:
>> I had hoped that the P30 chips would be supported now, but it seems they
>> are not fully. How can I unlock the sectors, if that is really the issue
>> here.
> P30 flash is supported in that it supports CFI.  You can read and write
> to it as long as it's unlocked.  CFI does not support automatic
> unlocking, it assumes if it's locked, it's locked for a reason.  The
> bootloader has to ensure that the sectors occupied by the rootfs are
> unlocked before mounting the filesystem.  We're using P30 here without
> problems.

Hmm... OK.
Just in theory, can one write to a locked sector?

I ask because I flashed the very same rootfs to the chip using the
bootloader. The bootloader, which is BLOB BTW, seems to be able to write
to the chips and the contents written also seems to be OK (since I can
boot and mount the rootfs).

> Justin.
Cheers
  nils faerber

-- 
kernel concepts GbR      Tel: +49-271-771091-12
Dreisbachstr. 24         Fax: +49-271-771091-19
D-57250 Netphen          Mob: +49-176-21024535
--
