Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OZn1V-0004tR-A5
	for linux-mtd@lists.infradead.org; Fri, 16 Jul 2010 15:40:31 +0000
Received: by gya1 with SMTP id 1so1592197gya.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 16 Jul 2010 08:40:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <D0271AF888369C4C85548462366DB24B3F524F16@US2K7EXMBPF1.spansion.com>
References: <D0271AF888369C4C85548462366DB24B3F524EF2@US2K7EXMBPF1.spansion.com>
	<AANLkTilwlddf90uXscKJLF9P0qonT1DcYuF8JT5PRrZb@mail.gmail.com>
	<D0271AF888369C4C85548462366DB24B3F524F16@US2K7EXMBPF1.spansion.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 16 Jul 2010 11:40:02 -0400
Message-ID: <AANLkTinF9f0FMeyK4kMc6cVw3rtSDELJzkLLD_4J0hKT@mail.gmail.com>
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

On Fri, Jul 16, 2010 at 11:32, Hoyler, Gernot wrote:
>> you will need to verify all platform resources in board files are updated as well -mike
>
> I had run a recursive grep through the original kernel source tree, see below.
> In this output, I do not see any directly matching board driver references...
> except some refs to s25sl128b which seems to be declared by some derived Freescale
> driver (fsl_m25p80). I assume we cannot fix that derivative (because it only comes
> with the Freescale BSPs), so we should be clean!

mmm, why do you assume that ?  dts files are compiled into device
trees which are bundled into the kernel image.  you will need to
change those dts files to use the updated name.  otherwise the spi
flash will not be detected/probed for those boards anymore.
-mike
