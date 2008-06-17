Received: from yw-out-1718.google.com ([74.125.46.152])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8P4f-0005Aa-9n
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 00:29:25 +0000
Received: by yw-out-1718.google.com with SMTP id 5so3939989ywm.72
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Jun 2008 17:29:24 -0700 (PDT)
Date: Mon, 16 Jun 2008 20:22:47 -0400
From: Josh Boyer <jwboyer@gmail.com>
To: Mitch Bradley <wmb@firmworks.com>
Subject: Re: mtd partitions limited to 4 GB?
Message-ID: <20080616202248.042457ca@vader.jdub.homelinux.org>
In-Reply-To: <4856FF76.9000302@firmworks.com>
References: <4856FF76.9000302@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 16 Jun 2008 14:04:06 -1000
Mitch Bradley <wmb@firmworks.com> wrote:

> In drivers/mtd/mtdpart.c, struct mtd_part has  "u_int32_t offset", thus 
> (apparently) limiting the partition start offset to 4 GiB.  Similarly, 
> struct mtd_partition in include/linux/mtd/partititions.h has "u_int32_t 
> size" and "u_int32_offset".

This is not limited to partitions.  The entire MTD subsystem is limited
to 4 GiB sized devices.

> Now that NAND FLASH device sizes have exceeded that, this appears to be 
> a significant limitation.
> 
> Is anyone in the mtd community already addressing this?

There have been some that have offered to help in recent weeks.  A
brainstorming session of sorts happened on the list a couple of weeks
ago.  You might check there for what was decided.

> Fixing the core infrastructure might be as simple as using "loff_t" 
> instead of "u_int32_t" for those fields.  However, all of the existing 
> partition map parsers appear to have the same 32-bit limitation, so 
> partitioning a >4GiB device will require a new or modified partition map 
> format.

IIRC, one of the outcomes of the discussion was to introduce a new
interface so that chips are addressed in block+offset mappings.  This
will be better overall, but requires a bit more overhead in the initial
implementation.

josh
