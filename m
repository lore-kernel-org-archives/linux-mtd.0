Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atX2Z-0002LR-2s
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 09:06:19 +0000
Date: Fri, 22 Apr 2016 11:05:47 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Petr Kulhavy <petr@barix.com>
Cc: Murali Karicheri <m-karicheri2@ti.com>, linux-mtd@lists.infradead.org
Subject: Re: DaVinci NAND: disable subpage write (28c015)
Message-ID: <20160422110547.7fdf019c@bbrezillon>
In-Reply-To: <5719DEB9.1020909@barix.com>
References: <5719DEB9.1020909@barix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Petr,

On Fri, 22 Apr 2016 10:20:09 +0200
Petr Kulhavy <petr@barix.com> wrote:

> Hi,
> 
> this email refers to the commit: 
> 28c015a9daabe4ed3aeb0ccf669a3f1c2b8b81d5 on drivers/mtd/nand/davinci-nand.c.
> This commit sets the NAND_NO_SUBPAGE_WRITE option for "ti,keystone-nand" 
> to workaround a HW issue on the controller.
> 
> Disabling subpage write however should be made a general option because 
> some NAND chips do not support subpage write at all. Subpage write is a 
> feature of the NAND chip, not the NAND interface. In combination with  
> "ti,davinci-nand" there is no option to disable subpage write.
> In my case I'm struggling with this issue on the AM1808 with a 1Gb 
> Micron NAND (MT29F1GxxABB).

That's true that subpage write is initially a feature exposed by NAND
chips (actually called subpage in datasheets), but the controller can
say that it does not support writing subpages.
The problem is, in most drivers we don't have the concept of
controllers, hence the reason we're asking NAND controllers to
explicitly modify chip->options and set the NAND_NO_SUBPAGE_WRITE flag
manually.

Note that, unless the CHIP supports subpage write, mtd->subpage_sft
will be 0, which should prevent subpage writes [1].

> 
> My proposal would be to add a boolean property 
> "ti,davinci-disable-subpage-write" or similar, which sets the 
> NAND_NO_SUBPAGE_WRITE option.

Hm, that's not a good idea IMO. This limitation is controller specific.
If some versions of your controller are supporting subpage writes, then
they should not set this flag. So, setting NAND_NO_SUBPAGE_WRITE
depending on the compatible string looks like the good approach here.

Regards,

Boris

[1]http://lxr.free-electrons.com/source/drivers/mtd/nand/nand_base.c#L4350

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
