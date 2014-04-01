Received: from mail-pb0-x22b.google.com ([2607:f8b0:400e:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUtew-0001yr-4C
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 08:03:02 +0000
Received: by mail-pb0-f43.google.com with SMTP id um1so9448551pbc.2
 for <linux-mtd@lists.infradead.org>; Tue, 01 Apr 2014 01:02:40 -0700 (PDT)
Date: Tue, 1 Apr 2014 01:02:37 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v4 0/5] mtd: nand: Add on-die ECC support
Message-ID: <20140401080237.GE6400@brian-ubuntu>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1396308537-16013-1-git-send-email-davidm@egauge.net>
Cc: gsi@denx.de, linux-mtd@lists.infradead.org, pekon@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On Mon, Mar 31, 2014 at 05:28:52PM -0600, David Mosberger wrote:
> This patch-series is designed to go on top of Gerhard Sittig's
> patch series "mtd: nand: introduce a READMODE command".
> 
> The patches add on-die ECC support as found on some Micron flash chips.
> 
> David Mosberger (5):
>   mtd: nand: Detect Micron flash with on-die ECC (aka "internal ECC")
>     enabled.
>   mtd: nand: Add NAND_ECC_HW_ON_DIE ECC-mode.
>   mtd: nand: Enable subpage-reads on flashes with on-die ECC enabled.
>   mtd: nand: Allocate extra buffers needed for on-die ECC controller.
>   mtd: nand: Improve bitflip detection for on-die ECC scheme.

As I commented on your patches, I think this series is tied too closely
to a single flash part. I gave a few pointers where it can be unraveled
a bit, but please consider more ways to do so if possible. And ask
questions if anything is unclear or difficult.

Aside: if we continue to get more pseudo-generic features with
(relatively) small per-vendor differences, it may be time to do some
cleanup, and push some of the vendor-specific stuff into a new file
drivers/mtd/nand/nand_vendor.c. Already, I think a lot of the
nand_get_flash_type() stuff is so logically separate from much of the
NAND operation core, that maybe it should be pulled out. I don't expect
you to do this cleanup for me, but it may help guide you in determining
how to split certain functionality cleanly into pieces.

Thanks,
Brian
