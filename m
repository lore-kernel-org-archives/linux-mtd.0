Received: from mail-bl2lp0204.outbound.protection.outlook.com
 ([207.46.163.204] helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WeiSe-0000jl-JW
 for linux-mtd@lists.infradead.org; Mon, 28 Apr 2014 10:06:57 +0000
Date: Mon, 28 Apr 2014 17:08:24 +0800
From: Huang Shijie <b32955@freescale.com>
To: Kamal Dasu <kdasu.kdev@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: Add support to use nand_base poi databuf
 as bounce buffer
Message-ID: <20140428090822.GA21064@localhost>
References: <1398375634-24759-1-git-send-email-kdasu.kdev@gmail.com>
 <5359C361.9000302@freescale.com>
 <CAC=U0a0OwJe4f4ZC6GBWzrVZ6fF1Lq=QB1E0ZBANww=k7L4cXA@mail.gmail.com>
 <20140425074310.GA2117@localhost> <20140425075943.GA2221@localhost>
 <CAC=U0a3_O2AHX8Y_gCxftkZjrH97U32=8ksLbaBTgTBPX7oWmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAC=U0a3_O2AHX8Y_gCxftkZjrH97U32=8ksLbaBTgTBPX7oWmg@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 25, 2014 at 12:10:43PM -0400, Kamal Dasu wrote:
> Huang,
> 
> "In the gpmi driver, i do a memcpy for the highmem buffer passed from
> upper layer."
> 
> In other l2-mtd driver examples when the mapping fails those drivers
> are reverting to bouce buffering using kmall'd dma buffer and memcpy
> to highmem buffer. So the solutions have been implemented in the
> l2-mtd (lowest level nand controller) driver.
> 
> In contrast this in change in nand_base uses the generic mm api
> virt_addr_valid() to check if the passed address is in highmem, and if
> it is I am not trying to convert(map) it, rather using the kmalloc'd
> databuf in nand_base and memcpy to/from the highmem buffer. Also
I think your idea is good.  :)

If your patch can be merged to kernel, it mean the driver can always do the
DMA mapping sucessfully(Am i right?). And it makes the gpmi driver more simple.

See my comment in the orginal patch.

thanks
Huang Shijie
