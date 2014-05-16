Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WlB47-0005Ih-1j
 for linux-mtd@lists.infradead.org; Fri, 16 May 2014 05:52:19 +0000
Received: by mail-pb0-f45.google.com with SMTP id um1so2124437pbc.4
 for <linux-mtd@lists.infradead.org>; Thu, 15 May 2014 22:51:58 -0700 (PDT)
Date: Thu, 15 May 2014 22:51:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] Documentation: mtd: update the document for m25p80
Message-ID: <20140516055154.GB2413@norris-Latitude-E6410>
References: <1398237167-23881-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398237167-23881-1-git-send-email-b32955@freescale.com>
Cc: marex@denx.de, linux-mtd@lists.infradead.org,
 devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org,
 linux-doc@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 23, 2014 at 03:12:47PM +0800, Huang Shijie wrote:
> The m25p80.c has used the SPI NOR framework now, and the m25p_ids has
> been moved to spi-nor.c and renamed to spi_nor_ids.
> 
> This patch updates the document for m25p80.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Pushed to l2-mtd.git. Thanks!

Brian
