Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VALre-0004dB-Fv
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2013 15:22:59 +0000
Received: by mail-pd0-f180.google.com with SMTP id y10so2368318pdj.39
 for <linux-mtd@lists.infradead.org>; Fri, 16 Aug 2013 08:22:36 -0700 (PDT)
Date: Fri, 16 Aug 2013 23:26:47 -0400
From: Huang Shijie <shijie8@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v4 6/6] mtd: update the ABI document about the ecc step
 size
Message-ID: <20130817032644.GA27332@gmail.com>
References: <1376619009-8622-1-git-send-email-b32955@freescale.com>
 <1376619009-8622-7-git-send-email-b32955@freescale.com>
 <1376660759.2089.358.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376660759.2089.358.camel@sauron.fi.intel.com>
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, pekon@ti.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 16, 2013 at 04:45:59PM +0300, Artem Bityutskiy wrote:
> On Fri, 2013-08-16 at 10:10 +0800, Huang Shijie wrote:
> > +
> > +What:          /sys/class/mtd/mtdX/ecc_step_size
> > +Date:          May 2013
> > +KernelVersion: 3.10
> > +Contact:       linux-mtd@lists.infradead.org
> > +Description:
> > +               The size of each ECC step which is used for ECC.
> > +               Note that some devices will have multiple ecc steps within each
> > +               writesize region.
> 
> Actually this phrase is a bit confusing because it may be interpreted as
> that one write-size may have ECC steps of multiple sizes. Would you
> re-phrase, may be?
What's about the following:
 -----------------------------------------------------------------
   The size of each ECC step which is used for ECC.
   Note that some devices will have multiple ecc steps within each
   writesize region, and the ecc steps share the same size.
 -----------------------------------------------------------------

thanks
Huang Shijie
