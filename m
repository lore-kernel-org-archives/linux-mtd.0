Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eo3uP-0002Sn-4D
 for linux-mtd@lists.infradead.org; Tue, 20 Feb 2018 09:08:29 +0000
Date: Tue, 20 Feb 2018 10:07:59 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: hartleys@visionengravers.com, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: Re: [bug report] mtd: plat_nand: request memory resource before
 doing ioremap
Message-ID: <20180220100759.4b5acd2f@bbrezillon>
In-Reply-To: <20180220084115.GA18059@mwanda>
References: <20180220084115.GA18059@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dan,

On Tue, 20 Feb 2018 11:41:15 +0300
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> [  This is really weird that Smatch is complaining about ancient code
>    today.  No idea why.  - dan ]

Probably because I moved NAND code around recently.

> 
> Hello H Hartley Sweeten,
> 
> The patch 2d098a725333: "mtd: plat_nand: request memory resource
> before doing ioremap" from Oct 19, 2009, leads to the following
> static checker warning:
> 
> 	drivers/mtd/nand/raw/plat_nand.c:100 plat_nand_probe()
> 	info: return a literal instead of 'err'

Hm, I don't really get this error message? What's wrong with returning
err when it's 0? It's true that we could return 0 directly, but I don't
see it as a real issue. Am I missing something?

> 
> drivers/mtd/nand/raw/plat_nand.c
>     78  
>     79          platform_set_drvdata(pdev, data);
>     80  
>     81          /* Handle any platform specific setup */
>     82          if (pdata->ctrl.probe) {
>     83                  err = pdata->ctrl.probe(pdev);
>     84                  if (err)
>     85                          goto out;
>     86          }
>     87  
>     88          /* Scan to find existence of the device */
>     89          err = nand_scan(mtd, pdata->chip.nr_chips);
>     90          if (err)
>     91                  goto out;
>     92  
>     93          part_types = pdata->chip.part_probe_types;
>     94  
>     95          err = mtd_device_parse_register(mtd, part_types, NULL,
>     96                                          pdata->chip.partitions,
>     97                                          pdata->chip.nr_partitions);
>     98  
>     99          if (!err)
>    100                  return err;
>                 ^^^^^^^^^^^^^^^^^^^
> 
> Ugh...  Success handling.  There seems to be a lot of it in this
> subsystem.  :(

Yep, there's a lot of ancient code that no one dares to touch in the
fear that it may break things. Also, there's so many old drivers that
cleaning up everything would take a lot of time.

> 
>    101  
>    102          nand_release(mtd);
>                              ^^^
> This call to nand_release() makes no sense.  It calls unregister but
> mtd_device_parse_register() failed.

You're right, we should call nand_cleanup() here. This being said,
calling mtd_device_unregister() should be harmless because of this test
[1].

To sum-up, this code is definitely not meeting the kernel standards in
term of code quality, but it doesn't seem to be buggy either.

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v4.8/source/drivers/mtd/mtdcore.c#L664

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
