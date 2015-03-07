Received: from cpsmtpb-ews07.kpnxchange.com ([213.75.39.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YUE1W-0006N5-UC
 for linux-mtd@lists.infradead.org; Sat, 07 Mar 2015 12:40:07 +0000
Message-ID: <1425731983.2281.6.camel@tiscali.nl>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
From: Paul Bolle <pebolle@tiscali.nl>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 07 Mar 2015 13:39:43 +0100
In-Reply-To: <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Corneliu Doban <cdoban@broadcom.com>,
 Ray Jui <rjui@broadcom.com>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, Jonathan Richardson <jonathar@broadcom.com>,
 Anatol Pomazao <anatol@google.com>, bcm-kernel-feedback-list@broadcom.com,
 linux-mtd@lists.infradead.org, Dmitry Torokhov <dtor@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Only a license nit.

Brian Norris schreef op vr 06-03-2015 om 17:18 [-0800]:

> --- /dev/null
> +++ b/drivers/mtd/nand/brcmstb_nand.c
> @@ -0,0 +1,2182 @@
> +/*
> + * Copyright © 2010-2015 Broadcom Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> + * GNU General Public License for more details.
> + */

This states the license is GPL v2.

> +MODULE_LICENSE("GPL");

So you probably want
   MODULE_LICENSE("GPL v2");

here.


Paul Bolle
