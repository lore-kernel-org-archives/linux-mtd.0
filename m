Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dJ6hy-0000SJ-2I
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 23:19:19 +0000
Received: by mail-pg0-x243.google.com with SMTP id v14so5970268pgn.1
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jun 2017 16:18:57 -0700 (PDT)
Date: Thu, 8 Jun 2017 16:18:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: Re: [PATCH 3/4] mtd: mchp23k256: add partitioning support
Message-ID: <20170608231854.GF102137@google.com>
References: <20170517053908.26138-1-chris.packham@alliedtelesis.co.nz>
 <20170517053908.26138-4-chris.packham@alliedtelesis.co.nz>
 <20170517172911.5f926712@bbrezillon>
 <20170601184340.GA102137@google.com>
 <bba73e6d5f4b41a88423287300d892e5@svr-chch-ex1.atlnz.lc>
 <20170601222320.GE102137@google.com>
 <92ffaa3cef7d49aeb9d5abae06e10ddb@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92ffaa3cef7d49aeb9d5abae06e10ddb@svr-chch-ex1.atlnz.lc>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 01, 2017 at 11:08:08PM +0000, Chris Packham wrote:
> Do we need a flag to indicate SRAM-like properties? I assume there is a 
> difference between NO_ERASE on ROM devices where there is just no way of 
> erasing the data. For {S,F,M}RAM there is no block erase operation but 

I think we already have that:

#define MTD_CAP_ROM             0
#define MTD_CAP_RAM             (MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)

The key signifier for ROM would be !MTD_WRITEABLE.

> you can overwrite data to destroy it (which is actually my use-case with 
> this SPI SRAM). I was tempted to set erase_size = 1 at one point which 
> in my mind was technically accurate but would probably upset the mtd 
> layer just as much as 0.

I'm not sure what erasesize should be here. I suppose 0, but really, I
think the MTD_NO_ERASE flag is the clearer indication that erase is not
needed, and that one should ignore the erasesize.

Brian
