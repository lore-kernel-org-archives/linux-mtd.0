Received: from n12a.bullet.mail.mud.yahoo.com ([209.191.125.177])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MYUMp-000891-4Q
	for linux-mtd@lists.infradead.org; Wed, 05 Aug 2009 00:28:35 +0000
From: David Brownell <david-b@pacbell.net>
To: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Subject: Re: [PATCH] [MTD] m25p80: memory accessor interface for SPI MTD driver
Date: Mon, 3 Aug 2009 18:24:01 -0700
References: <1249333325-16750-1-git-send-email-sudhakar.raj@ti.com>
In-Reply-To: <1249333325-16750-1-git-send-email-sudhakar.raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200908031824.01795.david-b@pacbell.net>
Cc: dwmw2@infradead.org, davinci-linux-open-source@linux.davincidsp.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 03 August 2009, Sudhakar Rajashekhara wrote:
> On TI's da850/omap-l138 EVM, MAC address is stored in SPI flash.
> This patch implements memory accessor interface for SPI MTD
> driver which enables the kernel to access flash data.

If that's going to be possible, shouldn't it work for any
MTD device?  And the lack of protection bothers me a bit
more here than with EEPROMs and NVRAM, since it seems kind
of easy to clobber UBI (or JFFS2 etc) data.  Maybe there
should be a way to make jus a specific partition available
this way?


> This patch also changes the initialization sequence of the
> drivers by moving mtd and spi ahead of net in drivers/Makefile
> thereby enabling da850/omap-l138 ethernet driver to read the
> MAC address while booting.

Worth a separate patch.  That much raises no flags for me.
For the SPI move:

  Acked-by: David Brownell <dbrownell@users.sourceforge.net>


- Dave

 
> Signed-off-by: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
