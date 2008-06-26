Date: Thu, 26 Jun 2008 21:55:25 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: "Vitja Makarov" <vitja.makarov@gmail.com>
Subject: Re: [PATCH] mtd_dataflash use command allocated on stack
Message-ID: <20080626215525.177e1694@siona.local>
In-Reply-To: <1925ef8a0804222100y2b0ff8d6rd640ad723d0517bc@mail.gmail.com>
References: <1207285360.10621.8.camel@vitja-laptop>
	<1208895638.9212.673.camel@pmac.infradead.org>
	<1925ef8a0804222100y2b0ff8d6rd640ad723d0517bc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sorry about the late response...I'm currently getting up to speed with
various mailing lists.

On Wed, 23 Apr 2008 08:00:34 +0400
"Vitja Makarov" <vitja.makarov@gmail.com> wrote:

> If you are asking about could spi DMA from stack, I think so, as
> spi_sync() is called before ret, but there still are cache issues,
> dataflash or better spi driver should call invalidate/flush for the
> given address if needed, I moved it to spi_bfin code, and that seems
> to work for me wo modifyng original dataflash driver.

NO! DMA from stack is NOT safe!

The problem isn't missing cache flushing -- any driver that uses DMA
must do that anyway -- but that the flushed lines get sucked right back
in when the function returns.

Also note that DMA from stack may work _sometimes_, but you never know
when the buffer happens to share a cache line with some return
address...

Haavard
