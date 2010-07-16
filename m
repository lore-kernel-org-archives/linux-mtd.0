Received: from mail-gx0-f177.google.com ([209.85.161.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OZma6-0008WA-66
	for linux-mtd@lists.infradead.org; Fri, 16 Jul 2010 15:12:06 +0000
Received: by gxk27 with SMTP id 27so1583955gxk.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Jul 2010 08:12:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <D0271AF888369C4C85548462366DB24B3F524EF2@US2K7EXMBPF1.spansion.com>
References: <D0271AF888369C4C85548462366DB24B3F524EF2@US2K7EXMBPF1.spansion.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 16 Jul 2010 11:11:44 -0400
Message-ID: <AANLkTilwlddf90uXscKJLF9P0qonT1DcYuF8JT5PRrZb@mail.gmail.com>
Subject: Re: Spansion SPI parts
To: "Hoyler, Gernot" <Gernot.Hoyler@spansion.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 16, 2010 at 10:08, Hoyler, Gernot wrote:
> Can we fix the Spansion SPI flash device names in drivers/mtd/devices/m25p80.c?
> There is no Spansion s25sl device family. The references should be changed to s25fl, at a couple of locations (see below).

you will need to verify all platform resources in board files are
updated as well
-mike
