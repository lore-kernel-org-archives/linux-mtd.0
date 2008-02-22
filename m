Received: from py-out-1112.google.com ([64.233.166.178])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JSO1r-000862-OZ
	for linux-mtd@lists.infradead.org; Fri, 22 Feb 2008 02:52:52 +0000
Received: by py-out-1112.google.com with SMTP id p76so376013pyb.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Feb 2008 18:52:50 -0800 (PST)
Message-ID: <386072610802211852r466ba76m427d8705b3d86ad9@mail.gmail.com>
Date: Fri, 22 Feb 2008 10:52:49 +0800
From: "Bryan Wu" <cooloney@kernel.org>
Sender: cooloney.lkml@gmail.com
To: "Ivan Djelic" <ivan.djelic@parrot.com>
Subject: Re: [MTD/NAND] Blackfin NFC driver DMA bug ?
In-Reply-To: <loom.20080221T171743-57@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <loom.20080221T171743-57@post.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 22, 2008 at 1:58 AM, Ivan Djelic <ivan.djelic@parrot.com> wrote:
> Hello All,
>
>  While working on a NAND flash MTD driver, I came across the following piece of
>  code in the Blackfin bf5xx NAND flash controller driver:
>

Thanks, I am always here to answer questions, -;)

>  >From linux-2.6.24.2, file bf5xx_nand.c:418, function bf5xx_nand_dma_rw():
>
>         /*
>          * Before starting a dma transfer, be sure to invalidate/flush
>          * the cache over the address range of your DMA buffer to
>          * prevent cache coherency problems. Otherwise very subtle bugs
>          * can be introduced to your driver.
>          */
>         if (is_read)
>                 invalidate_dcache_range((unsigned int)buf,
>                                 (unsigned int)(buf + page_size));
>         else
>                 flush_dcache_range((unsigned int)buf,
>                                 (unsigned int)(buf + page_size));
>
>  Since 'buf' is allocated outside MTD, are we allowed to assume it is
>  cache-aligned ? Because if it's not, invalidating dcache on read is not enough
>  to prevent cache coherency problems. For instance, a cache line partially
>  spanning across the buffer address range could be flushed just after DMA has
>  completed, corrupting DMA data in the process...

Oh, I am not fully understand your concern.  The code is invalidating
or flushing buf before DMA operation.
And invalidate and flush operation is OK for buf which is not
cache-aligned on Blackfin arch. it also should be
OK for other arch.

-Bryan
