Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OgvOT-0007Fe-Mt
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 08:01:38 +0000
Received: by bwz15 with SMTP id 15so4007127bwz.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 01:01:36 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 5 Aug 2010 10:01:35 +0200
Message-ID: <AANLkTinWBxKC0F-awnJktD7JfJofg3XqT-1onPcQypws@mail.gmail.com>
Subject: protection on cfi-flash
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a board with Spansion nor flash, type S29GL01GP. This uses the
cfi-flash driver
In order to avoid accidential erasure of sectors, and hence wanted to
use flash_lock and flash_unlock.
However apparently the mtd driver for this chip does not support lock
and unlock.

U-boot does support protecting the flash (using the protect command)
so it is feasible.
The chip uses cfi_cmdset_0002.c to do its work.

I guess adding lock/unlock to this is technically not too difficult,
but I lack some info on the internals of mtd and how best to do this.
Anyone a suggestion (or maybe some code or a pointer to some code)?

Thanks alot, Frans

PS: I noticed that if I protect the flash in u-boot that flash_erase
will still report success when I invoke it (although of course the
actual data is not erased).
I would expect flash_erase to get some error code in that case and
report it back (or if that is not possible do a readback of the data
to see if the erase was successful).
