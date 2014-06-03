Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WrphT-0000bs-HW
 for linux-mtd@lists.infradead.org; Tue, 03 Jun 2014 14:28:27 +0000
From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: spi-nor: read 6 bytes for the ID
Date: Tue, 3 Jun 2014 16:23:46 +0200
References: <1397470174-27856-1-git-send-email-b32955@freescale.com>
 <201405292258.52803.marex@denx.de>
 <20140530004928.GA31796@shlinux1.ap.freescale.net>
In-Reply-To: <20140530004928.GA31796@shlinux1.ap.freescale.net>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201406031623.46311.marex@denx.de>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 Christophe KERELLO <christophe.kerello@st.com>, linux-mtd@lists.infradead.org,
 angus.clark@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, May 30, 2014 at 02:49:30 AM, Huang Shijie wrote:
> On Thu, May 29, 2014 at 10:58:52PM +0200, Marek Vasut wrote:
> > On Wednesday, May 28, 2014 at 07:22:40 AM, Huang Shijie wrote:
> > [...]
> > 
> > > From 7b920141899e4e7249bd23792dc8d5f1558cb7ca Mon Sep 17 00:00:00 2001
> > > From: Huang Shijie <b32955@freescale.com>
> > > Date: Mon, 14 Apr 2014 18:09:34 +0800
> > > Subject: [PATCH v2] mtd: spi-nor: read 6 bytes for the ID
> > > 
> > > Currently, we read 5 bytes for ID, but s25fl128s has the same
> > > ext_id(0x4d01) with s25fl129p1. The s25fl128s can support the DDR Quad
> > > read, while s25fl129p1 does not. So we have to distinguish the two NOR
> > > flashs.
> > > 
> > > This patch reads out 6 bytes for the ID, and use the 6 bytes ID to
> > > search the right flash_info.
> > > 
> > > The detail of the patch is:
> > >   [1] change the "ext_id" from u16 to u32.
> > >   
> > >       We can store two bytes or three bytes with the @ext_id now.
> > >   
> > >   [2] search the right flash_info with the 6byte ID and the new
> > >   @ext_id.
> > >   
> > >       We use "matched" variable to track the legacy two bytes @ext_id.
> > >       If the flash_info's @ext_id is three bytes, we will use the
> > >       sixth byte of the ID to check it.
> > >   
> > >   [3] add the new item to spi_nor_ids for s25fl128s.
> > > 
> > > Signed-off-by: Huang Shijie <b32955@freescale.com>
> > > ---
> > > 
> > >  drivers/mtd/spi-nor/spi-nor.c |   30 +++++++++++++++++++++++++-----
> > >  1 files changed, 25 insertions(+), 5 deletions(-)
> > 
> > What exactly changed here please ?
> 
> This patch will reset the ext_jedec to the old value if the
> sixth-byte-match fails.
> 
> ------------------------------------------------------------
> +				/* reset back the ext_jedec */
> +				ext_jedec >>= 8;
> ------------------------------------------------------------

Uh oh, I think we're getting deeper and deeper into ad-hoc adjustments :-(

Best regards,
Marek Vasut
