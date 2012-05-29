Received: from 9.mo3.mail-out.ovh.net ([87.98.184.141]
 helo=mo3.mail-out.ovh.net)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SZOr4-0007tY-52
 for linux-mtd@lists.infradead.org; Tue, 29 May 2012 16:01:08 +0000
Received: from mail91.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with SMTP id A3BAFFFB2A6
 for <linux-mtd@lists.infradead.org>; Tue, 29 May 2012 18:04:15 +0200 (CEST)
Date: Tue, 29 May 2012 18:01:12 +0200
From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v9 3/3] MTD: at91: atmel_nand: Update driver to support
 Programmable Multibit ECC controller
Message-ID: <20120529160112.GT3377@game.jcrosoft.org>
References: <1338038677-6752-1-git-send-email-josh.wu@atmel.com>
 <1338038677-6752-4-git-send-email-josh.wu@atmel.com>
 <20120528065822.GL3377@game.jcrosoft.org>
 <4FC3389C.5050303@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4FC3389C.5050303@atmel.com>
Cc: hongxu.cn@gmail.com, dedekind1@gmail.com, nicolas.ferre@atmel.com,
 linux-mtd@lists.infradead.org, ivan.djelic@parrot.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> >>+
> >>+static void __iomem *pmecc_get_index_of(struct atmel_nand_host *host)
> >this is a __dev_init function plese check the other too
> >
> >btw you need to use __dev_init and not __init
> 
> Here I use pmecc_get_index_of() function to get a lookup table base
> which is in ROM.
> I'm not clear about how should I need __dev_init here. Can you give
> more information?

it is the section where the function is going to be stored

pmecc_get_index_of is use at probe time so it's __devinit section

as it's supposed to be for the probe function too

Best Regards,
J.
