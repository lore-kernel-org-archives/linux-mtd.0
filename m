Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gG9AH-000498-2z
 for linux-mtd@lists.infradead.org; Fri, 26 Oct 2018 20:57:07 +0000
Date: Fri, 26 Oct 2018 22:56:51 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Yannick Lanz <yannick.lanz@wifx.net>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: bad block table erased by u-boot's ubi part command
Message-ID: <20181026225651.24be0d06@bbrezillon>
In-Reply-To: <A5CEBF07E04C514A9C56312C6027F32186A8C57B@SWIFXDC01.lan.wifx.net>
References: <A5CEBF07E04C514A9C56312C6027F32186A8C57B@SWIFXDC01.lan.wifx.net>
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

On Fri, 26 Oct 2018 16:21:37 +0000
Yannick Lanz <yannick.lanz@wifx.net> wrote:


> 
> If a mount the UBI partition in U-Boot, then the bad block table is never found 
> in the kernel and always recreated. The other strange point is that U-Boot 
> doesn't find the 4 bad block found by the kernel.
> 
> If I reboot without mounting the UBI partition in U-Boot, then the bad block 
> table is directly discovered by the kernel following its creation on latest boot.
> It seems that U-Boot is destroying the bad block table.
> 
> Do you have any idea what's happening ?

Probably because u-boot does not have on-flash-bbt enabled, so it's
assuming the blocks reserved by Linux for the bad block table are free,
and when UBI is attached to the last partition it picks the last 4
blocks and writes its metadata on it.
