Received: from mail-yx0-f172.google.com ([209.85.210.172])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O2762-0000sw-9y
	for linux-mtd@lists.infradead.org; Wed, 14 Apr 2010 18:13:54 +0000
Received: by yxe2 with SMTP id 2so237239yxe.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 14 Apr 2010 11:13:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1271231840l.5270l.0l@i-dmzi_al.realan.de>
References: <4BC56F21.6040909@call-direct.com.au>
	<1271231840l.5270l.0l@i-dmzi_al.realan.de>
Date: Wed, 14 Apr 2010 11:13:52 -0700
Message-ID: <v2u347733d51004141113r670eb5edgf140bdf197724e42@mail.gmail.com>
Subject: Re: [PATCH] Fix Oops with Atmel SPI
From: Kevin Cernekee <cernekee@gmail.com>
To: Anders Larsen <al@alarsen.net>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Ian McDonnell <ian@brightstareng.com>,
	Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
	Iwo Mergler <iwo@call-direct.com.au>, linux-mtd@lists.infradead.org,
	Matthias Kaehlcke <matthias@kaehlcke.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 14, 2010 at 12:57 AM, Anders Larsen <al@alarsen.net> wrote:
> the original problem occurs with SPI flashes, which typically have a much
> smaller erase block size (and it only occurs when they are driven by an Atmel
> SoC SPI controller, hence the #ifdefs)

FWIW, the 16MiB Spansion SPI NOR flashes I've been seeing on new
designs have 64KiB or 256KiB (!) eraseblocks.  256KiB eraseblocks are
likely to become even more common as the device capacity increases to
32MiB and beyond.
