Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e72uZ-00033g-Fw
 for linux-mtd@lists.infradead.org; Tue, 24 Oct 2017 17:22:45 +0000
Received: by mail-qk0-x242.google.com with SMTP id r64so27233875qkc.1
 for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2017 10:22:22 -0700 (PDT)
Date: Tue, 24 Oct 2017 13:22:20 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
cc: Chris Brandt <chris.brandt@renesas.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 0/5] unconfuse get_unmapped_area and point/unpoint
 driver methods
In-Reply-To: <20171017152826.11658-1-nicolas.pitre@linaro.org>
Message-ID: <nycvar.YSQ.7.76.1710241321450.3238@knanqh.ubzr>
References: <20171017152826.11658-1-nicolas.pitre@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Ping.

On Tue, 17 Oct 2017, Nicolas Pitre wrote:

> This series improves or implements the point and unpoint driver methods
> and reimplements mtd_get_unmapped_area() in terms of those. Because
> mtd->_point() provides a superset of what mtd->_get_unmapped_area() does
> then there is no reason for having both. Or worse: having one but not
> the other.
> 
> This is motivated by my work on XIP cramfs for both MMU and !MMU systems
> where I do need the more complete point functionality. And it just looks
> like the right thing to do.
> 
> This is also available on top of Linux v4.14-rc3 via git here:
> 
>   http://git.linaro.org/people/nicolas.pitre/linux mtd_point
> 
> 
> Changes from v1:
> 
> - Fix retlen computation in mtdram.c:ram_point().
> 
> - Added Richard Weinberger's REviewd-by tags.
> 
> 
> diffstat:
> 
>  drivers/mtd/chips/map_ram.c  | 34 ++++++++++++++++++++--------------
>  drivers/mtd/chips/map_rom.c  | 34 +++++++++++++++++++++-------------
>  drivers/mtd/devices/mtdram.c | 36 ++++++++++++++++++++++--------------
>  drivers/mtd/mtdconcat.c      | 27 ---------------------------
>  drivers/mtd/mtdcore.c        | 17 ++++++++++++-----
>  drivers/mtd/mtdpart.c        | 14 --------------
>  include/linux/mtd/mtd.h      |  4 ----
>  7 files changed, 75 insertions(+), 91 deletions(-)
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
