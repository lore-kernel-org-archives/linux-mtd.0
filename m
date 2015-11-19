Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzWrt-0005p7-5A
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 21:35:49 +0000
Received: by pacej9 with SMTP id ej9so92963555pac.2
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 13:35:28 -0800 (PST)
Date: Thu, 19 Nov 2015 13:35:26 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Bayi Cheng <bayi.cheng@mediatek.com>, Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: provide default erase_sector
 implementation
Message-ID: <20151119213526.GI64635@google.com>
References: <1447186528-42263-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447186528-42263-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 10, 2015 at 12:15:27PM -0800, Brian Norris wrote:
> Some spi-nor drivers perform sector erase by duplicating their
> write_reg() command. Let's not require that the driver fill this out,
> and provide a default instead.
> 
> Tested on m25p80.c and Medatek's MT8173 SPI NOR flash driver.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
> v1 -> v2:
>   * use statically-sized array, with a check to make sure MAX is big enough
> 
> v1: http://lists.infradead.org/pipermail/linux-mtd/2015-October/062916.html

Pushed both to l2-mtd.git
