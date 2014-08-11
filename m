Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XGtso-0006Xo-PE
 for linux-mtd@lists.infradead.org; Mon, 11 Aug 2014 17:59:47 +0000
Received: by mail-pa0-f45.google.com with SMTP id eu11so11433717pac.4
 for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2014 10:59:25 -0700 (PDT)
Date: Mon, 11 Aug 2014 10:59:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH 1/8] mtd: spi-nor: eliminate duplicate
 spi_nor_wait_till_{, fsr}_ready() code
Message-ID: <20140811175922.GV3711@ld-irv-0074>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-2-git-send-email-computersforpeace@gmail.com>
 <20140809062543.GA31092@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140809062543.GA31092@localhost.localdomain>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 zajec5@gmail.com, linux-mtd@lists.infradead.org,
 Graham Moore <grmoore@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 09, 2014 at 02:25:45PM +0800, Huang Shijie wrote:
> On Wed, Aug 06, 2014 at 06:16:55PM -0700, Brian Norris wrote:
> > +	fsr = nor->flags & SNOR_F_USE_FSR ? spi_nor_fsr_ready(nor) : 1;
> > +	if (fsr < 0)
> > +		return sr;
> return "fsr" here.

Will fix, thanks.

Brian
