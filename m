Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3Rc0-00031I-Oc
 for linux-mtd@lists.infradead.org; Sun, 06 Nov 2016 17:52:09 +0000
Date: Sun, 6 Nov 2016 18:51:47 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Zach Brown <zach.brown@ni.com>
Cc: <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>,
 <dedekind1@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 0/5] mtd: use ONFI bad blocks per LUN to calculate
 UBI bad PEB limit
Message-ID: <20161106185147.384f2e15@bbrezillon>
In-Reply-To: <1478024190-13713-1-git-send-email-zach.brown@ni.com>
References: <1478024190-13713-1-git-send-email-zach.brown@ni.com>
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

On Tue, 1 Nov 2016 13:16:25 -0500
Zach Brown <zach.brown@ni.com> wrote:

> For ONFI-compliant NAND devices, the ONFI parameters report the maximum number
> of bad blocks per LUN that will be encountered over the lifetime of the device,
> so we can use that information to get a more accurate (and smaller) value for
> the UBI bad PEB limit.
> 
> The ONFI parameter "maxiumum number of bad blocks per LUN" is the max number of
> bad blocks that each individual LUN will ever ecounter. It is not the number of
> bad blocks to reserve for the nand device per LUN in the device.
> 
> This means that in the worst case a UBI device spanning X LUNs will encounter
> "maximum number of bad blocks per LUN" * X bad blocks. The implementation in
> this patch assumes this worst case and allocates bad block accordingly.
> 
> These patches are ordered in terms of their dependencies, but ideally, all 5
> would need to be applied for this to work as intended.

This series looks good to me.

Acked-by: Boris Brezillon <boris.brezillon@free-electron.com>

Brian, Richard, any objections?

> 
> v1:
>  * Changed commit message to address concerns from v1[1] about this patch set
>    making best case assumptions.
> v2:
>  * Provided helper function for _max_bad_blocks
>  * Two new patches
>  * First new patch adds bb_per_lun and blocks_per_lun to nand_chip struct
>  * Second new patch sets the new fields during nand_flash_detect_onfi
>  * Max bad blocks calculation now uses the new nand_chip fields
> v3:
>  * Changed bb_per_lun and blocks_per_lun to bb_per_die and blocks_per_die
>  * Corrected type of bb_per_die and blocks_per_die from little endian to host
>    unsigned int
> 
> [1]
> http://lkml.iu.edu/hypermail/linux/kernel/1505.1/04822.html
> 
> 
> Jeff Westfahl (2):
>   mtd: introduce function max_bad_blocks
>   mtd: ubi: use 'max_bad_blocks' to compute bad_peb_limit if available
> 
> Zach Brown (3):
>   mtd: nand: Add bb_per_die and blocks_per_die fields to nand_chip
>   mtd: nand: implement 'max_bad_blocks' mtd function
>   mtd: nand: set bb_per_die and blocks_per_die for ONFI compliant chips
> 
>  drivers/mtd/mtdpart.c        | 13 +++++++++++++
>  drivers/mtd/nand/nand_base.c | 39 +++++++++++++++++++++++++++++++++++++++
>  drivers/mtd/ubi/build.c      |  4 ++++
>  include/linux/mtd/mtd.h      | 11 +++++++++++
>  include/linux/mtd/nand.h     |  5 +++++
>  5 files changed, 72 insertions(+)
> 
> --
> 2.7.4
> 
