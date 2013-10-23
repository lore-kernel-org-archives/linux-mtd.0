Received: from mail-oa0-x22b.google.com ([2607:f8b0:4003:c02::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ7PX-0001TB-6y
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 23:00:20 +0000
Received: by mail-oa0-f43.google.com with SMTP id m1so1622479oag.16
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 15:59:58 -0700 (PDT)
Date: Wed, 23 Oct 2013 15:59:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V2 0/4] mtd: gpmi: support two nand chips at most
Message-ID: <20131023225954.GY23337@ld-irv-0074.broadcom.com>
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1377595747-21033-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 27, 2013 at 05:29:03PM +0800, Huang Shijie wrote:
> Current gpmi-nand driver only supports one chips. But we may meet
> some embarrassing situation, such as Micron MT29F32G08QAA.
> This nand chip has two DIEs internally. Each die has its own chip select pin,
> so this chip acts as two nand chips.
> 
> If we only scan one chip, we may find that we only get 2G for this chip,
> but in actually, this chip's size is 4G.
> 
> So scan two chips by default.
> 
> In order to support two nand chips, we have to do the following:
>    1.) Decouple the chip select from the DMA channel,
>        We can use the dma 0 to access all the nand chips.
> 
>    2.) fix the wrong method of checking the ready/busy status.
>       In the imx6, all the ready/busy pins are binding together, we
>       should check ready/busy status of chip 0 for the all the chips. 
> 
> Tested this patch set with MT29F32G08QAA.

I fixed up some typos in patch 4 and pushed the series. Thanks!

Brian
