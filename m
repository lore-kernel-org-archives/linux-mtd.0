Subject: Re: [PATCH revised] mtd: remove driver-core BUS_ID_SIZE
From: David Woodhouse <dwmw2@infradead.org>
To: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
In-Reply-To: <1244306664-23741-1-git-send-email-anemo@mba.ocn.ne.jp>
References: <1244306664-23741-1-git-send-email-anemo@mba.ocn.ne.jp>
Content-Type: text/plain
Date: Mon, 08 Jun 2009 09:14:22 +0100
Message-Id: <1244448862.30939.76.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Kay Sievers <kay.sievers@vrfy.org>, linux-mtd@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@suse.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-06-07 at 01:44 +0900, Atsushi Nemoto wrote:
> From: Kay Sievers <kay.sievers@vrfy.org>
> 
> The name size limit is gone from the driver-core, the BUS_ID_SIZE
> value will be removed.

Thanks. I've already applied the original patch, so I was after an
incremental one.

>  			txx9_priv->cs = -1;
> -			strcpy(txx9_priv->mtdname, dev_name(&dev->dev));
> +			txx9_priv->mtdname = kstrdup(dev_name(&dev->dev),
> +						     GFP_KERNEL);

You don't check for failure here.

With that fixed, this is your changes as an incremental patch with an
appropriate commit log... I think it's exceeded the limit of how much
I'd want to massage your patch while retaining your Signed-off-by:, so
I'll give you a chance to append your S-o-b for yourself....

-----
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: [PATCH] Fix memory leak on probe failure.

Commit 81933046ef2a615031c46171013bde2c5225ee69 ('mtd: Fix handling of
mtdname in txx9ndfmc.c') introduced a potential memory leak. The
'mtdname' member of the private data structure is now allocated
separately, but was not freed on certain error paths.

Fix that, and make things simpler by _always_ allocating it separately
so that we don't need 'if (mtdname != dev_name()) kfree(mtdname)'...
which gets ugly now that we're doing it more than once, and more likely
that we'll get it wrong some time.

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 5f919e6..488088e 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -336,20 +336,21 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 			txx9_priv->cs = i;
 			txx9_priv->mtdname = kasprintf(GFP_KERNEL, "%s.%u",
 						       dev_name(&dev->dev), i);
-			if (!txx9_priv->mtdname) {
-				kfree(txx9_priv);
-				dev_err(&dev->dev,
-					"Unable to allocate TXx9 NDFMC MTD device name.\n");
-				continue;
-			}
 		} else {
 			txx9_priv->cs = -1;
-			txx9_priv->mtdname = dev_name(&dev->dev);
+			txx9_priv->mtdname = kstrdup(dev_name(&dev->dev),
+						     GFP_KERNEL);
+		}
+		if (!txx9_priv->mtdname) {
+			kfree(txx9_priv);
+			dev_err(&dev->dev, "Unable to allocate MTD name.\n");
+			continue;
 		}
 		if (plat->wide_mask & (1 << i))
 			chip->options |= NAND_BUSWIDTH_16;
 
 		if (nand_scan(mtd, 1)) {
+			kfree(txx9_priv->mtdname);
 			kfree(txx9_priv);
 			continue;
 		}
@@ -391,8 +392,7 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
 		kfree(drvdata->parts[i]);
 #endif
 		del_mtd_device(mtd);
-		if (txx9_priv->mtdname != dev_name(&dev->dev))
-			kfree(txx9_priv->mtdname);
+		kfree(txx9_priv->mtdname);
 		kfree(txx9_priv);
 	}
 	return 0;

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
