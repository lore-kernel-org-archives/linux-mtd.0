Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YhuVg-0000tb-7V
 for linux-mtd@lists.infradead.org; Tue, 14 Apr 2015 06:39:49 +0000
Received: by paboj16 with SMTP id oj16so780574pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 13 Apr 2015 23:39:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <1428951432.3868.21.camel@x220>
References: <1428941550-4620-1-git-send-email-punnaia@xilinx.com>
 <858a607d-7c5a-4066-aa79-ab14c456b8e5@BN1BFFO11FD046.protection.gbl>
 <1428951432.3868.21.camel@x220>
Date: Tue, 14 Apr 2015 12:09:26 +0530
Message-ID: <CAGnW=Ba7oYT6qf=ag49r6Z-xkVTANcvLqK8848Hg2fTd6L6egw@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] nand: pl353: Add basic driver for arm pl353 smc
 nand interface
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: Paul Bolle <pebolle@tiscali.nl>
Content-Type: text/plain; charset=UTF-8
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "jussi.kivilinna@iki.fi" <jussi.kivilinna@iki.fi>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 Grant Likely <grant.likely@linaro.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jason@lakedaemon.net" <jason@lakedaemon.net>,
 "pawel.moll@arm.com" <pawel.moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "joern@logfs.org" <joern@logfs.org>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Punnaiah Choudary <kpc528@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, "Khoronzhuk,
 Ivan" <ivan.khoronzhuk@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Paul Bolle,

On Tue, Apr 14, 2015 at 12:27 AM, Paul Bolle <pebolle@tiscali.nl> wrote:
> On Mon, 2015-04-13 at 21:42 +0530, Punnaiah Choudary Kalluri wrote:
>
>> --- a/drivers/mtd/nand/Makefile
>> +++ b/drivers/mtd/nand/Makefile
>
>> +obj-$(CONFIG_MTD_NAND_PL353)         += pl353_nand.o
>
> (I think pl353_nand.o can be part of a module. If that's incorrect, you
> can stop reading here.)
>
>> --- /dev/null
>> +++ b/drivers/mtd/nand/pl353_nand.c
>
>> + * This program is free software; you can redistribute it and/or modify it under
>> + * the terms of the GNU General Public License version 2 as published by the
>> + * Free Software Foundation; either version 2 of the License, or (at your
>> + * option) any later version.
>
> This states the license of this driver is GPL v2 or later.
>
>> +MODULE_LICENSE("GPL v2");
>
> And according to include/linux/module.h this states the license is GPL
> v2. So either the comment at the top of this file or the license ident
> used in the MODULE_LICENSE() macro needs to change.

Thanks for the review. I will change the licence ident to "GPL".

I will wait some time for further functional comments on this driver
before sending the next version
of patches.

Regards,
Punnaiah

>
> Thanks,
>
>
> Paul Bolle
>
