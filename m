Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZhKDR-0006et-MD
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2015 16:26:51 +0000
Received: by padhy16 with SMTP id hy16so45101092pad.1
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2015 09:26:29 -0700 (PDT)
Date: Wed, 30 Sep 2015 21:56:23 +0530
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, lkp@intel.com
Subject: Re: [PATCH v2] mtd: mtdram: fix build error
Message-ID: <20150930162623.GB21569@sudip-pc>
References: <1443619766-8134-1-git-send-email-sudipm.mukherjee@gmail.com>
 <20150930155107.GA5192@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150930155107.GA5192@localhost>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 30, 2015 at 08:51:07AM -0700, Brian Norris wrote:
> On Wed, Sep 30, 2015 at 06:59:26PM +0530, Sudip Mukherjee wrote:
> > i386 allmodconfig fails with:
> > ERROR: "__umoddi3" [drivers/mtd/devices/mtdram.ko] undefined!
> > ERROR: "__moddi3" [drivers/mtd/devices/mtdram.ko] undefined!
> > 
> > arm allmodconfig fails with:
> > ERROR: "__aeabi_uldivmod" [drivers/mtd/devices/mtdram.ko] undefined!
> > ERROR: "__aeabi_ldivmod" [drivers/mtd/devices/mtdram.ko] undefined!
> > 
> > mips allmodconfig fails with:
> > ERROR: "__umoddi3" [drivers/mtd/devices/mtdram.ko] undefined!
> > ERROR: "__moddi3" [drivers/mtd/devices/mtdram.ko] undefined!
> > 
> > The modulus operation is not being supported by these compilers. Use
> > do_div() instead which returns the remainder.
> > 
> > Fixes: 7827e3acad2d ("mtd: mtdram: check offs and len in mtdram->erase")
> > Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> > ---
> > 
> > v1 showed build warning with cris and xtensa. I have checked v2 with
> > arm, cris and xtensa.
> 
> I already reverted the bad patch, so this doesn't apply any more...
> 
> If you want to send a squashed patch that redoes this properly, I can
> take it.

Ok. Sending the new patch.

regards
sudip
