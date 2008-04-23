Received: from yw-out-1718.google.com ([74.125.46.157])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoW9w-0008OM-Vv
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 04:00:41 +0000
Received: by yw-out-1718.google.com with SMTP id 5so48498ywr.56
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Apr 2008 21:00:34 -0700 (PDT)
Message-ID: <1925ef8a0804222100y2b0ff8d6rd640ad723d0517bc@mail.gmail.com>
Date: Wed, 23 Apr 2008 08:00:34 +0400
From: "Vitja Makarov" <vitja.makarov@gmail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd_dataflash use command allocated on stack
In-Reply-To: <1208895638.9212.673.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1207285360.10621.8.camel@vitja-laptop>
	<1208895638.9212.673.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008/4/23 David Woodhouse <dwmw2@infradead.org>:
> On Fri, 2008-04-04 at 09:02 +0400, Vitja Makarov wrote:
>  > Hi!
>  >
>  >
>  > Currently mtd_dataflash driver has command in their private structure.
>  > That is only 4 bytes, sometimes actually 8 is needed.
>  > Also it could be accessed twice before lock is taken.
>  >
>  > This patch moves command to stack.
>
>  Is that allowed? The SPI code might DMA from it, surely?
>
>  --
>  dwmw2
>
>


I'm using this driver with dma enabled on blackfin arch and that seems to work.
Btw mutex is taken before priv->command is accessed so no race could be here.
But I still think that having command 4 bytes when it's actually 8 (4
+ 4 don't cares) isn't a good idea.
If you are asking about could spi DMA from stack, I think so, as
spi_sync() is called before ret, but there still are cache issues,
dataflash or better spi driver should call invalidate/flush for the
given address if needed, I moved it to spi_bfin code, and that seems
to work for me wo modifyng original dataflash driver.
