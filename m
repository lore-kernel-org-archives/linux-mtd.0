Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OFv7s-0002wq-3F
	for linux-mtd@lists.infradead.org; Sat, 22 May 2010 20:16:52 +0000
Received: by vws4 with SMTP id 4so781369vws.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 22 May 2010 13:16:50 -0700 (PDT)
Date: Sat, 22 May 2010 22:16:26 +0200
From: Dan Carpenter <error27@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [patch] mtd/sst25l: check for null consistently
Message-ID: <20100522201626.GJ22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	kernel-janitors@vger.kernel.org,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Andre Renaud <andre@bluewatersys.com>, linux-mtd@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The rest of the function assumes that "data" can be null.  I don't know
the code well enough to say whether it can actually be null, but there 
is no harm in checking here.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
index ab5d8cd..684247a 100644
--- a/drivers/mtd/devices/sst25l.c
+++ b/drivers/mtd/devices/sst25l.c
@@ -454,7 +454,7 @@ static int __init sst25l_probe(struct spi_device *spi)
 						  parts, nr_parts);
 		}
 
-	} else if (data->nr_parts) {
+	} else if (data && data->nr_parts) {
 		dev_warn(&spi->dev, "ignoring %d default partitions on %s\n",
 			 data->nr_parts, data->name);
 	}
