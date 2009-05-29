Subject: Re: mtd: remove driver-core BUS_ID_SIZE
From: David Woodhouse <dwmw2@infradead.org>
To: Kay Sievers <kay.sievers@vrfy.org>
In-Reply-To: <ac3eb2510905290625g4f89ef7cj597892affb94a9e6@mail.gmail.com>
References: <1239899196.17211.11.camel@poy>
	<1243602695.19886.146.camel@macbook.infradead.org>
	<1243603308.19886.149.camel@macbook.infradead.org>
	<ac3eb2510905290625g4f89ef7cj597892affb94a9e6@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 29 May 2009 14:33:41 +0100
Message-Id: <1243604021.19886.152.camel@macbook.infradead.org>
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

On Fri, 2009-05-29 at 15:25 +0200, Kay Sievers wrote:
> On Fri, May 29, 2009 at 15:21, David Woodhouse <dwmw2@infradead.org> wrote:
> > This might work better. Nemoto-san, can you test and confirm?
> 
> Looks good to me.
> 
> > diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
> 
> >                if (plat->ch_mask != 1) {
> > +                       char *devname = dev_name(&dev->dev);
> >                        txx9_priv->cs = i;
> > +                       txx9_priv->mtdname = kmalloc(strlen(devname) + 3,
> > +                                                    GFP_KERNEL);
> 
> kasprintf() might be nicer here?

True; thanks. (Er, how have I managed not to know that asprintf()
exists, for the last 20-odd years?)

diff --git a/drivers/mtd/nand/txx9ndfmc.c b/drivers/mtd/nand/txx9ndfmc.c
index 8124792..5f919e6 100644
--- a/drivers/mtd/nand/txx9ndfmc.c
+++ b/drivers/mtd/nand/txx9ndfmc.c
@@ -64,7 +64,7 @@ struct txx9ndfmc_priv {
 	struct nand_chip chip;
 	struct mtd_info mtd;
 	int cs;
-	char mtdname[BUS_ID_SIZE + 2];
+	const char *mtdname;
 };
 
 #define MAX_TXX9NDFMC_DEV	4
@@ -334,11 +334,17 @@ static int __init txx9ndfmc_probe(struct platform_device *dev)
 
 		if (plat->ch_mask != 1) {
 			txx9_priv->cs = i;
-			sprintf(txx9_priv->mtdname, "%s.%u",
-				dev_name(&dev->dev), i);
+			txx9_priv->mtdname = kasprintf(GFP_KERNEL, "%s.%u",
+						       dev_name(&dev->dev), i);
+			if (!txx9_priv->mtdname) {
+				kfree(txx9_priv);
+				dev_err(&dev->dev,
+					"Unable to allocate TXx9 NDFMC MTD device name.\n");
+				continue;
+			}
 		} else {
 			txx9_priv->cs = -1;
-			strcpy(txx9_priv->mtdname, dev_name(&dev->dev));
+			txx9_priv->mtdname = dev_name(&dev->dev);
 		}
 		if (plat->wide_mask & (1 << i))
 			chip->options |= NAND_BUSWIDTH_16;
@@ -385,6 +391,8 @@ static int __exit txx9ndfmc_remove(struct platform_device *dev)
 		kfree(drvdata->parts[i]);
 #endif
 		del_mtd_device(mtd);
+		if (txx9_priv->mtdname != dev_name(&dev->dev))
+			kfree(txx9_priv->mtdname);
 		kfree(txx9_priv);
 	}
 	return 0;


-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
