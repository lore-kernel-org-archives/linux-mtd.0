Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXErn-0001MM-AK
	for linux-mtd@lists.infradead.org; Sun, 24 Aug 2008 12:38:47 +0000
Date: Sun, 24 Aug 2008 13:38:34 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] [MTD] mtdchar.c: Fix regression in MEMGETREGIONINFO
	ioctl()
Message-ID: <20080824123834.GC24946@shareable.org>
References: <48ABCC0B.40607@gmail.com>
	<20080822153451.bb79bd1f.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080822153451.bb79bd1f.akpm@linux-foundation.org>
Cc: Giometti <giometti@enneenne.com>, Rodolfo@shareable.org,
	linux-kernel@vger.kernel.org, Zev Weiss <zevweiss@gmail.com>,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Morton wrote:
> struct mtd_erase_region_info {
> 	struct {
> 		u_int32_t offset;
> 		u_int32_t erasesize;
> 		u_int32_t numblocks;
> 	} user_part;
> 	unsigned long *lockmap;
> };

Is the name "struct mtd_erase_region_info" something userspace uses?

Nothing wrong with changing the kernel's version, as long as userspace
uses different headers, but it might be confusing.

-- Jamie
