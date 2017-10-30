Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9EtE-0002aS-VA
 for linux-mtd@lists.infradead.org; Mon, 30 Oct 2017 18:34:27 +0000
Received: by mail-qt0-x230.google.com with SMTP id n61so17648082qte.10
 for <linux-mtd@lists.infradead.org>; Mon, 30 Oct 2017 11:34:03 -0700 (PDT)
Date: Mon, 30 Oct 2017 14:34:00 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
To: Chris Brandt <Chris.Brandt@renesas.com>
cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: RE: [PATCH v2 0/5] unconfuse get_unmapped_area and point/unpoint
 driver methods
In-Reply-To: <SG2PR06MB1165A4668E066DAC5E810CD08A590@SG2PR06MB1165.apcprd06.prod.outlook.com>
Message-ID: <nycvar.YSQ.7.76.1710301432220.3238@knanqh.ubzr>
References: <20171017152826.11658-1-nicolas.pitre@linaro.org>
 <SG2PR06MB1165A4668E066DAC5E810CD08A590@SG2PR06MB1165.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 Oct 2017, Chris Brandt wrote:

> I was able to boot my system with the following kernel options:
> 
>   "rootfstype=cramfs root=mtd:rootfs_xipcramfs"
> 
> This meant the cramfs image was one where the executable code pages 
> remained in flash.
> 
> 
> Therefore, for this MTD series, applied on top of the file system series 
> "[PATCH v6 0/4] cramfs refresh for embedded usage":
> 
> Tested-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for testing!


Nicolas
