Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZmAsr-0008ID-KD
 for linux-mtd@lists.infradead.org; Wed, 14 Oct 2015 01:29:38 +0000
Received: by pabws5 with SMTP id ws5so6532206pab.1
 for <linux-mtd@lists.infradead.org>; Tue, 13 Oct 2015 18:29:16 -0700 (PDT)
Date: Tue, 13 Oct 2015 18:29:14 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 00/10] mtd: spi-nor: cleanups + block protection support
 updates
Message-ID: <20151014012914.GE107187@google.com>
References: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441137435-52862-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 01, 2015 at 12:57:05PM -0700, Brian Norris wrote:
> [Note: as this is sent out during the merge window, it's based on the
> semi-unofficial l2-mtd.git/next branch, which is targeting 4.4, not 4.3]
> 
> Hi all,
> 
> I've been reviewing various spi-nor drivers as well as working with some
> Winbond flash to support new locking features. The former helped point out a
> few more things that could use some improvement, and the latter suggested that
> we have some glaring oversights in the spi-nor lock/unlock code.
> 
> <side note>
> Some helpful companion code, for mtd-utils:
> 
>  http://lists.infradead.org/pipermail/linux-mtd/2015-August/061526.html
> 
> This extends the flash_lock tool so that you can more easily test specific
> ranges, using:
> 
>   # flash_lock --lock /dev/mtdX <offset> <block-count>
>   # flash_lock --unlock /dev/mtdX <offset> <block-count>
>   # flash_lock --islocked /dev/mtdX <offset> <block-count>
> </side note>
> 
> The first half of this series is fairly self-explanatory. The second might take
> a bit of thought, as a formulaic approach is a little more subtle than a
> table-based approach, so I tried to copy the relevant portions distilled from a
> few datasheets and include comments. Please shout if anything deserves more
> explanation or looks funny to you.
> 
> Highlights:
> 
>  * clean up spi-nor.h header
>  * spi-nor now supports MEMISLOCKED
>  * MEM{LOCK,UNLOCK} support is a little more robust and extendible
>  * turn on dual/quad read for Winbond w25q{32,64}dw
>  * enable block protection for Winbond flash
> 
> Regards,
> Brian

Pushed all to l2-mtd.git, with some minor context fixups for patch 8
