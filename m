Received: from aserp1040.oracle.com ([141.146.126.69])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c9rY1-0005es-EX
 for linux-mtd@lists.infradead.org; Thu, 24 Nov 2016 10:46:34 +0000
Date: Thu, 24 Nov 2016 13:45:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: kyungmin.park@samsung.com
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] mtd: add Samsung SoC OneNAND driver
Message-ID: <20161124101817.GA14449@mwanda>
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

Hello Kyungmin Park,

The patch 46f3e88bd9da: "mtd: add Samsung SoC OneNAND driver" from
Apr 28, 2010, leads to the following static checker warning:

	drivers/mtd/onenand/samsung.c:876 s3c_onenand_probe()
	info: ignoring unreachable code.

drivers/mtd/onenand/samsung.c
   858          onenand = kzalloc(sizeof(struct s3c_onenand), GFP_KERNEL);
   859          if (!onenand) {
   860                  err = -ENOMEM;
   861                  goto onenand_fail;
   862          }
   863  
   864          this = (struct onenand_chip *) &mtd[1];
   865          mtd->priv = this;
   866          mtd->dev.parent = &pdev->dev;
   867          onenand->pdev = pdev;
   868          onenand->type = platform_get_device_id(pdev)->driver_data;
   869  
   870          s3c_onenand_setup(mtd);
   871  
   872          r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   873          if (!r) {
   874                  dev_err(&pdev->dev, "no memory resource defined\n");
   875                  return -ENOENT;
   876                  goto ahb_resource_failed;

We should probably do a goto but problem not that one.  It looks like
maybe "goto resource_failed;"?  Best to name the gotos after what they
do instead of using come-from names that describe the goto location.
"goto free_onenand;".

   877          }
   878  
   879          onenand->base_res = request_mem_region(r->start, resource_size(r),
   880                                                 pdev->name);
   881          if (!onenand->base_res) {
   882                  dev_err(&pdev->dev, "failed to request memory resource\n");
   883                  err = -EBUSY;
   884                  goto resource_failed;
   885          }
   886  

regards,
dan carpenter
