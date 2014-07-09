Received: from mail-qa0-x22f.google.com ([2607:f8b0:400d:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X4guz-0004QV-5M
 for linux-mtd@lists.infradead.org; Wed, 09 Jul 2014 01:43:33 +0000
Received: by mail-qa0-f47.google.com with SMTP id i13so297692qae.34
 for <linux-mtd@lists.infradead.org>; Tue, 08 Jul 2014 18:43:11 -0700 (PDT)
Date: Tue, 8 Jul 2014 18:43:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v3 0/3] mtd: Add sysfs entries and account BBT blocks
 properly
Message-ID: <20140709014307.GF7537@ld-irv-0074>
References: <1403618152-4515-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1403618152-4515-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 24, 2014 at 10:55:49AM -0300, Ezequiel Garcia wrote:
> Here's a new round of the patchset to add sysfs entries for the ECC stats
> struct fields. See the discussion around previous version for context:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2014-March/052804.html
> 
> Changes from v2:
> 
>   * As suggested by Pekon Gupta, use "ecc_failures" instead of
>     "uncorrectable_errors".
> 
>   * Added documentation for the new sysfs ABI as requested by Greg KH.
> 
> Changes from v1:
> 
>   * As agreed I've added a sysfs file per field to replace the ecc_stats
>     sysfs file. The current proposal follows the "one file per value" sysfs
>     rule, adding the following device attributes:
>     - corrected_bits (ecc_stats.corrected)
>     - uncorrectable_errors (ecc_stats.failed)
>     - bad_blocks (ecc_stats.badblocks)
>     - bbt_blocks (ecc_stats.bbtblocks)
> 
>   * Following Brian's request, added small wrapper nand_block_isreserved()
>     that checks if the NAND has a bad block table before querying the number
>     of reserved blocks.
> 
>   * Finally, this new series drops patch: "nand: Account the blocks used by
>     the BBT in the ecc_stats". It's not yet clear how to best deal with the
>     current inconsistencies in MTD master and partition handling.
> 
> The first patch adds the sysfs entries. The rest of the patches fixes the
> bbtblock accounting and allows to keep track of the reserved blocks correctly.
> 
> This is a very old issue, probably around since the dawn of time,
> and nobody seemed to care much about it. However, with the introduction of
> the sysfs access, it's easier to access this stats and easier to
> see the issue.

Pushed to l2-mtd.git, with the small tweaks I noted for patch 1. Thanks!

Brian
