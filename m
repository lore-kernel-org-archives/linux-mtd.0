Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEmvA-0000Pv-Gr
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 22:09:28 +0000
Received: by mail-pd0-f170.google.com with SMTP id g10so2040893pdj.29
 for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2014 15:09:06 -0700 (PDT)
Date: Tue, 5 Aug 2014 15:09:02 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v2] mtd: atmel_nand: NFC: fix mtd_nandbiterrs.ko test
 fail when using sram write
Message-ID: <20140805220902.GL3711@ld-irv-0074>
References: <1407235132-4757-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407235132-4757-1-git-send-email-josh.wu@atmel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 05, 2014 at 06:38:52PM +0800, Josh Wu wrote:
> When enable NFC sram write, it will failed the mtd_nandbiterrs.ko test.
> 
> As in driver's nfc_sram_write_page(), if ops->mode equal to MTD_OSP_RAW,
> driver assumes the data buffer contains one page data and one oob data
> followed. And driver will write the page data and oob data to nand.
> 
> But this is wrong implementation. Since the data buffer don't contains the
> oob data to write. We should write the chip->oob_poi to nand's oob.
> 
> So this patch fix it by writing the oob data from chip->oob_poi.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> ---
> v1 -> v2:
>   drop the sanity check for if write_page will write more than 1 page. As
> NAND layer will guarantees that.

Queued to l2-mtd.git/next. Thanks!

Brian
