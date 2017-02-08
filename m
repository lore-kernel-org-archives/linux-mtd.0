Received: from mail-pg0-f65.google.com ([74.125.83.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbbRG-0000dK-PE
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 23:14:17 +0000
Received: by mail-pg0-f65.google.com with SMTP id 204so16048994pge.2
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 15:13:54 -0800 (PST)
Date: Wed, 8 Feb 2017 15:12:51 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V4] mtd: bcm47xxsflash: support reading flash out of
 mapping window
Message-ID: <20170208231251.GM94627@google.com>
References: <20170123115154.3364-1-zajec5@gmail.com>
 <20170208225344.24010-1-zajec5@gmail.com>
 <20170208230921.GL94627@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170208230921.GL94627@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 08, 2017 at 03:09:21PM -0800, Brian Norris wrote:
> On Wed, Feb 08, 2017 at 11:53:44PM +0100, Rafał Miłecki wrote:
> > From: Rafał Miłecki <rafal@milecki.pl>
> > 
> > For reading flash content we use MMIO but it's possible to read only
> > first 16 MiB this way. It's simply an arch design/limitation.
> > To support flash sizes bigger than 16 MiB implement indirect access
> > using ChipCommon registers.
> > This has been tested using MX25L25635F.
> > 
> > Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> > Acked-by: Marek Vasut <marek.vasut@gmail.com>
> > ---
> > V2: Simplify line writing to buf
> >     Add some trivial comment for OPCODE_ST_READ4B
> >     Both requested by Marek
> > V3: Use as much as possible MMIO access for reads crossing boundary
> > V4: Add missing buf increment (thanks Brian!)
> 
> Presumably you tested for this case now? Seems like quick turnaround :)

Anyway, LGTM. Applied to l2-mtd.git.
