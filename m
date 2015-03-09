Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YV1W7-0001j4-Ia
 for linux-mtd@lists.infradead.org; Mon, 09 Mar 2015 17:31:00 +0000
Received: by pdbnh10 with SMTP id nh10so72772035pdb.3
 for <linux-mtd@lists.infradead.org>; Mon, 09 Mar 2015 10:30:37 -0700 (PDT)
Date: Mon, 9 Mar 2015 10:30:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 3/3] mtd: nand: add NAND driver for Broadcom STB NAND
 controller
Message-ID: <20150309173022.GS18140@ld-irv-0074>
References: <1425691129-1150-1-git-send-email-computersforpeace@gmail.com>
 <1425691129-1150-4-git-send-email-computersforpeace@gmail.com>
 <1425731983.2281.6.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1425731983.2281.6.camel@tiscali.nl>
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 sbranden@broadcom.com, Kevin Cernekee <cernekee@gmail.com>,
 Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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

On Sat, Mar 07, 2015 at 01:39:43PM +0100, Paul Bolle wrote:
> Only a license nit.
> 
> Brian Norris schreef op vr 06-03-2015 om 17:18 [-0800]:
> 
> > --- /dev/null
> > +++ b/drivers/mtd/nand/brcmstb_nand.c
> > @@ -0,0 +1,2182 @@
> > +/*
> > + * Copyright © 2010-2015 Broadcom Corporation
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + */
> 
> This states the license is GPL v2.
> 
> > +MODULE_LICENSE("GPL");
> 
> So you probably want
>    MODULE_LICENSE("GPL v2");
> 
> here.

Thanks. Fixed.

Brian
