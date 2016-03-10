Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae5gD-0007os-Rs
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 18:51:26 +0000
Received: by mail-pa0-x22e.google.com with SMTP id tt10so73466840pab.3
 for <linux-mtd@lists.infradead.org>; Thu, 10 Mar 2016 10:51:02 -0800 (PST)
Date: Thu, 10 Mar 2016 10:50:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] MAINTAINERS: add a maintainer for the NAND subsystem
Message-ID: <20160310185059.GA2545@google.com>
References: <1457557044-7029-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457557044-7029-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 09, 2016 at 09:57:24PM +0100, Boris Brezillon wrote:
> Add myself as the maintainer of the NAND subsystem.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes since v1:
> - rename the MAINTAINERS entry to NAND FLASH SUBSYSTEM
> - add Richard as a reviewer
> - add a git tree

Pushed to linux-mtd.git.

I'll take any last NAND inclusions for this upcoming merge window
directly, but I'll generally defer to you to queue them up in your tree
first from then on.

Regards,
Brian
