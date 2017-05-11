Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d8rVA-0001R7-CQ
 for linux-mtd@lists.infradead.org; Thu, 11 May 2017 17:03:46 +0000
Received: by mail-pf0-x244.google.com with SMTP id u26so3901512pfd.2
 for <linux-mtd@lists.infradead.org>; Thu, 11 May 2017 10:03:23 -0700 (PDT)
Date: Thu, 11 May 2017 10:03:20 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 linux-mtd@lists.infradead.org, cphealy@gmail.com,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] mtd: dataflash: Make use of "extened device
 information"
Message-ID: <20170511170320.GE70297@google.com>
References: <20170421163026.24884-1-andrew.smirnov@gmail.com>
 <20170421163026.24884-5-andrew.smirnov@gmail.com>
 <c998bbb1-1545-ce56-2f74-5fb83721269a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c998bbb1-1545-ce56-2f74-5fb83721269a@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 21, 2017 at 07:19:21PM +0200, Marek Vasut wrote:
> On 04/21/2017 06:30 PM, Andrey Smirnov wrote:
> > In anticipation of supporting chips that need it, extend the size of
> > struct flash_info's 'jedec_id' field to make room 2 byte of extended
> > device information as well as add code to fetch this data during
> > jedec_probe().
> > 
> > Cc: cphealy@gmail.com
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Cc: Marek Vasut <marek.vasut@gmail.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> > Cc: linux-kernel@vger.kernel.org
> > Acked-by: Marek Vasut <marek.vasut@gmail.com>
> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> > ---
> > 
> > Changes since [v4]:
> > 
> > 	- Corrected value of SUP_EXTID from BIT(3) to 0x0004
> > 
> > 	- Collected Acked-by from Marek
> 
> Super, entire series is great, thanks !

Applied to l2-mtd.git/next for 4.13
