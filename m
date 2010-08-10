Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oij5S-0005WD-GK
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 07:17:27 +0000
Received: by wwc33 with SMTP id 33so566498wwc.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 10 Aug 2010 00:17:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1281422578-20461-1-git-send-email-sudhakar.raj@ti.com>
References: <1281422578-20461-1-git-send-email-sudhakar.raj@ti.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 10 Aug 2010 03:17:05 -0400
Message-ID: <AANLkTimJAiUfyAYd6aoftbexKaBOz5A8BjX-fgumkWU9@mail.gmail.com>
Subject: Re: [PATCH] m25p80: add support for a callback to platform code on
	successful device probe
To: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Content-Type: text/plain; charset=UTF-8
Cc: david-b@pacbell.net, dwmw2@infradead.org,
	davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 10, 2010 at 02:42, Sudhakar Rajashekhara wrote:
> On some platforms, MTD device can hold MAC address, calibration
> data, serial numbers etc.

pretty standard behavior ...

> On TI's DA850/OMAP-L138/AM18xx EVM, MAC address is stored on
> the last sector of the SPI flash, which is exported as an MTD
> device.

again, nothing unique here ...

> This patch adds two new members to the 'flash_platform_data'
> structure, a function handler which will be called after
> add_mtd_device() and an argument to be passed to this function,
> for example: offset to read from.

... and your changelog falls apart.  the intro gives no basis that i
can see as to why you need these hooks.

please give examples of what you're actually trying to accomplish and
how these hooks help you accomplish said goal and why it is necessary
that you do these things from kernel space instead of standard
userspace.
-mike
