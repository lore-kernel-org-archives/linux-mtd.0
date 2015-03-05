Message-ID: <1425543594.24292.189.camel@x220>
Subject: Re: [PATCH 1/5] mtd: nand: vf610_nfc: Freescale NFC for VF610,
 MPC5125 and others
From: Paul Bolle <pebolle@tiscali.nl>
To: Stefan Agner <stefan@agner.ch>
Date: Thu, 05 Mar 2015 09:19:54 +0100
In-Reply-To: <1425510624-22250-2-git-send-email-stefan@agner.ch>
References: <1425510624-22250-1-git-send-email-stefan@agner.ch>
 <1425510624-22250-2-git-send-email-stefan@agner.ch>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: mark.rutland@arm.com, boris.brezillon@free-electrons.com,
 shawn.guo@linaro.org, marb@ixxat.de, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 galak@codeaurora.org, computersforpeace@gmail.com, dwmw2@infradead.org,
 aaron@tastycactus.com, bpringlemeir@nbsps.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-03-05 at 00:10 +0100, Stefan Agner wrote:
> --- /dev/null
> +++ b/drivers/mtd/nand/vf610_nfc.c
> @@ -0,0 +1,730 @@

> + * This is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.

This states the license is GPL v2 or later.

> +MODULE_LICENSE("GPL v2");

So you probably want
    MODULE_LICENSE("GPL");

here.


Paul Bolle
