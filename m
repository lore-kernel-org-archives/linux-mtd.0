Received: from mail-ie0-x22d.google.com ([2607:f8b0:4001:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VrFIp-0004v9-JG
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2013 23:04:20 +0000
Received: by mail-ie0-f173.google.com with SMTP id to1so1753989ieb.18
 for <linux-mtd@lists.infradead.org>; Thu, 12 Dec 2013 15:03:57 -0800 (PST)
Date: Thu, 12 Dec 2013 15:03:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH for v3.13 1/2] mtd: nand: pxa3xx: Use info->use_dma to
 release DMA resources
Message-ID: <20131212230353.GW27149@ld-irv-0074.broadcom.com>
References: <1386680236-21698-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1386680236-21698-2-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1386680236-21698-2-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Seif Mazareeb <seif@marvell.com>,
 Tawfik Bayouk <tawfik@marvell.com>, Arnaud Ebalard <arno@natisbad.org>,
 linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 10, 2013 at 09:57:15AM -0300, Ezequiel Garcia wrote:
> In commit:
> 
>   commit 62e8b851783138a11da63285be0fbf69530ff73d
>   Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>   Date:   Fri Oct 4 15:30:38 2013 -0300
> 
>   mtd: nand: pxa3xx: Allocate data buffer on detected flash size
> 
> the way the buffer is allocated was changed: the first READ_ID is issued
> with a small kmalloc'ed buffer. Only once the flash page size is detected
> the DMA buffers are allocated, and info->use_dma is set.
> 
> Currently, if the device detection fails, the driver checks the 'use_dma'
> module parameter and tries to release unallocated DMA resources.
> 
> Fix this by checking the proper indicator of the DMA allocation, which
> is 'info->use_dma'.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Pushed only this patch to linux-mtd.git.

Thanks,
Brian
