Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GpQqP-00027D-4Q
	for linux-mtd@lists.infradead.org; Wed, 29 Nov 2006 09:56:20 -0500
Date: Wed, 29 Nov 2006 14:26:07 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: dedekind@infradead.org
Subject: Re: jffs2_flash_writev(): Non-contiguous write to 00825300 with
	mtd_dataflash
Message-ID: <20061129142607.7546cbad@dhcp-252-105.norway.atmel.com>
In-Reply-To: <1164717377.576.29.camel@sauron>
References: <20061101115252.26000d78@cad-250-152.norway.atmel.com>
	<1163404009.3925.26.camel@sauron>
	<20061128125810.306e7d54@dhcp-252-105.norway.atmel.com>
	<1164717377.576.29.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Nov 2006 14:36:17 +0200
Artem Bityutskiy <dedekind@infradead.org> wrote:

> On Tue, 2006-11-28 at 12:58 +0100, Haavard Skinnemoen wrote:
> > +#define jffs2_can_mark_obsolete(c) (c->mtd->flags &
> > (MTD_BIT_WRITEABLE)	\
> > +				    && !jffs2_dataflash(c))
> 
> Please, make sure the DataFlash driver does has MTD_BIT_WRITEABLE bit
> set at c->mtd->flags instead

Ok, how about this instead? It seems to work equally well on my board.

Haavard
---
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
Subject: [PATCH] [MTD] Don't set MTD_BIT_WRITEABLE for DataFlash

Attempting to write something to a file on a jffs2 filesystem using
mtd_dataflash often results in the following BUG:

jffs2_flash_writev(): Non-contiguous write to 00825720
wbuf was previously 00825300-0082530c
kernel BUG at /home/hskinnemoen/git/linux-devel/fs/jffs2/wbuf.c:786!

Fix this by not setting MTD_BIT_WRITEABLE for DataFlash devices, thus
causing jffs2_can_mark_obsolete() to return 0.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
---
 drivers/mtd/devices/mtd_dataflash.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/mtd_dataflash.c
index 5db7160..10a4f4e 100644
--- a/drivers/mtd/devices/mtd_dataflash.c
+++ b/drivers/mtd/devices/mtd_dataflash.c
@@ -480,7 +480,7 @@ add_dataflash(struct spi_device *spi, ch
 	device->writesize = pagesize;
 	device->owner = THIS_MODULE;
 	device->type = MTD_DATAFLASH;
-	device->flags = MTD_CAP_NORFLASH;
+	device->flags = MTD_WRITEABLE;
 	device->erase = dataflash_erase;
 	device->read = dataflash_read;
 	device->write = dataflash_write;
-- 
1.4.3.3
