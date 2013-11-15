Received: from mail-pb0-x22b.google.com ([2607:f8b0:400e:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgyKg-0002C9-JQ
 for linux-mtd@lists.infradead.org; Thu, 14 Nov 2013 14:55:47 +0000
Received: by mail-pb0-f43.google.com with SMTP id rq2so31143pbb.30
 for <linux-mtd@lists.infradead.org>; Thu, 14 Nov 2013 06:55:25 -0800 (PST)
Date: Thu, 14 Nov 2013 22:53:52 -0500
From: Huang Shijie <shijie8@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 1/8] mtd: gpmi: do not use the local array to do the DMA
 transfer
Message-ID: <20131115035336.GB3904@gmail.com>
References: <1384410351-2169-1-git-send-email-b32955@freescale.com>
 <1384410351-2169-2-git-send-email-b32955@freescale.com>
 <20131114134630.GA7076@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131114134630.GA7076@localhost>
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 14, 2013 at 10:46:31AM -0300, Ezequiel Garcia wrote:
> On Thu, Nov 14, 2013 at 02:25:44PM +0800, Huang Shijie wrote:
> 
> ONFI_SUBFEATURE_PARAM_LEN is only 4, so the most natural choice is to
> allocate that in the stack. I think you should add a comment here
> explaining that this buffer needs to be kmallocated for dma purposes.
> 
> Just a nitpick, to avoid people asking why you're doing the allocation
> for just 4 bytes.
i just do not like the warning. 

thanks
Huang Shijie
