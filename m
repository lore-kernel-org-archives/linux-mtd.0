Received: from userp2120.oracle.com ([156.151.31.85])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eo3Ua-0006FK-Ab
 for linux-mtd@lists.infradead.org; Tue, 20 Feb 2018 08:41:41 +0000
Date: Tue, 20 Feb 2018 11:41:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: hartleys@visionengravers.com
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: [bug report] mtd: plat_nand: request memory resource before doing
 ioremap
Message-ID: <20180220084115.GA18059@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[  This is really weird that Smatch is complaining about ancient code
   today.  No idea why.  - dan ]

Hello H Hartley Sweeten,

The patch 2d098a725333: "mtd: plat_nand: request memory resource
before doing ioremap" from Oct 19, 2009, leads to the following
static checker warning:

	drivers/mtd/nand/raw/plat_nand.c:100 plat_nand_probe()
	info: return a literal instead of 'err'

drivers/mtd/nand/raw/plat_nand.c
    78  
    79          platform_set_drvdata(pdev, data);
    80  
    81          /* Handle any platform specific setup */
    82          if (pdata->ctrl.probe) {
    83                  err = pdata->ctrl.probe(pdev);
    84                  if (err)
    85                          goto out;
    86          }
    87  
    88          /* Scan to find existence of the device */
    89          err = nand_scan(mtd, pdata->chip.nr_chips);
    90          if (err)
    91                  goto out;
    92  
    93          part_types = pdata->chip.part_probe_types;
    94  
    95          err = mtd_device_parse_register(mtd, part_types, NULL,
    96                                          pdata->chip.partitions,
    97                                          pdata->chip.nr_partitions);
    98  
    99          if (!err)
   100                  return err;
                ^^^^^^^^^^^^^^^^^^^

Ugh...  Success handling.  There seems to be a lot of it in this
subsystem.  :(

   101  
   102          nand_release(mtd);
                             ^^^
This call to nand_release() makes no sense.  It calls unregister but
mtd_device_parse_register() failed.

   103  out:
   104          if (pdata->ctrl.remove)
   105                  pdata->ctrl.remove(pdev);
   106          return err;
   107  }

regards,
dan carpenter
