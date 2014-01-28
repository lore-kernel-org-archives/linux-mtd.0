Received: from mail-pd0-x231.google.com ([2607:f8b0:400e:c02::231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W81eh-0002VS-LV
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2014 05:56:16 +0000
Received: by mail-pd0-f177.google.com with SMTP id x10so6653750pdj.36
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2014 21:55:54 -0800 (PST)
Date: Mon, 27 Jan 2014 21:55:51 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH 1/2] mtd: gpmi: allocate a proper buffer for non ECC
 read/write
Message-ID: <20140128055551.GG3162@norris-Latitude-E6410>
References: <1387381260-11923-1-git-send-email-shijie8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1387381260-11923-1-git-send-email-shijie8@gmail.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 18, 2013 at 11:40:59PM +0800, Huang Shijie wrote:
> The @data_buffer_dma buffer is used for non ECC read/write.
> 
> Currently, the length of the buffer is PAGE_SIZE, but the NAND chip may
> has 8K page or 16K page. So we have to extend it for the large page NAND
> chips.
> 
> The gpmi_alloc_dma_buffer will be called twice. The first time is to
> allocate a temporary buffer for scanning the NAND chip; The second time
> is to allocate a buffer to store the real page content.
> 
> This patch allocates a buffer of PAGE_SIZE size for scanning the NAND
> chip when gpmi_alloc_dma_buffer is called the first time, and allocates a
> buffer of the real NAND page size for the second time gpmi_alloc_dma_buffer
> is called.
> 
> Signed-off-by: Huang Shijie <shijie8@gmail.com>

Pushed these two to l2-mtd.git/master, since they are bugfixes. I plan
to submit a pull request soon, so please holler ASAP if you object.

Brian
