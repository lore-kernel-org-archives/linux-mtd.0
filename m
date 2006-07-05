Received: from h062040172167.moe.cm.kabsi.at ([62.40.172.167]
	helo=quake.thinstuff.com)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Fy2Vc-0004ry-KG
	for linux-mtd@lists.infradead.org; Wed, 05 Jul 2006 04:13:35 -0400
Message-ID: <44AB6EFA.9000604@thinstuff.com>
Date: Wed, 05 Jul 2006 09:49:14 +0200
From: Norbert Federa <nfedera@thinstuff.com>
MIME-Version: 1.0
To: vherva@vianova.fi
Subject: Re: block2mtd: Overrun end of disk in cache readahead
References: <20060705072614.GQ6240@vianova.fi>
In-Reply-To: <20060705072614.GQ6240@vianova.fi>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ville,
Try changing the PAGE_READAHEAD define in
/drivers/mtd/devices/block2mtd.c from 64 to 0:

-#define PAGE_READAHEAD 64
+#define PAGE_READAHEAD 0

Or a bit more sophisticated:

in drivers/mtd/devices/Kconfig ...

+config MTD_BLOCK2MTD_PAGE_READAHEAD
+    int "How many pages block2mtd reads ahead"
+    depends on MTD_BLOCK2MTD
+    default "64"
+    help
+      This allows you to configure the PAGE_READAHEAD value of the
+      MTD_BLOCK2MTD driver.
+

... and in drivers/mtd/devices/block2mtd.c

-#define PAGE_READAHEAD 64
+#define PAGE_READAHEAD CONFIG_MTD_BLOCK2MTD_PAGE_READAHEAD

-- 
Norbert


Ville Herva wrote:
> I get 
> 	block2mtd: Overrun end of disk in cache readahead
>
> each time I mount a JFFS2 created with
>
> 	mkfs.jffs2 -o IMAGE -d skeleton --pad=999161856 -v
> 	dd if=IMAGE of=/dev/hdc2
>
> Afaict, the fs should fit onto the device:
>
> 	du --block-size=512 --apparent-size IMAGE
> 	1951488 IMAGE
> 	blockdev --getsize /dev/hdc2             
> 	1951488
> 	blockdev --getsize /dev/mtdblock0        
> 	1951488
>
> Should I leave some blocks worth of space in the end nevertheless?
>
>
>
>
> -- v -- 
>
> v@iki.fi
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
