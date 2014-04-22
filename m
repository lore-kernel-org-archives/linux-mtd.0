Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wce2I-00074N-2q
 for linux-mtd@lists.infradead.org; Tue, 22 Apr 2014 16:59:10 +0000
From: Marek Vasut <marex@denx.de>
To: Graham Moore <grmoore@altera.com>
Subject: Re: [PATCH V3] Add support for flag status register on Micron chips.
Date: Tue, 22 Apr 2014 18:55:57 +0200
References: <1398175396-7560-1-git-send-email-grmoore@altera.com>
 <1398175396-7560-2-git-send-email-grmoore@altera.com>
In-Reply-To: <1398175396-7560-2-git-send-email-grmoore@altera.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404221855.57247.marex@denx.de>
Cc: ggrahammoore@gmail.com, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jingoo Han <jg1.han@samsung.com>,
 Geert Uytterhoeven <geert+renesas@linux-m68k.org>,
 linux-kernel@vger.kernel.org, Yves Vandervennet <rocket.yvanderv@gmail.com>,
 linux-mtd@lists.infradead.org, Insop Song <insop.song@gainspeed.com>,
 Alan Tull <atull@altera.com>, Sourav Poddar <sourav.poddar@ti.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen <dinguyen@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, April 22, 2014 at 04:03:16 PM, Graham Moore wrote:
[...]

>  #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
> @@ -488,6 +534,8 @@ const struct spi_device_id spi_nor_ids[] = {
>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, 0) },
>  	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K) },
>  	{ "n25q512a",    INFO(0x20bb20, 0, 64 * 1024, 1024, SECT_4K) },
> +	{ "n25q512ax3",  INFO(0x20ba20, 0, 64 * 1024, 1024, USE_FSR) },
> +	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048, USE_FSR) },

Are you sure the n25q512a doesn't use FSR ? Do n25q512a{1,8}3 share the same 
IDs?

[...]
Best regards,
Marek Vasut
