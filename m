Received: from mail-io0-f194.google.com ([209.85.223.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbZ2l-0000j6-Mf
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 20:40:49 +0000
Received: by mail-io0-f194.google.com with SMTP id m98so28558iod.2
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 12:40:27 -0800 (PST)
Date: Wed, 8 Feb 2017 12:39:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.11
Message-ID: <20170208203922.GA105912@google.com>
References: <2f46eee5-35c1-291a-52e9-132ced5749a9@atmel.com>
 <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
 <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
 <c89577f7-2908-3a75-6be4-78455c5cffcb@atmel.com>
 <20170208190939.GA97840@google.com>
 <20170208192236.muenymk6s36hrn42@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170208192236.muenymk6s36hrn42@sirena.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 08, 2017 at 07:22:36PM +0000, Mark Brown wrote:
> On Wed, Feb 08, 2017 at 11:09:39AM -0800, Brian Norris wrote:
> 
> > But one question: *why* exactly is the transfer or message limit so
> > fixed? If a SPI controller allows manual control over the CS line, then
> > why would anybody care if a sequence of data gets split up into multiple
> > HW sequences (e.g., for a long spi_transfer, why can't we split it into
> > 2 sub-transfers, while keeping the CS asserted?).
> 
> Not every device will provide software control of the chip select line
> so it's possible you might hit limits there.  If a device does allow
> software control then yes, we should be handling this transparently in
> the core and splitting up longer transfers into chunks the device can
> handle

Thanks for the info. Then it sounds like that really should be the
dividing line; driver-visible limitations ideally should only happen
when CS is not software-controllable. (As Heiner points out, it seems
FSL ESPI is one such case.) All other cases can be handled by some form
of splitting, in the SPI core.

So that actually sounds like drivers like m25p80 should never have to
account for spi_max_transfer_size(), but instead should have to account
for only spi_max_message_size().

But that's all only a "should" -- nobody has done the work to do this
properly, and so right now, we need to check for both.

> and in fact this is already done in spi_split_transfers_maxsize(). 
> 
> We're missing masking that out in spi_max_transfer_size() though so
> clients won't know if we can handle things, it's overly conservative.

Huh, I've never noticed spi_split_transfers_maxsize(). That looks like
work for it got dropped on the floor somewhere though; nobody is using
it yet, and it's over a year since its introduction.

Brian
