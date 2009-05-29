Subject: Re: mtd: remove driver-core BUS_ID_SIZE
From: David Woodhouse <dwmw2@infradead.org>
To: Kay Sievers <kay.sievers@vrfy.org>
In-Reply-To: <1243602695.19886.146.camel@macbook.infradead.org>
References: <1239899196.17211.11.camel@poy>
	<1243602695.19886.146.camel@macbook.infradead.org>
Content-Type: text/plain
Date: Fri, 29 May 2009 14:21:48 +0100
Message-Id: <1243603308.19886.149.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Greg Kroah-Hartman <gregkh@suse.de>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-05-29 at 14:11 +0100, David Woodhouse wrote:
> On Thu, 2009-04-16 at 18:26 +0200, Kay Sievers wrote:
> > From: Kay Sievers <kay.sievers@vrfy.org>
> > Subject: mtd: remove driver-core BUS_ID_SIZE
> > 
> > The name size limit is gone from the driver-core, the BUS_ID_SIZE
> > value will be removed.
> > 
> > Cc: dwmw2@infradead.org
> > Cc: linux-mtd@lists.infradead.org
> > Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
> > Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
> > ---
> >  drivers/mtd/nand/txx9ndfmc.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > --- a/drivers/mtd/nand/txx9ndfmc.c
> > +++ b/drivers/mtd/nand/txx9ndfmc.c
> > @@ -64,7 +64,7 @@ struct txx9ndfmc_priv {
> >  	struct nand_chip chip;
> >  	struct mtd_info mtd;
> >  	int cs;
> > -	char mtdname[BUS_ID_SIZE + 2];
> > +	char mtdname[20 + 2];
> >  };
> >  
> >  #define MAX_TXX9NDFMC_DEV	4
> 
> Not so cunning. You're explicitly noting that the limit on the input
> string size is gone, and yet you do nothing about the code which uses
> it...
> 
> 		if (plat->ch_mask != 1) {
> 			txx9_priv->cs = i;
> 			sprintf(txx9_priv->mtdname, "%s.%u",
> 				dev_name(&dev->dev), i);
> 		} else {
> 			txx9_priv->cs = -1;
> 			strcpy(txx9_priv->mtdname, dev_name(&dev->dev));
> 		}

This might work better. Nemoto-san, can you test and confirm?

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 8124792..6329382 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -64,7 +64,7 @@ struct txx9ndfmc_priv {
 	struct nand_chip chip;
 	struct mtd_info mtd;
 	int cs;
-	char mtdname[BUS_ID_SIZE + 2];
+	char *mtdname;
 };
 
 #define MAX_TXX9NDFMC_DEV	4
@@ -333,12 +333,21 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 		txx9_priv->dev = dev;
 
 		if (plat->ch_mask != 1) {
+			char *devname = dev_name(&dev->dev);
 			txx9_priv->cs = i;
+			txx9_priv->mtdname = kmalloc(strlen(devname) + 3,
+						     GFP_KERNEL);
+			if (!txx9_mtdname) {
+				kfree(txx9_priv);
+				dev_err(&dev->dev,
+					"Unable to allocate TXx9 NDFMC MTD device name.\n");
+				continue;
+			}
 			sprintf(txx9_priv->mtdname, "%s.%u",
-				dev_name(&dev->dev), i);
+				devname, i);
 		} else {
 			txx9_priv->cs = -1;
-			strcpy(txx9_priv->mtdname, dev_name(&dev->dev));
+			txx9_priv->mtdname = dev_name(&dev->dev);
 		}
 		if (plat->wide_mask & (1 << i))
 			chip->options |= NAND_BUSWIDTH_16;
@@ -385,6 +394,8 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
 		kfree(drvdata->parts[i]);
 #endif
 		del_mtd_device(mtd);
+		if (txx9_priv->mtdname != dev_name(&dev->dev))
+			kfree(txx9_priv->mtdname);
 		kfree(txx9_priv);
 	}
 	return 0;

-- 
dwmw2
