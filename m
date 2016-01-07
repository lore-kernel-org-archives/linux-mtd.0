Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aH0kB-0008Rb-J9
 for linux-mtd@lists.infradead.org; Thu, 07 Jan 2016 02:56:07 +0000
Received: by mail-pa0-x22c.google.com with SMTP id do7so9188691pab.2
 for <linux-mtd@lists.infradead.org>; Wed, 06 Jan 2016 18:55:47 -0800 (PST)
Date: Wed, 6 Jan 2016 18:55:44 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 "Franklin S Cooper Jr." <fcooper@ti.com>,
 Maxim Levitsky <maximlevitsky@gmail.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>,
 Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] mtd: nand: davinci: remove custom 'erased check'
 implementation
Message-ID: <20160107025544.GB109450@google.com>
References: <1451503927-10831-1-git-send-email-boris.brezillon@free-electrons.com>
 <1451503927-10831-4-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1451503927-10831-4-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 30, 2015 at 08:32:05PM +0100, Boris Brezillon wrote:
> The davinci drivers is manually checking for 'erased pages' while
> correcting ECC bytes.
> This logic can now done by the core infrastructure, and can thus be removed
> from this drivers.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Pushed patch 3 to l2-mtd.git
