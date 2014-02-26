Received: from mail-ie0-x231.google.com ([2607:f8b0:4001:c03::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WIUsf-00081G-Rk
 for linux-mtd@lists.infradead.org; Wed, 26 Feb 2014 03:09:58 +0000
Received: by mail-ie0-f177.google.com with SMTP id rl12so193846iec.8
 for <linux-mtd@lists.infradead.org>; Tue, 25 Feb 2014 19:09:33 -0800 (PST)
Date: Tue, 25 Feb 2014 19:09:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [RFC 0/3] mtd: bcm47xxnflash: adding support for new NANDs
Message-ID: <20140226030929.GG4194@ld-irv-0074>
References: <1393154819-7369-1-git-send-email-zajec5@gmail.com>
 <5309DBF4.50305@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5309DBF4.50305@hauke-m.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Rafal,

On Sun, Feb 23, 2014 at 12:31:00PM +0100, Hauke Mehrtens wrote:
> On 02/23/2014 12:26 PM, Rafał Miłecki wrote:
> > New Broadcom SoCs have NAND flashes attached & programmed in a totally different
> > way. Instead of accessing them with help of ChipCommon core, they can be used
> > directly.
> > 
> > To support them we can extend bcm47xxnflash in the way this patches implements.
> > However almost nothing in the code will be shared between support for old and
> > new devices.
> > 
> > How should we proceed? Implement it that way anyway? Or maybe writing a
> > separated driver (bcm53xxnflash?) would be a better idea?
> 
> if this controller is completely different I would suggest writing a new
> driver for that controller. Extending the existing driver would make if
> just more complex.

Judging by your (mostly non-functional) patch:

  [WIP][FYI] mtd: bcm53xxnflash: add driver for NAND on new BCMA SoCs

it looks like your hardware is very similar to a line of NAND
controllers that I support at Broadcom. I'm planning to upstream the
driver eventually, and it is much more mature than what you have there.
Perhaps you can wait to integrate with it?

The main difference between my driver and what I see you doing for 53xx
is that you require the bcma_* accessors, whereas my platforms just
perform direct memory-mapped register access.

Brian
