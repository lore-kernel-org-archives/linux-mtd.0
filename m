Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLC7w-0001xj-1a
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 13:44:55 +0000
Date: Wed, 5 Mar 2014 10:44:20 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: rename block device ioctls
Message-ID: <20140305134420.GA3393@arch.cereza>
References: <1394024530-17379-1-git-send-email-dedekind1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394024530-17379-1-git-send-email-dedekind1@gmail.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 05, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Rename the UBI_IOCVOLATTBLK and UBI_IOCVOLDETBLK to UBI_IOCVOLCRBLK and
> UBI_IOCVOLRMBLK, because we do not use terms "attach" and "detach" for the R/O
> block devices on top of UBI volumes. Instead, we use terms "create" and
> "remove". This patch also amends the related commentaries.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
