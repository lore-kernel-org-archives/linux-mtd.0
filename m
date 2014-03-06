Received: from mail-ie0-x22a.google.com ([2607:f8b0:4001:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLf9o-0004W4-H3
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 20:44:46 +0000
Received: by mail-ie0-f170.google.com with SMTP id rd18so3409895iec.15
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 12:44:22 -0800 (PST)
Date: Thu, 6 Mar 2014 12:44:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: m25p80: add Macronix mx66l1g55g 1Gbit SPI flash
Message-ID: <20140306204411.GA5232@ld-irv-0074>
References: <1391031826-28794-1-git-send-email-computersforpeace@gmail.com>
 <201402010235.27291.marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201402010235.27291.marex@denx.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 01, 2014 at 02:35:27AM +0100, Marek Vasut wrote:
> On Wednesday, January 29, 2014 at 10:43:46 PM, Brian Norris wrote:
> > Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> > ---
> >  drivers/mtd/devices/m25p80.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> > index 1e147a849c35..5124b649d68c 100644
> > --- a/drivers/mtd/devices/m25p80.c
> > +++ b/drivers/mtd/devices/m25p80.c
> > @@ -940,6 +940,7 @@ static const struct spi_device_id m25p_ids[] = {
> >  	{ "mx25l25635e", INFO(0xc22019, 0, 64 * 1024, 512, 0) },
> >  	{ "mx25l25655e", INFO(0xc22619, 0, 64 * 1024, 512, 0) },
> >  	{ "mx66l51235l", INFO(0xc2201a, 0, 64 * 1024, 1024, M25P80_QUAD_READ) },
> > +	{ "mx66l1g55g",  INFO(0xc2261b, 0, 64 * 1024, 2048, M25P80_QUAD_READ) },
> 
> Well it does make sense, doesn't it ? :)
> 
> Acked-by: Marek Vasut <marex@denx.de>

Pushed to l2-mtd.git.

Brian
