Received: from mail51.messagelabs.com ([216.82.244.179])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KIkBd-0003Jz-TA
	for linux-mtd@lists.infradead.org; Tue, 15 Jul 2008 13:03:22 +0000
Date: Tue, 15 Jul 2008 15:03:16 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <Uwe.Kleine-Koenig@digi.com>
To: <linux-mtd@lists.infradead.org>
Subject: CONFIG_MTD_ROM and suspend-to-RAM
Message-ID: <20080715130316.GA1617@digi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Cc: Lennert, Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>,
	Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a machine with a CFI flash using the physmap-flash mapping
driver.

The problem after the failed detection (as reported earlier on the
list[1]) is that if my kernel has CONFIG_MTD_ROM map_rom_probe() is
called, which doesn't assign mtd->suspend and returns success.

Then when I do

	echo mem > /sys/power/state

physmap_flash_suspend is called which does:

	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
		ret |= info->mtd[i]->suspend(info->mtd[i]);

	return ret;

Unsurprisingly this results in an Oops.

IMHO both functions should behave better.  map_rom_probe should do some
probing (not sure this is possible though) and physmap_flash_suspend
should only call suspend if it's non-NULL.  Moreover
physmap_flash_suspend mangles the return value.  I would prefer to break
the loop after the first failure (and probably resume the already
suspended parts).  Moreover IIRC resume isn't called if suspend failed,
so there might be some chips that stay suspended after a failing
suspend.

I will come up with a patch addressing the physmap problems, but I don't
know map_rom and don't have a chip for that, so I will leave that to
someone else.

Best regards
Uwe

[1] http://thread.gmane.org/gmane.linux.drivers.mtd/22209

-- 
Uwe Kleine-König, Software Engineer
Digi International GmbH Branch Breisach, Küferstrasse 8, 79206 Breisach, Germany
Tax: 315/5781/0242 / VAT: DE153662976 / Reg. Amtsgericht Dortmund HRB 13962
