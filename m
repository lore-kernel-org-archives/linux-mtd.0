Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W5KW7-0001mU-Ko
 for linux-mtd@lists.infradead.org; Mon, 20 Jan 2014 19:28:16 +0000
Received: by mail-ie0-f182.google.com with SMTP id lx4so1699957iec.13
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jan 2014 11:27:54 -0800 (PST)
Date: Mon, 20 Jan 2014 11:27:51 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH fix] mtd: nand: add support for Samsung K9LCG08U0B
Message-ID: <20140120192751.GM8919@ld-irv-0074>
References: <CAN8TOE-6gwR1fXM_unGUo27JhLsZiUBXhTsGa+GD8tbe-kRf_A@mail.gmail.com>
 <1389939446-20577-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1389939446-20577-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 17, 2014 at 02:17:26PM +0800, Huang Shijie wrote:
> Assume that:
>           tmp = ((extid >> 2) & 0x04) | (extid & 0x03));
> 
> From the K9LCG08U0B's datasheet, we know that:
>   the oob size is 640 when tmp is 6;
>   the oob size is 1024 when tmp is 7;
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
> 
> [1] use the 1024, not the SZ_1k
> [2] add back the default case for case 0.

I was already running a modified version of your previous patch through
some tests, so I have pushed it to l2-mtd.git. It's nearly identical to
this version.

Thanks,
Brian
