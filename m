Received: from smtpeu1.atmel.com ([195.65.72.27] helo=bagnes.atmel.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JqT30-0000W3-8H
	for linux-mtd@lists.infradead.org; Mon, 28 Apr 2008 13:05:35 +0000
Date: Mon, 28 Apr 2008 15:05:00 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/1] Add fixup for AT49BV6416 devices which needs to
	swap the region info
Message-ID: <20080428150500.4e398c8c@hskinnemo-gx620.norway.atmel.com>
In-Reply-To: <1208877798.9212.618.camel@pmac.infradead.org>
References: <11997880443971-git-send-email-hcegtvedt@atmel.com>
	<1208877798.9212.618.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kernel@avr32linux.org,
	Hans-Christian Egtvedt <hcegtvedt@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse <dwmw2@infradead.org> wrote:
> On Tue, 2008-01-08 at 11:27 +0100, Hans-Christian Egtvedt wrote:
> > This patch adds a fixup for Atmel AT49BV6416 devices which has the erase region
> > information swapped. The fixup swaps them correct.  
> 
> How does this interact with the code in fixup_convert_atmel_pri() which
> sets extp->TopBottom? Doesn't the code _already_ print "Swapping erase
> regions for broken CFI table" for _all_ top-boot chips?

IIRC the AT49BV6416 got it wrong -- the CFI table indicates top-boot
layout, so we need to swap the erase regions for bottom-boot chips and
keep them as is for top-boot chips (or swap them twice, of course.)

Other Atmel chips like the AT49BV642D (which is a replacement for the
obsolete 6416 chip) gives the top-boot bit a more "traditional"
meaning. So I think it's correct to handle the 6416 as a special case.

I haven't checked how many other chips may suffer from this quirk.

Haavard
