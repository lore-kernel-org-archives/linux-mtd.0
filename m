Received: from mail-pa0-x243.google.com ([2607:f8b0:400e:c03::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bt5IN-00083d-SE
 for linux-mtd@lists.infradead.org; Sun, 09 Oct 2016 04:01:04 +0000
Received: by mail-pa0-x243.google.com with SMTP id qn10so4819204pac.2
 for <linux-mtd@lists.infradead.org>; Sat, 08 Oct 2016 21:00:42 -0700 (PDT)
Date: Sat, 8 Oct 2016 21:00:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] mtd: introduce the mtd_pairing_scheme concept
Message-ID: <20161009040039.GA10199@brian-ubuntu>
References: <1473951929-416-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1473951929-416-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 15, 2016 at 05:05:29PM +0200, Boris Brezillon wrote:
> MLC and TLC NAND devices are using NAND cells exposing more than one bit,
> but instead of attaching all the bits in a given cell to a single NAND
> page, each bit is usually attached to a different page. This concept is
> called 'page pairing', and has significant impacts on the flash storage
> usage.
> The main problem showed by these devices is that interrupting a page
> program operation may not only corrupt the page we are programming
> but also the page it is paired with, hence the need to expose to MTD
> users the pairing scheme information.
> 
> The pairing APIs allows one to query pairing information attached to a
> given page (here called wunit), or the other way around (the wunit
> pointed by pairing information).
> It also provides several helpers to help the conversion between absolute
> offsets and wunits, and query the number of pairing groups.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Reviewed-by: Brian Norris <computersforpeace@gmail.com>
> ---
> Hi Brian,
> 
> Here is a new version addressing your comments.
> If you're okay with this version, you can directly pull the
> 4.9/mtd-pairing-scheme tag [1] into your tree (it's based on 4.8-rc1).

I never found where '[1]' was pointing, but I did pull
4.9/mtd-pairing-scheme from github.com:linux-nand/linux into
linux-mtd.git.

Thanks,
Brian

> Changes since v2:
> - fix documentation
> - make API consistent by returning error codes and adding bounds
>   checking everywhere
> - drop NAND pairing scheme patches (will be resubmitted after
>   this patch has been merged)
> 
> Changes since v1:
> - document the paring scheme concepts and the associate structures and
>   helpers
> - rework the dist3 and dist6 implementation according to George
>   comments
> - introduce the mtd_set_pairing_scheme() helper to avoid directly
>   manipulating the mtd->pairing field
> - drop the patch assigning dist6 pairing scheme to the H27UCG8T2ATR
>   NAND (in the light of George comment I'm not longer sure this scheme
>   is suitable for this NAND, and I can't test it)
> 
>  drivers/mtd/mtdcore.c   | 104 ++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/mtdpart.c   |   1 +
>  include/linux/mtd/mtd.h | 107 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 212 insertions(+)
