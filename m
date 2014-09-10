Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XRrGp-00036C-KM
 for linux-mtd@lists.infradead.org; Wed, 10 Sep 2014 23:25:52 +0000
Received: by mail-pd0-f174.google.com with SMTP id v10so12038478pde.33
 for <linux-mtd@lists.infradead.org>; Wed, 10 Sep 2014 16:25:29 -0700 (PDT)
Date: Wed, 10 Sep 2014 16:25:26 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie.huang@intel.com>
Subject: Re: [PATCH 7/8] mtd: spi-nor: factor out write_enable() for erase
 commands
Message-ID: <20140910232526.GI18411@ld-irv-0074>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-8-git-send-email-computersforpeace@gmail.com>
 <20140809105232.GA1571@localhost.localdomain>
 <20140811184818.GY3711@ld-irv-0074>
 <20140812005912.GA1850@shldeISGChi005.sh.intel.com>
 <20140910070537.GC5732@norris-Latitude-E6410>
 <20140910152021.GB13016@shldeISGChi005.sh.intel.com>
 <20140910074708.GD5732@norris-Latitude-E6410>
 <20140910161237.GB13736@shldeISGChi005.sh.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140910161237.GB13736@shldeISGChi005.sh.intel.com>
Cc: Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
 zajec5@gmail.com, Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 11, 2014 at 12:12:37AM +0800, Huang Shijie wrote:
> On Wed, Sep 10, 2014 at 12:47:08AM -0700, Brian Norris wrote:
> > On Wed, Sep 10, 2014 at 11:20:21PM +0800, Huang Shijie wrote:
> > > On Wed, Sep 10, 2014 at 12:05:37AM -0700, Brian Norris wrote:
> > > > On Tue, Aug 12, 2014 at 08:59:12AM +0800, Huang Shijie wrote:
> > > you miss a write_enable for each sector's erase. 
> > 
> > But is that necessary? I thought 'write-enabled' was retained across
> > operations, so why would you have to perform it before each sector's
> > erase?
> The legacy code did so.
> 
> > 
> > Or do you have a flash datasheet which says you must send WREN before
> > each sector erase?
> See the belowing from Spansion Nor S25fl129:
> 
> "
> The Sector Erase (SE) command sets all bits at all addresses within a
> specified sector to a logic 1. A WREN
> command is required prior to writing the SE command.
> "
> 
> It does not tell we send a WREN for each sector erase, but i am not sure if we can remove it.

OK, well I guess I can rework this to retain the original behavior. That
was in fact, an oversight (thanks for catching), although I'm not
convinced it's actually necessary.

(Edit: I think you may be right that WREN is necessary before every
erased command. From a Micron N25Q256 datasheet:

  The write enable latch bit must be set before every PROGRAM, ERASE,
  WRITE, ENTER 4-BYTE ADDRESS MODE, and EXIT 4-BYTE ADDRESS MODE
  command.
  
But I don't recall seeing any ill effects last time I tested this on my
Micron SPI flash, so I'm still mildly confused.)

Brian
