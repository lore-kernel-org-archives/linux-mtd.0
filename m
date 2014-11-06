Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmScE-0002bs-Ij
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 19:21:07 +0000
Received: by mail-pa0-f46.google.com with SMTP id lf10so1840760pab.33
 for <linux-mtd@lists.infradead.org>; Thu, 06 Nov 2014 11:20:45 -0800 (PST)
Date: Thu, 6 Nov 2014 11:20:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Subject: Re: [PATCH 0/2] staging: mtd: Support for GigaDevice SPI NAND flash
Message-ID: <20141106192041.GB23619@ld-irv-0074>
References: <1415289079-16922-1-git-send-email-ionela.voinescu@imgtec.com>
 <20141106160548.GB21363@kroah.com> <545BB0BB.3040905@imgtec.com>
 <20141106174459.GA3945@kroah.com> <545BB7F1.5050400@imgtec.com>
 <545BBB26.2040207@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <545BBB26.2040207@imgtec.com>
Cc: Marek Vasut <marex@denx.de>, Ionela Voinescu <ionela.voinescu@imgtec.com>,
 Kamlakant Patel <kamlakant.patel@broadcom.com>, abrestic@chromium.org,
 Greg KH <gregkh@linuxfoundation.org>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, dehrenberg@chromium.org,
 linux-mtd@lists.infradead.org, james.hartley@imgtec.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 06, 2014 at 03:17:10PM -0300, Ezequiel Garcia wrote:
> How about picking Sourav's v2 as a starting point:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2013-July/047434.html

Completely irrelevant, but I found this amusing in that patch, a few
lines into spinand.h:

+/bin/bash: 4: command not found

:)

> And then try to use that to support Micron's MT29F and Gigadevice's GD5F ?
> 
> Brian: Any ideas or suggestion on how to proceed?

I'm not opposed to trying to build a proper SPI-NAND framework. But the
linked v2 patch doesn't provide much to start from. It barely handles
anything that is specific to SPI-NAND (pushing the details out to a
flash-specific driver), and it doesn't address what I think the biggest
question is: how similar will the various SPI-NAND implementations be?
I've talked with a few flash vendors and seen that there were some
growing pains with developing a first generation de-facto standard, so
there is bound to be a bit of incompatibility if we try to support the
earliest examples, but it seemed like there was some effort to keep
things consistent across different manufacturers. I don't know the
progress of any standardization effort there.

Anyway, I think we really should look at whether any of the
identification and command sequencing details can be abstracted into a
drivers/mtd/spinand/spinand.c, with client drivers mostly handling the
transport protocol differences (e.g., interfacing with the SPI layer,
similar to what m25p80.c does for SPI NOR).

I don't have any time to create such a framwork on my own, but I may be
able to spare some limited resources for reviewing others' work. I'd
really like to see some efforts from a few interested reviewers, as I
haven't figured out how to squeeze more hours into my day yet.

BTW, has there been any progress on whatever TODO items landed
mt29f_spinand in staging in the first place?

Brian
