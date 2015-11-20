Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzr1J-0002sw-Nv
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 19:06:54 +0000
Received: by padhx2 with SMTP id hx2so124588940pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 11:06:32 -0800 (PST)
Date: Fri, 20 Nov 2015 11:06:30 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Sheng Yong <shengyong1@huawei.com>
Cc: dwmw2@infradead.org, richard@nod.at, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [RFC PATCH 0/5] MTD: nandsim: simulate multiple chips
Message-ID: <20151120190630.GV64635@google.com>
References: <1438764954-36976-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438764954-36976-1-git-send-email-shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 05, 2015 at 08:55:49AM +0000, Sheng Yong wrote:
> Hi, folks,
> 
> These patchset add a new module parameter, numchips, to supports to
> simulate NAND flash with multiple chips.
> 
> This simulation helps to test and improve generic NAND driver on
> multiple chips NAND flash.

I'm not quite sure I understand the real purpose of this feature. Seems
like you're just testing different corners of the internals of the NAND
framework, but not actually exposing anything new that an MTD user would
care about. Care to clarify?

Brian

> MTD test (except for mtd_nandbiterr) are passed. 
> 
> Thanks,
> Sheng
> 
> Sheng Yong (5):
>   MTD: nandsim: add numchips module parameter
>   MTD: nandsim: fix column address size of large page
>   MTD: nandsim: fix page address size
>   MTD: nandsim: add ADJUST_ROW() to find the real page number
>   MTD: nandsim: extent outprint messages
> 
>  drivers/mtd/nand/nandsim.c | 632 +++++++++++++++++++++++++++------------------
>  1 file changed, 377 insertions(+), 255 deletions(-)
> 
> -- 
> 1.8.3.4
> 
