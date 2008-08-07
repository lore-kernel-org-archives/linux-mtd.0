Date: Thu, 7 Aug 2008 12:34:44 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: David Brownell <david-b@pacbell.net>
Subject: Re: [patch 2.6.27-rc2] MTD:  make dataflash write-verify be optional
Message-ID: <20080807123444.4d004065@hskinnemo-gx745.norway.atmel.com>
In-Reply-To: <200808062155.14366.david-b@pacbell.net>
References: <200808062155.14366.david-b@pacbell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	Andrew Victor <linux@maxim.org.za>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Brownell <david-b@pacbell.net> wrote:
> From: David Brownell <dbrownell@users.sourceforge.net>
> 
> This adds a WRITE_VERIFY Kconfig option to the DataFlash driver,
> closely mirroring the similar NAND and ONENAND options, giving
> an option to disable some code that's currently always enabled.
> 
> Removing this step probably saves a millisecond or so per page
> when writing data, which will add up quickly since these pages
> are small (the largest is 1 KByte).  It doesn't seem to add a
> lot in terms of reliability, and wouldn't detect errors which 
> crop up when transferring data to the on-chip SRAM buffer.
> 
> Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>

Sounds good to me. DataFlash speed is a bit of an issue, and if we
eventually manage to boost the SPI transfer speed, this thing might
turn out to be a bigger bottleneck than it currently is.

I suppose write verify might catch flash programming errors when the
flash is worn out, so it makes sense to keep it optional for users that
need to know early when this happens.

Acked-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
