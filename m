Received: from mail-wm0-f65.google.com ([74.125.82.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1castA-0004sz-Tw
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2017 23:40:06 +0000
Received: by mail-wm0-f65.google.com with SMTP id u63so25071299wmu.2
 for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2017 15:39:44 -0800 (PST)
Date: Tue, 7 Feb 2017 00:38:41 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>
Subject: Re: [bug report] ARM: Orion: fix driver probe error handling with
 respect to clk
Message-ID: <20170206233840.GA15302@gandalf>
References: <20170206152947.GA17091@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170206152947.GA17091@mwanda>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dan

On Mon, Feb 06, 2017 at 06:29:47PM +0300, Dan Carpenter wrote:
> The patch baffab28b131: "ARM: Orion: fix driver probe error handling
> with respect to clk" from Jul 19, 2012, leads to the following static
> checker warning:
> 
> 	drivers/mtd/nand/orion_nand.c:172 orion_nand_probe()
> 	warn: 'clk' was already freed.
> 
> drivers/mtd/nand/orion_nand.c
>    150          /* Not all platforms can gate the clock, so it is not
>    151             an error if the clock does not exists. */
>    152          clk = clk_get(&pdev->dev, NULL);
>    153          if (!IS_ERR(clk)) {
>    154                  clk_prepare_enable(clk);
>    155                  clk_put(clk);
> 
> Huh?  Apparently clk_get() and clk_put() are not ref counted
> opperations?
> 
> You would think they would be from the name.  What it looks like to me
> is that clk_put() should be renamed clk_free().  The comments on
> clk_put() are not totally clear on this.  I'm just joking.  :P  There
> aren't any comments...

This looks fishy indeed (btw.  that's not my code).  Instead of
holding a clock pointer, the driver seems to use clk_get()/clk_put()
every time it "needs" a clock (see also orion_nand_remove()).  This
results in calling clk_put() on an enabled clock here and not holding
a reference to the clock after the probe.

Looks somewhat similar to the situation fixed in ac0696629d73 ('usb:
ehci-orion: fix clock reference leaking') to me.
 
>    156          }
>    157  
>    158          ret = nand_scan(mtd, 1);
>    159          if (ret)
>    160                  goto no_dev;
>    161  
>    162          mtd->name = "orion_nand";
>    163          ret = mtd_device_register(mtd, board->parts, board->nr_parts);
>    164          if (ret) {
>    165                  nand_release(mtd);
>    166                  goto no_dev;
>    167          }
>    168  
>    169          return 0;
>    170  
>    171  no_dev:
>    172          if (!IS_ERR(clk)) {
>    173                  clk_disable_unprepare(clk);
> 
> Any later reference to "clk" after clk_put() is a use after free.


Yes, sure. But the clk_put() above should not be there in the first
place. When I added this code, I probably should have had a closer
look at the clock handling above. (Or, more realistically, I just did
not understand enough at that time...)

> 
>    174                  clk_put(clk);
>    175          }
>    176  
>    177          return ret;
>    178  }


- Simon
